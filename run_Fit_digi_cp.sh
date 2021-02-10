#!/bin/bash
#export NGAMMA=1
#export NOANGLE=2
#export ENERGY=.5
#export DIR=""
export STR="OR"
clear
for((i=13;i<14;i++))
do
export NOANGLE=$i
export NGAMMA=1
rm /home/jokey/Panda/workspace/plot/doc/A${NOANGLE}_par_cp.txt

if [ ! -d /home/jokey/Panda/workspace/plot/doc/A${NOANGLE}_FitPicture_cp ];then
        mkdir /home/jokey/Panda/workspace/plot/doc/A${NOANGLE}_FitPicture_cp
else
	rm /home/jokey/Panda/workspace/plot/doc/A${NOANGLE}_FitPicture_cp/*
fi

	#for((j=2;j<10;j+=2))
	#do
        #export ENERGY=$(printf "%.1f" `echo "scale=1;$j/10"|bc`)
	#export DIR="WorkData_"$NGAMMA"Gamma_A"$NOANGLE"_E"$ENERGY"_"$STR
	#echo "NGAMMA $NGAMMA  >>>>>>    Angle: $i/16       Energy: $ENERGY GeV    Dir:$DIR"
	#expect /home/jokey/Panda/run/.run_Fit_digi_cp.expect
	#done
	
	#if [ $(( $i % 2 )) -eq 1 ]
	#then
	#continue
	#fi
	
	#if [ $i -eq 2 ]||[ $i -eq 4 ]||[ $i -eq 6 ]
	#if [ $i -eq 2 ]
	#then
	#continue
	#fi

	for((j=1;j<13;j++))
	do
	#if [ $i -eq 9 ]||[ $i -eq 13 ]&&[ $j -eq 11 ]
	#then
	#continue
	#fi
	export ENERGY=$(printf "%.1f" `echo "scale=1;$j/2"|bc`)
	export DIR="WorkData_"$NGAMMA"Gamma_A"$NOANGLE"_E"$ENERGY"_"$STR
	echo "NGAMMA $NGAMMA  >>>>>>    Angle: $i/16       Energy: $ENERGY GeV    Dir:$DIR"
	expect /home/jokey/Panda/run/.run_Fit_digi_cp.expect
	done
	#fi
done
unset NOANGLE
unset NGAMMA
unset ENERGY
unset DIR
unset STR
