#!/bin/bash

KRD='/share/Public/tftp/disks/krd'

cd $KRD

ORIG=$(cat krd_bases_timestamp.txt)
NEW=$(curl -s http://rescuedisk.kaspersky-labs.com/rescuedisk/updatable/2018/bases/krd.xml | egrep '[[:digit:]]{12}' | awk -F '"' '{print $2}')
if [[ "$NEW" -ne "$ORIG" ]] ; then

        echo "$NEW" > krd_bases_timestamp.txt

		cd $KRD/data

		wget -O 005-bases.srm http://rescuedisk.kaspersky-labs.com/updatable/2018/bases/042-freshbases.srm

		curl -s http://rescuedisk.kaspersky-labs.com/updatable/2018/bases/hashes.txt | sed 's/042-freshbases.srm/005-bases.srm/' > 005-bases.srm.sha512


        else
            exit
fi


