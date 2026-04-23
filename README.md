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


Still on the replication server, let's check the replication point using the command.
show master status;









	

