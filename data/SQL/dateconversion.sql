 --table updates 
 -- 1) add columns
 -- 2) update day, month, year
 -- 3) add date in SQLite complianc format
 -- 4) added size_k converting `size` to k from M and G  and -1 for `it varies`
 -- 5) create summary table (1M apps summarized in < 50K rows )
 
 alter table apps add COLUMN release_year text;
 alter table apps add COLUMN release_month text;
 alter table apps add COLUMN release_day text;
 alter table apps add COLUMN release_date text;
 
update apps
set	release_year  = substr(released, length(released)-4) ,
    	release_month =		case substr(released, 1, 3)
				when 'Jan' then 1
				when 'Feb' then 2
				when 'Mar' then 3
				when 'Apr' then 4
				when 'May' then 5
				when 'Jun' then 6
				when 'Jul' then 7
				when 'Aug' then 8
				when 'Sep' then 9
				when 'Oct' then 10
				when 'Nov' then 11
				when 'Dec' then 12
				end,
		release_day = substr(released, 5, instr(released, ",")-5)
;

update apps
set	   release_date =  release_year || '-' || release_month || '-' || release_day 
;

alter table apps add column size_k numeric;

update apps
set size_k = 	case substr(size,length(size))
			  when 'G' then substr(replace(size,',',''),1,length(replace(size,',',''))-1) * 1000000
			  when 'M' then substr(replace(size,',',''),1,length(replace(size,',',''))-1) * 1000
			  when 'k' then substr(replace(size,',',''), 1, length(replace(size,',',''))-1)
			  else -1 end 
;

drop table if exists apps_sum;

create table apps_sum as
select  release_year,
		       category,
			   free,
			   adsupported,
			   inapppurchase,
			   contentrating,
			   installs, 
			   avg(rating_count) as avg_ratingcount, 
			   min(rating_count) as min_ratingcount, 
			   max(rating_count) as max_ratingcount,
			   avg(rating) as avg_rating, 
			   min(rating) as min_rating, 
			   max(rating) as max_rating, 
			   avg(mininstalls) as avg_mininstalls, 
			   avg(maxinstalls) as avg_maxinstalls,
			   round(avg(price),2) as avg_price, 
			   min(price) as min_price, 
			   max(price) as max_price,
			   count(*)  as n_apps
from apps
group by release_year, category, free, adsupported, inapppurchase, contentrating, installs
order by release_year, category, free, adsupported, inapppurchase, contentrating, installs
;
 
