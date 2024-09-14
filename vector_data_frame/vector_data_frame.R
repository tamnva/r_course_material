
# Vector -----------------------------------------------------------------------
# Create a vector
x <- runif(20)

# append value to a vector (at the last and 3rd position)
x <- append(x, 6)

# append value to a vector (at the last and 3rd position)
x <- append(x, 9, 3)

# subset of a vector (only take element 1:10 and 12)
x <- x[c(1:10, 12)]

# math operators
x <- x * 2 
x <- (x / 3) + (x - 4) + (x + 5)

# math operators with a specific element of a vector
x[3] <- 2 + 3 - 1 + x[3] * 0

# find max, min, mean, median, summarize
max(x)
min(x)
mean(x)
median(x)
summary(x)

# sort x
sort(x, decreasing = TRUE)

# sort and get index
sorted_x <- sort(x, decreasing = TRUE, index.return = TRUE)

# get sorted values and index
sorted_x$x
sorted_x$ix

# also can find location of max value by
which(x == max(x))

# find which x > median
which(x > mean(x))


# Data frame -------------------------------------------------------------------
# Create data frame
df <- data.frame(date = seq.Date(from = as.Date("2030-01-01", format("%Y-%m-%d")), 
                                 to = as.Date("2030-12-31", format("%Y-%m-%d")), 
                                 by = 1))

# get dimension of data frame
dim(df)

# or get number of rows
nrow(df)

# get number of colums
ncol(df)

# add a column to a data frame
df$value <- sin(seq(0, 20, length.out = nrow(df)))

# plot
plot(x = df$date, y = df$value, type = "l")

# access all values of the 2nd columns
df[,2]
df$value

# all values of the 3rd row
df[3,]

# specific value (3rd row, 2nd column)
df[3,2]

# math operator (each colum/row is a vector) - same as vector, e.g.,
# add all columns "value" with 3
df$value <- df$value + 3

# modify a specific values
df[3,2] <- 4

# get df column name
colnames(df)

# rename df column
colnames(df) <- c("time", "data")

# if you rename, the column order is unchanged, just the column name
df[3,2]

# subset df
df[c(1:10),]
df[df$time < as.Date("2030-01-31", format("%Y-%m-%d")),]
df[df$data > mean(df$data),]

subset(df, data > mean(df$data) &  
         time < as.Date("2030-01-31", format("%Y-%m-%d")))

# aggregate (sum up data by month)
df$month <- month(df$time)
aggregate(data = df, data ~ month, FUN = "sum")

