#!/bin/bash


cat /wsu/home/hb/hb65/hb6588/rna_pro/p1/data.txt |while read line
do

#######   write the jobs content to each file
echo "
#PBS -q mwsuq
#PBS -l select=1:ncpus=5:mem=100GB


STAR --genomeDir /wsu/home/hb/hb65/hb6588/rna_pro \
--runThreadN 5 \
--readFilesIn /wsu/home/hb/hb65/hb6588/rna_pro/p1/${line}_1.pair.clean.fastq /wsu/home/hb/hb65/hb6588/rna_pro/p1/${line}_2.pair.clean.fastq \
--outFileNamePrefix /wsu/home/hb/hb65/hb6588/rna_pro/p1/${line} \
--outSAMtype BAM SortedByCoordinate \
--outSAMunmapped Within \
--outSAMattributes Standard \
--twopassMode Basic


" > /wsu/home/hb/hb65/hb6588/rna_pro/p1/${line}.star_map.sh

#####  submit the jobs
qsub  /wsu/home/hb/hb65/hb6588/rna_pro/p1/${line}.star_map.sh

done

