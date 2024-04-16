#!/bin/bash
PLIK=$1
ITER=$2
while [ $ITER -gt 0 ]; do
cat $PLIK
ITER=$(($ITER-1))
done