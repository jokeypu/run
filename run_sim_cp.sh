#!/bin/bash
#export NGAMMA=1
#export NOANGLE=2
#export ENERGY=.5
#export WORK_DATA_PATH=""
export STR="OR"
for((i=7;i<8;i++))
do
export NOANGLE=$i
export NGAMMA=1
	for((j=12;j<13;j++))
	do
	export ENERGY=$(printf "%.1f" `echo "scale=1;$j/2"|bc`)
	export DIR="WorkData_"$NGAMMA"Gamma_A"$NOANGLE"_E"$ENERGY"_"$STR
	export WORK_DATA_PATH="/home/jokey/Panda/data/"$DIR"/evtcomplete"
	echo "NGAMMA $NGAMMA  >>>>>>    Angle: $i/16       Energy: $ENERGY GeV    Dir:$DIR"
	sleep 5
	expect /home/jokey/Panda/run/.run_sim.expect
	done

#export NGAMMA=2
#        for((j=1;j<13;j++))
#        do
#	export ENERGY=$(printf "%.1f" `echo "scale=1;$j/2"|bc`)
#	export DIR="WorkData_"$NGAMMA"Gamma_A"$NOANGLE"_E"$ENERGY"_"$STR
#	export WORK_DATA_PATH="/home/jokey/Panda/data/"$DIR"/evtcomplete"
#	echo "NGAMMA $NGAMMA  >>>>>>    Angle: $i/16       Energy: $ENERGY GeV    Dir:$DIR"
#	sleep 5
#	expect /home/jokey/Panda/run/.run_sim.expect
#	done

done
unset NOANGLE
unset NGAMMA
unset ENERGY
unset DIR
unset WORK_DATA_PATH
