INSERT INTO jenres (name)
values ('Pop_music'), ('Hip-Hop'), ('Rap-music'),
('Punk-Rock'), ('Alternative-Rock');

INSERT INTO executors (name)
values ('Pink'), ('Adele'), ('Михаил Круг'), ('JAY-Z'),
('NoFX'),('Nirvana'), ('Guano Apes'), ('30 Seconds to Mars');

INSERT INTO albums (name, year_of_issur)
values ('Trustfall', '2020-01-08'), ('iTunes Live from SoHo', '2018-03-16'), 
		('Жиган-Лимон', '2021-06-23'), ('The Blueprint 3', '2019-05-27'),
		('The War on Errorism', '2018-09-06'),('Nevermind', '2018-10-17'), 
		('Offline', '2022-12-23'), ('A Beautiful Lie', '2019-07-14');


		
INSERT INTO traks (id_album, name, time_trak) 
values	('1', 'Long Way to Go', '00:03:50'),('1', 'Kids in Love My', '00:02:30'),
		('2', 'Fool That I Am', '00:03:38'), ('2', 'Melt My Heart to Stone','00:03:54'), 
		('3','Жиган-МойЛимон', '00:02:15'), ('3','Мой Кольщик:)', '00:02:40'),
		('4', 'Already Home', '00:04:30'), ('4', 'Empire State of Mind', '00:04:41'),
		('5', 'Re-gaining Unconsciousness', '00:02:39'), ('5', 'Decom-posuer', '00:03:27'),
		('6', 'My song', '00:02:16'), ('6', 'On a Plain', '00:03:18'),
		('7', 'Offline', '00:03:42'), ('7', 'Close to the my Sun', '00:03:24'),
	    ('8', 'My Beautiful Lie','00:04:00'), ('8', 'From Yesterday', '00:04:04');
	   
INSERT INTO traks (id_album, name, time_trak)
VALUES ('3','Фраер', '00:03:04'), ('6','Come As You Are', '00:03:40');
	    
INSERT INTO collection (name, year_of_issur)
values	('Pop and Hip-Hop', '2022-02-08'), ('Pop-Hits', '2020-12-03'),
		('Alternative-Rock and Punk-Rock ', '2018-08-12'), ('Punk-Hits', '2019-03-03'),
		('Alternative-Hits', '2022-12-19'), ('Шансон', '2018-12-19'),
		('Зарубежная Эстрада - 80х', '2018-01-01'), ('Rap-Hits', '2020-12-06');
	

		
INSERT INTO collection_traks (id_collection, id_trak)
values	('1', '1'),('1', '2'),('1', '3'),('1', '4'),('1', '5'),('1', '6'),('1', '7'),('1', '8'),
		('2', '1'),('2', '2'),('2', '3'),('2', '4'),('2', '5'),('2', '6'),
		('3', '9'),('3', '10'),('3', '11'),('3', '12'),('3', '13'),('3', '14'),('3', '15'),('3', '16'),
		('4', '9'),('4', '10'),('4', '11'),('4', '12'),
		('5', '13'),('5', '14'),('5', '15'),('5', '16'),('6', '5'),('6', '6'),
		('8', '7'),('8', '8');
		
INSERT INTO jenres_executors (id_jenre, id_executor)
values	('1', '1'), ('1', '2'), ('1', '3'),
		('2', '4'), ('3', '4'),
		('4', '5'), ('4', '6'),
		('5', '7'), ('5', '8');
		
INSERT INTO executors_albums (id_executor, id_album)
values	('1',  '1'),('2', '2'), ('3', '3'),
		('4', '4'), ('5', '5'),('6', '6'),
		('7', '7'), ('8', '8');