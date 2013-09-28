#!/bin/bash
#CPU Frequency governor script by HoKaze (version 0.3)

#runs this script as root if not already
if [ ! $( id -u ) -eq 0 ]; then
	exec gksu "${0}" # call this script as root
	exit ${?}  # since we're 'execing' above, we wont reach this exit
               # unless something goes wrong.
fi

#creates zenity radiolist for all governors except userspace
governor=$(zenity --title="CPU Frequency Selector" --height=400 --text "Please select a CPU frequnecy governor. \n(Recommended option is Ondemand)" --list --separator=" & " --radiolist --column="tick" --column=option powersave "powersave" ondemand "ondemand" conservative "conservative" performance "performance")

for CPUFREQ in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
do
	[ -f $CPUFREQ ] || continue
	echo -n $governor > $CPUFREQ
done
