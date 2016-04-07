

library(ggplot2)
TwitterTweets <- read.table(
  header=TRUE, text='Candidate  Topic Tweets
  1  Cruz    Economy     60
  2  Trump      Economy     45 
  3  Cruz China      5
  4   Trump China      4
  5    Cruz Healthcare       36
  6   Trump  Healthcare      22
  7    Cruz    Guncontrol     64172
  8   Trump     Guncontrol     45070
  9    Cruz  Immigrant     13
  10   Trump   Immigrant     24
  11   Cruz  Military    64529
  12   Trump     Military     45109
  13  Cruz  Climate 0
  14  Trump Climate 0
  15 Cruz Race 64158
  16 Trump Race 45048
  17 Cruz Religion 26
  18 Trump Religion 32')

ggplot(TwitterTweets, aes(Topic, Tweets, fill = Candidate)) + 
  geom_bar(stat="identity", position = "dodge") + 
  scale_fill_brewer(palette = "Set1") # + geom_point(aes(alpha = Tweets))