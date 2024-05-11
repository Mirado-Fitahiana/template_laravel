create sequence seq_personne;
create table personne(
   id_personne VARCHAR default ('pers'||nextval('seq_personne')),
   nom VARCHAR not null,
   email VARCHAR not null,
   pass VARCHAR not null,
   isAdmin INTEGER default 0
);
alter table personne add column path_image VARCHAR;

create sequence seq_liste;
create table liste(
    id_produit VARCHAR default('prod'||nextval('seq_liste')) PRIMARY KEY,
    nom_produit VARCHAR unique,
    path_image VARCHAR not null
);

create sequence seq_recherche;
create table recherche(
    id_recherche VARCHAR default('r_'||nextval('seq_recherche')) PRIMARY KEY,
    nom_voiture VARCHAR not null,
    marque_voiture VARCHAR not null,
    description VARCHAR not null,
    min numeric,
    max numeric
);

    INSERT INTO recherche (nom_voiture, marque_voiture, description, min, max) VALUES
    ('Toyota Corolla', 'Toyota', 'Une berline compacte fiable et économique, idéale pour la conduite en ville et les trajets quotidiens. Dotée d un intérieur spacieux et de technologies avancées.', 5000, 15000),
    ('Honda Civic', 'Honda', 'La Honda Civic offre un équilibre parfait entre performance, confort et économie de carburant. Son design sportif et ses caractéristiques de sécurité avancées en font un choix populaire.', 6000, 17000),
    ('Ford Focus', 'Ford', 'La Ford Focus est une voiture compacte polyvalente, idéale pour les déplacements quotidiens et les escapades en famille. Son design élégant et sa maniabilité en font un choix prisé.', 4000, 12000),
    ('Chevrolet Malibu', 'Chevrolet', 'La Chevrolet Malibu allie élégance, confort et performances. Avec son intérieur spacieux, ses fonctionnalités haut de gamme et son design raffiné, elle offre une expérience de conduite exceptionnelle.', 8000, 20000),
    ('Nissan Altima', 'Nissan', 'La Nissan Altima est une berline élégante et fiable, parfaite pour les trajets quotidiens et les voyages sur autoroute. Son intérieur bien équipé et son excellente économie de carburant en font un choix judicieux.', 5500, 16000),
    ('Hyundai Elantra', 'Hyundai', 'L Hyundai Elantra est une compacte abordable et économique, offrant une conduite confortable et une bonne économie de carburant. Son design moderne et ses nombreuses fonctionnalités en font une option attrayante.', 4500, 13000),
    ('Volkswagen Jetta', 'Volkswagen', 'La Volkswagen Jetta est une berline compacte élégante et raffinée, offrant une conduite confortable et des fonctionnalités technologiques avancées. Son design intemporel en fait un choix sûr pour ceux qui recherchent une voiture polyvalente.', 7000, 18000),
    ('Mazda3', 'Mazda', 'La Mazda3 est une voiture compacte sportive et dynamique, offrant une conduite agile et une performance exceptionnelle. Son design audacieux et son intérieur bien aménagé en font un choix populaire parmi les amateurs de conduite.', 6500, 17000),
    ('Subaru Impreza', 'Subaru', 'La Subaru Impreza est une berline compacte robuste et fiable, dotée de la légendaire traction intégrale de Subaru. Son design pratique et sa réputation de durabilité en font un choix sûr pour affronter toutes les conditions de conduite.', 7000, 19000),
    ('Kia Forte', 'Kia', 'La Kia Forte est une compacte bien équipée, offrant un excellent rapport qualité-prix, une conduite confortable et une économie de carburant impressionnante. Avec son design moderne et ses nombreuses fonctionnalités, elle offre une expérience de conduite agréable.', 5500, 15000),
    ('BMW 3 Series', 'BMW', 'La BMW Série 3 est une berline de luxe emblématique, offrant des performances dynamiques, un intérieur haut de gamme et une multitude de technologies avancées. Son design élégant et ses options de personnalisation en font un choix incontournable pour les amateurs de conduite exigeants.', 10000, 25000),
    ('Mercedes-Benz C-Class', 'Mercedes-Benz', 'La Mercedes-Benz Classe C incarne l élégance et le luxe, offrant des performances impressionnantes et un intérieur somptueux. Avec ses technologies innovantes et son design sophistiqué, elle représente l apogée du prestige automobile.', 12000, 30000),
    ('Audi A4', 'Audi', 'L Audi A4 est une berline premium offrant un équilibre parfait entre luxe, performances et sophistication. Son design raffiné, son intérieur haut de gamme et ses technologies de pointe en font un choix prisé dans sa catégorie.', 11000, 28000),
    ('Lexus IS', 'Lexus', 'La Lexus IS est une berline de luxe sportive, offrant des performances dynamiques et un intérieur raffiné. Avec son design distinctif et son confort supérieur, elle incarne le luxe et la performance de manière inégalée.', 13000, 32000),
    ('Infiniti Q50', 'Infiniti', 'L Infiniti Q50 est une berline sportive et élégante, offrant des performances puissantes et une conduite dynamique. Avec son design expressif et ses technologies avancées, elle offre une expérience de conduite immersive.', 14000, 33000),
    ('Cadillac ATS', 'Cadillac', 'La Cadillac ATS est une berline de luxe dynamique, offrant des performances sportives et un intérieur raffiné. Avec son design distinctif et ses caractéristiques haut de gamme, elle incarne le luxe et l élégance.', 15000, 35000),
    ('Acura TLX', 'Acura', 'L Acura TLX est une berline de luxe sophistiquée, offrant un équilibre parfait entre performance, confort et technologie. Son design dynamique, son intérieur luxueux et ses performances impressionnantes en font un choix judicieux pour les connaisseurs exigeants.', 12000, 30000),
    ('Volvo S60', 'Volvo', 'La Volvo S60 est une berline de luxe sécuritaire et confortable, offrant une conduite douce et des fonctionnalités innovantes. Avec son design élégant et son engagement envers la sécurité, elle offre une expérience de conduite supérieure.', 13000, 32000),
    ('Tesla Model 3', 'Tesla', 'La Tesla Model 3 est une voiture électrique révolutionnaire, offrant des performances électriques époustouflantes et une autonomie impressionnante. Avec son design futuriste et ses fonctionnalités de pointe, elle redéfinit les normes de l industrie automobile.', 25000, 60000),
    ('Porsche Taycan', 'Porsche', 'La Porsche Taycan est une berline électrique de luxe, offrant des performances électriques de pointe et un design exceptionnel. Avec son intérieur haut de gamme et ses fonctionnalités avancées, elle incarne le luxe et l innovation.', 70000, 150000),
    ('Toyota Camry', 'Toyota', 'La Toyota Camry est une berline fiable et spacieuse, offrant une conduite confortable et des fonctionnalités pratiques. Avec son design classique et sa réputation de durabilité, elle reste un choix populaire parmi les conducteurs du monde entier.', 8000, 20000),
    ('Honda Accord', 'Honda', 'La Honda Accord est une berline polyvalente, offrant une conduite confortable et une excellente économie de carburant. Avec son intérieur bien aménagé et sa fiabilité légendaire, elle reste une référence dans sa catégorie.', 7500, 19000),
    ('Ford Fusion', 'Ford', 'La Ford Fusion est une berline élégante et spacieuse, offrant une conduite confortable et des fonctionnalités technologiques avancées. Avec son design attrayant et sa polyvalence, elle est parfaitement adaptée à la vie urbaine moderne.', 6000, 16000),
    ('Chevrolet Impala', 'Chevrolet', 'La Chevrolet Impala est une berline pleine de caractère, offrant un espace généreux et des performances solides. Avec son design emblématique et son confort supérieur, elle incarne le style et l élégance.', 7000, 18000),
    ('Nissan Maxima', 'Nissan', 'La Nissan Maxima est une berline sportive et luxueuse, offrant des performances puissantes et un intérieur raffiné. Avec son design audacieux et ses caractéristiques haut de gamme, elle offre une expérience de conduite exceptionnelle.', 8500, 21000),
    ('Hyundai Sonata', 'Hyundai', 'L Hyundai Sonata est une berline élégante et confortable, offrant une conduite douce et des fonctionnalités avancées. Avec son design moderne et sa fiabilité éprouvée, elle est parfaitement adaptée à la vie quotidienne.', 6500, 17000),
    ('Volkswagen Passat', 'Volkswagen', 'La Volkswagen Passat est une berline spacieuse et raffinée, offrant un intérieur bien aménagé et une conduite confortable. Avec son design élégant et sa technologie innovante, elle est conçue pour offrir une expérience de conduite supérieure.', 8000, 20000),
    ('Mazda6', 'Mazda', 'La Mazda6 est une berline dynamique et élégante, offrant une conduite agile et des performances remarquables. Avec son design séduisant et ses fonctionnalités haut de gamme, elle incarne l harmonie entre forme et fonction.', 7000, 19000),
    ('Subaru Legacy', 'Subaru', 'La Subaru Legacy est une berline spacieuse et polyvalente, offrant une conduite confortable et une excellente traction intégrale. Avec son design fonctionnel et sa réputation de fiabilité, elle est idéale pour les aventures en famille.', 9000, 22000),
    ('Kia Optima', 'Kia', 'La Kia Optima est une berline élégante et bien équipée, offrant un excellent rapport qualité-prix et des performances solides. Avec son design moderne et ses nombreuses fonctionnalités, elle offre une conduite agréable et sécuritaire.', 7500, 19000),
    ('BMW 5 Series', 'BMW', 'La BMW Série 5 est une berline de luxe haut de gamme, offrant des performances exceptionnelles et un intérieur somptueux. Avec son design élégant et ses technologies innovantes, elle incarne le summum du luxe automobile.', 15000, 35000),
    ('Mercedes-Benz E-Class', 'Mercedes-Benz', 'La Mercedes-Benz Classe E est une berline de luxe prestigieuse, offrant un confort supérieur et des performances impressionnantes. Avec son design sophistiqué et ses fonctionnalités avancées, elle représente l élite de l industrie automobile.', 18000, 40000),
    ('Audi A6', 'Audi', 'L Audi A6 est une berline premium offrant un mélange parfait de luxe, de performances et de technologie. Avec son intérieur somptueux, son design raffiné et ses caractéristiques haut de gamme, elle offre une expérience de conduite inégalée.', 16000, 38000),
    ('Lexus ES', 'Lexus', 'La Lexus ES est une berline de luxe confortable et raffinée, offrant une conduite silencieuse et des matériaux haut de gamme. Avec son design élégant et son attention portée aux détails, elle incarne l excellence et le prestige.', 20000, 45000),
    ('Infiniti Q70', 'Infiniti', 'L Infiniti Q70 est une berline de luxe élégante et puissante, offrant des performances exceptionnelles et un intérieur luxueux. Avec son design distinctif et ses caractéristiques haut de gamme, elle offre une expérience de conduite exaltante.', 22000, 50000),
    ('Cadillac CTS', 'Cadillac', 'La Cadillac CTS est une berline de luxe sportive, offrant des performances dynamiques et un intérieur raffiné. Avec son design audacieux et ses fonctionnalités haut de gamme, elle incarne le luxe et la performance.', 25000, 55000),
    ('Acura RLX', 'Acura', 'L Acura RLX est une berline de luxe sophistiquée, offrant un confort exceptionnel et des performances équilibrées. Avec son design élégant et ses technologies avancées, elle offre une expérience de conduite haut de gamme.', 20000, 45000),
    ('Volvo S90', 'Volvo', 'La Volvo S90 est une berline de luxe sûre et élégante, offrant une conduite douce et des fonctionnalités avancées. Avec son design raffiné et son engagement envers la sécurité, elle offre une expérience de conduite supérieure.', 22000, 50000),
    ('Tesla Model S', 'Tesla', 'La Tesla Model S est une berline électrique révolutionnaire, offrant des performances électriques de classe mondiale et un intérieur luxueux. Avec son design innovant et son autonomie impressionnante, elle définit les normes de l industrie automobile.', 60000, 150000),
    ('Porsche Panamera', 'Porsche', 'La Porsche Panamera est une berline de luxe sportive, offrant des performances exceptionnelles et un design sophistiqué. Avec son intérieur haut de gamme et ses fonctionnalités avancées, elle incarne le summum du luxe automobile.', 80000, 200000),
    ('Toyota Avalon', 'Toyota', 'La Toyota Avalon est une berline spacieuse et confortable, offrant une conduite souple et des fonctionnalités avancées. Avec son design élégant et son attention portée au confort, elle est parfaite pour les longs trajets et les voyages en famille.', 9000, 22000),
    ('Honda Clarity', 'Honda', 'La Honda Clarity est une berline hybride écologique, offrant une conduite économique et respectueuse de l environnement. Avec son intérieur bien équipé et son design moderne, elle offre une expérience de conduite durable et raffinée.', 25000, 50000),
    ('Ford Taurus', 'Ford', 'La Ford Taurus est une berline spacieuse et confortable, offrant une conduite douce et des fonctionnalités pratiques. Avec son design intemporel et sa réputation de durabilité, elle reste une option attrayante pour les conducteurs à la recherche de confort et de fiabilité.', 8000, 18000),
    ('Chevrolet Cruze', 'Chevrolet', 'La Chevrolet Cruze est une compacte polyvalente, offrant une conduite agile et une économie de carburant impressionnante. Avec son design moderne et ses fonctionnalités avancées, elle est idéale pour la conduite en ville et les aventures sur route.', 6000, 15000),
    ('Nissan Sentra', 'Nissan', 'La Nissan Sentra est une compacte fiable et économique, offrant une conduite confortable et des fonctionnalités pratiques. Avec son design élégant et sa réputation de fiabilité, elle est idéale pour les conducteurs à la recherche d une voiture polyvalente.', 5500, 14000),
    ('Hyundai Accent', 'Hyundai', 'L Hyundai Accent est une compacte économique et fiable, offrant une conduite souple et une excellente économie de carburant. Avec son design moderne et son prix abordable, elle est parfaite pour les conducteurs à la recherche de valeur et d efficacité.', 5000, 12000),
    ('Volkswagen Golf', 'Volkswagen', 'La Volkswagen Golf est une compacte dynamique et polyvalente, offrant une conduite agile et des fonctionnalités innovantes. Avec son design emblématique et son intérieur bien aménagé, elle incarne la quintessence du plaisir de conduire.', 7000, 16000),
    ('Mazda2', 'Mazda', 'La Mazda2 est une compacte énergique et agile, offrant une conduite divertissante et une excellente économie de carburant. Avec son design séduisant et son prix abordable, elle est idéale pour les conducteurs urbains à la recherche de style et d efficacité.', 5500, 14000),
    ('Subaru Impreza', 'Subaru', 'La Subaru Impreza est une compacte robuste et polyvalente, offrant une conduite sécuritaire et une traction intégrale légendaire. Avec son design fonctionnel et sa réputation de fiabilité, elle est prête à affronter toutes les conditions de conduite.', 6000, 15000),
    ('Kia Rio', 'Kia', 'La Kia Rio est une compacte économique et fiable, offrant une conduite confortable et des fonctionnalités pratiques. Avec son design moderne et son excellent rapport qualité-prix, elle est idéale pour les conducteurs à la recherche de valeur et d efficacité.', 5000, 12000);

-- for search full text
CREATE EXTENSION IF NOT EXISTS pg_trgm;
ALTER TABLE recherche ADD search tsvector GENERATED ALWAYS AS
	(to_tsvector('simple', nom_voiture) || ' ' ||
   to_tsvector('simple', marque_voiture) || ' ' ||
   to_tsvector('french', description)
) STORED;
CREATE INDEX idx_search ON movies USING GIN(search);

SELECT * FROM recherche WHERE search @@ websearch_to_tsquery('french','agile');