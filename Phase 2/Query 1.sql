SELECT COUNT (BID)FROM BUSINESS B WHERE (B.BCID = (SELECT BCID FROM BUSINESS_CATEGORY WHERE BCNAME='National Parks'));
SELECT COUNT(B.BID)FROM BUSINESS B, BUSINESS_CATEGORY C WHERE (B.BCID=C.BCID AND C.BCNAME='National Parks');