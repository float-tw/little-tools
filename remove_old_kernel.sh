#!/bin/bash
kernel=(`dpkg -l | grep linux-image | awk '{print $2}'`)
kernel_num=${#kernel[*]}
for id in ${!kernel[*]}
do
	echo "($id) ${kernel[$id]}"
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
	echo ${kernel[$id]}
done

yn="X"
while [ "$yn" != "y" -a "$yn" != "Y" -a "$yn" != "n" -a "$yn" != "N" ]
do
	read -p "delete above kernel?[y/N]:" yn
done

if [ "$yn" == "y" -o "$yn" == "Y" ]; then
	for id in ${each_input[*]}
	do
		sudo apt-get purge ${kernel[$id]}
	done
fi
