
create database cinepax;
\c cinepax; 

create sequence seq_salle;
CREATE TABLE salle(
   id_salle VARCHAR(50) default ('salle'||nextval('seq_salle')) ,
   nom_salle VARCHAR(50) ,
   PRIMARY KEY(id_salle)
);


create sequence seq_rangee;
CREATE TABLE rangee(
   id_range VARCHAR(50)default ('rang'||nextval('seq_rangee')) ,
   nom_range VARCHAR(50) ,
   PRIMARY KEY(id_range)
);

create sequence seq_categorie_billet;
CREATE TABLE categorie_billet(
   id_categorie_billet VARCHAR(50)default ('cat'||nextval('seq_categorie_billet'))   ,
   nom_categorie VARCHAR(50) ,
   PRIMARY KEY(id_categorie_billet)
);
-- alter table categorie_billet add column prix_billet NUMERIC default 0;

create sequence seq_film;
CREATE TABLE film(
   id_film VARCHAR(50) default ('film'||nextval('seq_film')) ,
   description_film VARCHAR(50) ,
   nom_film VARCHAR(50) ,
   date_sortie DATE,
   PRIMARY KEY(id_film)
);

create sequence seq_intervalle;
CREATE TABLE intervale(
   id_interval VARCHAR(50) default ('intervale'||nextval('seq_intervalle')) ,
   debut INTEGER,
   fin INTEGER,
   PRIMARY KEY(id_interval)
);

create sequence seq_place;
CREATE TABLE place(
   id_place VARCHAR(50) default('place'||nextval('seq_place')),
   nom_place VARCHAR(50) ,
   id_range VARCHAR(50)  NOT NULL,
   id_salle VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id_place),
   FOREIGN KEY(id_range) REFERENCES rangee(id_range),
   FOREIGN KEY(id_salle) REFERENCES salle(id_salle)
);

create sequence seq_billet;
CREATE TABLE billet(
   id_billet VARCHAR(50) default ('billet'||nextval('seq_billet')),
   nom_billet VARCHAR(50) ,
   prix_billet NUMERIC(15,2)  ,
   id_place VARCHAR(50)  NOT NULL,
   id_categorie_billet VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id_billet),
   FOREIGN KEY(id_place) REFERENCES place(id_place),
   FOREIGN KEY(id_categorie_billet) REFERENCES categorie_billet(id_categorie_billet)
);
-- drop table billet;

-- alter table billet drop column id_place;

create sequence seq_diffusion;
CREATE TABLE diffusion(
   id_diffusion VARCHAR(50) default ('diff'||nextval('seq_diffusion')),
   date_diffusion VARCHAR(50) ,
   id_interval VARCHAR(50)  NOT NULL,
   id_film VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id_diffusion),
   FOREIGN KEY(id_interval) REFERENCES intervale(id_interval),
   FOREIGN KEY(id_film) REFERENCES film(id_film)
);

create sequence seq_vente_billet;
CREATE TABLE vente_billet(
   id_vente VARCHAR(50) default ('vente'||nextval('seq_vente_billet')),
   date_vente DATE,
   id_diffusion VARCHAR(50)  NOT NULL,
   id_billet VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id_vente),
   FOREIGN KEY(id_diffusion) REFERENCES diffusion(id_diffusion),
   FOREIGN KEY(id_billet) REFERENCES billet(id_billet)
);
-- alter table  vente_billet add column id_place VARCHAR REFERENCES place(id_place)
-- alter table vente_billet drop column id_billet;
-- alter table vente_billet add column id_categorie_billet VARCHAR REFERENCES categorie_billet(id_categorie_billet);
create sequence seq_produit_annexe;
CREATE TABLE produit_annexe(
   id_produit VARCHAR default ('prod'||nextval('seq_produit_annexe')),
   nom_produit VARCHAR(50) ,
   prix NUMERIC(15,2)  ,
   PRIMARY KEY(id_produit)
);


create sequence seq_personne;
create table personne(
   id_personne VARCHAR default ('pers'||nextval('seq_personne')),
   nom VARCHAR not null,
   email VARCHAR not null,
   pass VARCHAR not null,
   isAdmin INTEGER default 0
);

insert into salle values(default,'salle1');
insert into salle values(default,'salle2');
insert into salle values(default,'salle3');


insert into rangee values(default,'A');
insert into rangee values(default,'B');
insert into rangee values(default,'C');

insert into categorie_billet values(default,'enfant');
insert into categorie_billet values(default,'adulte');

INSERT INTO film (description_film, nom_film, date_sortie) VALUES
('Un thriller captivant', 'Inception', '2010-07-16'),
('Une comédie hilarante', 'La Grande Vadrouille', '1966-12-08'),
('Un drame émotionnel', 'Forrest Gump', '1994-07-06'),
('Un film d action explosif', 'Matrix', '1999-03-31'),
('Une romance inoubliable', 'Titanic', '1997-12-19');

INSERT INTO intervale (debut, fin) VALUES
(8, 10),
(10, 12),
(13, 15),
(15, 17),
(17, 21);


INSERT INTO place (nom_place, id_range, id_salle) VALUES
('A1', 'rang1', 'salle1'),
('A2', 'rang1', 'salle1'),
('A2', 'rang1', 'salle1'),
('A3', 'rang1', 'salle1'),
('A4', 'rang1', 'salle1'),
('A5', 'rang1', 'salle1'),
('A6', 'rang1', 'salle1'),
('A7', 'rang1', 'salle1'),
('A8', 'rang1', 'salle1'),
('A9', 'rang1', 'salle1'),
('A10', 'rang1', 'salle1'),

('B1', 'rang2', 'salle1'),
('B2', 'rang2', 'salle1'),
('B3', 'rang2', 'salle1'),
('B4', 'rang2', 'salle1'),
('B5', 'rang2', 'salle1'),
('B6', 'rang2', 'salle1'),
('B7', 'rang2', 'salle1'),
('B8', 'rang2', 'salle1'),
('B9', 'rang2', 'salle1'),
('B10', 'rang2', 'salle1'),

('C1', 'rang2', 'salle1'),
('C2', 'rang2', 'salle1'),
('C3', 'rang2', 'salle1'),
('C4', 'rang2', 'salle1'),
('C5', 'rang2', 'salle1'),
('C6', 'rang2', 'salle1'),
('C7', 'rang2', 'salle1'),
('C8', 'rang2', 'salle1'),
('C9', 'rang2', 'salle1'),
('C10', 'rang2', 'salle1');

insert into diffusion (date_diffusion,id_interval,id_film) values
('2024-05-5','intervale1','film1'),
('2024-05-5','intervale2','film1'),
('2024-05-5','intervale3','film1');


-- INSERT INTO vente_billet (date_vente,id_diffusion,id_place,id_categorie_billet ) VALUES (now(),'diff1','place2','cat2' );

--    SELECT 
--       p.id_place,
--       p.nom_place,
--       p.id_salle,
--       v.id_diffusion,
--       v.date_vente,
--       CASE 
--          WHEN v.id_place IS NOT NULL THEN 'VENDUE'
--          ELSE 'NON VENDUE'
--       END AS etat_vente
--    FROM 
--       place p
--    LEFT JOIN 
--       vente_billet v ON p.id_place = v.id_place;
