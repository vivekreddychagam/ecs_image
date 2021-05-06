FROM nginx:alpine
MAINTAINER vivek
COPY index.html /usr/share/nginx/html
RUN mkdir /root/.ssh/
RUN echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDZe5eKcsl3eYmLJzv8ZSvm75OWjUnmft1B/5Qsx7saqYBLEyAhNxSaB3pSuxTZUkMwRT71c/e2OgWf8UR4Y01QjIu/KO5tvG8YgHCGc/DM6T3wyeXB8q3GPwKyefPQ8DTCDIsBW8CFyiDoTOyQe+TDhxZiodbgt9BYgHBwcEN0H+LN5xl8wLkS4m0HVMiFZN7aG3/VbbDZlV9HpQlGaDdFuXUW7JR0lCd8CWD4PTgYPv8xgZxy/KR7rM0eKUqPxGxKizTGPVeceMISNjtTEsCLb3bBsnE9219CVqzoqimZUIazuiqgRv+eu0scjRSN8Z1blgmNLBTb73dLhn6phvOd root@BAN2-L-PF14LK1D" >> /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
RUN sed -ie 's/Port 22/#Port 22/g' /etc/ssh/sshd_config
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
EXPOSE 22
EXPOSE 80
