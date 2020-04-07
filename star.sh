#!/bin/bash

#PBS -q wsuq

##      One core and 1GB of RAM selected:
#PBS -l select=1:ncpus=5:mem=200GB


STAR  --runThreadN 5 --runMode genomeGenerate --genomeDir /wsu/home/hb/hb65/hb6588/rna_pro  --genomeFastaFiles /wsu/home/hb/hb65/hb6588/rna_pro/GRCm38.primary_assembly.genome.fa --sjdbGTFfile /wsu/home/hb/hb65/hb6588/rna_pro/gencode.vM23.primary_assembly.annotation.gtf   --sjdbOverhang 150




