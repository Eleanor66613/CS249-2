name_percentage <- ddply(bnames, .(name, year), summarise, percent = sum(percent))
 
name_appear_times <- ddply(name_percentage, .(name), summarise, times =
length(year))
frequent_names <- subset(name_appear_times, times > 14)$name
name_percentage <- subset(name_percentage, name %in% frequent_names)
 
name_ranked <- ddply(
    name_percentage, .(name), mutate,
    rank_percent = rank(-percent),
    rank_year = rank(-year)
)
# Find name that is not up trending
no_trending_name <- unique(subset(name_ranked, rank_percent != rank_year)$name)
# Fine name that is up trending
up_trending_name <- unique(subset(name_ranked, !(name %in%
no_trending_name))$name)
print(up_trending_name)
