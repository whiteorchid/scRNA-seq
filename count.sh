#!/bin/bash

#PBS -q mwsuq
#PBS -l select=1:ncpus=8:mem=90GB

featureCounts   -T 8 -p -t gene -g gene_name  -a /wsu/home/hb/hb65/hb6588/rna_pro/gencode.vM23.primary_assembly.annotation.gtf -o /wsu/home/hb/hb65/hb6588/rna_pro/p1/all_gene_name.txt /wsu/home/hb/hb65/hb6588/rna_pro/p1/SRX3757335Aligned.sortedByCoord.out.bam	/wsu/home/hb/hb65/hb6588/rna_pro/p1/SRX3757336Aligned.sortedByCoord.out.bam	/wsu/home/hb/hb65/hb6588/rna_pro/p1/SRX3757337Aligned.sortedByCoord.out.bam	/wsu/home/hb/hb65/hb6588/rna_pro/p1/SRX3757338Aligned.sortedByCoord.out.bam	/wsu/home/hb/hb65/hb6588/rna_pro/p1/SRX3757339Aligned.sortedByCoord.out.bam	/wsu/home/hb/hb65/hb6588/rna_pro/p1/SRX3757340Aligned.sortedByCoord.out.bam	/wsu/home/hb/hb65/hb6588/rna_pro/p1/SRX3757341Aligned.sortedByCoord.out.bam	/wsu/home/hb/hb65/hb6588/rna_pro/p1/SRX3757343Aligned.sortedByCoord.out.bam	/wsu/home/hb/hb65/hb6588/rna_pro/p1/SRX3757344Aligned.sortedByCoord.out.bam	/wsu/home/hb/hb65/hb6588/rna_pro/p1/SRX3757345Aligned.sortedByCoord.out.bam

