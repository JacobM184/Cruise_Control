#!/bin/bash
FILE = ./CruiseController.xes

if test -f "$FILE"; then
    make clean
    make CruiseController.xes
    ./CruiseController.xes
else
    make CruiseController.xes
    ./CruiseController.xes
fi