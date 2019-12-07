#!/bin/bash

while [[ $# -gt 0 ]]
do
    key="${1}"
    case ${key} in
    --lamp)
        install_lamp=true
        shift # past argument
        ;;
    --node)
        install_node=true
        shift # past argument
        ;;
    --firewall)
        setup_firewall=true
        shift # past argument
        ;;
    --ramdisk)
        setup_ramdisk=true
        shift # past argument
        ;;
    # -o|--output)
    #     OUTPUTPARAM="${2}"
    #     shift # past argument
    #     shift # past value
    #     ;;
    -h|--help)
        echo "Show help"
        shift # past argument
        ;;
    *)    # unknown option
        shift # past argument
        ;;
    esac
    shift
done

DIRECTORY=$(cd `dirname $0` && pwd)

cd ~

# all includes (note the starting '.', short for 'source')
# using `source` gives the child script all the variables in this scope
# specifically `$DIRECTORY`

# update apt-get
. $DIRECTORY/update-apt-get.sh

# install lamp
if [ "$install_lamp" = true ] ; then
    . $DIRECTORY/install-lamp.sh
fi

# install node
if [ "$install_node" = true ] ; then
    . $DIRECTORY/install-node.sh
fi

# setup firewall
if [ "$setup_firewall" = true ] ; then
    . $DIRECTORY/setup-firewall.sh
fi

# setup ram disk
if [ "$ramdisk" = true ] ; then
    . $DIRECTORY/setup-ram-disk.sh
fi

# enable startup scripts
. $DIRECTORY/enable-startup-scripts.sh

# setup profile
. $DIRECTORY/setup-profile.sh
