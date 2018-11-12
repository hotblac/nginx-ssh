FROM nginx:stable

RUN apt-get update && apt-get install -y openssh-server
EXPOSE 22

CMD service ssh start && nginx -g 'daemon off;'
