#!/usr/bin/env bash

echo
echo "Installing Java..."
cd /usr/local
cp /vagrant/Files/jre-8u111-linux-x64.tar.gz ./
tar -xf jre-8u111-linux-x64.tar.gz
ln -s /usr/local/jre1.8.0_111/bin/java /usr/bin/java

echo
echo "Installing Neo4j..."
cd /etc
cp /vagrant/Files/neo4j-community-3.0.7-unix.tar.gz ./
tar -xf neo4j-community-3.0.7-unix.tar.gz
#export PATH=$PATH:/etc/neo4j-community-3.0.7/bin/
touch  /etc/profile.d/vagrant.sh
echo "PATH=\$PATH:/etc/neo4j-community-3.0.7/bin" >> /etc/profile.d/vagrant.sh
chmod 755 /etc/profile.d/vagrant.sh
source /etc/profile.d/vagrant.sh
#rm -rf /etc/neo4j-community-3.0.7/data
#mkdir -p /vagrant/neo4j_data/data
#ln -sfn /vagrant/neo4j_data/data /etc/neo4j-community-3.0.7/data

echo
echo "Cleaning Up..."
rm /usr/local/jre-8u111-linux-x64.tar.gz
rm /etc/neo4j-community-3.0.7-unix.tar.gz

echo
echo "Updating Neo4j Config..."
sed -i 's/#dbms\.connector\.http\.address=0\.0\.0\.0:7474/dbms.connector.http.address=0.0.0.0:7474/' /etc/neo4j-community-3.0.7/conf/neo4j.conf
echo
echo "Starting Neo4j..."
neo4j start