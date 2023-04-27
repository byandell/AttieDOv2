# analysis of RNA-seq phenotypes

library(qtl2)

# load data file
load("Attie_islet_secr_data_v1.Rdata")
# contains:
# genome.build  - GRCm38
# genoprobs     - R/qtl2 genoprobs on 69k grid
# K             - list of "loco" kinship matrices (500 x 500)
# map           - physical map for the 69k grid
# markers       - data frame for 69k grid with marker, chr, pos, cM, bp
# pheno         - phenotypes (483 x 57)
# pheno_dict    - phenotype dictionary
# annot.mrna    - 21,771 x 9 mRNA annotations (id,symbol,chr,start,end,strand,middle_point,nearest_marker,biotype)
# expr.mrna     - 378 x 21,771 mRNA phenotypes
# rankz.mrna    - 378 x 21,771 mRNA phenotypes (rankZ)
# raw.mrna      - 378 x 21,771 mRNA phenotypes (raw)

# create covarites
covar <- cbind(sex=(pheno$sex=="M")*1,
               DOwave2=(pheno$DOwave==3)*1,
               DOwave3=(pheno$DOwave==3)*1,
               DOwave4=(pheno$DOwave==4)*1,
               DOwave4=(pheno$DOwave==5)*1)
rownames(covar) <- rownames(pheno)

# do genome scans 
out <- scan1(genoprobs, rankz.mrna, K, addcovar=covar, cores=0)

# save output to RDS file
saveRDS(out, "rnaseq_rankz_output.rds")

# genes on autosome or X
genes_to_consider <- which(annot.mrna$chr %in% c(1:19,"X"))
# split by closest pseudomarker
batch <- split(genes_to_consider, annot.mrna$nearest_marker[genes_to_consider])

# function to scan a batch with a common pseudomarker
scan_batch <- function(batch) {
    pr_covar <- pull_genoprobpos(genoprobs, annot.mrna$nearest_marker[batch[1]])
    
    scan1(genoprobs, rankz.mrna[,batch,drop=FALSE], K, addcovar=cbind(covar, pr_covar[rownames(covar),-1]), cores=1)
}

cores <- qtl2:::setup_cluster(0)
out_vlocal <- qtl2:::cluster_lapply(cores, batch, scan_batch)
out_vlocal <- do.call("cbind", out_vlocal)

saveRDS(out_vlocal, "rnaseq_rankz_output_vlocal.rds")

