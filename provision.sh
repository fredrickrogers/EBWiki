#!/bin/bash
# Do some groundwork with the environment
source /vagrant/dev_provisions/environment.sh

if [ -f /tmp/provisioning_complete.txt ];
then
    echo "Server already provisioned!"
else

echo '#########################################################'
echo '##  Provisioning the EBWiki Development Environment'
echo '##  This will take a while :D (10-15 mins depending on network)'
echo "##  Start time: $(date)"
echo '##  Provisioning the EBWiki Development Environment' > ${PROJECT_LOG}
echo '#########################################################'

env >> ${PROJECT_LOG}
cp /vagrant/dev_provisions/database.yml /vagrant/config/database.yml

echo '##  Updating the apt cache'
apt-get install -qq aptitude
aptitude update 2>&1 >> ${PROJECT_LOG}

echo '##  Installing dependencies'
echo '##  Installing dependencies'
aptitude install --assume-yes \
    apt-transport-https \
    autoconf \
    automake \
    bison \
    build-essential \
    curl \
    g++ \
    gcc \
    git-core \
    gnupg2 \
    libcurl4-openssl-dev \
    libffi-dev \
    libffi-dev \
    libgdbm-dev \
    libgdbm5 \
    libncurses5-dev \
    libpq-dev \
    libreadline6-dev \
    libsqlite3-dev \
    libssl-dev \
    libtool \
    libxml2-dev \
    libxslt-dev \
    libyaml-dev \
    make \
    nginx \
    nodejs \
    npm \
    openjdk-8-jre \
    postgresql \
    redis-server \
    sqlite3 \
    zlib1g-dev \
    2>&1 >> ${PROJECT_LOG}

echo '##  Install Elasticsearch'
cp /vagrant/dev_provisions/elastic-6.x.list /etc/apt/sources.list.d
wget -q https://artifacts.elastic.co/GPG-KEY-elasticsearch -O /tmp/GPG-KEY-elasticsearch
(apt-key add /tmp/GPG-KEY-elasticsearch) 2>&1 >> ${PROJECT_LOG}
aptitude update 2>&1 >> ${PROJECT_LOG}
aptitude install --assume-yes --quiet elasticsearch 2>&1 >> ${PROJECT_LOG}
systemctl enable elasticsearch 2>&1 >> ${PROJECT_LOG}
/etc/init.d/elasticsearch start 2>&1 >> ${PROJECT_LOG}
until [ $(curl -o /dev/null --silent --head --write-out '%{http_code}\n' http://127.0.0.1:9200) -eq 200 ];
do
    sleep 1;
done

echo '##  Installing NGINX'
cp /vagrant/dev_provisions/nginx.conf /etc/nginx/sites-available/default
systemctl reload nginx
systemctl enable nginx

echo '##  Installing PostgreSQL'
su - postgres -c \
psql <<__END__
CREATE USER blackops WITH PASSWORD '${BLACKOPS_DATABASE_PASSWORD}';
ALTER USER blackops WITH SUPERUSER;
__END__
systemctl enable postgresql

echo '##  Installing ruby, bundler, and rails'
wget -q https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.1.tar.gz
tar xzvf ruby-2.5.1.tar.gz
cd ruby-2.5.1
./configure
make install
cd && rm -rf ruby-2.5.1*

echo '##  Installing Fake S3'
gem install fakes3 2>&1 >> ${PROJECT_LOG}
fakes3 --root=${FAKE_S3_HOME} --port=${FAKE_S3_PORT} --license=${FAKE_S3_KEY} &

echo '##  Running bundle install'
echo "gem: --no-document" > ~/.gemrc
gem install nokogiri -v '1.10.0'
gem install bundler -v '1.17.3'
(cd /vagrant && bundle install) 2>&1 >> ${PROJECT_LOG}

/etc/init.d/elasticsearch start
until [ $(curl -o /dev/null --silent --head --write-out '%{http_code}\n' http://127.0.0.1:9200) -eq 200 ];
do
    sleep 1;
done

chown postgres /vagrant/db/structure.sql

echo '##  Running rake commands...'
for env in development;
do
    for rake_step in create structure:load seed;
    do
        echo "## DATABASE_URL=postgres://blackops:${BLACKOPS_DATABASE_PASSWORD}@localhost/blackops_${env} rake db:${rake_step}"
        cd /vagrant && DATABASE_URL=postgres://blackops:${BLACKOPS_DATABASE_PASSWORD}@localhost/blackops_${env} rake db:${rake_step} 2>&1 >> ${PROJECT_LOG};
    done
done

echo
echo
echo '#########################################################'
echo '##  Installation complete!'
echo "##  End time: $(date)"
echo '#########################################################'
echo '##  Environment Summary'
echo '#########################################################'
echo "ruby    = $(ruby -v)"
echo "rails   = $(rails --version)"
echo "bundler = $(bundler --version)"
echo "rake    = $(rake --version)"
echo "node    = $(nodejs --version)"
echo "npm     = $(npm -v)"
echo "java    = $(java -version 2>&1 | grep version)"
echo "psql    = $(psql --version)"
echo "nginx   = $(nginx -v 2>&1)"
echo "redis   = $(redis-server --version | awk '{print $3}')"
echo "elastic = $(curl -sX GET 'http://localhost:9200')"
echo '#########################################################'

date +%F-%s > /tmp/provisioning_complete.txt
echo
echo "##  Starting EBWiki on ${PROJECT_URL}"
echo '##  Run 'vagrant ssh' to connect to the VM'
echo '##  Run 'vagrant status' for tips on working with the VM'
echo
echo '##  To provision the database, run the following commands:'
echo '##       vagrant ssh'
echo '##       source /vagrant/dev_provisions/provision_database.sh'
source /vagrant/dev_provisions/provision_database.sh 2>&1 >> ${PROJECT_LOG}
fi
cd /vagrant && rails server 2>&1 >> ${PROJECT_LOG} &
