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
	('Tomografía'),
	('Mamografía'),
	('Intervencionismo'),
	('Gammagrafía'),
	('Rayos X'),
	('Densitometría ósea');
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