#!/bin/bash
yum update -y
yum install -y httpd

# Get instance ID
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)

echo "<!DOCTYPE html>
<html>
<head>
<title>Terraform Project Server 1</title>
<style>
@keyframes colorChange {
  0% { color: red; }
  50% { color: green; }
  100% { color: blue; }
}
h1 {
  animation: colorChange 2s infinite;
}
</style>
</head>
<body>
<h1>Terraform Project Server 1</h1>
<h2>Instance ID: <span style='color:green'>${INSTANCE_ID}</span></h2>
<p>Welcome to Reyaz DnA Course</p>
</body>
</html>" > /var/www/html/index.html

systemctl start httpd
systemctl enable httpd
