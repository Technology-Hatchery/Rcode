# Testing
x <- 2
y <- 4
m <- 1:10
dim(m) <- c(2,5)
m

x<-data.frame(foo=1:4,bar=c(T,T,F,F))
nrow(x)
ncol(x)

m <- matrix(1:9,nrow=3,ncol=3)
dimnames(m) <- list(c("a","b","c"),c("d","e","f"))

# Read from text file

setwd("./")

## Using readLines
path <- paste(getwd(),"Data/Textual Analysis/Text.txt",sep="/")
file_con = file(description = path, open = "r", blocking = TRUE, encoding = getOption("encoding"), raw = FALSE)
lines = readLines(con = file_con, n = -1L, ok = TRUE, warn = TRUE, encoding = "unknown", skipNul = FALSE)
x <- 7

## Using read.table
file_path <- paste(getwd(),"Data/Sample - Superstore Sales (Excel).csv",sep="/")
save_path <- paste(getwd(),"Data/saved.Rda",sep="/")
library(Defaults)
setDefaults('as.Date.character', format = '%m/%d/%Y')
colClasses_values <- c("numeric","numeric","Date","character","numeric","numeric","numeric","character","numeric","numeric","numeric","character","character","character","character","character","character","character","character","numeric","Date")
dataFrame <- read.csv(file_path,header=TRUE,sep=",",quote="\"",dec=".",comment.char="",row.names=NULL,colClasses=colClasses_values)
#dataFrame <- read.csv(file_path,header=TRUE,sep=",",quote="\"",dec=".",comment.char="",row.names=NULL)
save(dataFrame,file=save_path)

# Loop
for(i in 1:10) {
    print(i)  
}

# Function Creation
add2 <- function(x, y) {
    x+y
}

# Word Cloud
words <- Corpus(DirSource("X:/Dropbox/Technology Hatchery Inc/technical/Git/Rcode/Data/Textual Analysis/"))
words <- tm_map(wsj,stripWhitespace)
words <- tm_map(wsj,tolower)
words <- tm_map(wsj,removeWords,stopwords("english"))
words <- tm_map(wsj,stemDocument)

wordcloud(lords, scale=c(5,0.5), max.words=100, random.order=FALSE, rot.per=0.35, use.r.layout=FALSE, colors=brewer.pal(8, “Dark2″))