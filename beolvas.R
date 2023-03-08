filenames <- dir("Adatok")
library(readxl)

BorArbor <- as.data.frame(read_excel(paste0("Adatok/", filenames[1]), sheet = "Arborétum"))
