register /home/participant/git/commoncrawl-examples/lib/*.jar; 

register /home/participant/git/commoncrawl-examples/dist/lib/commoncrawl-examples-1.0.1.jar;

a = LOAD '/home/participant/data/*.arc.gz' USING org.commoncrawl.pig.ArcLoader() as (date, length, type, statuscode, ipaddress, url, html);

dump a;

words = foreach a generate flatten(type) as types;

dump words;

grpd = group words by types; 

dump grpd;

cntd = foreach grpd generate group, COUNT(words); 

dump cntd;
