#!/bin/bash
fudisk=$(df -Bm | awk '{fd+=$2} END {print fd}')
avdisk=$(df -Bm | awk '{ad+=$4} END {print ad}')
pdisk=$((avdisk/(fudisk/100)))
fram=$(free -m | awk 'NR==2 {print $2}')
avram=$(free -m | awk 'NR==2 {print $4}')
pram=$((avram/(fram/100)))

echo -e "Attention! Important message from your servermaster!"
echo ""
echo -e " -----------------------------Message----------------------------------"
echo -e " Here's some handy information about our server:"
echo ""
echo -e " Architecture:   "`uname -a`
echo -e " Physical CPU's: "`cat /proc/cpuinfo | grep "physical id" | sort | uniq | wc -l`
echo -e " vCPU's: 	 "`cat /proc/cpuinfo | grep processor | wc -l`
echo -e " RAM: 		 $avram MB $pram% Available" 
echo -e " Disk Space: 	$avdisk MB $pdisk% Available"
echo -e " CPU load: 	"
echo -e " Last boot: 	"
echo -e " LVM: 		"
echo -e " Network:	IPv4 "`hostname -I`" MAC "
