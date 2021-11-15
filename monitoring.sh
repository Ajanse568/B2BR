#!/bin/bash
fudisk=$(df -Bm | awk '{fd+=$2} END {print fd}')
avdisk=$(df -Bm | awk '{ad+=$4} END {print ad}')
pdisk=$((avdisk/(fudisk/100)))
fram=$(free -m | awk 'NR==2 {print $2}')
avram=$(free -m | awk 'NR==2 {print $4}')
pram=$((avram/(fram/100)))
name=$(uname -a)
pcpu=$(cat /proc/cpuinfo | grep "physical id" | sort | uniq | wc -l)
vcpu=$(cat /proc/cpuinfo | grep processor | wc -l)
net=$(hostname -I)

wall  "Attention! Important message from your servermaster!

      -----------------------------Message----------------------------------
      Here's some handy information about our server:
 
      Architecture: $name  
      Physical CPU's: $pcpu
      vCPU's: $vcpu
      RAM: 		 $avram MB $pram% Available
      Disk Space: 	$avdisk MB $pdisk% Available
      CPU load: 	
      Last boot: 	
      LVM: 		
      Network:	IPv4 $net MAC "
