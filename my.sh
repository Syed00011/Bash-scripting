#!/bin/bash
echo " welcome to lords of rings "

echo "please select your armour :
1 - Red  ranger
2 - blue ranger
3 - yellow ranger"
read  class
case $class in

	1)
		name="Red ranger"
		power=10
		;;
	2)
		name="Blue ranger"
		power=15
		;;
	3)
		name="yellow ranger"
		power=20
		;;
	*)
		echo "invalid statement"
		exit 1
		;;
esac

echo "you have selcected $name which has $power"
echo "select your level of playing :
1 - easy 
2 - medium
3 - hard "
read level
case $level in
	1)
		echo "you have selected easy level"
		go_to_2=0
		go_to_3=0
		;;
	2)
		echo "you have selected medium level"
		go_to_2=1
		go_to_3=0
		;;
	3)
		echo "you have selected hard level"
		go_to_2=0
		go_to_3=1
		;;
	*)
		echo"invalid statement"
		exit 1
		;;
esac
sleep 3

#level-1
if [[ $go_to_2 == 0 && $go_to_3 == 0 ]]; then
	echo "You have entered easy level 1"
elif [[ $go_to_2 == 1 && $go_to_3 == 0 ]]; then
	echo "you have entered medium level 2"
elif [[ $go_to_2 == 0 && $go_to_3 == 1 ]]; then
	echo "you have entered hard level 3"
else
	echo "please select the valid statement again"
fi
bash my.sh
