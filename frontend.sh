rm -f /tmp/expense.log

HEADING() {
  echo -e "\e[35m$*\e[0m"
}

HEADING Installing Nginx
dnf install nginx -y &>>/tmp/expense.log
echo exit status - $?

HEADING Copy expense config file
cp expense.conf /etc/nginx/default.d/expense.conf &>>/tmp/expense.log
echo exit status - $?

HEADING clean old content
rm -rf /usr/share/nginx/html/* &>>/tmp/expense.log
echo exit status - $?

HEADING download frontend content
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip &>>/tmp/expense.log
echo exit status - $?
cd /usr/share/nginx/html

HEADING extract content
unzip /tmp/frontend.zip &>>/tmp/expense.log
echo exit status - $?

HEADING restart service
systemctl enable nginx &>>/tmp/expense.log
systemctl restart nginx &>>/tmp/expense.log
echo exit status - $?
