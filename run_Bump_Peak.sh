#!/bin/bash
#export NGAMMA=1
#export NOANGLE=2
#export ENERGY=.5
#export DIR=""
export STR1="OR"
export STR2="fix"
clear
for((i=7;i<8;i++))
do
export NOANGLE=$i
export NGAMMA=2
rm /home/jokey/Panda/workspace/plot/doc/A${NOANGLE}_resolution_par.txt

if [ ! -d /home/jokey/Panda/workspace/plot/doc/A${NOANGLE}_resolution_Picture ];then
        mkdir /home/jokey/Panda/workspace/plot/doc/A${NOANGLE}_resolution_Picture
else
	rm /home/jokey/Panda/workspace/plot/doc/A${NOANGLE}_resolution_Picture/*
fi
	for((j=1;j<13;j++))
	do
	export ENERGY=$(printf "%.1f" `echo "scale=1;$j/2"|bc`)
	export DIR1="WorkData_"$NGAMMA"Gamma_A"$NOANGLE"_E"$ENERGY"_"$STR1
	export DIR2="WorkData_"$NGAMMA"Gamma_A"$NOANGLE"_E"$ENERGY"_"$STR2
	echo "NGAMMA $NGAMMA  >>>>>>    Angle: $i/16       Energy: $ENERGY GeV    Dir:$DIR"
	#sleep 2
	expect /home/jokey/Panda/run/.run_Bump_Peak.expect
	done
done
unset NOANGLE
unset NGAMMA
unset ENERGY
unset DIR1
unset DIR2
unset STR1
unset STR2
