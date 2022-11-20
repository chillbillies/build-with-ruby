CREATE DATABASE chill_dev;
CREATE USER chill_dev WITH PASSWORD 'containerdev123';
GRANT ALL PRIVILEGES ON DATABASE chill_dev TO chill_dev;

CREATE DATABASE chill_test;
CREATE USER chill_test WITH ENCRYPTED PASSWORD 'containertest123';
GRANT ALL PRIVILEGES ON DATABASE chill_test TO chill_test;
