#!/bin/bash
#export NGAMMA=1
#export NOANGLE=2
#export ENERGY=.5
#export DIR=""
export STR="OR"
clear
for((i=1;i<24;i++))
do

if [ ! $i -eq 4 ]&&[ ! $i -eq 15 ]
then    
continue
fi 

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
	
	#if [ $i -eq 2 ]||[ $i -eq 4 ]
	#if [ $i -eq 8 ]
	#then
	#continue
	#fi
	for((j=2;j<10;j++))
	do
	export ENERGY=$(printf "%.1f" `echo "scale=1;$j/10"|bc`)
	export DIR="WorkData_"$NGAMMA"Gamma_A"$NOANGLE"_E"$ENERGY"_"$STR
	echo "NGAMMA $NGAMMA  >>>>>>    Angle: $i/16       Energy: $ENERGY GeV    Dir:$DIR"
	expect /home/jokey/Panda/run/run_sim_low/.run_Fit_digi_test.expect
	done

	#for((j=2;j<13;j++))
	#do
	#export ENERGY=$(printf "%.1f" `echo "scale=1;$j/2"|bc`)
	#export DIR="WorkData_"$NGAMMA"Gamma_A"$NOANGLE"_E"$ENERGY"_"$STR
	#echo "NGAMMA $NGAMMA  >>>>>>    Angle: $i/16       Energy: $ENERGY GeV    Dir:$DIR"
	#expect /home/jokey/Panda/run/run_sim_low/.run_Fit_digi_test.expect
	#done
done
unset NOANGLE
unset NGAMMA
unset ENERGY
unset DIR
unset STR
