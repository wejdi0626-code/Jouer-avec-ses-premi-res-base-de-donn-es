-- 1. Récupérer tous les albums
SELECT * FROM albums;

-- 2. Récupérer tous les albums dont le titre contient « Great »
SELECT * FROM albums WHERE Title LIKE '%Great%';

-- 3. Donner le nombre total d'albums
SELECT COUNT(*) AS total_albums FROM albums;

-- 4. Supprimer tous les albums dont le titre contient « music »
-- Attention : cette requête modifie la base. La tester sur une copie de chinook.db.
DELETE FROM albums WHERE Title LIKE '%music%';

-- 5. Récupérer toutes les informations des albums écrits par AC/DC
SELECT albums.* FROM albums INNER JOIN artists ON albums.ArtistId = artists.ArtistId WHERE artists.Name = 'AC/DC';

-- 6. Récupérer uniquement les titres des albums de AC/DC
SELECT albums.Title FROM albums INNER JOIN artists ON albums.ArtistId = artists.ArtistId WHERE artists.Name = 'AC/DC';

-- 7. Récupérer les titres des morceaux de l'album « Let There Be Rock »
SELECT tracks.Name FROM tracks INNER JOIN albums ON tracks.AlbumId = albums.AlbumId WHERE albums.Title = 'Let There Be Rock';

-- 8. Afficher le prix total et la durée totale de « Let There Be Rock »
SELECT ROUND(SUM(tracks.UnitPrice), 2) AS prix_total, SUM(tracks.Milliseconds) AS duree_totale_ms, ROUND(SUM(tracks.Milliseconds) / 60000.0, 2) AS duree_totale_minutes FROM tracks INNER JOIN albums ON tracks.AlbumId = albums.AlbumId WHERE albums.Title = 'Let There Be Rock';

-- 9. Afficher le coût de l'intégralité de la discographie de Deep Purple
SELECT ROUND(SUM(tracks.UnitPrice), 2) AS cout_discographie FROM tracks INNER JOIN albums ON tracks.AlbumId = albums.AlbumId INNER JOIN artists ON albums.ArtistId = artists.ArtistId WHERE artists.Name = 'Deep Purple';

-- 10. Créer un artiste, son album et un morceau dans les trois tables
-- Les trois INSERT sont nécessaires car il faut écrire dans trois tables différentes.
INSERT INTO artists (Name) VALUES ('Daft Punk');
INSERT INTO albums (Title, ArtistId) VALUES ('Discovery', (SELECT ArtistId FROM artists WHERE Name = 'Daft Punk' ORDER BY ArtistId DESC LIMIT 1));
INSERT INTO tracks (Name, AlbumId, MediaTypeId, Milliseconds, UnitPrice) VALUES ('One More Time', (SELECT AlbumId FROM albums WHERE Title = 'Discovery' AND ArtistId = (SELECT ArtistId FROM artists WHERE Name = 'Daft Punk' ORDER BY ArtistId DESC LIMIT 1) ORDER BY AlbumId DESC LIMIT 1), 1, 320000, 0.99);
