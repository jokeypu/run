#!/bin/bash
export STR="fix"
export STR_O="OR"
export DATA_DIR="/media/jokey/DATA/data"
clear
for((i=5;i<6;i++))
do
export NOANGLE=$i
	for((j=1;j<13;j++))
	do
	export ENERGY=$(printf "%.1f" `echo "scale=1;$j/2"|bc`)
	export DIR="WorkData_Pi0_A"$NOANGLE"_E"$ENERGY"_"$STR
	export DIR_O="WorkData_Pi0_A"$NOANGLE"_E"$ENERGY"_"$STR_O
	if [ ! -d /home/jokey/Panda/data/$DIR ];then
		mkdir /home/jokey/Panda/data/$DIR
	else
		rm /home/jokey/Panda/data/$DIR/*
	fi
	if [ ! -f /home/jokey/Panda/data/$DIR/evtcomplete_sim.root ];then
		ln -s $DATA_DIR/$DIR_O/evtcomplete_par.root /home/jokey/Panda/data/$DIR/
		ln -s $DATA_DIR/$DIR_O/evtcomplete_sim.root /home/jokey/Panda/data/$DIR/
	fi
	echo "Pi0   >>>>>>    Angle: $i       Energy: $ENERGY GeV    Dir:$DIR"
	#sleep 3
	expect ./.run_digi_Pi0.expect
	done
done
unset NOANGLE
unset ENERGY
unset DIR
unset DIR_O
unset DATA_DIR
unset STR
unset STR_O
