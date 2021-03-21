# cara menggunakan fungsi apply 
# sumber: https://www.youtube.com/watch?v=7sJ8r6Lb7-o&ab_channel=MarinStatsLectures-RProgramming%26Statistics

# apply function merupakan kumpulan fungsi loop di R
# perbedaan yang paling utama adalah fungsi ini lebih efisien dibanding "for loop"
# efisien karena kodenya lebih sedikit, dan performa lebih cepat.

# import data
StockData <- read.table("StockExample.csv",sep = ",",header = T,row.names = 1)


# calculate mean price for each stock (column wise)
apply(X=StockData,MARGIN=2,FUN=mean) # margin 2 = kolom, margin 1 = baris

# Hilangkan NA
apply(X=StockData,MARGIN=2,FUN=mean, na.rm=T)

# Store the mean on variable
AVG <- apply(X=StockData,MARGIN=2,FUN=mean, na.rm=T)
AVG

# jika tahu parameter, tidak usah ditulis ulang
apply(StockData, 2, mean, na.rm=T)

# hasil yang sama dengan perintah yang berbeda
colMeans(StockData,na.rm = T)
## nilai akan sama, karena ini merupakan apply function
## yang sudah dioptimasi untuk menghitung rata-rata per kolom

# cari maksimum tiap kolom
apply(StockData, 2, max, na.rm=T)

# cari percentile ke 20 dan ke 80 
apply(X=StockData,MARGIN=2,FUN=quantile, probs=c(0.2,0.8), na.rm=T)

# buat plot
apply(X=StockData,MARGIN=2,FUN=plot, type="l") # plotting tiap stok kolom

# tambah keterangan di plot
apply(X=StockData,MARGIN=2,FUN=plot, type="l", main="Stock",
      ylab="Price", xlab="Day")

# hitung jumlah per baris
apply(X=StockData,MARGIN=1,FUN=sum, na.rm=T)

# hasil yang sama dengan rowSums
rowSums(StockData,na.rm = T)

# buat plot per baris untuk tiap hari 
plot(apply(X=StockData,MARGIN=1,FUN=sum, na.rm=T),type = "l",
     ylab="Total Market Value", xlab = "Day",main = "Market Trend")

# tambah point
points(apply(X=StockData,MARGIN=1,FUN=sum, na.rm=T),pch=16,col="blue")
