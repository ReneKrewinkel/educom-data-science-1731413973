SELECT Name, TrackId 
FROM `track` 
WHERE EXISTS (
    SELECT Title 
    FROM `album` 
    WHERE Title = "Californication" AND album.AlbumID = track.AlbumId
    );
