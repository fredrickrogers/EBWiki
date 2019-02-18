su - postgres -c "psql -c \"DROP USER IF EXISTS blackops;\""
su - postgres -c "psql -c \"CREATE USER blackops WITH PASSWORD 'ebwiki';\""
su - postgres -c "psql -c \"ALTER USER blackops WITH SUPERUSER;\""
chown postgres /vagrant/db/structure.sql

