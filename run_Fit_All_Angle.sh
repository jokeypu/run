#!/bin/bash
#export NGAMMA=1
#export NOANGLE=2
#export ENERGY=.5
#export DIR=""
clear
export NGAMMA=1
rm /home/jokey/Panda/workspace/plot/doc/AllPar.txt

if [ ! -d /home/jokey/Panda/workspace/plot/doc/AllPar_FitPicture ];then
        mkdir /home/jokey/Panda/workspace/plot/doc/AllPar_FitPicture
else
	rm /home/jokey/Panda/workspace/plot/doc/AllPar_FitPicture/*
fi
	for((j=3;j<14;j++))
	do
	export NOANGLE=$j
	echo "NGAMMA $NGAMMA  >>>>>>    Angle: $i/16     File:A${NOANGLE}_par.txt"
	sleep 2
	expect /home/jokey/Panda/run/.run_Fit_All_Angle.expect
	done
unset NOANGLE
unset NGAMMA
