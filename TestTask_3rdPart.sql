-- SCHEMA: TestTask

-- DROP SCHEMA IF EXISTS "TestTask" ;

CREATE SCHEMA IF NOT EXISTS "TestTask"
    AUTHORIZATION postgres;

CREATE TABLE IF NOT EXISTS "TestTask".printer(
	code INT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY ,
	model CHARACTER VARYING(50),
	color CHARACTER VARYING(15) NOT NULL,
	"type" CHARACTER VARYING(20) NOT NULL,
	price INT NOT NULL,
	FOREIGN KEY (model) REFERENCES "TestTask".product(model)
)

CREATE TABLE IF NOT EXISTS "TestTask".laptop(
	code INT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY ,
	model CHARACTER VARYING(50),
	speed INT NOT NULL,
	ram INT NOT NULL,
	hd REAL NOT NULL,
	price INT NOT NULL,
	screen INT NOT NULL,
	FOREIGN KEY (model) REFERENCES "TestTask".product(model)
)

CREATE TABLE IF NOT EXISTS "TestTask".pc(
	code INT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY ,
	model CHARACTER VARYING(50),
	speed INT NOT NULL,
	ram INT NOT NULL,
	hd REAL NOT NULL,
	price INT NOT NULL,
	cd CHARACTER VARYING(30) NOT NULL,
	FOREIGN KEY (model) REFERENCES "TestTask".product(model)
)

CREATE TABLE IF NOT EXISTS "TestTask".product (
	maker CHARACTER VARYING(40) NOT NULL,
	model CHARACTER VARYING(50) PRIMARY KEY UNIQUE,
	"type" CHARACTER VARYING(40) NOT NULL,
	country CHARACTER VARYING(30) NOT NULL
);

INSERT INTO "TestTask".laptop(model,speed,ram,hd,price,screen)
VALUES
('examplemodel6',2000,2000,2000,5000,50),
('examplemodel7',2000,2000,2000,5000,50),
('examplemodel8',2000,2000,2000,5000,50),
('examplemodel9',2000,2000,2000,5000,50),
('examplemodel10',2000,2000,2000,5000,50)

INSERT INTO "TestTask".pc(model,speed,ram,hd,price,cd)
VALUES
('examplemodel11',2000,2000,2000,50000,'Disk1'),
('examplemodel12',2000,2000,2000,50000,'Disk2'),
('examplemodel13',2000,2000,2000,50000,'Disk3'),
('examplemodel14',2000,2000,2000,50000,'Disk4'),
('examplemodel15',2000,2000,2000,50000,'Disk5')

INSERT INTO "TestTask".product(maker,model,"type",country)
VALUES
('Apple','examplemodel1','printer','USA'),
('Apple','examplemodel2','printer','USA'),
('Google','examplemodel3','printer','USA'),
('Apple','examplemodel4','printer','Australia'),
('Apple','examplemodel5','printer','China'),
('Apple','examplemodel6','laptop','USA'),
('Apple','examplemodel7','laptop','China'),
('Apple','examplemodel8','laptop','Australia'),
('Apple','examplemodel9','laptop','China'),
('Apple','examplemodel10','laptop','USA'),
('Apple','examplemodel11','pc','China'),
('Apple','examplemodel12','pc','USA'),
('Apple','examplemodel13','pc','China'),
('Apple','examplemodel14','pc','China'),
('Apple','examplemodel15','pc','USA')

/* First task */
INSERT INTO "TestTask".printer(model,color,"type",price)
VALUES
('examplemodel1','blue','exampletype1',20000),
('examplemodel2','blue','exampletype2',20000),
('examplemodel3','blue','exampletype3',20000),
('examplemodel4','blue','exampletype4',20000),
('examplemodel5','blue','exampletype5',20000)

/* Second task */
SELECT COUNT(maker) as Maker_count FROM "TestTask".product WHERE country = 'USA'

/* Third task */
SELECT "TestTask".pc.code as pc_code, "TestTask".laptop.code as laptop_code FROM "TestTask".pc,"TestTask".laptop  
WHERE "TestTask".pc.speed = "TestTask".laptop.speed AND "TestTask".pc.code = "TestTask".laptop.code

/* Third task(another variaint)*/
SELECT "TestTask".pc.code as pc_code, "TestTask".laptop.code as laptop_code FROM "TestTask".pc
JOIN  "TestTask".laptop ON "TestTask".pc.code = "TestTask".laptop.code



