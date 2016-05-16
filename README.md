# spark_executor_docker

A Docker-based Spark executor for use with Apache Spark 1.6.1+ in cluster mode on Apache Mesos 0.28.1+, including support for Scala and Python Spark applications.

# Build 

Dockerfiles are included for both CentOS 6.x and Alpine 3.3, and a Rakefile includes rules to build both executor container images.

I have attempted to minimize the size of the container images, and the current sizes are:

* Alpine 3.3 (with no libmesos.so): 593 MB
* CentOS 6.x (with no libmesos.so): 655 MB
* CentOS 6.x (with libmesos.so): 801 MB

Note that Spark requires a working version of libmesos.so within the executor container, so the smaller container images without libmesos installed via RPM from Mesosphere will need to be manually patched with a copy of libmesos.so.

## Spark Version

* Apache Spark 1.6.1+
* Apache Mesos 0.28.1+

## Configuration

Set the following environment variables in ``${SPARK_HOME}/conf/docker.properties``:

* spark.mesos.executor.docker.image: local/bluejay-spark-executor:latest
* spark.mesos.executor.home: /spark-1.6.1-bin-hadoop2.6
* spark.executorEnv.MESOS_NATIVE_JAVA_LIBRARY: /usr/lib/libmesos.so

Note that the current implementation of Mesos's launch mechanism uses Docker v1, so if you choose to change the image URL to a remote Docker registry with authentication then you will need to use Docker v1 authentication.

## License

Licensed under the Apache Software License 2.0.
