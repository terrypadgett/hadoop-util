#!/bin/env bash
#
# Assumptions: The ambari-server binary is in the executing users path
#
# Input Argument : Full path to the ojdbc6.jar file
#
# NOTE: Jar file must have 644 permisssions
#
ambari-server setup --jdbc-db=oracle --jdbc-driver=$1
