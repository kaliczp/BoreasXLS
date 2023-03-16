which(diff(index(BorArbor)) != 600)
BorArbor[12294:12298]
BorArbor['2021-03-27 09:00/2021-03-27 09:10'] # 09:01 additional
BorArbor[15470:15473]
BorArbor['2021-04-18 10:50/2021-04-18 11:10'] # 11:01 additional
BorArbor[28185:28188]
BorArbor['2021-07-15 17:50/2021-07-15 18:10'] # 18:01 additional
BorArbor[35896:35899]
BorArbor['2021-09-07 06:50/2021-09-07 07:10'] # 07:01 additional
BorArbor[88653:88656]
BorArbor['2022-09-08 15:30/2022-09-08 15:40'] # 15:31 additional
BorArbor[111808:111811]
BorArbor['2023-02-16 09:30/2023-02-16 09:40'] # 09:31 additional

## Daylightsaving
## Change in xlsx at DST change 02:00 -> 03:00
BorArbor[12390:12395]
BorArbor['2021-03-28 00:50/2021-03-28 01:10']
BorArbor['2021-03-28 01:50/2021-03-28 03:10']
BorArbor[64811:64814]
BorArbor['2022-03-27 00:50/2022-03-27 01:10']
BorArbor['2022-03-27 01:50/2022-03-27 03:10']
## What about winter change? Missing!!
BorArbor[is.na(BorArbor)]
BorArbor['2021-10-31 01:50/2021-10-31 03:10']
BorArbor['2022-10-30 01:50/2022-10-30 03:10']
