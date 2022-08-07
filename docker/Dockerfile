FROM python:3.7-slim-buster
# Install python packages

RUN apt update && apt upgrade -y
RUN apt install gcc -y
RUN apt install openssh-server -y

RUN pip install mlflow boto3 pymysql psycopg2-binary pysftp

EXPOSE 5000

COPY entrypoint.sh /entrypoint.sh

CMD /entrypoint.sh