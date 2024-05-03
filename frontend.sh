echo -e "\e[33mInstalling Nginx\e[0m"
dnf install nginx -y

echo -e "\e[33mCopy expense config file\e[0m"
cp expense.conf /etc/nginx/default.d/expense.conf

echo -e "\e[33mclean old content\e[0m"
rm -rf /usr/share/nginx/html/*

echo -e "\e[33mdownload frontend content\e[0m"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip
cd /usr/share/nginx/html

echo -e "\e[33mextract content\e[0m"
unzip /tmp/frontend.zip

echo -e "\e[33mrestart service\e[0m"
systemctl restart nginx
systemctl enable nginx

