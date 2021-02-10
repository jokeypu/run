#!/bin/bash
#export NGAMMA=1
#export NOANGLE=2
#export ENERGY=.5
#export DIR=""
export STR="fix"
export STR_O="OR"
export DATA_DIR="/media/jokey/DATA/data"
#export DATA_DIR="/home/jokey/Panda/data"
clear
for((i=3;i<14;i++))
do

if [ $i -eq 7 ]
then
continue
fi

export NOANGLE=$i
export NGAMMA=2
	for((j=2;j<3;j++))
	do
	export ENERGY=$(printf "%.1f" `echo "scale=1;$j/2"|bc`)
	export DIR="WorkData_"$NGAMMA"Gamma_A"$NOANGLE"_E"$ENERGY"_"$STR
	export DIR_O="WorkData_"$NGAMMA"Gamma_A"$NOANGLE"_E"$ENERGY"_"$STR_O
	if [ ! -d /home/jokey/Panda/data/$DIR ];then
		mkdir /home/jokey/Panda/data/$DIR
	else
		rm /home/jokey/Panda/data/$DIR/*
	fi
	if [ ! -f /home/jokey/Panda/data/$DIR/evtcomplete_sim.root ];then
		ln -s $DATA_DIR/$DIR_O/evtcomplete_par.root /home/jokey/Panda/data/$DIR/
		ln -s $DATA_DIR/$DIR_O/evtcomplete_sim.root /home/jokey/Panda/data/$DIR/
	fi
	echo "NGAMMA $NGAMMA  >>>>>>    Angle: $i/16       Energy: $ENERGY GeV    Dir:$DIR"
	sleep 3
	expect /home/jokey/Panda/run/.run_digi.expect
	done
done
unset NOANGLE
unset NGAMMA
unset ENERGY
unset DIR
unset STR
