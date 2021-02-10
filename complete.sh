#!/bin/bash
rm -rf $PANDA_DIR/data/test
ls $PANDA_DIR/data
read -p "Please enter the output directory name:" -t 180 NEW_DIR
let i=1
while [ $i -eq 1 ]
do
if [ -d $PANDA_DIR/data/$NEW_DIR ];then
read -p "The directory already exists, please retype:" -t 180 NEW_DIR
else
let i=100
fi
done
echo "dir: $NEW_DIR"
read -p "Please enter the MaxEvt:" -t 180 MAX_EVT
export MAX_EVT=$MAX_EVT
vi +30 $PANDA_DIR/run/sim_complete.C
expect .script.expect
cd $PANDA_DIR/data
mkdir $NEW_DIR;
mv *.root $NEW_DIR
unset MAX_EVT
unset NEW_DIR
ls
