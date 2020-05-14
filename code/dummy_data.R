# code to generate the dummy variables

if (!require("tidyverse")) install.packages("tidyverse")
library(tidyverse)

# read inital table
dat <- read_csv("data/rawcounts.csv")

# separate the sgRNA column into multiple new columns based on the "_" character as a delimiter (unsure what the very first bit was supposed to be so called it "something"

# then separate the column that has the probe and gene info into two columns based on the "-" character


## Tidying
gene_dat <- dat %>%
  separate(col = sgRNA, into = c("something","TSS", "strand", "probe_gene"), sep = "_") %>%
  separate(col = probe_gene, into = c("probe", "gene"), sep = "-")

## Summary
# create summary of FC by gene and the number of probes for a gene:

gene_summary <- gene_dat %>%
  group_by(gene) %>%
  summarise(meanFC = mean(`Fold change`, na.rm = T), n_probes = n())
