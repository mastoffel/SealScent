# Main script for analysing scent profiles and associations with genetics

# laoding functions ------------------------------------------------------------
source("get_scores.R")
source("subset_all.R")
# loading data------------------------------------------------------------------                                                                                                                                                                                                                                                                                                                               

# abundance matrix (standardized and log(x + 1) - transformed)
# alternatives: scent abundances.csv,  scent abundance nobeach.csv,
#               scent.abundance.pa.csv

scent_abundance <- as.data.frame(t(read.csv(paste("C:\\Users\\Martin\\Studium\\",
                                "MSc.Behaviour\\Research\\Seal Scent\\R code\\",
                                "data\\csv_files\\scent abundances.csv", 
                                sep = ""), row.names=1)))

# diversity measures
scent_diversity <- read.csv(paste("C:\\Users\\Martin\\Studium\\",
                                  "MSc.Behaviour\\Research\\Seal Scent\\",
                                  "R code\\data\\csv_files\\",
                                  "scent diversity.csv", sep = ""),
                                   row.names=1)

# relatedness matrix (old: relatedness_41loci.csv)
relatedness <- read.csv(paste("C:\\Users\\Martin\\Studium\\",
                              "MSc.Behaviour\\Research\\Seal Scent\\",
                              "R code\\data\\csv_files\\",
                              "relatednessnew.csv", sep = ""),
                               row.names=1)

## heterozygosity SH
heterozygosity <- read.csv(paste("C:\\Users\\Martin\\Studium\\",
                                 "MSc.Behaviour\\Research\\Seal Scent\\",
                                 "R code\\data\\csv_files\\",
                                 "heterozygosity_41loci.csv", sep = ""),
                                  row.names=1) 

# beach and family factor
factors <- read.csv(paste("C:\\Users\\Martin\\Studium\\",
                          "MSc.Behaviour\\Research\\Seal Scent\\",
                          "R code\\data\\csv_files\\",
                          "factors.csv", sep = ""),
                           row.names=1) 


# choose ordination method and get scores---------------------------------------

allscores <- get_scores(scent_abundance, method = "fa", num_dim = 4, 
                        rotation = "promax")

# get subsets for age ("mums", "pups", "all") and beach (0 = all, 1, 2)---------

allsubsets <- subset_all("mums", beach = 0, scent_abundance,scent_diversity,
                        relatedness, heterozygosity, allscores, factors)

abund <- allsubsets[[1]]
div <- allsubsets[[2]]
relate <- allsubsets[[3]]
het <- allsubsets[[4]]
scores <- allsubsets[[5]]
factors <- allsubsets[[6]]

#

load    <- scent.fa$loadings
sorted.loadings <- load[order(load[, 1],decreasing=TRUE), 1] # change both numbers for PC change
#sorted.loadings.1 <- load[order(load[, 1]), 1]
loaddf <- as.data.frame(sorted.loadings)
myTitle <- "Loadings Plot for PC1" 
myXlab  <- "Variable Loadings"
dotplot(sorted.loadings, main=myTitle, xlab=myXlab, cex=1.5, col="red")
