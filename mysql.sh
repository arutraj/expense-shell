echo -e "\e[35mInstalling MySQL Server\e[0m"
dnf install mysql-server -y
echo exit status - $?

echo -e "\e[35Start Nginx Service\e[0m"
systemctl enable mysqld
systemctl start mysqld
echo exit status - $?

echo -e "\e[35mSet Root Password\e[0m"
mysql_secure_installation --set-root-pass $1
echo exit status - $?
