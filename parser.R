setwd("~/Documents/topic-detection")
library(streamR)

#generates csv files for each candidate for each date - 4 x 9 = 36 csv files

files <-c("tweets.03.16.2016.summary.json", "tweets.03.17.2016.summary.json","tweets.03.18.2016.summary.json","tweets.03.19.2016.summary.json","tweets.03.20.2016.summary.json","tweets.03.21.2016.summary.json","tweets.03.22.2016.summary.json","tweets.03.23.2016.summary.json","tweets.03.24.2016.summary.json","tweets.03.25.2016.summary.json") 
for (filename in files)
 {
  tweets_shiny.df <- parseTweets(filename, simplify = TRUE)

 
  HillaryClinton <- tweets_shiny.df[grep("Hillary Clinton|HillaryClinton", tweets_shiny.df$text), ]
  BernieSanders <- tweets_shiny.df[grep("Bernie Sanders|BernieSanders", tweets_shiny.df$text), ]
  
  DemocratTotals <- rbind(HillaryClinton, BernieSanders)
  write.csv(HillaryClinton, file = paste("HillaryClinton", filename, ".csv"))
  write.csv(BernieSanders, file = paste("BernieSanders", filename, ".csv"))
  write.csv(DemocratTotals, file = paste("DemocratTotals", filename, ".csv"))
  
  write.csv(HillaryClinton, file = "HillaryClinton.csv")
  write.csv(BernieSanders, file = "BernieSanders.csv")
  write.csv(DemocratTotals, file = "democrat.csv")
  
  
  #Democrat <- tweets_shiny.df[grep('Hillary Clinton|Bernie Sanders', tweets_shiny.df$text), ]
  
  TedCruz <- tweets_shiny.df[grep("Ted Cruz|TedCruz", tweets_shiny.df$text), ]
  DonaldTrump <- tweets_shiny.df[grep("Donald Trump|DonaldTrump", tweets_shiny.df$text), ]
  
  RepublicanTotals <- rbind(TedCruz, DonaldTrump)
  write.csv(TedCruz, file = paste("TedCruz", filename, ".csv"))
  write.csv(DonaldTrump, file = paste("DonaldTrump", filename, ".csv"))
  write.csv(DemocratTotals, file = paste("RepublicanTotals", filename, ".csv"))
  
  write.csv(HillaryClinton, file = "TedCruz.csv")
  write.csv(BernieSanders, file = "DonaldTrump.csv")
  write.csv(RepublicanTotals, file = "republican.csv")

  }


#   HillaryClinton <- tweets_shiny.df[grep("Hillary Clinton", tweets_shiny.df$text), ]
#   HillaryClinton_wo <- tweets_shiny.df[grep("HillaryClinton", tweets_shiny.df$text), ]
#   HillaryTotals <- rbind(HillaryClinton, HillaryClinton_wo)
#   #write.csv(HillaryTotals, file = "HCTotals" + date + ".csv")
#   write.csv(HillaryTotals, file = paste("HCTotals", filename, ".csv"))
#   #load(HillaryTotals)
#   
#   #tweets_shiny.df <- parseTweets("all_candidates.json", simplify = TRUE)
#   BernieSanders<- tweets_shiny.df[grep("Bernie Sanders", tweets_shiny.df$text), ]
#   BernieSanders_wo <- tweets_shiny.df[grep("BernieSanders", tweets_shiny.df$text), ]
#   BernieTotals <- rbind(BernieSanders, BernieSanders_wo)
#   write.csv(BernieTotals, file = paste("BSTotals", filename, ".csv"))
#   
#   #tweets_shiny.df <- parseTweets("all_candidates.json", simplify = TRUE)
#   DonaldTrump<- tweets_shiny.df[grep("Donald Trump", tweets_shiny.df$text), ]
#   DonaldTrump_wo <- tweets_shiny.df[grep("DonaldTrump", tweets_shiny.df$text), ]
#   DonaldTotals <- rbind(DonaldTrump, DonaldTrump_wo)
#   write.csv(DonaldTotals, file = paste("DTTotals", filename, ".csv"))
#   
#   
#   #tweets_shiny.df <- parseTweets("all_candidates.json", simplify = TRUE)
#   #TedCruz<- tweets_shiny.df[grep("Ted Cruz", tweets_shiny.df$text), ]
#   #TedCruz_wo <- tweets_shiny.df[grep("TedCruz", tweets_shiny.df$text), ]
#   #TedTotals <- rbind(TedCruz, TedCruz_wo)
#   
#   
#   #tweets_shiny.df <- parseTweets("all_candidates.json", simplify = TRUE)
#   MarcoRubio<- tweets_shiny.df[grep("Marco Rubio", tweets_shiny.df$text), ]
#   MarcoRubio_wo <- tweets_shiny.df[grep("MarcoRubio", tweets_shiny.df$text), ]
#   MarcoTotals <- rbind(MarcoRubio, MarcoRubio_wo)
#   write.csv(MarcoTotals, file = paste("MRTotals", filename, ".csv"))
#   #load(MarcoTotals)

