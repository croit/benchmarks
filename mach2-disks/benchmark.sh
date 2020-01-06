#!/bin/bash

for iodepth in 1 2 4 8 16 32 64 128 256 ; do
	fio --ioengine=rbd --pool=test-mach2 --rbd=test --direct=1 --bs=4k --numjobs=1 --iodepth=${iodepth} --runtime=900 --time_based --group_reporting --name=test --rw=randread --output-format json > read-mach2-${iodepth}.json
	fio --ioengine=rbd --pool=test-mach2 --rbd=test --direct=1 --bs=4k --numjobs=1 --iodepth=${iodepth} --runtime=900 --time_based --group_reporting --name=test --rw=randwrite --output-format json > write-mach2-${iodepth}.json
	fio --ioengine=rbd --pool=test-normal-hdd --rbd=test --direct=1 --bs=4k --numjobs=1 --iodepth=${iodepth} --runtime=900 --time_based --group_reporting --name=test --rw=randread --output-format json > read-normal-${iodepth}.json
	fio --ioengine=rbd --pool=test-normal-hdd --rbd=test --direct=1 --bs=4k --numjobs=1 --iodepth=${iodepth} --runtime=900 --time_based --group_reporting --name=test --rw=randwrite --output-format json > write-normal-${iodepth}.json
done

