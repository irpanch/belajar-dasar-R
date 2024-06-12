#basic data manipulation in R.

# create a simple dataframe
data <- data.frame(
  Name = c("Alice", "Bob", "Charlie"),
  Age = c(25,30,35),
  City = c("New York", "London", "Paris")
)
print(data)

# or simple load the available data set
data("mtcars")
head(mtcars,5)

# use base bracket "[ ]"
# remove cars with less than 6 cylinder
filtered_mtcars <- mtcars[mtcars$cyl >=6,] #pilih baris tertentu, semua kolom
print(filtered_mtcars)

# remove the first and third row 
mtcars_without_rows <- mtcars[-c(1,3),] #hapus baris 1 dan 3
print(mtcars_without_rows)

# using subset ().
# hilangkan mobil yang kurang dari 6 siilnder dengan subset
filtered_mtcars_subset <- subset(mtcars, cyl >=6)
print(filtered_mtcars_subset)

# hilangkan 5 baris pertama
mtcars_without_first_five <- mtcars[-c(1:5),]
print(mtcars_without_first_five)

# penggunaan dplyr
library(dplyr)
# ambil yang hanya 4 silinder
filtered_mtcars <- mtcars |> filter(cyl==4)
print(filtered_mtcars)

# filter dengan multiple kondisi
# 4 silinder dan hp lebih dari 100
filtered_mtcars <- mtcars |> filter(cyl==4 & hp >100)
print(filtered_mtcars)

# advance dplyr
# gunakan slice() untuk pemilihan dan penghapusan baris
## pilih 5 baris pertama
first_five_cars <- mtcars |> slice(1:5)
print(first_five_cars)
## hilangkan 5 baris pertama
cars_without_first_five <- mtcars |> slice(-c(1:5))
print(cars_without_first_five)
