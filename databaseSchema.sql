CREATE TABLE study(
	name VARCHAR(20) PRIMARY KEY
);
CREATE TABLE faq(
	title VARCHAR(20) NOT NULL,
	study_name VARCHAR(20) NOT NULL,
	response VARCHAR(200) NOT NULL,
	PRIMARY KEY (title),
	FOREIGN KEY (study_name) REFERENCES study(name)
);
CREATE TABLE modality(
	name VARCHAR(20) NOT NULL,
	study_name VARCHAR(20) NOT NULL,
	indications VARCHAR(500) NOT NULL,
	preparation VARCHAR(500) NOT NULL,
	PRIMARY KEY (name),
	FOREIGN KEY (study_name) REFERENCES study(name)
);
CREATE TABLE tips(
	title VARCHAR(20) NOT NULL,
	study_name VARCHAR(20) NOT NULL,
	information VARCHAR(200) NOT NULL,
	PRIMARY KEY (title),
	FOREIGN KEY (study_name) REFERENCES study(name)
);
INSERT INTO study (name) VALUES
	('Radiología'),
	('Tomografía'),
	('Mamografía'),
	('Intervencionismo'),
	('Gammagrafía'),
	('Rayos X'),
	('Densitometría ósea');