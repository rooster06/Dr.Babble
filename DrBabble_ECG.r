
# Dr. Babble ----------------------------------------------
# Description: Dr. Babble is a fun script that generates a hospital report using n-grams
# created on hospital reports obtained from MIMIC III v1.3 database
# The following script only generates ECG Report doctor notes
# Author: Prabhat Rayapati

rm(list = ls())
# Packages -------------------------------------------------
# install.packages("stringr")
library(stringr)
# install.packages("ngram")
library(ngram)
# install.packages("koRpus")
library(koRpus)
# install.packages("wordcloud")
library(wordcloud)
# install.packages("tm")
library(tm)
# install.packages("RColorBrewer")
library(RColorBrewer)


# Data ------------------------------------------------------

# The following data of Doctor notes for the category ECG reports was
# extracted from the MIMIC III v1.3 database 
# To get access to the data please request access at the following website 
# https://mimic.physionet.org

# reading the data from the csv table created using the sql script
drbabble_ECG <- read.csv("drbabble1_rawdat.csv", stringsAsFactors = FALSE)
# careates a dataframe

# viewing the first ECG report to get an idea of the data
cat(drbabble_ECG$text[1])
# theres 209,051 such ECG reports
# the location and the dates are removed from the mimic data for privacy

# cleaning, removing the new line identifiers like \n
drbabble_ECG$text <-gsub("\n"," ",drbabble_ECG$text)


# ngram & babble ----------------------------------------------------
# lets create DrBabble_ECG for babbling a ECG reprot using ngrams

ECG_report <- paste(drbabble_ECG$text, collapse=" ")
ECG_report<-gsub("[[:digit:]]"," ",ECG_report)
ECG_report<-gsub("\\[\\*\\* Location \\*\\*\\]"," ",ECG_report)
ng<- ngram(ECG_report,n = 3)

# if you want to view the ngrams created uncomment and run the line below
# get.ngrams(ng) 

# let Dr. Babble babble some ECG report
# change the seed to babble something new
babble(ng, 30, seed=116201) 

# wordcloud ----------------------------------------------------------
# fun

# break the corpus into vector of one word and remove whitesapces and punct
ECG_report<-gsub("Location","",ECG_report)
ECG<-str_split(ECG_report," ")
ECG<-unlist(ECG)
ECG<-gsub("[[:punct:]]","",ECG)
ECG<-gsub("[[:digit:]]","",ECG)
ECG<-trimws(ECG)

# remove stop words
ECG<-removeWords(ECG,stopwords("en"))
# stopwords_regex = paste(stopwords('en'), collapse = '\\b|\\b')
# stopwords_regex = paste0('\\b', stopwords_regex, '\\b')
# ECG = stringr::str_replace_all(ECG, stopwords_regex, '')
ECG<-paste(ECG,collapse = " ")

# create a corpus and make the wordCloud on ECG reports
ECG <- Corpus(VectorSource(ECG))
dtm <- TermDocumentMatrix(ECG)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 10)
# lets remove the word location, its redundant in this data, it only appers to 
# deidentidy the location to preserve privacy 

set.seed(1234)
wordcloud(words = d$word, freq = d$freq, min.freq = 10,
          max.words=150,colors=brewer.pal(12, "Set1"))



