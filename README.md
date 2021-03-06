# Dr.Babble
## Ngram Language Models &amp; WordClouds on hospital ECG Notes

MIMIC III is an openly available dataset developed by the MIT Lab for Computational Physiology, comprising deidentified health data associated with >40,000 critical care patients. It includes demographics, vital signs, laboratory tests, medications, and more.

Of the available tables in mimic one was particularly interesting for NLP purposes, the NOTEEVENTS table. This table contains all the doctor reports, nurse reports etc.; textual information for patients in the database. Some of the most frequently occuring reports in the table are shown below, (category and descriptions fields in NOTEEVENTS together describe the type of text):

![alt tag](https://github.com/rooster06/Dr.Babble/blob/master/note-stats.png)

And ofcourse, I thought it would be fun to make Ngram models on the doctor notes and have the computer babble a note by iteself. Simple language models like Ngrams are known for generating amusing but senseless text, and the function in R used to generate text from a constructed Ngram is called babble, hence the name Dr.Babble. 

MIMIC dataset though open, requires you to gain access by completing a few steps, so I wont be sharing the data used here. You can request access to mimic database at https://mimic.physionet.org. Once you have access to the dataset you can use the sql script in this repository pull the required data from your mimic 3 database. I used the MIMIC III version 1.3 in this fun experiment. 

The R script helps you create a short ECG report based on Ngram language models made on 209,051 ECG report data available in the MIMIC III v1.3 database. Making Ngrams on ECG Reports was easy because the text was just continous notes and not a structured document with various fields like in other reports. This meant less cleaning and data wrangling. An example, one of the ECG Report from the data is shown below:

"Atrial fibrillation with rapid ventricular response.  Inferior myocardial infarction, age undetermined.  Lateral ST-T wave changes may be due to myocardial ischemia or repolarization abnormality.  Clinical correlation is suggested.  Compared to the [\*\* Location \*\*]us tracing of [\*\*2820-7-23\*\*] the rhythm is now consistently atrial fibrillation and the rate has increased."

Two examples of reports generated for each unigram, bigram and trigram models are shown below:

### * Unigram

  ex.1.

  "arms) No significant change from tracing no diagnostic interval are small R waves are new. TRACING # Sinus tachycardia. Baseline artifact. Underlying sinus rhythm. Compared to the us tracing of "

  ex.2.

  "wavechanges improved but the right axis deviation Conduction defect Inferior Q waves. Delayed R wave abnormalities were present and ST-T wave and aVF is suggested. TRACING # Sinus rhythm. The "

### * Bigram

  ex.1.

  "strain. Diffuse non-diagnostic repolarization abnormalities. Low voltage in leads aVL and V raising questions of inferior myocardial infarction of indeterminate age. Poor R wave transition in lead aVF is now "

  ex.2.

  “\*\*\* Nonspecific ST-T changes are present. TRACING # Sinus rhythm. Baseline artifact. Sinus rhythm. Low limb lead voltage. Slightly delayed precordial R wave progression Consider anteroseptal infarct Low QRS voltage. "

### * Trigram

  ex.1.

  "complex with ventricular pacer and fusion beats. Compared to the us tracing no significant change. Sinus rhythm with PACs Since us     tracing, no significant change Irregular wide complex rhythjm with "

  ex.2.

  "complex tachycardia. Consider supraventricular tachycardia with varying block. Diffuse non-specific ST-T wave changes. No us tracing available for comparison. Sinus rhythm. Left axis deviation - could be in part early "

### WordCloud

Additionnaly the script creates a wordCloud for the ECG report data. Stopwords were removed.

![alt tag](https://github.com/rooster06/Dr.Babble/blob/master/ECG.png)

### Future work:

* Try to create language models on something structurally more complicated (data wrangling wise) like discharge summary reports and be able to babble an entire structured report.

* Use better language models. 


### Ackwnoledgements:

MIMIC-III, a freely accessible critical care database. Johnson AEW, Pollard TJ, Shen L, Lehman L, Feng M, Ghassemi M, Moody B, Szolovits P, Celi LA, and Mark RG. Scientific Data (2016). DOI: 10.1038/sdata.2016.35.
