#!/bin/bash
#export STR="OR"
export STR="fix"
#export STR="std"
clear
for((i=12;i<13;i++))
do
export NOANGLE=$i
	for((j=1;j<13;j++))
	do
	export ENERGY=$(printf "%.1f" `echo "scale=1;$j/2"|bc`)
	export DIR="WorkData_Pi0_A"$NOANGLE"_E"$ENERGY"_"$STR
	echo "Pi0  >>>>>>    Angle: $i       Energy: $ENERGY GeV    Dir:$DIR"
	#sleep 5
	expect ./.run_File_data_pi0_gamma.expect
	done
done
unset NOANGLE
unset ENERGY
unset DIR
unset STR
