

Select  jun.RID ,may.avgmay,jun.avgjune,checkincount from (
select RID, to_char(avg(STARS), '9G999D99')avgjune                     from
Review_id where PUBLISH_DATE  <= date '2015-06-30' and publish_date > date
'2015-05-31'                   group by RID ) jun  left join (
select RID, to_char(avg(STARS), '9G999D99') avgmay                   from
Review_id where PUBLISH_DATE  <=  date '2015-05-31' and publish_date >= date
'2015-05-01'                   group by RID                   ) may on(
may.RID =jun.RID or jun.RID is null)

                 LEFT join (   select RID, count(*) as checkincount  from
                 Review_id   group by RID  order by count(*) desc ,RID)
                 checkins on jun.RID  = checkins.RID
                  
                  where (jun.avgjune >= 2*may.avgmay) or ( may.avgmay is null
                  )  order by checkins.checkincount desc
                  

                  
                  