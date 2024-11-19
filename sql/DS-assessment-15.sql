SELECT album.AlbumId, album.Title, album.ArtistId, track.Name, track.TrackId 
FROM `album` 
LEFT JOIN `track` ON track.AlbumID = track.AlbumID 

UNION 

SELECT album.AlbumId, album.Title, album.ArtistId, track.Name, track.TrackId 
FROM `album` 
RIGHT JOIN `track` ON track.AlbumID = track.AlbumID;
