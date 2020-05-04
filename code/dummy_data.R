# code to generate the dummy variables

if (!require("tidyverse")) install.packages("tidyverse")
library(tidyverse)

# read inital table
dat <- read_csv("data/rawcounts.csv")
