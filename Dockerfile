FROM ubuntu:22.04

RUN apt-get update && apt-get install flex bison make g++ -y
