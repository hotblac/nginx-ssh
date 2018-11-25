FROM nginx:stable

RUN apt-get update && apt-get install -y openssh-server
EXPOSE 22

# Create a group and user account for the SSH connection
RUN groupadd sshgroup && useradd -ms /bin/bash -g sshgroup sshuser

# NOT RECOMMENDED: Set a password on the sshuser account
# RUN echo 'sshuser:Pa$$word' | chpasswd

# MORE SECURE: use a trusted RSA key
ARG home=/home/sshuser
RUN mkdir $home/.ssh
COPY id_rsa.pub $home/.ssh/authorized_keys
RUN chown sshuser:sshgroup $home/.ssh/authorized_keys && \
    chmod 600 $home/.ssh/authorized_keys

CMD service ssh start && nginx -g 'daemon off;'
