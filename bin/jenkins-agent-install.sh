#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo 'root required (use "sudo jenkins-agent-install.sh")'
  exit 1
fi

JENKINS_URL=${JENKINS_URL:-https://jenkins.int.quadtreeworld.net}
if [ -z "$JENKINS_SECRET" ];
then
        echo "JENKINS_SECRET is required"
        exit 1
fi

# Download jenkins agent
curl -s -o /home/vagrant/jenkins-agent.jar ${JENKINS_URL}/jnlpJars/agent.jar
chown vagrant:vagrant /home/vagrant/jenkins-agent.jar

sudo mkdir -p /home/vagrant/jenkins
sudo chown -R vagrant:vagrant /home/vagrant/jenkins

echo "
[Unit]
Description=jenkins-agent
After=network-online.target

[Service]
Type=simple
ExecStart=java -jar /home/vagrant/jenkins-agent.jar -jnlpUrl "${JENKINS_URL}/computer/${HOSTNAME}/jenkins-agent.jnlp" -secret ${JENKINS_SECRET} -workDir "/home/vagrant/jenkins"
PIDFile=/run/jenkins-agent.pid
User=vagrant
Group=vagrant
WorkingDirectory=/home/vagrant/jenkins

[Install]
WantedBy=multi-user.target
" > /etc/systemd/system/jenkins-agent.service

systemctl daemon-reload
systemctl enable jenkins-agent
systemctl restart jenkins-agent




