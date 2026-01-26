select count(1) as short_trips_count
from green_taxi_data
where
	(date_trunc('day', lpep_pickup_datetime) between make_date(2025,11,1) and make_date(2025,11,30))
	and trip_distance <= 1
;

select lpep_pickup_datetime::date as longest_trip_date 
from green_taxi_data
where
	trip_distance < 100
order by trip_distance desc
limit 1
;

select 
	tz."Zone" as taxi_zone
	, sum(gtd.total_amount) as grand_total
from green_taxi_data gtd
left join taxi_zones tz on gtd."PULocationID"=tz."LocationID"
where
	date_trunc('day', lpep_pickup_datetime) = make_date(2025,11,18) 
group by taxi_zone
order by grand_total desc
;

select 
	tz."Zone" as pu_zone
	, tz2."Zone" as do_zone
	, gtd.tip_amount
from green_taxi_data gtd
inner join taxi_zones tz on gtd."PULocationID"=tz."LocationID" and tz."Zone"='East Harlem North'
left join taxi_zones tz2 on gtd."DOLocationID"=tz2."LocationID"
where
	(date_trunc('day', lpep_pickup_datetime) between make_date(2025,11,1) and make_date(2025,11,30))
order by tip_amount desc
limit 1
;