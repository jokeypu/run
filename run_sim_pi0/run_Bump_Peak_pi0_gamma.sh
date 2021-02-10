#!/bin/bash
#export NGAMMA=1
#export NOANGLE=2
#export ENERGY=.5
#export DIR=""
export STR1="OR"
export STR2="fix"
clear
for((i=12;i<13;i++))
do
export NOANGLE=$i
rm /home/jokey/Panda/workspace/plot/doc/pi0_gamma_A${NOANGLE}_resolution_par.txt

if [ ! -d /home/jokey/Panda/workspace/plot/doc/pi0_gamma_A${NOANGLE}_resolution_Picture ];then
        mkdir /home/jokey/Panda/workspace/plot/doc/pi0_gamma_A${NOANGLE}_resolution_Picture
else
	rm /home/jokey/Panda/workspace/plot/doc/pi0_gamma_A${NOANGLE}_resolution_Picture/*
fi
	for((j=1;j<13;j++))
	do
	export ENERGY=$(printf "%.1f" `echo "scale=1;$j/2"|bc`)
	export DIR1="WorkData_Pi0_A"$NOANGLE"_E"$ENERGY"_"$STR1
	export DIR2="WorkData_Pi0_A"$NOANGLE"_E"$ENERGY"_"$STR2
	echo "Pi0  >>>>>>    Angle: $i       Energy: $ENERGY GeV    Dir1:$DIR1    Dir2:$DIR2"
	#sleep 2
	expect ./.run_Bump_Peak_pi0_gamma.expect
	done
done
unset NOANGLE
unset ENERGY
unset DIR1
unset DIR2
unset STR1
unset STR2
