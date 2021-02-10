#!/bin/bash
#export NGAMMA=1
#export NOANGLE=2
#export ENERGY=.5
#export DIR=""
clear
export NGAMMA=1
rm /home/jokey/Panda/workspace/plot/doc/AllPar_cp.txt

if [ ! -d /home/jokey/Panda/workspace/plot/doc/AllPar_FitPicture_cp ];then
        mkdir /home/jokey/Panda/workspace/plot/doc/AllPar_FitPicture_cp
else
	rm /home/jokey/Panda/workspace/plot/doc/AllPar_FitPicture_cp/*
fi
	for((j=1;j<24;j++))
	do

	if [ $j -eq 13 ]
	then
	echo "NO pass"
	#continue
	fi

	export NOANGLE=$j
	echo "NGAMMA $NGAMMA  >>>>>>    Angle: $i/24     File:A${NOANGLE}_par.txt"
	sleep 2
	expect /home/jokey/Panda/run/.run_Fit_All_Angle_cp.expect
	done
unset NOANGLE
unset NGAMMA
