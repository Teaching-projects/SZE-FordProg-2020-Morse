#!/bin/bash

rm test_tmp.txt

for i in `seq 0 5000`;
do
	cat test.txt >> test_tmp.txt

	z=$((i%500))
	
	if [ $z -eq 0 ]; then


	echo -n "$i;"

	testfile=$PWD'/test_tmp.txt'

	./solution1/a.out $1 < $testfile
	./solution2/a.out $1 < $testfile
	./solution3/a.out $1 < $testfile

	echo -n "\n"

	fi

done    


