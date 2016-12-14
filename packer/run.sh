#!/bin/bash

bundle install
bundle exec librarian-puppet install

./bin/packer build overlord.json
