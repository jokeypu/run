#!/bin/bash
#export NGAMMA=1
#export NOANGLE=2
#export ENERGY=.5
#export WORK_DATA_PATH=""
export STR="OR"
for((i=12;i<13;i++))
do
export NOANGLE=$i
export NGAMMA=1
	for((j=2;j<10;j+=2))
	do
	export ENERGY=$(printf "%.1f" `echo "scale=1;$j/10"|bc`)
	export DIR="WorkData_"$NGAMMA"Gamma_A"$NOANGLE"_E"$ENERGY"_"$STR
	export WORK_DATA_PATH="/home/jokey/Panda/data/"$DIR"/evtcomplete"
	echo "NGAMMA $NGAMMA  >>>>>>    Angle: $i/16       Energy: $ENERGY GeV    Dir:$DIR"
	#sleep 3
	expect /home/jokey/Panda/run/.run_sim_one.expect
	mv /home/jokey/Panda/data/$DIR /media/jokey/DATA/data/
	ln -s /media/jokey/DATA/data/$DIR /home/jokey/Panda/data/
	done

done
unset NOANGLE
unset NGAMMA
unset ENERGY
unset DIR
unset WORK_DATA_PATH
