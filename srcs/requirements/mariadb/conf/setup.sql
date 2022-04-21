ALTER USER 'root'@'localhost' IDENTIFIED BY '12345';
CREATE DATABASE wordpress;
CREATE USER 'cdarrell'@'%' IDENTIFIED BY 'root';
GRANT ALL ON wordpress.* TO 'cdarrell'@'%';
FLUSH PRIVILEGES;