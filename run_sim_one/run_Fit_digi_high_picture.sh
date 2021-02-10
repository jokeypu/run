#!/bin/bash
#export NGAMMA=1
#export NOANGLE=2
#export ENERGY=.5
#export DIR=""
export STR="OR"
clear
for((i=1;i<24;i++))
do

export NOANGLE=$i
export NGAMMA=1
rm /home/jokey/Panda/workspace/plot/doc/A${NOANGLE}_par_cp.txt

if [ ! -d /home/jokey/Panda/workspace/plot/doc/A${NOANGLE}_FitPicture_cp ];then
        mkdir /home/jokey/Panda/workspace/plot/doc/A${NOANGLE}_FitPicture_cp
else
	rm /home/jokey/Panda/workspace/plot/doc/A${NOANGLE}_FitPicture_cp/*
fi

	for((j=2;j<10;j++))
	do
	export ENERGY=$(printf "%.1f" `echo "scale=1;$j/10"|bc`)
	export DIR="WorkData_"$NGAMMA"Gamma_A"$NOANGLE"_E"$ENERGY"_"$STR
	echo "NGAMMA $NGAMMA  >>>>>>    Angle: $i/16       Energy: $ENERGY GeV    Dir:$DIR"
	expect ./.run_Fit_digi_high_picture.expect
	done

	for((j=2;j<13;j++))
	do
	export ENERGY=$(printf "%.1f" `echo "scale=1;$j/2"|bc`)
	export DIR="WorkData_"$NGAMMA"Gamma_A"$NOANGLE"_E"$ENERGY"_"$STR
	echo "NGAMMA $NGAMMA  >>>>>>    Angle: $i/16       Energy: $ENERGY GeV    Dir:$DIR"
	expect ./.run_Fit_digi_high_picture.expect
	done
done
unset NOANGLE
unset NGAMMA
unset ENERGY
unset DIR
unset STR
