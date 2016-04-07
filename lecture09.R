setwd("~/Documents/topic-detection")
library(streamR)

tweets_HC <- parseTweets("tweets_LP_HC.json")
tweets_DT <- parseTweets("tweets_LP_DT.json")

library(tm)
library(wordcloud)
#library(Rstem)
library(stringr)

tweets_HC$text <- sapply(tweets_HC$text, function(row) iconv(row, "latin1", "ASCII", sub=""))
TweetCorpus <- paste(unlist(tweets_HC$text), collapse =" ") #to get all of the tweets together
TweetCorpus <- Corpus(VectorSource(TweetCorpus))
TweetCorpus <- tm_map(TweetCorpus, PlainTextDocument)
TweetCorpus <- tm_map(TweetCorpus, removePunctuation)
TweetCorpus <- tm_map(TweetCorpus, removeWords, stopwords('english'))
# %TweetCorpus <- tm_map(TweetCorpus, stemDocument) # % No stemming for now!
TweetCorpus <- tm_map(TweetCorpus, content_transformer(tolower),lazy=TRUE)
TweetCorpus <- tm_map(TweetCorpus, PlainTextDocument)
wordcloud(TweetCorpus, max.words = 100, random.order = FALSE)

lexicon <- read.csv("lexicon.csv", stringsAsFactors=F)
pos.words <- lexicon$word[lexicon$polarity=="positive"]
neg.words <- lexicon$word[lexicon$polarity=="negative"]

TweetWords <- strsplit(TweetCorpus[[1]]$content, " ")[[1]]


positive <- sum(TweetWords %in% pos.words)
negative <- sum(TweetWords %in% neg.words)

pos <- TweetWords[TweetWords %in% pos.words]
write.csv(pos, file ="pos.csv")
neg <- TweetWords[TweetWords %in% neg.words]

wordcloud(pos)

#positive <- sum(TweetCorpus %in% pos.words)
#negative <- sum(TweetCorpus %in% neg.words)
