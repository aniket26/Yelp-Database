SELECT s.Bid, s.Bname, AVG(R.STARS) AS "Stars Average", COUNT(R.RID) AS "Review Count"
FROM Business s, Review_id r, YelpUser y
WHERE s.Bid=R.BID AND y.userid=R.AUTHORID 
GROUP BY s.Bid, s.Bname
ORDER BY COUNT(R.Rid) DESC, s.Bid ASC;