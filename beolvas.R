Sys.setenv(TZ="UTC")

filenames <- dir("Adatok")
library(readxl)

import.Boreas.xls <- function(filename, sheet, xlscolumn = 2) {
    require(readxl)
    require(xts)
    rawdata <- as.data.frame(read_excel(filename, sheet))
    full.date <- seq.POSIXt(rawdata[1,1], rawdata[nrow(rawdata),1], by = "10 min")
    if(length(full.date) == nrow(rawdata)) {
        xts(rawdata[, xlscolumn],full.date)
    } else {
        stop("Different length of databases")
    }
}

BorArbor <- import.Boreas.xls(filename = paste0("Adatok/", filenames[1]),
                              sheet = "Arborétum"
                              )
for(tti in 2:length(filenames)) {
    print(tti)
    BorArbor <- c(BorArbor, import.Boreas.xls(filename = paste0("Adatok/", filenames[tti]),
                                              sheet = "Arborétum"
                                              )
                  )
}
