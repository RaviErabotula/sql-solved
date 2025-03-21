--Q - https://datalemur.com/questions/sql-histogram-tweets



WITH user_tweets
     AS (SELECT user_id,
                Count(*) AS tweets_count
         FROM   tweets
         WHERE  Date_part('year', tweet_date) = 2022
         GROUP  BY user_id)
SELECT tweets_count AS tweet_bucket,
       Count(*)     AS users_num
FROM   user_tweets
GROUP  BY tweets_count; 
