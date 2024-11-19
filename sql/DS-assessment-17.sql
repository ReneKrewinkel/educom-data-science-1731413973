SELECT * 
FROM artist 
WHERE NOT EXISTS (
    SELECT Name, album.ArtistId 
    FROM album 
    WHERE album.ArtistId = artist.ArtistId
    ) 
ORDER BY `artist`.`Name` ASC
