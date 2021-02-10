#!/bin/bash
. .config.sh
export STR="OR"
export i=6
export NOANGLE=$i
export NGAMMA=2
for((j=1;j<13;j++))
do
export ENERGY=$(printf "%.1f" `echo "scale=1;$j/2"|bc`)
export DIR="WorkData_"$NGAMMA"Gamma_A"$NOANGLE"_E"$ENERGY"_"$STR
export WORK_DATA_PATH="/home/jokey/Panda/data/"$DIR"/evtcomplete"
echo "NGAMMA $NGAMMA  >>>>>>    Angle: $i       Energy: $ENERGY GeV    Dir:$DIR"
if [ -L /home/jokey/Panda/data/$DIR ]; then
rm -rf /home/jokey/Panda/data/$DIR
fi
if [ ! -d /home/jokey/Panda/data/$DIR ]; then
mkdir  /home/jokey/Panda/data/$DIR
fi
expect ./.run_sim_two.expect
if [ -d /media/jokey/DATA/data/$DIR ]; then
rm -rf /media/jokey/DATA/data/$DIR
fi
mv /home/jokey/Panda/data/$DIR /media/jokey/DATA/data/
ln -s /media/jokey/DATA/data/$DIR /home/jokey/Panda/data/
done
unset NOANGLE
unset NGAMMA
unset ENERGY
unset DIR
unset WORK_DATA_PATH
unset i
