CREATE TABLE YelpUser(
  UserID VARCHAR(3) NOT NULL PRIMARY KEY,
  Email VARCHAR(250),
  FName VARCHAR (225) NOT NULL,
  LName VARCHAR (225),
  Date_of_birth DATE,
  Birthplace VARCHAR(2),
  Gender CHAR(1)
);
INSERT INTO YELPUSER VALUES ('Y1','john@yahoo.com','John','Smith',to_date('12121992','MMDDYYYY'),'FL','M');
INSERT INTO YELPUSER VALUES ('Y2','juan@gmail.com','Juan','Carlos',to_date('02071988','MMDDYYYY'),'AK','M');
INSERT INTO YELPUSER VALUES ('Y3','jane@gmail.com','Jane','Chapel',to_date('06011980','MMDDYYYY'),'IL','F');
INSERT INTO YELPUSER VALUES ('Y4','adi@yahoo.com','Aditya','Awasthi',to_date('04121994','MMDDYYYY'),'CA','M');
INSERT INTO YELPUSER VALUES ('Y5','james@hotmail.com','James','Williams',to_date('05051991','MMDDYYYY'),'NY','M');
INSERT INTO YELPUSER VALUES ('Y6','mike@yahoo.com','Mike','Brown',to_date('03011988','MMDDYYYY'),'NC','M');
INSERT INTO YELPUSER VALUES ('Y7','bob@yahoo.com','Bob','Jones',to_date('02191970','MMDDYYYY'),'NY','M');
INSERT INTO YELPUSER VALUES ('Y8','wei@gmail.com','Wei','Zhang',to_date('03181975','MMDDYYYY'),'NV','F');
INSERT INTO YELPUSER VALUES ('Y9','mark@gmail.com','Mark','Davis',to_date('11021993','MMDDYYYY'),'CA','M');
INSERT INTO YELPUSER VALUES ('Y10','daniel@yahoo.com','Daniel','Gracia',to_date('05101984','MMDDYYYY'),'NJ','M');
INSERT INTO YELPUSER VALUES ('Y11','maria@hotmail.com','Maria','Rodriguez',to_date('08121985','MMDDYYYY'),'CA','F');
INSERT INTO YELPUSER VALUES ('Y12','freya@yahoo.com','Freya','Wilson',to_date('10051995','MMDDYYYY'),'NJ','F');


CREATE SEQUENCE seq_f_id MINVALUE 1 START WITH 1 INCREMENT BY 1 CACHE 19;
CREATE SEQUENCE seq_cf_id MINVALUE 1 START WITH 1 INCREMENT BY 1 CACHE 19;

CREATE TABLE BUSINESS_CATEGORY (  
  BCID VARCHAR2(5) NOT NULL PRIMARY KEY, 
  BCNAME VARCHAR2(225), 
  LIST_OF_SUBCATEGORIES VARCHAR2(225)
);
 
Insert into BUSINESS_CATEGORY (BCID,BCNAME,LIST_OF_SUBCATEGORIES) values ('BCT1','Amusement Parks','Water Parks');
Insert into BUSINESS_CATEGORY (BCID,BCNAME,LIST_OF_SUBCATEGORIES) values ('BCT2','National Parks','Wildlife National Parks');
Insert into BUSINESS_CATEGORY (BCID,BCNAME,LIST_OF_SUBCATEGORIES) values ('BCT3','Career Counseling','Career Counselling for Kids');
Insert into BUSINESS_CATEGORY (BCID,BCNAME,LIST_OF_SUBCATEGORIES) values ('BCT4','Food and more','Ice-cream and Yogurt');
Insert into BUSINESS_CATEGORY (BCID,BCNAME,LIST_OF_SUBCATEGORIES) values ('BCT5','Bars','Sports Bar');
Insert into BUSINESS_CATEGORY (BCID,BCNAME,LIST_OF_SUBCATEGORIES) values ('BCT6','Restaurants','Ice-cream and Yogurt');
Insert into BUSINESS_CATEGORY (BCID,BCNAME,LIST_OF_SUBCATEGORIES) values ('BCT7','Pool Cleaners','Swimming Pool Cleaners');
Insert into BUSINESS_CATEGORY (BCID,BCNAME,LIST_OF_SUBCATEGORIES) values ('BCT8','Coffee Shops','Cold Coffee Shops');


