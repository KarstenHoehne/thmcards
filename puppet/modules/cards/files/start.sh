#!/usr/bin/env bash
set -x
echo -e "starting THM-Cards...\c"

# set up DB
cd /vagrant/thm-cards/
nodejs app.js