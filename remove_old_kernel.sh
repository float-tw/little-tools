#!/bin/bash
l_i="linux-image"
l_h="linux-headers"
gen="generic"
kernel_version=(`dpkg -l | grep -Po '(?<=linux-image-).*(?=-generic)'`)
kernel_num=${#kernel_version[*]}
for id in ${!kernel_version[*]}
do
	echo "($id) $l_i-${kernel_version[$id]}-$gen"
done

check='X'
while [ "$check" != "" ]
do
	echo 'input the kernel index want to remove move than one split by space'
	read -p ':' input
	#check input all number
	check=`echo $input | grep '[^[:digit:]^[:space:]]'`
	if [ "$check" == "" ] ; then
		break
	fi
	echo -e 'index error\n'
done
each_input=(`echo $input | awk '{print $0}'`)

echo -e "\n"

for id in ${each_input[*]}
do
	#check index is small than kernel number 
	if test $id -ge $kernel_num ;
	then
		echo 'index ouput of range'
		exit
	fi
	echo $l_i-${kernel_version[$id]}-$gen
done

yn="X"
while [ "$yn" != "y" -a "$yn" != "Y" -a "$yn" != "n" -a "$yn" != "N" ]
do
	read -p "delete above kernel?[y/N]:" yn
done

all_need_remove=""
if [ "$yn" == "y" -o "$yn" == "Y" ]; then
	for id in ${each_input[*]}
	do
		all_need_remove+=" $l_i-${kernel_version[$id]}-$gen $l_h-${kernel_version[$id]}"
	done
	sudo apt-get purge $all_need_remove
fi
