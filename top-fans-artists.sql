--Q: https://datalemur.com/questions/top-fans-rank


WITH artist_songs AS (
    SELECT ar.artist_id, ar.artist_name, sg.song_id
    FROM artists ar
    INNER JOIN songs sg ON ar.artist_id = sg.artist_id
),
ranked_artists AS (
    SELECT ars.artist_name,
          DENSE_RANK() OVER (ORDER BY COUNT(gsr.rank) DESC) AS artist_rank
    FROM artist_songs ars
    INNER JOIN global_song_rank gsr ON ars.song_id = gsr.song_id
    WHERE gsr.rank < 11
    GROUP BY ars.artist_name
)

SELECT *      
FROM ranked_artists where artist_rank<6;


