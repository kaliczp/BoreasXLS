filenames <- dir("Adatok")
library(readxl)

import.Boreas.xls <- function(filename, sheet) {
    require(readxl)
    require(xts)
    rawdata <- as.data.frame(read_excel(filename, sheet))
    full.date <- seq.POSIXt(rawdata[1,1], rawdata[nrow(rawdata),1], by = "10 min")
    if(length(full.date) == nrow(rawdata)) {
        xts(rawdata[,2],full.date)
    } else {
        stop("Different length of databases")
    }
}

BorArbor <- import.Boreas.xls(filename = paste0("Adatok/", filenames[1]),
                              sheet = "Arborétum"
                              )

BorArbor <- import.Boreas.xls(filename = paste0("Adatok/", filenames[3]),
                              sheet = "Arborétum"
                              )
