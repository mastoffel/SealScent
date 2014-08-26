# building the bootstrapping test
library(vegan)
source("bio.env.R")
source("bv.step.R")
source("bioenvmod.R")
# create empty vector to count elements
all_best <- vector()

for (i in 1:10) {
        
        index_seals <- sort(sample(1:41, size = 20, replace = F))
        
        # subset relate and abund
        reltemp <- as.dist(relate[index_seals, index_seals])
        abundtemp <- abund[index_seals, ]
        
        for (i in 1:10) {
                
        # sample 10 compounds
                index_comps <- sort(sample(1:203, size = 10, replace = F))
                
                results <- bio.env(reltemp, abundtemp[, index_comps], 
                                var.dist.method = "bray", 
                                scale.fix = F, scale.var = F)
        
                mods <- results$models
                best.est <- which.max(sapply(mods, function(x) x$est))
                best.comps.ind <- mods[[best.est]][[1]]
                best <- names(abundtemp[, index_comps])[best.comps.ind]
                all_best <- append(all_best, best)
        }
}
source("bioenvmod.R")

results <- bio.env(as.dist(relate), abund[, 180:193],  var.dist.method = "bray")
                 