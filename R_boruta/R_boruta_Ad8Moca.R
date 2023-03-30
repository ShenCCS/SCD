library(ggplot2)
library(lattice)
library(Boruta)
library(mlbench)
library(caret)
library(data.table)
library(magrittr)
library(dplyr)

df_ad8_ <- fread(input=sprintf("./dataset(13W)/FC/AD8_FC(mean+var+cv).csv"))
df_moca_ <- fread(input = sprintf("./dataset(13W)/FC/moca_FC(mean+var+cv).csv"))
names(df_ad8_)[2]<-'outcome'
names(df_moca_)[2]<-'outcome'
df_ad8_ <- df_ad8_[,setdiff(colnames(df_ad8_),'ID'),with=FALSE]
df_moca_ <- df_moca_[,setdiff(colnames(df_moca_),'ID'),with=FALSE]

print(head(df_ad8_,3))
print(head(df_moca_,3))

set.seed(123)
boruta_AD8 <- Boruta(outcome ~ ., data = df_ad8_, doTrace = 0, maxRuns = 500)
boruta_MOCA <- Boruta(outcome ~ ., data = df_moca_, doTrace = 0, maxRuns = 500)

AD8_shadow <- attStats(boruta_AD8)
MOCA_shadow <- attStats(boruta_MOCA)
MOCA_shadow <- MOCA_shadow[order(MOCA_shadow$'normHits', decreasing = TRUE),]
AD8_shadow <- AD8_shadow[order(AD8_shadow$'normHits', decreasing = TRUE),]

write.csv(MOCA_shadow,file = sprintf("./AD8andMoca/FC(m+v+c)/R-Boruta-MOCA_feature-selection-result(13W).csv"))
write.csv(AD8_shadow,file = sprintf("./AD8andMoca/FC(m+v+c)/R-Boruta-AD8_feature-selection-result(13W).csv"))