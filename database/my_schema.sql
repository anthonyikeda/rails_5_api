CREATE DATABASE IF NOT EXISTS inventory_manager_dev ;

CREATE USER 'im_user'@'localhost' IDENTIFIED BY 'aB6yog4Quex5';
GRANT ALL PRIVILEGES ON inventory_manager_dev.* TO 'im_user'@'localhost' WITH GRANT OPTION;

FLUSH PRIVILEGES;

CREATE USER 'im_user'@'%' IDENTIFIED BY 'aB6yog4Quex5';
GRANT ALL PRIVILEGES ON inventory_manager_dev.* TO 'im_user'@'%' WITH GRANT OPTION;

FLUSH PRIVILEGES;
