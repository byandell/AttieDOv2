This file contains a copy of box note [Attie DO v2](https://uwmadison.app.box.com/notes/253775365848) by Karl Broman.

Files related to the re-boot of the Attie DO mouse project.

- [attie_DO500_genoprobs_v5.rds](https://uwmadison.box.com/s/nw8ftrtuj1lmq8nyziv5p3lxbjkyitbr) - 8-state genotype probabilities for all 500 mice on a 69k grid 
- grid_pmap.rds  -  Physical map (Mbp) of the pseudomarker positions in the genoprobs
- grid_gmap.rds  -  Genetic map (cM) of the pseudomarker positions in the genoprobs
- kinship_loco_v5.rds  - kinship matrices by the "loco" method
- [pheno_clin_v5.RData](https://uwmadison.box.com/s/wct2sv5xursk7akgr5qutmubb35348yw) - clinical phenotypes and dictionary (contains pheno_clin, pheno_clin_dict, and ins_secr_raw) (Note the hilarious "v2" of the fifth version of this file. I neglected to re-format the mouse IDs in the ins_secr_raw object.)
- [ForMark/](https://uwmadison.app.box.com/folder/42904241734)  -  subset of pheno_clin and pheno_clin_dict (that are in pheno_clin_v5.RData), as two separate CSV files plus as an RData file. The columns and mice are following the subset that Mark Keller had asked everyone to focus on for the 2nd QTL paper
- [0_example_analysis.Rmd]() - R Markdown file containing an example analysis for a single phenotype, using the latest version of R/qtl2 (in which the previously separate qtl2geno, qtl2scan, qtl2plot, and qtl2db have now been merged).
- 0_example_analysis.html - the compiled output of 0_example_analysis.Rmd
- 0_example_analysis.R - a plain R script derived from 0_example_analysis.Rmd with knitr::purl().

Code related to the project is at BitBucket. Email Karl Broman for access:
     <https://bitbucket.org/kbroman/AttieDOv2>

Note also that sqlite databases for CC founder SNPs and MGI mouse genes are on figshare:

- cc_variants.sqlite: [doi:10.6084/m9.figshare.5280229.v2](https://doi.org/10.6084/m9.figshare.5280229.v2)
- mouse_genes_mgi.sqlite: [doi:10.6084/m9.figshare.5286019.v5](https://doi.org/10.6084/m9.figshare.5286019.v5)

`CCmouse` is a local symbolic link to `~/Documents/Research/qtl2shinyApp`, which has files in it used for [qtl2shiny](https://github.com/byandell/qtl2shiny).
Additional data are in local `data` folder.

See recent update of SNP database documented by Karl Broman at <https://kbroman.org/qtl2/pages/move_to_build39.html>.


