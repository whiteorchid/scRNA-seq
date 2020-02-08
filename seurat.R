##########
### this script is done by ref the Seurat official site and raw counts file  analized by trimmomatic,STAR and featureCounts...
##########
Library(Seurat)
x <- read.delim("counts.txt", header = TRUE, skip = 1)
head(x)
count <- as.matrix(x[7:"232"])
rownames(count) <- x$Geneid
head(count)
cochlea <-  CreateSeuratObject(counts = count, project = "coch",min.cells = 3, min.features = 200)
cochlea <- NormalizeData(object = cochlea)
VlnPlot(cochlea, features = c("nFeature_RNA","nCount_RNA"))
cochlea <- subset(cochlea, subset = nFeature_RNA  > 8500 & nFeature_RNA <10000)
all.genes  <- rownames(cochlea)
cochlea <- ScaleData(cochlea, features = all.genes)
cochlea <- FindVariableFeatures(object = cochlea)
cochlea <- RunPCA(cochlea, features = VariableFeatures(object = cochlea))
VizDimLoadings(cochlea, dims = 1:2, reduction = "pca")
DimPlot(cochlea, reduction = "pca")
cochlea <- FindNeighbors(cochlea)
cochlea <- FindClusters(cochlea)
cochlea <- RunTSNE(cochlea, dims=1:10)
DimPlot(cochlea, reduction = "tsne")
FeaturePlot(object = cochlea, features = "Syt2")    ##  plot for single gene  
FeaturePlot(object = cochlea, features = "Ano2")    ##  plot for single gene  
markers <- FindAllMarkers(object = cochlea, only.pos = TRUE, min.pct = 0.25, thresh.use = 0.25)
library(dplyr)  ##  load another package to analysis data
top10 <- markers %>% group_by(cluster) %>% top_n(10, avg_logFC)
DoHeatmap(object = cochlea, features = top10$gene, label = TRUE)
