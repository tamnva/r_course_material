
library(wordcloud2)       # create word cloud
library(dplyr)           # data processing

# Read text from a text file
text <- readLines("C:/examples/text_sample.txt", -1L)

# separate text to words
words <- lapply(text, FUN = function(x) strsplit(x, "\\s+")[[1]])

# convert list to vector
words <- Reduce(c, words)

# combine to data frame
df <- data.frame(word = words, count = 1) 

# want to remove specific words
remove_words <- c("the", "a", "and", "of", "in", "for",  
                  "model", "The", "to", "modified")

# create data frame with words and frequentcy - remove unwanted words
df_remove <- df %>%
  group_by(word) %>%
  summarise(freq = sum(count)) %>%
  filter(!word %in% remove_words)


wordcloud2(demoFreq, 
           color = "skyblue")

