#!/bin/bash
#export STR="OR"
export STR="fix"
clear
export i=12
export NOANGLE=$i
export NGAMMA=2
for((j=1;j<13;j++))
do
export ENERGY=$(printf "%.1f" `echo "scale=1;$j/2"|bc`)
export DIR="WorkData_"$NGAMMA"Gamma_A"$NOANGLE"_E"$ENERGY"_"$STR
echo "NGAMMA $NGAMMA  >>>>>>    Angle: $i/16       Energy: $ENERGY GeV    Dir:$DIR"
expect ./.run_File_data_two.expect
done
unset NOANGLE
unset NGAMMA
unset ENERGY
unset DIR
unset STR
