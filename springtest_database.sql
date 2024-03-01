create database springtest;
use springtest;

CREATE TABLE kingdom (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  PRIMARY KEY (id)
);

INSERT INTO kingdom VALUES (1,'plant'),(2,'animal'),(3,'fungi');

CREATE TABLE organism (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  kingdom_id int(11) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY kingdom_id (kingdom_id),
  FOREIGN KEY (kingdom_id) REFERENCES kingdom (id) ON DELETE restrict ON UPDATE restrict
);

INSERT INTO organism VALUES (1,'dog',2),(2,'mushroom',3);


CREATE TABLE individual (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  organism_id int(11) NOT NULL,
  PRIMARY KEY (id),
  KEY organism_id (organism_id),
  FOREIGN KEY (organism_id) REFERENCES organism (id) 
ON DELETE restrict
ON UPDATE restrict
);

INSERT INTO individual VALUES (3,'Fido',1),(4,'Freddy',2);

select * from individual i join organism o on o.id=i.organism_id join kingdom k on k.id=o.kingdom_id LIMIT 0, 1000;

select * from kingdom k join organism o on k.id=o.kingdom_id;

-- delete from kingdom where id=2;
-- drop table kingdom;
select * from kingdom;