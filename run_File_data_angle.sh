#!/bin/bash
export STR="OR"
#export STR="fix"
#export STR="std"
clear
for((i=3;i<14;i++))
do
export NOANGLE=$i
export NGAMMA=2
	for((j=2;j<3;j++))
	do
	export ENERGY=$(printf "%.1f" `echo "scale=1;$j/2"|bc`)
	export DIR="WorkData_"$NGAMMA"Gamma_A"$NOANGLE"_E"$ENERGY"_"$STR
	echo "NGAMMA $NGAMMA  >>>>>>    Angle: $i/16       Energy: $ENERGY GeV    Dir:$DIR"
	sleep 5
	expect /home/jokey/Panda/run/.run_File_data.expect
	done
done
unset NOANGLE
unset NGAMMA
unset ENERGY
unset DIR
unset STR
