setwd("~/Documents/topic-detection")
library(streamR)

#tweets_HC <- parseTweets("tweets_LP_HC.json")
#tweets_DT <- parseTweets("tweets_LP_DT.json")

library(tm)
library(wordcloud)
#library(Rstem)
library(stringr)

tweets_HC <-HillaryClinton
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


themes <- read.csv("themes.csv", stringsAsFactors=F)
econ.words <- themes$word[themes$topic=="economy"]
imm.words <- themes$word[themes$topic=="immigration"]
health.words <- themes$word[themes$topic=="healthcare"]
milit.words <- themes$word[themes$topic=="military"]
china.words <- themes$word[themes$topic=="china"]
guncontrol.words <- themes$word[themes$topic=="guncontrol"]
race.words <- themes$word[themes$topic=="race"]
climate.words <- themes$word[themes$topic=="climate"]
religion.words <- themes$word[themes$topic=="religion"]


TweetWords <- strsplit(TweetCorpus[[1]]$content, " ")[[1]]


#positive <- sum(TweetWords %in% pos.words)
#negative <- sum(TweetWords %in% neg.words)

econ <- TweetWords[TweetWords %in% econ.words]
write.csv(econ, file ="HCecon.csv")

imm <- TweetWords[TweetWords %in% imm.words]
write.csv(imm, file ="HCimm.csv")

health <- TweetWords[TweetWords %in% health.words]
write.csv(health, file ="HChealth.csv")

milit <- TweetWords[TweetWords %in% milit.words]
write.csv(milit, file ="HCmilit.csv")

china <- TweetWords[TweetWords %in% china.words]
write.csv(china, file ="HCchina.csv")

guncontrol <- TweetWords[TweetWords %in% guncontrol.words]
write.csv(guncontrol, file ="HCguncontrol.csv")

race <- TweetWords[TweetWords %in% race.words]
write.csv(race, file ="HCrace.csv")

religion <- TweetWords[TweetWords %in% religion.words]
write.csv(religion, file ="HCreligion.csv")
#neg <- TweetWords[TweetWords %in% neg.words]


#lexicon <- read.csv("lexicon.csv", stringsAsFactors=F)
#pos.words <- lexicon$word[lexicon$polarity=="positive"]
#neg.words <- lexicon$word[lexicon$polarity=="negative"]

#TweetWords <- strsplit(TweetCorpus[[1]]$content, " ")[[1]]


#positive <- sum(TweetWords %in% pos.words)
#negative <- sum(TweetWords %in% neg.words)

#pos <- TweetWords[TweetWords %in% pos.words]
#write.csv(pos, file ="pos.csv")
#neg <- TweetWords[TweetWords %in% neg.words]

#wordcloud(pos)

#positive <- sum(TweetCorpus %in% pos.words)
#negative <- sum(TweetCorpus %in% neg.words)
