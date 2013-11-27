register /home/participant/git/commoncrawl-examples/lib/*.jar; 

register /home/participant/git/commoncrawl-examples/dist/lib/commoncrawl-examples-1.0.1.jar;

a = LOAD '/home/participant/data/*.arc.gz' USING org.commoncrawl.pig.ArcLoader() as (date:chararray, length:int, type, statuscode, ipaddress, url, html);

fdates = filter a by date matches '.*Thu Feb 09 06:03:.* CET 2012';

words = foreach fdates generate date as dates, flatten(length) as lengths;

gdates = group words by dates;

sumdates = foreach gdates generate group,SUM(words.lengths);

dump sumdates;
