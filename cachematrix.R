library(tm)
text <- readLines("res.txt", encoding="UTF-8")
txtsrc <- VectorSource(text)
corpus <- Corpus(txtsrc)
corpus <- tm_map(corpus, content_transformer(tolower))

corpus <- tm_map(corpus, removePunctuation)

corpus <- tm_map(corpus, stripWhitespace)

corpus <- tm_map(corpus, removeWords, stopwords("english"))
dtm <- DocumentTermMatrix(corpus)
dtm2 <- as.matrix(dtm)
frequency <- colSums(dtm2)
frequency <- sort(frequency, decreasing=TRUE)

head(frequency)

