#!/bin/bash

module load sratoolkit

cat /wsu/home/hb/hb65/hb6588/rna_pro/p1/data.txt |while read line 

do

#######   write the jobs content to each file 
echo "
#PBS -q mwsuq
#PBS -l select=1:ncpus=5:mem=10GB


java -jar /wsu/home/hb/hb65/hb6588/soft/Trimmomatic-0.39/trimmomatic-0.39.jar PE -phred33  /wsu/home/hb/hb65/hb6588/rna_pro/p1/${line}_1.fastq /wsu/home/hb/hb65/hb6588/rna_pro/p1/${line}_2.fastq /wsu/home/hb/hb65/hb6588/rna_pro/p1/${line}_1.pair.clean.fastq /wsu/home/hb/hb65/hb6588/rna_pro/p1/${line}_1.unpair.clean.fastq /wsu/home/hb/hb65/hb6588/rna_pro/p1/${line}_2.pair.clean.fastq /wsu/home/hb/hb65/hb6588/rna_pro/p1/${line}_2.unpair.clean.fastq  ILLUMINACLIP:TruSeq3-PE.fa:2:30:10:2:keepBothReads LEADING:3 TRAILING:3 MINLEN:36

" > /wsu/home/hb/hb65/hb6588/rna_pro/p1/${line}.trim.sh

#####  submit the jobs 
qsub  /wsu/home/hb/hb65/hb6588/rna_pro/p1/${line}.trim.sh

done 



