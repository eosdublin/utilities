#!/bin/bash
################################################################################
#
# Script created by @samnoble for https://eosdublin.com
#
# Visit https://github.com/eosdublin/scripts for details.
#
################################################################################

# SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

# <Imports>
# </Imports>

# <Parameters>
BRANCH=$1
ISTAG=$2 || 0
SYMBOL=$3 || "EOS"
# </Parameters>

# <Configuration>
# </Configuration>

# <Body>
# TODO - Check the folder doesn't exist first
# TODO - Add error checking

mkdir $1
git clone https://github.com/EOSIO/eos.git $1/
cd $1
git fetch --all --tags --prune

# TODO - Test if this is a branch
git checkout tags/$1 -b $1
git submodule update --init --recursive

# Update the symbol name
ex -sc '16i|set( CORE_SYMBOL_NAME $SYMBOL )' -cx CMakeLists.txt

# Do the build
./eosio_build.sh
# </Body>
