#!/bin/bash
. .config.sh
export STR="fix"
export STR_O="OR"
export DATA_DIR="/media/jokey/DATA/data"
#export DATA_DIR="/home/jokey/Panda/data"
clear
export i=17
export NOANGLE=$i
export NGAMMA=2
for((j=1;j<13;j++))
do
export ENERGY=$(printf "%.1f" `echo "scale=1;$j/2"|bc`)
export DIR="WorkData_"$NGAMMA"Gamma_A"$NOANGLE"_E"$ENERGY"_"$STR
export DIR_O="WorkData_"$NGAMMA"Gamma_A"$NOANGLE"_E"$ENERGY"_"$STR_O
export WORK_DATA_PATH="/home/jokey/Panda/data/"$DIR"/evtcomplete"
if [ ! -d /home/jokey/Panda/data/$DIR ];then
	mkdir /home/jokey/Panda/data/$DIR
else
	rm /home/jokey/Panda/data/$DIR/*
fi
if [ ! -f /home/jokey/Panda/data/$DIR/evtcomplete_sim.root ];then
	ln -s $DATA_DIR/$DIR_O/evtcomplete_par.root /home/jokey/Panda/data/$DIR/
	ln -s $DATA_DIR/$DIR_O/evtcomplete_sim.root /home/jokey/Panda/data/$DIR/
fi
echo "NGAMMA $NGAMMA  >>>>>>    Angle: $i       Energy: $ENERGY GeV    Dir:$DIR"
expect ./.run_digi_two.expect
done
unset NOANGLE
unset NGAMMA
unset ENERGY
unset DIR
unset DIR_O
unset STR
unset STR_O
unset DATA_DIR
unset WORK_DATA_PATH
unset i
