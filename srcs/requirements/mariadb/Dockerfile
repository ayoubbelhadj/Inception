FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y mariadb-server

COPY ./tools/script.sh .

EXPOSE 3306

CMD ["bash", "script.sh"]