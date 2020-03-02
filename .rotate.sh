#!/bin/bash

if [ "$1" == "initial" ]
then
	xrandr -o right
	xinput set-prop 'pointer:Goodix Capacitive TouchScreen'  --type=float "Coordinate Transformation Matrix" 0 1 0 -1 0 1 0 0 1 
	`echo -n "right" > /home/polina/.SCREEN_POSITION`
fi

ORIENTATION=`cat .SCREEN_POSITION`

if [ "$1" == "right" ]
then
	xrandr -o right
	xinput set-prop 'pointer:Goodix Capacitive TouchScreen'  --type=float "Coordinate Transformation Matrix" 0 1 0 -1 0 1 0 0 1 
	`echo -n "right" > /home/polina/.SCREEN_POSITION && i3-msg 'restart'`
fi

if [ "$1" == "left" ]
then
	xrandr -o left
	xinput set-prop 'pointer:Goodix Capacitive TouchScreen'  --type=float "Coordinate Transformation Matrix" 0 -1 1 1 0 0 0 0 1 
	`echo -n "left" > /home/polina/.SCREEN_POSITION && i3-msg 'restart'`
fi

if [ "$1" == "inverted" ]
then
	xrandr -o inverted
	xinput set-prop 'pointer:Goodix Capacitive TouchScreen'  --type=float "Coordinate Transformation Matrix" -1 0 1 0 -1 1 0 0 1 
	`echo -n "inverted" > /home/polina/.SCREEN_POSITION && i3-msg 'restart'`
fi

if [ "$1" == "normal" ]
then
	xrandr -o normal
	xinput set-prop 'pointer:Goodix Capacitive TouchScreen'  --type=float "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 1 
	`echo -n "normal" > /home/polina/.SCREEN_POSITION && i3-msg 'restart'`
fi

if [[ "$1" == "switch" && "$ORIENTATION" == "right" ]]
then
	xrandr -o inverted
	xinput set-prop 'pointer:Goodix Capacitive TouchScreen'  --type=float "Coordinate Transformation Matrix" -1 0 1 0 -1 1 0 0 1 
	`echo -n "inverted" > /home/polina/.SCREEN_POSITION && i3-msg 'restart'`
elif [[ "$1" == "switch" && "$ORIENTATION" == "inverted" ]]
then
	xrandr -o right
	xinput set-prop 'pointer:Goodix Capacitive TouchScreen'  --type=float "Coordinate Transformation Matrix" 0 1 0 -1 0 1 0 0 1 
	`echo -n "right" > /home/polina/.SCREEN_POSITION && i3-msg 'restart'`
elif [[ "$1" == "switch" ]]
then
	xrandr -o right
	xinput set-prop 'pointer:Goodix Capacitive TouchScreen'  --type=float "Coordinate Transformation Matrix" 0 1 0 -1 0 1 0 0 1 
	`echo -n "right" > /home/polina/.SCREEN_POSITION && i3-msg 'restart'`
fi
