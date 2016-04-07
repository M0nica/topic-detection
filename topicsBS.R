setwd("~/Documents/topic-detection")
library(streamR)

#tweets_HC <- parseTweets("tweets_LP_HC.json")
#tweets_DT <- parseTweets("tweets_LP_DT.json")

library(tm)
library(wordcloud)
#library(Rstem)
library(stringr)

tweets_BS <-BernieSanders
tweets_BS$text <- sapply(tweets_BS$text, function(row) iconv(row, "latin1", "ASCII", sub=""))
TweetCorpus <- paste(unlist(tweets_BS$text), collapse =" ") #to get all of the tweets together
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
trade.words <- themes$word[themes$topic=="trade"]


TweetWords <- strsplit(TweetCorpus[[1]]$content, " ")[[1]]


economyBS <- sum(TweetWords %in% econ.words)
immigrantBS <- sum(TweetWords %in% imm.words)
healthcareBS <- sum(TweetWords %in% health.words)
militaryBS <- sum(TweetWords %in% milit.words)
chinaBS <- sum(TweetWords %in% china.words)
guncontrolBS <- sum(TweetWords %in% guncontrol.words)
raceBS <- sum(TweetWords %in% race.words)
climateBS <- sum(TweetWords %in% climate.words)
religionBS <- sum(TweetWords %in% religion.words)
tradeBS <- sum(TweetWords %in% trade.words)



#positive <- sum(TweetWords %in% pos.words)
#negative <- sum(TweetWords %in% neg.words)

econ <- TweetWords[TweetWords %in% econ.words]
write.csv(econ, file ="BSecon.csv")

imm <- TweetWords[TweetWords %in% imm.words]
write.csv(imm, file ="BSimm.csv")

health <- TweetWords[TweetWords %in% health.words]
write.csv(health, file ="BShealth.csv")

milit <- TweetWords[TweetWords %in% milit.words]
write.csv(milit, file ="BSmilit.csv")

china <- TweetWords[TweetWords %in% china.words]
write.csv(china, file ="BSchina.csv")

guncontrol <- TweetWords[TweetWords %in% guncontrol.words]
write.csv(guncontrol, file ="BSguncontrol.csv")

race <- TweetWords[TweetWords %in% race.words]
write.csv(race, file ="BSrace.csv")

religion <- TweetWords[TweetWords %in% religion.words]
write.csv(religion, file ="BSreligion.csv")