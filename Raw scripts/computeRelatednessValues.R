library(Demerelate)
gen <- read.table("C://Users//Martin//Studium//MSc.Behaviour//Research//Seal Scent//R code//raw scripts//41_loci.txt", header = TRUE)

rels <- Demerelate(gen, object=TRUE, value="rxy" , NA.rm=FALSE)

rels <- Demerelate(inp)

vals <- rels$Empirical_Relatedness

relate <- relnew$BAS
