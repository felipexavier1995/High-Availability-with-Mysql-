--- Commands sql and shell
/*
Here have alls commands that used on Project.
*/

--- 1 - First alteration is update SO with command:
	sudo apt update
--- 2 -  After update, we need install Mysql with command:
sudo apt install mysql-server -y
---- 3 - Check all service of mysql with command:
sudo systemctl status mysql 


--- Now we can edit in path file

vi /etc/mysql/mysql.conf.d/mysqld.cnf

-- Command in SQL, We can created a user and password with your grants
-- PS switch the name 'senha' for other password
CREATE USER 'repl'@'%' IDENTIFIED BY 'senha';
GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%';
FLUSH PRIVILEGES;


-- Inside on mysql, command to show the file and position
show master status;

-- Command to view the file cnf, where we can see somethings parameters 
vi /etc/mysql/mysql.conf.d/mysqld.cnf
