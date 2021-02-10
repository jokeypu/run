#!/bin/bash
export STR="OR"
#export STR="fix"
#export STR="std"
clear
for((i=12;i<13;i++))
do
export NOANGLE=$i
	for((j=2;j<3;j++))
	do
	export ENERGY=$(printf "%.1f" `echo "scale=1;$j/2"|bc`)
	export DIR="WorkData_Range_A"$NOANGLE"_E"$ENERGY"_"$STR
	echo "Range  >>>>>>    Angle: $i       Energy: $ENERGY GeV    Dir:$DIR"
	#sleep 5
	expect ./.run_File_data_range.expect
	done
done
unset NOANGLE
unset NGAMMA
unset ENERGY
unset DIR
unset STR
