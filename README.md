<div align="center">
	<h1>High Availability with Mysql</h1>
</div>


<div align="center">
	<code><img width="45" src="https://raw.githubusercontent.com/marwin1991/profile-technology-icons/refs/heads/main/icons/mysql.png" alt="MySQL" title="MySQL"/></code>
	<code><img width="45" src="https://raw.githubusercontent.com/marwin1991/profile-technology-icons/refs/heads/main/icons/bash.png" alt="bash" title="bash"/></code>
	<code><img width="45" src="https://raw.githubusercontent.com/marwin1991/profile-technology-icons/refs/heads/main/icons/linux.png" alt="Linux" title="Linux"/></code>
</div>


#

Hi everybody,it's a document about High Availability with Mysql. The object with this file is to deepen my knowledge in Database and Infrastructure. I made an environment with two virtual machines with Linux. During the project. I was responsible for:
<ol>
	<li> 1GB memory ram</li>
  	<li> 30GB storing</li>
  	<li> 2 networking places (NAT and Host-only Adapter)</li>
	<li> System operation was Ubuntu 24</li>	
</ol>

<p>
  <img src="https://github.com/felipexavier1995/High-Availability-with-Mysql-/blob/main/images/tumble_dba.png" alt="tumble_dba.png">
</p>

With its lab we can understand and set up a little function that we can call “mirror databases” and a function of security of data that all DBA’s need to develop.

<div align="center">
	<h2> With its lab we can understand and set up a little function that we can call “mirror databases” and a function of security of data that all DBA’s need to develop. </h2>
</div>

#

After installation SO, We need somethings adjustments:
<ol>
	<li> First alteration is update SO with command: </li>
		sudo apt update
  	<li> After update, we need install Mysql with command:</li>
		sudo apt install mysql-server -y
  	<li> Check all service of mysql with command:</li>	
		sudo systemctl status mysql 
</ol>
<div align="center">
	<p>
  		<img src="https://github.com/felipexavier1995/High-Availability-with-Mysql-/blob/main/images/doc02.png" alt="doc02.png">
	</p>
</div>

and now, we go to the settings of file mysqld.cnf in each VM.

The VMs are located with the:

<ul>
  <li>Primary	IP: 192.168.56.107</li>
  <li>Replica	IP: 192.168.56.108</li>
</ul>

<div align="center">
	<p>
  		<img src="https://github.com/felipexavier1995/High-Availability-with-Mysql-/blob/main/images/art.png" alt="art.png">
	</p>
</div>

On the server primary we go configure of file mysqld.cnf with following parameters
vi /etc/mysql/mysql.conf.d/mysqld.cnf

<div align="center">
	<p>
  		<img src="https://github.com/felipexavier1995/High-Availability-with-Mysql-/blob/main/images/doc03.png" alt="doc03.png">
	</p>
</div>

Now, on the replication server, we wll create a user using the command and then grant permissions to the new user.
#
CREATE USER 'repl'@'%' IDENTIFIED BY 'password';
GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%';
FLUSH PRIVILEGES;
#
PS: We need switch the name 'password' for anything password.


<p>Still on the replication server, let's check the replication point using the command.</p>
show master status;
<div align="center">
	<p>
  		<img src="https://github.com/felipexavier1995/High-Availability-with-Mysql-/blob/main/images/doc04.png" alt="doc04.png">
	</p>
</div>

<p>The number of positions and files are important to be the same on the primary server.</p>
<p>On the replica server we are going to settings with the following parameters.</p>

vi /etc/mysql/mysql.conf.d/mysqld.cnf
<div align="center">
	<p>
  		<img src="https://github.com/felipexavier1995/High-Availability-with-Mysql-/blob/main/images/doc05.png" alt="doc05.png">
	</p>
</div>

<p>The line of relay-log is the one that communicates with the primary server and the server-id is identified if it is primary or replication
</p>

Next, the configuration of the replica within mysql we need to configure the parameters.
#
<p>CHANGE MASTER TO</p>
<p>MASTER_HOST='IP_DO_PRIMARY',         -> IP of primary server</p>
<p>MASTER_USER='repl',		           -> user maked</p>
<p>MASTER_PASSWORD='password',	           -> password that we set</p>
<p>MASTER_LOG_FILE='mysql-bin.00000x',   -> This number need to be alterado confirme o arquivo no servidor primary</p>
<p>MASTER_LOG_POS=157;		           -> This number needs to be the same on both servers</p>
#
<p>Now, we can test if we find working, firstly we are going to create a database on the primary server with command.</p>
create database test_replica;

<p>After, We can check a creation with command.</p>
show databases;

<div align="center">
	<p>
  		<img src="https://github.com/felipexavier1995/High-Availability-with-Mysql-/blob/main/images/doc06.png" alt="doc06.png">
	</p>
</div>





	

