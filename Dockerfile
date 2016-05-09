FROM gliderlabs/alpine:3.3
MAINTAINER David Tompkins <tompkins@adobe.com>

ENV SPARK_VERSION=1.6.1 \
    HADOOP_VERSION=hadoop2.6

RUN echo '@testing http://alpine.gliderlabs.com/alpine/edge/testing' >> /etc/apk/repositories && \
    apk add --no-cache openjdk7-jre-base python python3 py-pip py-certifi bash py-numpy@testing py-scipy@testing && \
    wget http://mirrors.ocf.berkeley.edu/apache/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-${HADOOP_VERSION}.tgz && \
    rm -rf /var/cache/apk/* && \
    tar xzf spark-${SPARK_VERSION}-bin-${HADOOP_VERSION}.tgz && \
    /bin/rm -f spark-${SPARK_VERSION}-bin-${HADOOP_VERSION}/lib/spark-examples-${SPARK_VERSION}-${HADOOP_VERSION}.0.jar && \
    /bin/rm -f spark-${SPARK_VERSION}-bin-${HADOOP_VERSION}/lib/spark-${SPARK_VERSION}-yarn-shuffle.jar && \
    /bin/rm -f spark-${SPARK_VERSION}-bin-${HADOOP_VERSION}/CHANGES.txt && \
    /bin/rm -rf spark-${SPARK_VERSION}-bin-${HADOOP_VERSION}/examples && \
    rm spark-${SPARK_VERSION}-bin-${HADOOP_VERSION}.tgz
