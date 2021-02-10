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
	for((j=2;j<3;j++))
	do
	export ENERGY=$(printf "%.1f" `echo "scale=1;$j/2"|bc`)
	rm /home/jokey/Panda/workspace/plot/doc/range_A${NOANGLE}_E${ENERGY}_resolution_par.txt
	if [ ! -d /home/jokey/Panda/workspace/plot/doc/range_A${NOANGLE}_E${ENERGY}_resolution_Picture ];then
        mkdir /home/jokey/Panda/workspace/plot/doc/range_A${NOANGLE}_E${ENERGY}_resolution_Picture
	else
	rm /home/jokey/Panda/workspace/plot/doc/range_A${NOANGLE}_E${ENERGY}_resolution_Picture/*
	fi
	export DIR1="WorkData_Range_A"$NOANGLE"_E"$ENERGY"_"$STR1
	export DIR2="WorkData_Range_A"$NOANGLE"_E"$ENERGY"_"$STR2
	echo "Range  >>>>>>    Angle: $i       Energy: $ENERGY GeV    Dir1:$DIR1  Dir2:$DIR2"
	#sleep 2
	
	for((k=10;k<50;k++))
	do
	export CUT_MIN=$(printf "%.1f" `echo "scale=1;$k/5"|bc`)
	export CUT_MAX=$(printf "%.1f" `echo "scale=1;($k+1)/5"|bc`)
	expect ./.run_Bump_Peak_range.expect
	done

	done
done
unset NOANGLE
unset ENERGY
unset DIR1
unset DIR2
unset STR1
unset STR2
unset CUT_MIN
unset CUT_MAX
