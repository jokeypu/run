#!/bin/bash
clear
export NGAMMA=1
rm /home/jokey/Panda/workspace/plot/doc/AllPar_cp.txt

if [ ! -d /home/jokey/Panda/workspace/plot/doc/AllPar_FitPicture_cp ];then
        mkdir /home/jokey/Panda/workspace/plot/doc/AllPar_FitPicture_cp
else
	rm /home/jokey/Panda/workspace/plot/doc/AllPar_FitPicture_cp/*
	rm /home/jokey/Panda/workspace/plot/doc/AllPar_FitPicture_cp/*
fi
for((j=1;j<24;j++))
do
	export NOANGLE=$j
	echo "NGAMMA $NGAMMA  >>>>>>    Angle: $i/24     File:A${NOANGLE}_par.txt"
	sleep 2
	expect ./.run_Fit_All_Angle_one.expect
done
unset NOANGLE
unset NGAMMA
