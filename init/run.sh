#!/bin/bash

DIRECTORY=$(cd `dirname $0` && pwd)

cd ~

# other includes (note the starting '.', short for 'source')
. DIRECTORY/install-node.sh