#!/bin/bash
#
# Run small terasort test 
# HDP 2.2.x environment
#
EXAMPLES_JAR=/usr/hdp/current/hadoop-mapreduce-client/hadoop-mapreduce-examples.jar
# rows are 100 bytes each
NUMBER_OF_ROWS=10000
OUTPUT_DIR=/user/root/terasort_out
INPUT_DIR=/user/root/terasort_in
TERAVALIDATE_OUT=/user/home/teravalidate_out

for DIRECTORY in $OUTPUT_DIR $INPUT_DIR $TERAVALIDATE_OUT; do 
	if ( hdfs dfs -test -d $DIRECTORY ) ; then
    		echo "Removing ${DIRECTORY}"
		hdfs dfs -rm -r -skipTrash $DIRECTORY
	fi
done 

# Genrate the data
# yarn jar /usr/hdp/current/hadoop-mapreduce-client/hadoop-mapreduce-examples.jar teragen 10000 /user/root/terasort_in
yarn jar $EXAMPLES_JAR teragen $NUMBER_OF_ROWS $INPUT_DIR

# yarn jar /usr/hdp/current/hadoop-mapreduce-client/hadoop-mapreduce-examples.jar terasort /user/root/terasort_in /user/root/tersort_out
yarn jar $EXAMPLES_JAR terasort $INPUT_DIR $OUTPUT_DIR

# yarn jar /usr/hdp/current/hadoop-mapreduce-client/hadoop-mapreduce-examples.jar teravalidate /user/home/terasort_out /user/home/teravalidate_out
yarn jar $EXAMPLES_JAR teravalidate $OUTPUT_DIR $TERAVALIDATE_OUT
