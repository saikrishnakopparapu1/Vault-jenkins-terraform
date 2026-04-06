#!/bin/bash
yum update -y

amazon-linux-extras enable corretto17
yum install -y java-17-amazon-corretto

wget -O /etc/yum.repos.d/jenkins.repo \
  https://pkg.jenkins.io/redhat-stable/jenkins.repo

rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
yum install -y jenkins

systemctl enable jenkins
systemctl start jenkins