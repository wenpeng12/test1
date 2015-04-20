#!/bin/bash

if [ -d "/opt/maven" ]; then
	echo "Maven already installed in /opt/maven, skipping!"
	rm -f equip_maven3.sh
	exit 0
fi

LATEST="3.2.5"

if (( "$#" == 1 )); then
	LATEST=$1
fi

FILENAME="apache-maven-$LATEST-bin.tar.gz"
LINK="http://ftp.unicamp.br/pub/apache/maven/maven-3/$LATEST/binaries/$FILENAME"

echo "$LINK"

wget --no-check-certificate "$LINK"

mkdir maven 
tar -zxvf $FILENAME -C maven --strip-components 1

# Will copy to /opt
sudo mv maven /opt/
