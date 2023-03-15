Sys.setenv(TZ="CET")
Sys.setenv(TZ = "Europe/Budapest") # Windows?

filenames <- dir("Adatok", pattern = "SoE")
library(readxl)

import.Boreas.xls <- function(filename, sheet, xlscolumn = 2) {
    require(readxl)
    require(xts)
    rawdata <- as.data.frame(read_excel(filename, sheet))
    rawdatetime <- as.character(rawdata[, 1])
    rawdatetime <- as.POSIXct(rawdatetime)
    full.date <- seq.POSIXt(rawdatetime[1], rawdatetime[length(rawdatetime)], by = "10 min")
    if(length(full.date) != nrow(rawdata)) {
        warning("Different length of databases")
    }
    raw.xts <- xts(rawdata[, xlscolumn], rawdatetime)
    generated.xts <- xts(rep(NA, length(full.date)), full.date)
    merge(raw.xts, generated.xts)[,1]
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
