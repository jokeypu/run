#!/bin/bash
#export STR="fix"
export STR="OR"
	for((j=1;j<13;j++))
	do
	export ENERGY=$(printf "%.1f" `echo "scale=1;$j/2"|bc`)
	export DIR="WorkData_Pi0_AllAngle_E"$ENERGY"_"$STR
	export WORK_DATA_PATH="/home/jokey/Panda/data/"$DIR"/evtcomplete"
	echo "Pi0  >>>>>>   Angle: $i       Energy: $ENERGY GeV    Dir:$DIR"
	expect ./.run_sim_Pi0_all.expect
	mv /home/jokey/Panda/data/$DIR /media/jokey/DATA/data/
	ln -s /media/jokey/DATA/data/$DIR /home/jokey/Panda/data/
	done
unset ENERGY
unset DIR
unset WORK_DATA_PATH
