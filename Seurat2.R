library(Seurat)
library(dplyr)
x <- read.csv("test.csv",header =TRUE)
count <- as.matrix(x[2:58390])
rownames(count) <- x$barcodes
count <- t(count)    ###  transform to gene X sample matrix
te <-  CreateSeuratObject(counts = count, project = "tes",min.cells = 3, min.features = 200)
te <- NormalizeData(object = te)
VlnPlot(te, features = c("nFeature_RNA","nCount_RNA"))
all.genes  <- rownames(te)
te <- ScaleData(te, features = all.genes)
te <- FindVariableFeatures(object = te)
te <- RunPCA(te, features = VariableFeatures(object = te))  
VizDimLoadings(te, dims = 1:2, reduction = "pca")
DimPlot(te, reduction = "pca")                  ### pca figure
te <- FindNeighbors(te)
te <- FindClusters(te)
te <- RunTSNE(te, dims=1:10) 
DimPlot(te, reduction = "tsne")                        #### plot  of tSNE
FeaturePlot(object = te, features = "Syt2")    ##  plot for single gene  
FeaturePlot(object = te, features = "Ano2")    ##  plot for single gene  
############################################3
markers <- FindAllMarkers(object = te, only.pos = TRUE, min.pct = 0.25, thresh.use = 0.25)
markers <- markers %>% group_by(cluster) %>% top_n(n = 2, wt = avg_logFC)   ## can adjust n to bigger to get more results to better assign the cell types
write.csv(markers, "tes.csv", quote = F)
#############################################3

new_cluster_ids <- c("Nature Killer T cell", "CD8+ T cell","CD1C-CD141 dendritic cell","CD1C+_B dendritic cell","Plasmacytoid dendritic cell","Platelet","CD1C-CD141 dendritic cell","Plasma cell","NK cell","Plasma cell","Effector CD8+ T memory cell","Nature Killer T cell","CD141 dendritic cell","AXL+ dendritic cell","Plasma cell","B cell")
names(new_cluster_ids) <- levels(te)
te <- RenameIdents(te, new_cluster_ids)
DimPlot(te, reduction = "tsne", label =T ) 
dev.off()

############################################
