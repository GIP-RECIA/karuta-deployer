-- SQL database and account creation, and grant to account


SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

SET @user := 'karuta';
SET @pass := 'karuta_password';
SET @db := 'karuta-backend';

SET @sql = CONCAT("CREATE USER '",@user,"'@localhost IDENTIFIED BY '",@pass,"'");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = CONCAT("CREATE DATABASE IF NOT EXISTS `",@db,"`");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- SET @sql = CONCAT("GRANT USAGE ON `",@db,"` . * TO '",@user,"'@localhost IDENTIFIED BY '",@pass,"' WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0");
SET @sql = CONCAT("GRANT USAGE ON `",@db,"` . * TO '",@user,"'@localhost");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = CONCAT("ALTER USER '",@user,"'@localhost WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = CONCAT("GRANT ALL PRIVILEGES ON `",@db,"` . * TO '",@user,"'@localhost");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- CREATE USER @user @ 'localhost' IDENTIFIED BY @pass;

-- CREATE DATABASE IF NOT EXISTS @db ;

-- GRANT USAGE ON @db . * TO @user @ 'localhost' IDENTIFIED BY @pass WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0 ;

-- GRANT ALL PRIVILEGES ON @db . * TO @user @ 'localhost';
