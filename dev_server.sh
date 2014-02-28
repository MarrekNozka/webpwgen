#!/bin/bash
# File:    dev_server.sh
# Task:    Bottle framework develompent wrapper
############################################################

python -m bottle --bind=localhost:8899 --debug --reload webpwgen    
