FROM ubuntu:24.04

RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

COPY . /opt/script4vps

CMD ["bash"]
