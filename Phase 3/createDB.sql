create table business (
  business_id varchar2(200) not null,
  business_name varchar2(200) not null,
  business_type varchar2(25),
  
  no_of_stars numeric (3,1),
  review_count numeric (4),
  business_open varchar2(25),
  
  address varchar2(500),
  latitude numeric(8,6),
  longitude numeric (9,6),
  
  city varchar2(50),
  state varchar2(50),
  
  Primary Key (business_id)
);


create table business_category(
  business_id varchar2(200) not null,
  category_name varchar2(500),
  

  Foreign Key (business_id) references business(business_id) ON DELETE CASCADE
  
);

create table business_sub_category(
  business_id varchar2(200) not null,
  sub_category varchar2(1000),
  
  Foreign Key (business_id) references business (business_id) ON DELETE CASCADE
);

create table yelp_user(
  user_id varchar2(200) not null, 
  user_name varchar2(200) not null,
  yelping_since_year number(38,0),
  yelping_since_month number(38,0), 
  user_type varchar2(25),
  
  votes_cool number,
  votes_funny number,
  votes_useful number,
  
  fans number,
  avg_stars number,
  review_count integer,
      
  Primary Key (user_id)
);

create table friends_of_user(
  user_id varchar2(200) not null, 
  no_of_friends integer,
  
  Foreign Key (user_id) references yelp_user(user_id) ON DELETE SET NULL 
);

create table review(
  votes_useful number,
  votes_funny number, 
  votes_cool number, 
  
  user_id varchar2(200) not null, 
  review_id varchar2(200) not null, 
  business_id varchar2(200), 
  
  stars int, 
  date_of_review DATE, 
  text CLOB, 
  review_type varchar2(10),

  Primary Key (review_id), 
  Foreign Key (user_id) references yelp_user(user_id) ON DELETE CASCADE,
  Foreign Key (business_id) references business (business_id)ON DELETE CASCADE
);



create table check_in_information(BUSINESS_ID VARCHAR(30)
, DAYOF INTEGER
, FROMHOUR INTEGER
, CHECKINCOUNT INTEGER,
  
  Foreign Key (business_id) references business(business_id) ON DELETE CASCADE
);

alter table review add votes_total INTEGER;
update review set votes_total=votes_useful+votes_funny+votes_cool;

alter table check_in_information add TOHOUR INTEGER;
update check_in_information set tohour=FROMHOUR+1;
