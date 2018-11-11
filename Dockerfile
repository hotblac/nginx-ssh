FROM nginx:stable

RUN apt-get update && apt-get install -y openssh-server

