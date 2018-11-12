FROM nginx:stable

RUN apt-get update && apt-get install -y openssh-server
EXPOSE 22

# Create a group and user account for the SSH connection
RUN groupadd sshgroup && useradd -ms /bin/bash -g sshgroup sshuser

CMD service ssh start && nginx -g 'daemon off;'
