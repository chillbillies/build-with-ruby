CREATE DATABASE local_dev;
CREATE USER local_dev WITH PASSWORD 'containerdev123';
GRANT ALL PRIVILEGES ON DATABASE local_dev TO local_dev;

CREATE DATABASE local_test;
CREATE USER local_test WITH ENCRYPTED PASSWORD 'containertest123';
GRANT ALL PRIVILEGES ON DATABASE local_test TO local_test;
