#!/bin/bash

echo "qd,iops"

for i in 1 2 4 8 16 32 64 128 256 ; do
	echo -n ${i},
	cat $1-$2-$i.json | jq .jobs[0].$1.iops
done

