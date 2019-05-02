FROM uhopper/hadoop:2.8.1

ARG FL_VERSION=1.9.0
ARG HADOOP_HOME=/opt/hadoop-2.8.1

ENV HDFS_CONF_dfs_namenode_name_dir=file:///hadoop/dfs/name
RUN mkdir -p /hadoop/dfs/name
VOLUME /hadoop/dfs/name

COPY resources/sqoop-1.4.7.tar.gz /opt/
COPY resources/mysql-connector-java-5.1.47.tar.gz /tmp/
COPY resources/jdk_ri-8u40-b25-linux-x64-10_feb_2015.tar.gz /opt/
COPY resources/apache-flume-${FL_VERSION}-bin.tar.gz /tmp/apache-flume-${FL_VERSION}-bin.tar.gz
COPY resources/KEYS /tmp/KEYS
COPY resources/apache-hive-2.3.4-bin.tar.gz /opt/
COPY resources/hive-env.sh /opt/apache-hive-2.3.4-bin/conf/

ADD resources/hello-world.conf /opt/flume/hello-world.conf


# Sqoop
RUN tar -zxf /opt/sqoop-1.4.7.tar.gz -C /opt/ && \
tar -zxf /tmp/mysql-connector-java-5.1.47.tar.gz -C /tmp/ && \
mv /tmp/mysql-connector-java-5.1.47/mysql-connector-java-5.1.47.jar /opt/sqoop-1.4.7.bin__hadoop-2.6.0/lib && \
tar -zxf /opt/jdk_ri-8u40-b25-linux-x64-10_feb_2015.tar.gz -C /opt/

ENV HADOOP_COMMON_HOME=${HADOOP_HOME}
ENV HADOOP_MAPRED_HOME=${HADOOP_HOME}
ENV HADOOP_HOME=${HADOOP_HOME}
ENV HADOOP_HDFS_HOME=${HADOOP_HOME}
ENV YARN_HOME=${HADOOP_HOME}

# Sqoop
ENV PATH=$PATH:/opt/sqoop-1.4.7.bin__hadoop-2.6.0/bin
# Java
ENV PATH=/opt/java-se-8u40-ri/bin:$PATH
ENV JAVA_HOME=/opt/java-se-8u40-ri


#HIVE

ENV HIVE_HOME="/opt/apache-hive-2.3.4-bin/"
ENV PATH=$PATH:$HIVE_HOME/bin


RUN \
# Install
  tar xvzf /tmp/apache-flume-${FL_VERSION}-bin.tar.gz -C /opt && \
  mv /opt/apache-flume-${FL_VERSION}-bin /opt/flume && \
  rm -f /tmp/apache-flume-* && \
  rm -f /tmp/KEYS

#Hive

RUN tar -xzf /opt/apache-hive-2.3.4-bin.tar.gz -C /opt && \
    rm /opt/apache-hive-2.3.4-bin.tar.gz

ADD run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]
