SELECT DISTINCT U.USERID, U.Fname, U.Lname
FROM YelpUser U, Check_in_BusINESS C, Business B, Review_id R 
WHERE U.USERID=C.USERID AND rownum<=10 and B.BID=C.BID AND R.STARS='5' and R.BID=B.BID
ORDER BY U.USERID;