SELECT B.Business_id, B.Business_name
FROM Business B, Review R, Yelp_User U
WHERE B.Su='0' AND B.AMBIENT_TYPE='Touristy' AND B.Business_id=R.BUS_ID AND U.Yelp_Id=R.AUTHOR_ID 
AND U.BIRTHPLACE!='CA' AND B.State='CA'
GROUP BY B.Business_id, B.Business_name
ORDER BY COUNT(R.REVIEW_ID), B.Business_id;