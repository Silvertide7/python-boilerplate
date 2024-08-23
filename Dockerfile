FROM python:3.12.5-slim

RUN mkdir -p /magic_demo
RUN mkdir -p /magic_demo/tests
WORKDIR /magic_demo

RUN apt-get update && apt-get install unzip -y

COPY makefile /magic_demo
COPY ./magic_demo /magic_demo
COPY ./tests /magic_demo/tests

CMD ["make", "test"]