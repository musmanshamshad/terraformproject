CREATE DATABASE IF NOT EXISTS usmandb;

USE usmandb;

CREATE USER 'usman'@'%' IDENTIFIED BY 'usman1';
GRANT ALL PRIVILEGES ON usmandb.* TO 'usman'@'%';


