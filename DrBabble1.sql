--------------------------------------------------------------
-- SQL scrip to extract Doctor notes from MIMIC III v1.3
-- This sql script extracts notes from the table noteevents	
-- of the form category: ECG and Description: Report
-- and then saves the text field of these records to a csv file
-- named drbabble1_rawdat. 
--
-- Author: Prabhat Rayapati
-------------------------------------------------------------


CREATE TABLE drbabble1 AS
(SELECT text FROM noteevents
WHERE category='ECG' AND description='Report');

COPY drbabble1 TO 'D:/mimic3/drbabble1_rawdat.csv' DELIMITER ',' CSV HEADER;

DROP TABLE drbabble1;