# monitor.sh V1.0.1
# Shell Script Monitor a webpage and Blink Thingm Blink(1)
# Copyright 2012 Neal Zipper
# Developed on OS X using bash
# Licensed under GNU V3.0 
# This Script used Thinkm Bink(1) blink1-tool that was released on 12-11-12 
# blink1-tool that support -rgb and --blink options on command line  

# Run this script forever
while : ; do
  echo Curling
	
	# Use Curl Command to get a website pipe to grep for a string
	curl -s "www.yahoo.com" | grep -i "test"
	# If grep return code is 0 (failure) send red command to Blink(1) 
	if [ "$?" -ne "0" ]; then
		# Keyword in grep command found
		./blink1-tool  -m 100 --rgb 255,0,0 --blink 10   # fade to Red and Blink in 0.1 seconds
	  	./blink1-tool  -m 100 --rgb 255,0,0    # fade to #Red and Stay Red
	
	else
		
		# Keyword in grep command found (sucess == 0) send red command to Blink(1)
		./blink1-tool -m 100 --rgb 0,127,0   # fade to Green in 0.1 seconds
	fi
	
	sleep 360
done
