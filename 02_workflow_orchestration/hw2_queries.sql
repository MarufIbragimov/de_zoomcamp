-- question #3
select sum(rows_count)
from yellow_tripdata_counts
where
	filename ilike 'yellow_tripdata_2020%'
;

-- question #4
select sum(rows_count)
from green_tripdata_counts
where
	filename ilike 'green_tripdata_2020%'
;

-- question #5
select rows_count
from yellow_tripdata_counts
where
	filename ilike 'yellow_tripdata_2021-03.csv'
;