setwd("~/Documents/topic-detection")
library(streamR)

#tweets_HC <- parseTweets("tweets_LP_HC.json")
#tweets_DT <- parseTweets("tweets_LP_DT.json")

library(tm)
library(wordcloud)
#library(Rstem)
library(stringr)

tweets_DT <-DonaldTrump
tweets_DT$text <- sapply(tweets_DT$text, function(row) iconv(row, "latin1", "ASCII", sub=""))
TweetCorpus <- paste(unlist(tweets_DT$text), collapse =" ") #to get all of the tweets together
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
religion.trade <- themes$word[themes$topic=="trade"]



TweetWords <- strsplit(TweetCorpus[[1]]$content, " ")[[1]]


#positive <- sum(TweetWords %in% pos.words)
#negative <- sum(TweetWords %in% neg.words)


economyDT <- sum(TweetWords %in% econ.words)
immigrantDT <- sum(TweetWords %in% imm.words)
healthcareDT <- sum(TweetWords %in% health.words)
militaryDT <- sum(TweetWords %in% milit.words)
chinaDT <- sum(TweetWords %in% china.words)
guncontrolDT <- sum(TweetWords %in% guncontrol.words)
raceDT <- sum(TweetWords %in% race.words)
climateDT <- sum(TweetWords %in% climate.words)
religionDT <- sum(TweetWords %in% religion.words)
tradeDT <- sum(TweetWords %in% trade.words)

econ <- TweetWords[TweetWords %in% econ.words]
write.csv(econ, file ="DTecon.csv")

imm <- TweetWords[TweetWords %in% imm.words]
write.csv(imm, file ="DTimm.csv")

health <- TweetWords[TweetWords %in% health.words]
write.csv(health, file ="DThealth.csv")

milit <- TweetWords[TweetWords %in% milit.words]
write.csv(milit, file ="DTmilit.csv")

china <- TweetWords[TweetWords %in% china.words]
write.csv(china, file ="DTchina.csv")

guncontrol <- TweetWords[TweetWords %in% guncontrol.words]
write.csv(guncontrol, file ="DTguncontrol.csv")

race <- TweetWords[TweetWords %in% race.words]
write.csv(race, file ="DTrace.csv")

religion <- TweetWords[TweetWords %in% religion.words]
write.csv(religion, file ="DTreligion.csv")