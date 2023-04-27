# find peaks in rna-seq results

library(qtl2)

o <- readRDS("rnaseq_output.rds")
pmap <- readRDS("../DerivedData/grid_pmap.rds")
peaks <- find_peaks(o, pmap, threshold=5.5, cores=0)
saveRDS(peaks, "rnaseq_peaks.rds")

o <- readRDS("rnaseq_rankz_output.rds")
peaks <- find_peaks(o, pmap, threshold=5.5, cores=0)
saveRDS(peaks, "rnaseq_rankz_peaks.rds")

