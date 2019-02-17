source /vagrant/dev_provisions/environment.sh
echo
echo "##  Starting EBWiki on ${PROJECT_URL}"
echo '##  Run 'vagrant ssh' to connect to the VM'
echo '##  Run 'vagrant status' for tips on working with the VM'
echo
echo '##  To provision the database, run the following commands:'
echo '##       vagrant ssh'
echo '##       source /vagrant/dev_provisions/provision_database.sh'
cd /vagrant && rails server 2>&1 >> ${PROJECT_LOG} &