CREATE TABLE BUSINESS(  
  BID VARCHAR2(5) NOT NULL PRIMARY KEY, 
  BNAME VARCHAR2(225), 
  DAYS_OF_OPERATION NUMBER(*,0), 
  AMBIENT_TYPE VARCHAR2(25), 
  STREET VARCHAR2(225), 
  STATE VARCHAR2(225), 
  ZIPCODE NUMBER(6,0), 
  BCID VARCHAR2(5),
  CONSTRAINT bc_id_fk FOREIGN KEY (BCID) REFERENCES BUSINESS_CATEGORY (BCID) ON DELETE CASCADE
);


Insert into BUSINESS (BID,BNAME,DAYS_OF_OPERATION,AMBIENT_TYPE,STREET,STATE,ZIPCODE,BCID) values ('B1','Big Surf',14,'Touristy','1500 N McClintock Dr.','AZ',85281,'BCT1');
Insert into BUSINESS (BID,BNAME,DAYS_OF_OPERATION,AMBIENT_TYPE,STREET,STATE,ZIPCODE,BCID) values ('B2','SMITH THOMSON',30,'Touristy','1595 Spring Hill Road Suite','VA',22182,'BCT6');
Insert into BUSINESS (BID,BNAME,DAYS_OF_OPERATION,AMBIENT_TYPE,STREET,STATE,ZIPCODE,BCID) values ('B3','Bay Area Coffee Shop',14,'Touristy','1522 W. Sam Rayburn Dr. Bonham','CA',95051,'BCT8');
Insert into BUSINESS (BID,BNAME,DAYS_OF_OPERATION,AMBIENT_TYPE,STREET,STATE,ZIPCODE,BCID) values ('B4','China  Coffee Toffee ',14,'Touristy','2570 El Camino Real','CA',95051,'BCT4');
Insert into BUSINESS (BID,BNAME,DAYS_OF_OPERATION,AMBIENT_TYPE,STREET,STATE,ZIPCODE,BCID) values ('B5','Hastings Water Works',14,null,'10331 Brecksville Rd.','OH',44141,'BCT7');
Insert into BUSINESS (BID,BNAME,DAYS_OF_OPERATION,AMBIENT_TYPE,STREET,STATE,ZIPCODE,BCID) values ('B6','Catch Your Big Break',127,null,'2341 Roosevelt Ct','CA',95051,'BCT3');
Insert into BUSINESS (BID,BNAME,DAYS_OF_OPERATION,AMBIENT_TYPE,STREET,STATE,ZIPCODE,BCID) values ('B7','The Cinebar',30,null,'2O285 South Western Ave.','CA',90501,'BCT5');
Insert into BUSINESS (BID,BNAME,DAYS_OF_OPERATION,AMBIENT_TYPE,STREET,STATE,ZIPCODE,BCID) values ('B8','Coffee Bar'||chr(38)||'Bistro',14,null,'2585 El Camino Real','CA',null,'BCT5');
Insert into BUSINESS (BID,BNAME,DAYS_OF_OPERATION,AMBIENT_TYPE,STREET,STATE,ZIPCODE,BCID) values ('B9','Hobbee''s',62,null,'90 Skyport Dr.','CA',95110,'BCT6');
Insert into BUSINESS (BID,BNAME,DAYS_OF_OPERATION,AMBIENT_TYPE,STREET,STATE,ZIPCODE,BCID) values ('B10','Cafe Gourmet',6,null,'80 N Market St.','CA',95113,'BCT6');
Insert into BUSINESS (BID,BNAME,DAYS_OF_OPERATION,AMBIENT_TYPE,STREET,STATE,ZIPCODE,BCID) values ('B11','Yellow Stone National Park',99,null,'Yellow Stone National Park','WY',82190,'BCT2');
Insert into BUSINESS (BID,BNAME,DAYS_OF_OPERATION,AMBIENT_TYPE,STREET,STATE,ZIPCODE,BCID) values ('B12','Petrified Forest National Park',7,null,'P.O. Box 221','AZ',860289,'BCT2');
Insert into BUSINESS (BID,BNAME,DAYS_OF_OPERATION,AMBIENT_TYPE,STREET,STATE,ZIPCODE,BCID) values ('B13','Grand Canyon National park',67,null,'Highway 64','AZ',86023,'BCT2');
Insert into BUSINESS (BID,BNAME,DAYS_OF_OPERATION,AMBIENT_TYPE,STREET,STATE,ZIPCODE,BCID) values ('B35','Connecticut Bar',19,null,'5847 San Felipe,Suite 2400','TX',77057,'BCT5');
Insert into BUSINESS (BID,BNAME,DAYS_OF_OPERATION,AMBIENT_TYPE,STREET,STATE,ZIPCODE,BCID) values ('B36','Sherley''s Bar'||chr(38)||'Restaurant',11,null,'1132 Terry Road','CT',6105,'BCT5');
Insert into BUSINESS (BID,BNAME,DAYS_OF_OPERATION,AMBIENT_TYPE,STREET,STATE,ZIPCODE,BCID) values ('B14','Connecticut Bar'||chr(38)||' Restaurent',11,null,'1132 Terry Road','CT',6105,'BCT5');

