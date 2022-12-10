#!/bin/bash

[ -e stop.txt ] && rm stop.txt

while true
do
	[ -e stop.txt ] && break
	[ -e zatrzymaj.txt ] && break
	[ -e STOP ] && break
	[ "$(date +%H:%M)" == "11:21" ] && break

	date
	sleep 1

done

