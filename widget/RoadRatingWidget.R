library(RCurl)
library(ggplot2)
RoadURL <- getURL("https://raw.githubusercontent.com/samedelstein/RoadData/master/RoadRatings.csv")
RoadRating <- read.csv(text = RoadURL)

RoadsByRating <- data.frame(table(RoadRating$Overall))
names(RoadsByRating) <- c("rating", "numberOfRoads")
RoadsByRating$rating <- as.numeric(as.character(RoadsByRating$rating))
RoadsByRating$GoodFairPoor <- "Fair"
RoadsByRating$GoodFairPoor[RoadsByRating$rating > 7] <- "Good"
RoadsByRating$GoodFairPoor[RoadsByRating$rating < 6] <- "Poor"

ggplot(RoadsByRating, aes(rating, numberOfRoads, fill = GoodFairPoor)) +
  geom_bar(stat="identity") + 
  scale_fill_manual(values=c("Yellow", "Green", "Red")) +
  ggtitle("Number of Roads By Rating")

