FROM debian:buster-slim

COPY setup-docker-env.sh /root/setup-docker-env.sh

RUN /bin/sh /root/setup-docker-env.sh

COPY builds /builds

CMD ["sleep_forever_in_docker"] 
