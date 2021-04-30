-- table export script

-- in sqlite3
.mode csv
.headers on
.output app_sum.csv
select * from app_sum2;
.output

--command line
sqlite3 -header -csv gps.db "select * from apps_sum" > test.csv