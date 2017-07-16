SELECT DISTINCT B.Bid, B.Bname
FROM Business B, Review_ID R, YelpUser U, Friendlist F
WHERE B.Bid=R.BID AND U.userid=R.AUTHORID AND U.userId=F.USERID
GROUP BY B.Bid, B.Bname
ORDER BY COUNT(B.Bid) DESC, B.Bid ASC;