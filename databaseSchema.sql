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
	("Ultrasonido"),
	("Rayos X"),
	("Densitometría ósea"),
	("Mamografía"),
	("Tomografía"),
	("Intervencionismo"),-
	("Gammagrafía"),
	("SPECT"),
	("PET");

/*
	Tomografía:
	Cráneo simple, cráneo con contraste, senos paranasales simple, oido simple, cuello simple, cuello con contraste, tórax simple, tórax con contraste, tórax de alta resolución, abdomen con contraste/simple, 
	Mamografía:
	Proyección Craneo caudal, Proyección Medio Lateral Oblicua, Perfil 90, magnificación, compresión focalizada, Tomosíntesis (estudio complementario), mamografía a pacientes con implantes en las que no se desea estudiar el mismo, aplicando la técnica de Eklund, en la cual se extrae el implante del campo de radiación. 
	Intervencionismo:
	se trata de solventar problemas como: obstrucciones (estenosis), dilataciones (angioplastia), drenaje de colecciones anatómicas, colocación de catéteres, guías, balones y stents
	Medicina Nuclear:
	Gammagrama óseo, SPECT, Estudios cardiológicos, estudio tiroideo, Estudios óseos, Estudios renales, Estudios pulmonares, Estudios digestivos, Estudios del aparato circulatorio, Estudios en sistemas venoso y linfático, Estudios en sistema nervioso central, Estudios de tumor e inflamación, PET CT
	Rayos X:
	Rayos X de Mano, Rayos x de pie, Rayos x de muñeca, rayos x de antebrazo, rayos x de codo, rayos x de húmero, rayos x de hombro, rayos x de cráneo, rayos x de senos paranasales, rayos x de clavícula, columna cervical, columna dorsal, columna lumbar, rayos x de tórax, esternón, costillas, tobillo, tibia y peroné, pierna, rodilla, rótula, fémur, cadera, pelvis, 
	Densitometría ósea:
	examen de columna, examen de cadera
*/

/*
The following will work as an example for testing purposes
*/

INSERT INTO study (name) VALUES ('example');

INSERT INTO modality(name,study_name,indications,preparation) VALUES
	('example1','example','indications1','preparation1'),
	('example2','example','indications2','preparation2'),
	('example3','example','indications3','preparation3'),
	('example4','example','indications4','preparation4'),
	('example5','example','indications5','preparation5'),
	('example6','example','indications6','preparation6'),
	('example7','example','indications7','preparation7');

INSERT INTO faq(title,study_name,response) VALUES
	('example faq 1','example','response faq #1'),
	('example faq 2','example','response faq #2'),
	('example faq 3','example','response faq #3'),
	('example faq 4','example','response faq #4'),
	('example faq 5','example','response faq #5'),
	('example faq 6','example','response faq #6'),
	('example faq 7','example','response faq #7');

INSERT INTO tips(title,study_name,information) VALUES
	('example tip 1','example','example for information of tip #1'),
	('example tip 2','example','example for information of tip #2'),
	('example tip 3','example','example for information of tip #3'),
	('example tip 4','example','example for information of tip #4'),
	('example tip 5','example','example for information of tip #5'),
	('example tip 6','example','example for information of tip #6'),
	('example tip 7','example','example for information of tip #7');