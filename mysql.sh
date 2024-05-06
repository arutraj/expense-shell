source common.sh
rm -f /tmp/expense.log

if [ -z "$1" ]; then
  echo "INput MySQL Password is Missing"
  exit 1
fi

HEADING Installing MySQL Server
dnf install mysql-server -y &>>/tmp/expense.log
if [ $? -eq 0 ]; then
  echo SUCCESS
else
  echo FAILURE
  exit 2
fi

HEADING Start Nginx Service
systemctl enable mysqld &>>/tmp/expense.log
systemctl start mysqld &>>/tmp/expense.log
if [ $? -eq 0 ]; then
  echo SUCCESS
else
  echo FAILURE
  exit 2
fi

HEADING Set Root Password
mysql_secure_installation --set-root-pass $1 &>>/tmp/expense.log
if [ $? -eq 0 ]; then
  echo SUCCESS
else
  echo FAILURE
  exit 2
fi

