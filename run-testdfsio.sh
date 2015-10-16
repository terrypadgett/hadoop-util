#!/bin/bash
#
# Run small TestDFSIO 
# HDP 2.2 environment
#
EXAMPLES_JAR=/usr/hdp/current/hadoop-mapreduce-client/hadoop-mapreduce-client-jobclient-tests.jar
NUMBER_OF_FILES=4
#base size is 1M
FILESIZE=1
TESTDFSIO_DIR=benchmarks/TestDFSIO

if ( hdfs dfs -test -d $TESTDFSIO_DIR ) ; then
	echo "Removing ${TESTDFSIO_DIR}"
	yarn jar $EXAMPLES_JAR TESTDFSIO -clean 
fi

# Write the data
# yarn jar /usr/hdp/current/hadoop-mapreduce-client/hadoop-mapreduce-examples.jar TestDFSIO -write -nrFiles 4 -fileSize 1
yarn jar $EXAMPLES_JAR TestDFSIO -write -nrFiles $NUMBER_OF_FILES -fileSize $FILESIZE

# yarn jar /usr/hdp/current/hadoop-mapreduce-client/hadoop-mapreduce-examples.jar TestDFSIO -read -nrFiles 4 -fileSize 1
yarn jar $EXAMPLES_JAR TestDFSIO -read -nrFiles $NUMBER_OF_FILES -fileSize $FILESIZE

