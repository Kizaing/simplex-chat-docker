FROM ubuntu:focal

COPY ./smp-server-ubuntu-20_04-x86-64 /app/smp-server
COPY ./entrypoint.sh /entrypoint.sh

RUN apt-get update \
    && apt-get install -y openssl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

EXPOSE 5223

ENTRYPOINT [ "/bin/bash" ]
CMD [ "/entrypoint.sh" ]