select * from yelpuser;
CREATE TABLE CHECK_IN ( 
  CID NUMBER(*,0), 
  CINFO VARCHAR2(150), 
  BID VARCHAR2(5),
  CONSTRAINT b_id_fk FOREIGN KEY (BID) REFERENCES BUSINESS (BID) ON DELETE CASCADE
);

Insert into CHECK_IN  values (seq_f_id.nextval,'Checkin Info 1','B1');
Insert into CHECK_IN  values (seq_f_id.nextval,'Checkin Info 2','B2');
Insert into CHECK_IN  values (seq_f_id.nextval,'Checkin Info 3','B3');
Insert into CHECK_IN  values (seq_f_id.nextval,'Checkin Info 4','B4');
Insert into CHECK_IN  values (seq_f_id.nextval,'Checkin Info 5','B5');
Insert into CHECK_IN  values (seq_f_id.nextval,'Checkin Info 6','B6');
Insert into CHECK_IN  values (seq_f_id.nextval,'Checkin Info 7','B7');
Insert into CHECK_IN  values (seq_f_id.nextval,'Checkin Info 8','B8');
Insert into CHECK_IN  values (seq_f_id.nextval,'Checkin Info 9','B9');
Insert into CHECK_IN  values (seq_f_id.nextval,'Checkin Info 10','B10');
Insert into CHECK_IN  values (seq_f_id.nextval,'Checkin Info 11','B11');
Insert into CHECK_IN  values (seq_f_id.nextval,'Checkin Info 12','B12');
Insert into CHECK_IN  values (seq_f_id.nextval,'Checkin Info 13','B13');


CREATE TABLE COMPLIMENTED_FRIEND_LIST(
  CFID VARCHAR2(3), 
  USERID VARCHAR(3) , 
  COMPLIMENTED_FRIENDID VARCHAR2(3),
  CONSTRAINT u_FK FOREIGN KEY (USERID) REFERENCES YELPUSER (USERID) ON DELETE CASCADE
);

