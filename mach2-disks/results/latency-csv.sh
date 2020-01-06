#!/bin/bash

echo "percentile,latencyns"

if grep read <<< $1 > /dev/null
then
	rw=read
else
	rw=write
fi

cat $1 | jq -r ".jobs[0].${rw}.clat_ns.percentile | to_entries[] | [.key, .value] | @csv" | tr -d \"

