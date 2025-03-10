--Question: https://datalemur.com/questions/sql-page-with-no-likes

  
select pg.page_id from pages pg
left join page_likes pl
on pg.page_id=pl.page_id
group by pg.page_id having count(pl.liked_date)=0;