Insert into COMPLIMENTED_FRIEND_LIST (CFID,USERID,COMPLIMENTED_FRIENDID) values (seq_cf_id.nextval,'Y1','Y7');
Insert into COMPLIMENTED_FRIEND_LIST (CFID,USERID,COMPLIMENTED_FRIENDID) values (seq_cf_id.nextval,'Y1','Y9');
Insert into COMPLIMENTED_FRIEND_LIST (CFID,USERID,COMPLIMENTED_FRIENDID) values (seq_cf_id.nextval,'Y3','Y6');
Insert into COMPLIMENTED_FRIEND_LIST (CFID,USERID,COMPLIMENTED_FRIENDID) values (seq_cf_id.nextval,'Y4','Y11');
Insert into COMPLIMENTED_FRIEND_LIST (CFID,USERID,COMPLIMENTED_FRIENDID) values (seq_cf_id.nextval,'Y6','Y4');
Insert into COMPLIMENTED_FRIEND_LIST (CFID,USERID,COMPLIMENTED_FRIENDID) values (seq_cf_id.nextval,'Y7','Y3');
Insert into COMPLIMENTED_FRIEND_LIST (CFID,USERID,COMPLIMENTED_FRIENDID) values (seq_cf_id.nextval,'Y8','Y6');
Insert into COMPLIMENTED_FRIEND_LIST (CFID,USERID,COMPLIMENTED_FRIENDID) values (seq_cf_id.nextval,'Y9','Y2');
Insert into COMPLIMENTED_FRIEND_LIST (CFID,USERID,COMPLIMENTED_FRIENDID) values (seq_cf_id.nextval,'Y11','Y5');
Insert into COMPLIMENTED_FRIEND_LIST (CFID,USERID,COMPLIMENTED_FRIENDID) values (seq_cf_id.nextval,'Y12','Y11');

CREATE TABLE FRIENDLIST(  
  FID VARCHAR2(4), 
  USERID VARCHAR2(3 ), 
  FRIENDSID VARCHAR2(3 ),
  CONSTRAINT user_id_fk FOREIGN KEY (USERID) REFERENCES YELPUSER (USERID) ON DELETE CASCADE
);


Insert into FRIENDLIST  values (1,'Y1','Y2');
Insert into FRIENDLIST  values (2,'Y1','Y7');
Insert into FRIENDLIST  values (3,'Y1','Y9');
Insert into FRIENDLIST  values (4,'Y3','Y6');
Insert into FRIENDLIST  values (5,'Y3','Y11');
Insert into FRIENDLIST  values (6,'Y3','Y5');
Insert into FRIENDLIST  values (7,'Y4','Y7');
Insert into FRIENDLIST  values (8,'Y4','Y11');
Insert into FRIENDLIST  values (9,'Y6','Y2');
Insert into FRIENDLIST  values (10,'Y6','Y4');
Insert into FRIENDLIST  values (11,'Y7','Y1');
Insert into FRIENDLIST  values (12,'Y7','Y3');
Insert into FRIENDLIST  values (13,'Y8','Y6');
Insert into FRIENDLIST  values (14,'Y8','Y1');
Insert into FRIENDLIST  values (15,'Y9','Y1');
Insert into FRIENDLIST  values (16,'Y9','Y2');
Insert into FRIENDLIST  values (17,'Y11','Y3');
Insert into FRIENDLIST  values (18,'Y11','Y5');
Insert into FRIENDLIST  values (19,'Y12','Y11');

CREATE TABLE REVIEW_ID(
  RID VARCHAR (3) NOT NULL PRIMARY KEY, 
  STARS INT, 
  AUTHORID VARCHAR(3),
  CONSTRAINT author_id FOREIGN KEY(AUTHORID) REFERENCES YELPUSER (USERID) ON DELETE CASCADE,
  PUBLISH_DATE TIMESTAMP WITH TIME ZONE,
  BID VARCHAR(5), 
  CONSTRAINT b_id FOREIGN KEY (BID) REFERENCES BUSINESS (BID) ON DELETE CASCADE
);

