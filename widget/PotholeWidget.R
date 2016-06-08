library(RCurl)
PotholeURL <- getURL("https://raw.githubusercontent.com/samedelstein/RoadData/master/data/PotholesFilled.csv")
Potholes <- read.csv(text = PotholeURL)
