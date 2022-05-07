# Raspberry Pi MariaDB SQL server


The steps I took to set up MariaDB server using an old Raspberry Pi 2 B running the most recent version of 

Note: This would probably be better on a Raspberry Pi 4, but they are currently impossible to get at a reasonable price

1. Update Raspberry Pi if needed
```
sudo apt update
sudo apt upgrade
```
2. Install MariaDB server
```
sudo apt install mariadb-server
```
3. Set up root access (modify as needed)
```
sudo mysql_secure_installation
```
4. Connecting as root
```
sudo mysql -u root -p
```
Then in mysql
```
GRANT ALL PRIVILEGES on *.*
TO 'root'@'%';
FLUSH PRIVILEGES;
```
You will also probably need to do this
```
SET PASSWORD FOR 'root'@'%' = PASSWORD("AStrongPwd");
```
5. Test this by running the following
```
mysql -u root -h localhost -p
```
6. Create a new user (so you don't need to continue to use root)
```
CREATE USER '<user>'@'%';

SET PASSWORD FOR '<user>'@'%' = PASSWORD("AStrongPwd");

GRANT ALL PRIVILEGES on *.* 
TO '<user>'@'%';
FLUSH PRIVILEGES;
```
These steps are a combination of steps from 
- [RaspberryTips](https://raspberrytips.com/install-mariadb-raspberry-pi/)
- [Richard Youngkin](https://betterprogramming.pub/how-to-install-mysql-on-a-raspberry-pi-ad3f69b4a094)
- [Database.Guide](https://database.guide/fix-access-denied-for-user-rootlocalhost-in-mariadb/) 

The above will work to start using MariaDB SQL server; however, my microSD card is really tiny (8 GB). 

**Here is how I set up a 1 TB USB drive as my data directory**

1. Insert the USB drive and check the block name of the drive partition you want your database to be on
```
lsblk
```
2. Mine was sda1 (yours might be different)
3. Unmount the drive and format it to ext4
```
sudo umount /dev/sdXX # Change sdXX to whatever your drive is
sudo mkfs.ext4 /dev/sdXX -L database
```
4. Create a mount point for your drive
```
sudo mkdir /mnt/database
```
5. Edit your /etc/fstab (using vim, nvim, nano, etc.) as root (sudo) and insert the following
```
/dev/sda1   /mnt/database   ext4  defaults  0   0
```
6. Mount your drive to /mnt/database
```
sudo mount -a
```
7. Clone /var/lib/mysql to /mnt/database/
```
sudo rsync -a /var/lib/mysql /mnt/database/
```
8. Edit (using vim, nvim, nano, etc.) as root (sudo) /etc/msql/mariadb.conf.d/50-server.cnf and edit the following line
```
data.dir        = /mnt/database/mysql
```
9. Restart MariaDB
```
sudo systemctl restart mysql
```
These steps were modified from this [thread](https://mariadb.com/kb/en/i-know-this-has-been-asked-loads-before-but/)
