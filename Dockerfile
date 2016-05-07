FROM alpine

ENV SPARK_VERSION=1.6.1

RUN echo '@edge http://nl.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories
RUN echo '@community http://nl.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories
RUN apk update && apk upgrade

# openjdk7-jre-base contains no GUI support. see https://pkgs.alpinelinux.org/package/main/x86_64/openjdk7-jre-base
RUN apk add openjdk7-jre-base
#RUN apt-get install -y wget openjdk-7-jre-headless python-pip
#RUN pip install awscli

# Clean APK cache
RUN rm -rf /var/cache/apk/*

RUN wget http://mirrors.ocf.berkeley.edu/apache/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-hadoop2.6.tgz

RUN tar xzf spark-$SPARK_VERSION-bin-hadoop2.6.tgz

WORKDIR /spark-$SPARK_VERSION-bin-hadoop2.6

# this copies in config files to run
#COPY run-driver.sh run-driver.sh

#ENTRYPOINT [ "./run-driver.sh", "bin/spark-submit" ]
