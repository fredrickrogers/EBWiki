#!/bin/bash
# Do some groundwork with the environment
source /vagrant/dev_provisions/environment.sh

echo '#########################################################'
echo '##  Provisioning the EBWiki Development Environment'
echo '##  This will take a while :D (10-15 mins depending on network)'
echo "##  Start time: $(date)"
echo '#########################################################'

cp /vagrant/dev_provisions/database.yml /vagrant/config/database.yml

echo '##  Start Fake S3'
fakes3 -r ${FAKE_S3_HOME} -p ${FAKE_S3_PORT} --license ${FAKE_S3_KEY} 2>&1 &

echo '##  Running bundle install'
(cd /vagrant && bundle install) 2>&1

echo '##  Running rake commands...'
for env in development;
do
    for rake_step in create structure:load;
    do
        echo "## DATABASE_URL=postgres://blackops:${BLACKOPS_DATABASE_PASSWORD}@localhost/blackops_${env} rake db:${rake_step}"
        cd /vagrant && DATABASE_URL=postgres://blackops:${BLACKOPS_DATABASE_PASSWORD}@localhost/blackops_${env} rake db:${rake_step} 2>&1;
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
echo "rails   = $(rails -v)"
echo "ruby    = $(ruby -v)"
echo "node    = $(nodejs --version)"
echo "npm     = $(npm -v)"
echo "java    = $(java -version 2>&1 | grep version)"
echo "psql    = $(psql --version)"
echo "nginx   = $(nginx -v 2>&1)"
echo "redis   = $(redis-server --version | awk '{print $3}')"
echo "elastic = $(curl -sX GET 'http://localhost:9200')"
echo '#########################################################'

source /vagrant/dev_provisions/provision_database.sh 2>&1
bin/rake db:migrate RAILS_ENV=development 2>&1
sudo systemctl restart nginx
cd /vagrant && rails server > /vagrant/ebwiki.log &

echo
echo "##  Starting EBWiki on ${PROJECT_URL}"
echo '##  Run 'vagrant ssh' to connect to the VM'
echo '##  Run 'vagrant status' for tips on working with the VM'
echo
echo '##  To provision the database, run the following commands:'
echo '##       vagrant ssh'
echo '##       source /vagrant/dev_provisions/provision_database.sh'
