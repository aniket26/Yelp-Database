SELECT DISTINCT C.BCID,B.BID,B.BNAME FROM BUSINESS_CATEGORY C,BUSINESS B
WHERE(C.BCID=B.BCID AND C.LIST_OF_SUBCATEGORIES IN (
SELECT DISTINCT LIST_OF_SUBCATEGORIES
FROM BUSINESS_CATEGORY 
GROUP BY LIST_OF_SUBCATEGORIES
HAVING COUNT(LIST_OF_SUBCATEGORIES)<=1));