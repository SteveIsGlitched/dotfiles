#!/bin/bash
sleep 2 # For ensuring swww has been initialized

#
# Configuration section
# Declare variables to configure.
#

dpapers="/home/steveisglitched/.config/dynapapers" # Path to wallpaper holder directory

pNight="$dpapers/nightDebian.png" # Night wallpaper
pEven="$dpapers/yellowDebian.png"    # Evening/morning wallpaper
pDay="$dpapers/redDebian.png"  # Day wallpaper

#
# Essential section
# Please do not touch if you don't know what you are doing.
#

firstExec=true
lastPaper=3 # the value is a placeholder
# 0 = night
# 1 = evening/morning
# 2 = day

updPapes () {
	if [[ $1 -ge 19 ]] || [[ $1 -le 7 ]]; then
		if [ "$firstExec" = true ]; then
			swww img $pNight
			firstExec=false
		else
			if [[ $lastPaper -eq 0 ]]; then
				echo ignoring
			else
				swww img $pNight
			fi
		fi

		lastPaper=0
	elif [[ $1 -ge 7 ]] && [[ $1 -le 9 ]]; then
                if [ "$firstExec" = true ]; then
                        swww img $pEven
			firstExec=false
                else
                        if [[ $lastPaper -eq 1 ]]; then
                                echo ignoring
                        else
                                swww img $pEven
                        fi
                fi
                
                lastPaper=1
	elif [[ $1 -ge 17 ]] && [[ $1 -le 18 ]]; then
                if [ "$firstExec" = true ]; then
                        swww img $pEven
			firstExec=false
                else
                        if [[ $lastPaper -eq 1 ]]; then
                                echo ignoring
                        else
                                swww img $pEven
                        fi
                fi
                
                lastPaper=1
	elif [[ $1 -ge 10 ]] && [[ $1 -le 16 ]]; then 
                if [ "$firstExec" = true ]; then
                        swww img $pDay
                	firstExec=false
		else
                        if [[ $lastPaper -eq 2 ]]; then
                                echo ignoring
                        else
                                swww img $pDay
                        fi
                fi
                
                lastPaper=2
	fi
}

while true; do
	var=$(date +"%H")

	if [[ ${var:0:1} -eq 0 ]]; then
		var=${var:1}
	fi

	updPapes $var
	sleep 120
done
