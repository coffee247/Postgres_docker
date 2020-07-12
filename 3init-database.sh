#!/bin/bash
set -e

dbname="rbims"

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname $dbname <<-EOSQL

    CREATE TABLE powders(powder_id serial, brandName varchar(30), PRIMARY KEY(powder_id), UNIQUE(brandName));
    INSERT INTO powders(brandName) values ('Accurate #2'), ('Accurate #9'), ('Allieant 2400'), ('Alliant Herc Bullseye'), ('Herules'), ('Hi-Skor 700x'), ('Hi-Skor 800x'), ('IMR-4198'), ('IMR-4756'), ('IMR-4895'), ('Power Pistol');
    
    CREATE TABLE ballisticians(ballistician_id serial, firstName varchar(30), lastName varchar(30), PRIMARY KEY(ballistician_id), UNIQUE(firstName, lastName));
    INSERT INTO ballisticians(firstName, lastName) values('James', 'Stallings'), ('Luke', 'Jeter');
    
    CREATE TABLE grains(grainweight integer, primary key (grainweight));
    insert into grains(grainweight) values (61),(124),(125),(147),(158),(180),(240),(650);
    
    CREATE TABLE fabrics(fabric_id serial, fabricname varchar(30), fabric_descr varchar(210), primary key(fabric_id), unique(fabricname));
    
    
    CREATE TABLE PLY(ply_ID serial, ply_descr varchar(215), ply_weight integer, fiber_type varchar(30) references public.fiber_types(fiber_type), construct varchar(30) references public.fabric_constructs(construct), primary key(ply_ID));
    
    
    CREATE TABLE shots(shot_id serial, grain varchar(30), ballistician_id integer, powder_id integer, primary key (shot_id));
    ALTER TABLE "shots" ADD FOREIGN KEY ("ballistician_id") REFERENCES "ballisticians" ("ballistician_id");
    ALTER TABLE "shots" ADD FOREIGN KEY ("powder_id") REFERENCES "powders" ("powder_id");
    
    CREATE TABLE us_states(ID serial, state_code char(2) NOT NULL, state_name varchar(50) NOT NULL, PRIMARY KEY (ID), unique(state_code), unique(state_name));

ALTER TABLE us_states ALTER COLUMN state_name TYPE citext;  

INSERT INTO US_STATES(STATE_CODE, STATE_NAME) VALUES 
('AL','Alabama'),
('AK','Alaska'),
('AZ','Arizona'),
('AR','Arkansas'),
('CA','California'),
('CO','Colorado'),
('CT','Connecticut'),
('DE','Delaware'),
('DC','District of Columbia'),
('FL','Florida'),
('GA','Georgia'),
('HI','Hawaii'),
('ID','Idaho'),
('IL','Illinois'),
('IN','Indiana'),
('IA','Iowa'),
('KS','Kansas'),
('KY','Kentucky'),
('LA','Louisiana'),
('ME','Maine'),
('MD','Maryland'),
('MA','Massachusetts'),
('MI','Michigan'),
('MN','Minnesota'),
('MS','Mississippi'),
('MO','Missouri'),
('MT','Montana'),
('NE','Nebraska'),
('NV','Nevada'),
('NH','New Hampshire'),
('NJ','New Jersey'),
('NM','New Mexico'),
('NY','New York'),
('NC','North Carolina'),
('ND','North Dakota'),
('OH','Ohio'),
('OK','Oklahoma'),
('OR','Oregon'),
('PA','Pennsylvania'),
('PR','Puerto Rico'),
('RI','Rhode Island'),
('SC','South Carolina'),
('SD','South Dakota'),
('TN','Tennessee'),
('TX','Texas'),
('UT','Utah'),
('VT','Vermont'),
('VA','Virginia'),
('WA','Washington'),
('WV','West Virginia'),
('WI','Wisconsin'),
('WY','Wyoming');

EOSQL

