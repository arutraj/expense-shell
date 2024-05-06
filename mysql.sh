source common.sh
rm -f /tmp/expense.log

if [ -z "$1" ]; then
  echo "INput MySQL Password is Missing"
  exit
fi

HEADING Installing MySQL Server
dnf install mysql-server -y
echo exit status - $?

HEADING Start Nginx Service
systemctl enable mysqld
systemctl start mysqld
echo exit status - $?

HEADING Set Root Password
mysql_secure_installation --set-root-pass $1
echo exit status - $?
