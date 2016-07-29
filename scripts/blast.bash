#!/bin/bash

# select sample:

samplename="RUN_190716"

# make directory hierachy:

homeDir="/home/jamtor"
projectDir="$homeDir/projects/nenad_natgen/"
annotDir="$projectDir/blast_dbs"
resultsDir="$projectDir/results"

inDir="$projectDir/raw_data/$samplename/sequences"
outDir="$resultsDir/blast/$samplename"

mkdir -p $outDir

annotFile="$annotDir/transcripts.fsa"
inFiles=`ls $inDir/*.fsa`

for file in $inFiles; do

	uniqueID=`basename $file | sed 's/.fsa//'`

	echo "The inFile is: "
	echo $file
	echo -e
	echo "The outFile is: "
	echo $outDir/$uniqueID.out
	echo -e

	blastline="blastn -db $annotFile -query $file -out $outDir/$uniqueID.out"
	echo "The blastline is:"
	echo $blastline
	echo -e
	
	$blastline
done;