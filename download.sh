#!/bin/bash

cat /wsu/home/hb/hb65/hb6588/rna_pro/p1/data.txt |while read line
do

echo "
#PBS -q mwsuq
#PBS -l select=1:ncpus=1:mem=50GB

module load sratoolkit

fastq-dump --split-3 $line  -O /wsu/home/hb/hb65/hb6588/rna_pro/p1/

" > /wsu/home/hb/hb65/hb6588/rna_pro/p1/${line}.sh

#####  submit the jobs
qsub  /wsu/home/hb/hb65/hb6588/rna_pro/p1/${line}.sh

done

