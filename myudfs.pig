-- myscript.pig
REGISTER /home/participant/git/commoncrawl-examples/lib/*.jar; 
REGISTER /home/participant/git/commoncrawl-examples/dist/lib/commoncrawl-examples-1.0.1.jar;
REGISTER myudfs.jar;
A = LOAD '/home/participant/data/*.arc.gz' USING org.commoncrawl.pig.ArcLoader() AS (date, length, type, statuscode, ipaddress, url, html);
B = FOREACH A GENERATE myudfs.UPPER(type);
DUMP B;