INSERT INTO REVIEW_ID VALUES('R1',3,'Y11',to_timestamp('Oct-02-07 09:10:54','MM-DD-YY HH24:MI:SS'),'B3');
INSERT INTO REVIEW_ID VALUES('R2','2','Y10',to_timestamp('Sep-29-07 13:45:00','MM-DD-YY HH24:MI:SS'),'B1');
INSERT INTO REVIEW_ID VALUES('R3','4','Y2',to_timestamp('Sep-29-07 10:38:25','MM-DD-YY HH24:MI:SS'),'B10');
INSERT INTO REVIEW_ID VALUES('R4','5','Y11',to_timestamp('Oct-02-07 13:05:56','MM-DD-YY HH24:MI:SS'),'B4');
INSERT INTO REVIEW_ID VALUES('R5','5','Y1',to_timestamp('Oct-25-07 17:15:00','MM-DD-YY HH24:MI:SS'),'B3');
INSERT INTO REVIEW_ID VALUES('R6','5','Y4',to_timestamp('Sep-26-07 17:15:00','MM-DD-YY HH24:MI:SS'),'B4');
INSERT INTO REVIEW_ID VALUES('R7','5','Y9',to_timestamp('Sep-26-07 17:15:00','MM-DD-YY HH24:MI:SS'),'B5');
INSERT INTO REVIEW_ID VALUES('R8','5','Y5',to_timestamp('Sep-27-07 17:15:00','MM-DD-YY HH24:MI:SS'),'B6');
INSERT INTO REVIEW_ID VALUES('R9','5','Y12',to_timestamp('Sep-28-07 17:15:00','MM-DD-YY HH24:MI:SS'),'B7');
INSERT INTO REVIEW_ID VALUES('R10','5','Y5',to_timestamp('Oct-29-07 17:15:00','MM-DD-YY HH24:MI:SS'),'B8');
INSERT INTO REVIEW_ID VALUES('R11','5','Y1',to_timestamp('Sep-30-07 17:15:00','MM-DD-YY HH24:MI:SS'),'B9');
INSERT INTO REVIEW_ID VALUES('R12','5','Y12',to_timestamp('Oct-25-07 17:15:00','MM-DD-YY HH24:MI:SS'),'B10');
INSERT INTO REVIEW_ID VALUES('R13','5','Y4',to_timestamp('Sep-25-07 17:15:00','MM-DD-YY HH24:MI:SS'),'B11');
INSERT INTO REVIEW_ID VALUES('R14','5','Y5',to_timestamp('Sep-25-07 17:15:00','MM-DD-YY HH24:MI:SS'),'B12');
INSERT INTO REVIEW_ID VALUES('R15','5','Y1',to_timestamp('Sep-29-07 17:15:00','MM-DD-YY HH24:MI:SS'),'B13');
INSERT INTO REVIEW_ID VALUES('R16','2','Y11',to_timestamp('Jun-07-15 17:15:00','MM-DD-YY HH24:MI:SS'),'B2');
INSERT INTO REVIEW_ID VALUES('R17','1','Y4',to_timestamp('May-05-15 17:15:00','MM-DD-YY HH24:MI:SS'),'B2');
INSERT INTO REVIEW_ID VALUES('R18','1','Y1',to_timestamp('May-05-15 17:15:00','MM-DD-YY HH24:MI:SS'),'B2');
INSERT INTO REVIEW_ID VALUES('R19','1','Y10',to_timestamp('Oct-25-07 17:15:00','MM-DD-YY HH24:MI:SS'),'B3');
INSERT INTO REVIEW_ID VALUES('R20','1','Y1',to_timestamp('Sep-28-07 17:15:00','MM-DD-YY HH24:MI:SS'),'B4');
INSERT INTO REVIEW_ID VALUES('R21','6','Y11',to_timestamp('Jun-07-15 17:15:00','MM-DD-YY HH24:MI:SS'),'B14');
INSERT INTO REVIEW_ID VALUES('R22','3','Y4',to_timestamp('May-05-15 17:15:00','MM-DD-YY HH24:MI:SS'),'B14');
INSERT INTO REVIEW_ID VALUES('R23','3','Y1',to_timestamp('May-05-15 17:15:00','MM-DD-YY HH24:MI:SS'),'B14');

