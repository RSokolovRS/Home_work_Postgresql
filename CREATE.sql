CREATE TABLE IF NOT EXISTS jenres (
	id_jenre SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT null UNIQUE);
	
CREATE TABLE IF NOT EXISTS executors (
	id_executor SERIAL PRIMARY KEY,
	name VARCHAR(160) NOT NULL);
	
CREATE TABLE IF NOT EXISTS albums (
	id_album SERIAL PRIMARY KEY,
	name VARCHAR(120) NOT NULL,
	year_of_issur DATE check(year_of_issur >= '2018-01-01'),
	unique(year_of_issur));
	
CREATE TABLE IF NOT EXISTS jenres_executors (
	id_jenre INTEGER REFERENCES jenres(id_jenre),
	id_executor INTEGER REFERENCES executors(id_executor),
	CONSTRAINT pk1_id PRIMARY KEY (id_jenre, id_executor));

	CREATE TABLE IF NOT EXISTS executors_albums (
	id_executor INTEGER REFERENCES executors(id_executor),
	id_album INTEGER REFERENCES albums(id_album),
	CONSTRAINT pk2_id PRIMARY KEY (id_executor, id_album));
	
CREATE TABLE IF NOT EXISTS traks (
	id_trak SERIAL PRIMARY KEY,
	name VARCHAR(80) NOT null,
	time_trak INTEGER,
	id_album INTEGER NOT NULL REFERENCES albums(id_album));
	
CREATE TABLE IF NOT EXISTS collection (
	id_collection SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	year_of_issur DATE UNIQUE,
	check(year_of_issur >= '2018-01-01'));
	
CREATE TABLE IF NOT EXISTS collection_traks (
	id_trak INTEGER REFERENCES traks(id_trak),
	id_collection INTEGER REFERENCES collection(id_collection),
	CONSTRAINT vk PRIMARY KEY (id_trak, id_collection));