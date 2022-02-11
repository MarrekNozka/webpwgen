#!/bin/sh
# File:    dev_server.sh
# Task:    Bottle framework develompent wrapper
############################################################

python3 -m bottle --bind=localhost:8899 --debug --reload webpwgen    
