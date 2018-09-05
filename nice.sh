#!/bin/sh

cd ~/somethingUseful/generated
mkdir shell_tut
cd shell_tut

for (( i = 0; i < 10; i++ )); do
	#statements
	touch test_$i.txt
done




