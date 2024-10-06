# Link to this R script is in the video description

# Example data frame
df <- data.frame(x = c("a", "b", "c", "a", "a", "a"), 
                 y = c(1.2, 3, 1.4, 5, 1.2, NA))

# Replace all "a" with "A"
df[df == "a"] <- "A"

# Replace NA with 0
df[is.na(df)] <- 0

# Replace b and 5 with 6
df[df == "b"|df == 5] <- 6

