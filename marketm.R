#test driven code 

library("openxlsx")
library("dplyr")

#download dataset
dataURL <- "http://www.reachresourcecentre.info/system/files/resource-documents/15._reach_yem_dataset_joint_market_monitoring_initiative_jmmi_may2019.xlsx"
temp = tempfile(fileext = ".xlsx")
download.file(dataURL, destfile=temp, mode='wb')
dataFILE<- read.xlsx(temp, sheet= 2)
dataFILE<- as.data.frame(dataFILE)

#funtion to calculate average price for petrol and diesel by disaggregation of interest

fuel_table <- function(marketDATA, DISAG) {
  petrol<- marketDATA %>%
    filter(marketDATA$sell_petrol=="yes") %>%
    group_by(!!DISAG) %>%
    dplyr::summarize(petrol_mean = mean(price_petrol, na.rm=TRUE))
  diesel<- marketDATA %>%
    filter(marketDATA$sell_diesel=="yes") %>%
    group_by(!!DISAG) %>%
    dplyr::summarize(diesel_mean = mean(price_diesel, na.rm=TRUE))
table<-merge(petrol, diesel,all = TRUE)
table
}
fuel_table(dataFILE,quo(governorate_name))
fuel_table(dataFILE,quo(type_area))

