#!/usr/bin/env bash
set -x
echo -e "Initializing couchDB...\c"

# set up DB
cd /vagrant/thm-cards/
python createviews.py
sleep 1

# copy badge docs into db
curl -d @/vagrant/thm-cards/couchviews/default_badges.design -X POST http://127.0.0.1:5984/thmcards/_bulk_docs -H "Content-Type: application/json"
sleep 1

# install thm-cards Write failed: Connection reset by peer
# cd /vagrant/thm-cards/
# npm install --loglevel info --no-bin-links