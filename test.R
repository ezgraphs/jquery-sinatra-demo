u='http://localhost:4567/data'
votes=as.numeric(readLines(url(u)))
length(votes)
mean(votes)
qplot(votes, binwidth=1) + geom_bar(color="white", binwidth=1)
qplot(votes, binwidth=1, fill=..count..) + scale_fill_gradient("Count", low="darkgreen", high="lightgreen")
