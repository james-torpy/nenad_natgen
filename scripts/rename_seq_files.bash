#!/bin/bash

# select sample:
samplename="RUN_290716"

# make directory hierachy:
homeDir="/home/jamtor"
projectDir="$homeDir/projects/nenad_natgen"
inDir="$projectDir/raw_data/$samplename/sequences"

echo "The inDir is:"
echo $inDir

# specify extensions:
inExt=".seq"
outExt=".fsa"

# fetch files:
files=( $(ls $inDir/*$inExt) )

for file in ${files[@]}; do

	echo -e
	echo "The file used is:"
	echo $file

	newname=`basename $file | sed 's/seq/fsa/'`

	echo -e
	echo "The renamed file is:"
	echo $newname

	mv $file $inDir/$newname
done
