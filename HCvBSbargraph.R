

library(ggplot2)
TwitterTweets <- read.table(
  header=TRUE, text='Candidate  Topic Tweets
  1  Sanders    Economy     economyTC
  2  Clinton      Economy     45 
  3  Sanders China      5
  4   Clinton China      4
  5    Sanders Healthcare       36
  6   Clinton   Healthcare      22
  7    Sanders    Guncontrol     17
  8   Clinton     Guncontrol     40
  9    Sanders  Immigrant     13
  10   Clinton     Immigrant     24
  11    Sanders  Military    421
  12   Clinton     Military     137
  13 Sanders  Climate 0
  14 Clinton Climate 0
  15 Sanders Race 186
  16 Clinton Race 365
  17 Sanders Religion 26
  18 Clinton Religion 32
  19 Sanders Trade 26
  20 Clinton Trade 18')

ggplot(TwitterTweets, aes(Topic, Tweets, fill = Candidate)) + 
  geom_bar(stat="identity", position = "dodge") + 
  scale_fill_brewer(palette = "Set1") # + geom_point(aes(alpha = Tweets))


#B <- c(economyBS, economyHC)
#barplot(B, main="Topic: Economy", xlab ="Number of Tweets", col= c("blue", "darkgreen"),  names.arg=c("Bernie Sanders", "Hillary Clinton"))
# 
# 
# library(ggplot2)
# TwitterTweets <- read.table(
#   header=TRUE, text='Candidate  Topic Tweets
#   1  Sanders    Economy     60
#   2  Clinton      Economy     45 
#   3  Sanders China      5
#   4   Clinton China      4
#   5    Sanders Healthcare       36
#   6   Clinton   Healthcare      22
#   7    Sanders    Guncontrol     64172
#   8   Clinton     Guncontrol     45070
#   9    Sanders  Immigrant     13
#   10   Clinton     Immigrant     24
#   11    Sanders  Military    64529
#   12   Clinton     Military     45109
#   13 Sanders  Climate 0
#   14 Clinton Climate 0
#     15 Sanders Race 64158
#   16 Clinton Race 45048
#     17 Sanders Religion 26
#   18 Clinton Religion 32
#   19 Sanders Trade 64158
#   20 Clinton Trade 45048')
# 
# ggplot(TwitterTweets, aes(Topic, Tweets, fill = Candidate)) + 
#   geom_bar(stat="identity", position = "dodge") + 
#   scale_fill_brewer(palette = "Set1") # + geom_point(aes(alpha = Tweets))