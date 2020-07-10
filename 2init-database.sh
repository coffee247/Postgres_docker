#!/bin/bash
set -e

dbname="rbims"

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname $dbname <<-EOSQL

     CREATE TABLE backings(backing varchar(30), primary key (backing));
     INSERT into backings (backing) values ('Air'), ('Aluminum'), ('Clay');
     
     CREATE TABLE Fiber_types(fiber_type varchar(30), primary key (fiber_type));
     INSERT INTO Fiber_types(fiber_type) values ('Dyneema'), ('Spectra'), ('Kevlar'), ('Twaron');
     
     CREATE TABLE Sample_types(sample_type varchar(30), primary key (sample_type));
     INSERT INTO Sample_types(sample_type) values ('Helmet'), ('Plate'), ('Shield'), ('Vest');
     
     CREATE TABLE Manufacturers(manufacturer varchar(30), primary key (manufacturer));
     INSERT INTO Manufacturers(manufacturer) values ('Artec'), ('Dupont'), ('Honeywell'), ('JPS'), ('Lincoln Fabrics'), ('Saint Gobian');
     
     CREATE TABLE Fabric_constructs(construct varchar(30), primary key (construct));
     INSERT INTO Fabric_constructs(construct) values ('Multi-Axial'), ('Uni-Directional'), ('Woven');
     
EOSQL

