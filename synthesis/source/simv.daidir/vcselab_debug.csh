#!/bin/csh -f

cd /home/Shrivastava012/Downloads/final/source

#This ENV is used to avoid overriding current script in next vcselab run 
setenv SNPS_VCSELAB_SCRIPT_NO_OVERRIDE  1

/home/vlsi/SynopsysTools/vcs/S-2021.09-SP2-4/linux64/bin/vcselab $* \
    -o \
    simv \
    -nobanner \

cd -

