SELECT USERID FROM YELPUSER WHERE GENDER='M'
INTERSECT
SELECT DISTINCT C.USERID FROM COMPLIMENTED_FRIEND_LIST C, YELPUSER Y 
WHERE ( C.COMPLIMENTED_FRIENDID=Y.USERID AND Y.GENDER='F');