CREATE TABLE REVIEW_LIST_OF_COMMENTS(
  RLC INT NOT NULL PRIMARY KEY, 
  RID VARCHAR (3),
  LIST_OF_COMMENTS VARCHAR(3),
  CONSTRAINT r_id_fk FOREIGN KEY (RID) REFERENCES REVIEW_ID (RID) ON DELETE CASCADE
);
CREATE SEQUENCE loc_id MINVALUE 1 START WITH 1 INCREMENT BY 1 CACHE 19;

INSERT INTO REVIEW_LIST_OF_COMMENTS VALUES(loc_id.nextval,'R2','Y3');
INSERT INTO REVIEW_LIST_OF_COMMENTS VALUES(loc_id.nextval,'R2','Y2');
INSERT INTO REVIEW_LIST_OF_COMMENTS VALUES(loc_id.nextval,'R3','Y3');
INSERT INTO REVIEW_LIST_OF_COMMENTS VALUES(loc_id.nextval,'R7','Y8');
INSERT INTO REVIEW_LIST_OF_COMMENTS VALUES(loc_id.nextval,'R7','Y11');
INSERT INTO REVIEW_LIST_OF_COMMENTS VALUES(loc_id.nextval,'R15','Y8');
INSERT INTO REVIEW_LIST_OF_COMMENTS VALUES(loc_id.nextval,'R16','Y8');
INSERT INTO REVIEW_LIST_OF_COMMENTS VALUES(loc_id.nextval,'R20','Y7');
INSERT INTO REVIEW_LIST_OF_COMMENTS VALUES(loc_id.nextval,'R20','Y10');

CREATE TABLE CHECK_IN_BUSINESS (
  CIB INT NOT NULL PRIMARY KEY,
  USERID VARCHAR(3),
  BID VARCHAR(5),
  CONSTRAINT chekedinuser_id_fk FOREIGN KEY (USERID) REFERENCES YELPUSER (USERID) ON DELETE CASCADE, 
  CONSTRAINT business_id_fk FOREIGN KEY (BID) REFERENCES BUSINESS (BID) ON DELETE CASCADE
);

INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y1','B3');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y1','B2');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y1','B13');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y1','B35');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y1','B36');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y1','B5');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y1','B4');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y1','B9');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y2','B10');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y2','B5');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y2','B11');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y2','B2');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y2','B36');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y2','B35');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y4','B4');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y4','B11');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y4','B12');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y4','B5');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y4','B36');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y4','B35');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y4','B2');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y5','B6');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y5','B11');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y5','B12');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y5','B5');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y5','B36');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y5','B35');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y5','B8');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y6','B36');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y6','B11');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y6','B2');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y6','B3');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y6','B13');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y7','B13');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y7','B35');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y7','B36');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y7','B11');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y7','B2');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y7','B3');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y8','B11');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y8','B2');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y8','B13');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y8','B35');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y8','B36');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y8','B4');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y9','B5');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y9','B11');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y9','B2');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y9','B13');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y9','B35');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y9','B36');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y10','B1');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y10','B5');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y10','B11');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y10','B2');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y10','B36');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y10','B35');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y10','B3');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y11','B3');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y11','B4');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y11','B1');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y11','B5');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y11','B11');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y11','B2');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y11','B36');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y11','B35');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y12','B7');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y12','B10');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y12','B5');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y12','B11');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y12','B2');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y12','B13');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y12','B35');
INSERT INTO CHECK_IN_BUSINESS VALUES(seq_cinb_id.nextval,'Y12','B36');


select * from yelpuser;
select * from check_in;
select * from business;
select * from business_category;
select * from review_id;
select * from review_list_of_comments;
select * from friendlist;
select * from complimented_friend_list;
select * from check_in_business;

