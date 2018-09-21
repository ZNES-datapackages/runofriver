CREATE TEMP TABLE regionalschluessel_to_dena AS

SELECT DISTINCT ON (SQ.regionalschluessel) SQ.* FROM 
(
	SELECT 
		A.region_key AS regionalschluessel,
		A.ags, 
		A.name, 
		A.nuts, 
		B.gid, 
		B.sp_id, 
		B.dpr_id::integer,
		-- ST_MAKEVALID: The function attempts to create a valid representation of a given invalid geometry without losing any of the input vertices. 
		-- Without it we get: ERROR:  Error performing intersection: TopologyException: Input geom 1 is invalid
		ST_AREA(ST_INTERSECTION(A.geom, ST_MAKEVALID(B.geom))) as shared_area
			FROM 
			vn.geo_municipality A,
			vn.geo_dpr_germany21 B
	WHERE ST_INTERSECTS(A.geom, B.geom)
	ORDER BY name, shared_area DESC
) SQ;

/*
Check DISTINCT ON is getting highest value of shared area, based on
# https://stackoverflow.com/questions/13325583/postgresql-max-and-group-by

Values before DISTINCT ON
-- Achberg 
"084365007001";"08436001";"Achberg";"DE148";4;"4";12;12028375.1078249
"084365007001";"08436001";"Achberg";"DE148";2;"2";10;614002.460102172

-- Adelzhausen
"097715704111";"09771111";"Adelzhausen";"DE275";2;"2";10;16668739.1088143
"097715704111";"09771111";"Adelzhausen";"DE275";10;"10";18;40066.2906452914
*/

SELECT * from regionalschluessel_to_dena where regionalschluessel = '097715704111';

-- "097715704111";"09771111";"Adelzhausen";"DE275";2;"2";10;16668739.1088143
-- OK

SELECT * from regionalschluessel_to_dena where regionalschluessel = '084365007001';

-- "084365007001";"08436001";"Achberg";"DE148";4;"4";12;12028375.1078249
-- OK

COPY  regionalschluessel_to_dena TO '/tmp/20171113_RegionkeyToDENARegion.csv' WITH (FORMAT 'csv', HEADER TRUE);



