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

<div align="center">
	<p>
  		<img src="https://github.com/felipexavier1995/High-Availability-with-Mysql-/blob/main/images/art.png" alt="art.png">
	</p>
</div>

After installation SO, We need somethings adjustments:

<ol>
	<li> First alteration is update SO with command:</li>
			sudo apt update
  	<li> After update, we need install Mysql with command:</li>
			sudo apt install mysql-server -y
  	<li> Check all service of mysql with command:</li>
			sudo systemctl status mysql
		<p align="center">
  			<img  src="https://github.com/felipexavier1995/High-Availability-with-Mysql-/blob/main/images/doc01.png" alt="doc01.png">
		</p>
</ol>
