setwd("C:/Users/carbon/Dropbox/Github/DataScience/Getting and Cleaning Data/Quiz 2")
library(httr)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. Register an application at https://github.com/settings/applications
#    Insert your values below - if secret is omitted, it will look it up in
#    the GITHUB_CONSUMER_SECRET environmental variable.
#
#    Use http://localhost:1410 as the callback url
myapp <- oauth_app("github", key = "60a49a2100c8bd1e15cc", secret = "0a81c5059b8fd7003d81f240ebd46bcdede64e4b" )

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
req <- GET("https://api.github.com/users/jtleek/repos", config(token = github_token))
stop_for_status(req)
content(req)

#Question 2

#Question 4
con = url("http://biostat.jhsph.edu/~jleek/contact.html")
html = readLines(con)
l = c(10,20,30,100)
z = for (line in l) {
    print(nchar(html[line]))
}

#Question 5
#File is in fixed width format
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for", destfile = "q5.for")

d = read.fwf(file = "q5.for", widths=c(12, 7,4, 9,4, 9,4, 9,4), skip = 4)
sum(d[,4])
