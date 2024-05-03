echo -e "\e[35mInstalling Nginx\e[0m"
dnf install nginx -y
echo exit status - $?

echo -e "\e[35mCopy expense config file\e[0m"
cp expense.conf /etc/nginx/default.d/expense.conf
echo exit status - $?

echo -e "\e[35mclean old content\e[0m"
rm -rf /usr/share/nginx/html/*
echo exit status - $?

echo -e "\e[35mdownload frontend content\e[0m"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip
echo exit status - $?
cd /usr/share/nginx/html

echo -e "\e[35mextract content\e[0m"
unzip /tmp/frontend.zip
echo exit status - $?

echo -e "\e[35mrestart service\e[0m"
systemctl enable nginx
systemctl restart nginx
echo exit status - $?
