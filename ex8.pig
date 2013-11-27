-- Bin laden UDF filtering :-)

REGISTER /home/participant/git/commoncrawl-examples/lib/*.jar; 
REGISTER /home/participant/git/commoncrawl-examples/dist/lib/commoncrawl-examples-1.0.1.jar;
REGISTER myudfs.jar;

A = LOAD '/home/participant/data/*.arc.gz' USING org.commoncrawl.pig.ArcLoader() as (date, length, type, statuscode, ipaddress, url, html:chararray);

BL = FILTER A BY myudfs.ContainsBinLaden(html);

CL = FOREACH BL GENERATE url;

DUMP CL;

