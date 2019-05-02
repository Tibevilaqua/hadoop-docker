#!/bin/sh

curl -fSL http://apache.mirror.amaze.com.au/sqoop/1.4.7/sqoop-1.4.7.bin__hadoop-2.6.0.tar.gz -o sqoop-1.4.7.tar.gz
curl -fSL https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.47.tar.gz -o mysql-connector-java-5.1.47.tar.gz
curl -fSL -v -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" https://download.java.net/openjdk/jdk8u40/ri/jdk_ri-8u40-b25-linux-x64-10_feb_2015.tar.gz -o jdk_ri-8u40-b25-linux-x64-10_feb_2015.tar.gz
curl -L http://www-eu.apache.org/dist/flume/1.9.0/apache-flume-1.9.0-bin.tar.gz -o apache-flume-1.9.0-bin.tar.gz
curl -L https://www.apache.org/dist/flume/KEYS -o KEYS
curl -fSL http://apache.mirror.amaze.com.au/hive/hive-2.3.4/apache-hive-2.3.4-bin.tar.gz -o apache-hive-2.3.4-bin.tar.gz

mv sqoop-1.4.7.tar.gz ././namenode/resources/
mv mysql-connector-java-5.1.47.tar.gz ././namenode/resources/
mv jdk_ri-8u40-b25-linux-x64-10_feb_2015.tar.gz ././namenode/resources/
mv apache-flume-1.9.0-bin.tar.gz ././namenode/resources/
mv KEYS ././namenode/resources/
mv apache-hive-2.3.4-bin.tar.gz ././namenode/resources/


for i in hadoop namenode datanode resourcemanager nodemanager historyserver spark; do
    echo Building $i
    ( cd $i && ./build.sh)
done