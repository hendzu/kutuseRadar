-- Created by Redgate Data Modeler (https://datamodeler.redgate-platform.com)
-- Last modification date: 2026-05-13 06:34:14.015

-- tables
-- Table: chain
CREATE TABLE chain (
    id int  NOT NULL,
    name varchar(225)  NOT NULL,
    logo bytea  NOT NULL,
    status varchar(1)  NOT NULL,
    CONSTRAINT chain_name UNIQUE (name) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT chain_pk PRIMARY KEY (id)
);

-- Table: favorite_stations
CREATE TABLE favorite_stations (
    id int  NOT NULL,
    user_id int  NOT NULL,
    station_id int  NOT NULL,
    CONSTRAINT favorite_stations_pk PRIMARY KEY (id)
);

-- Table: fuel
CREATE TABLE fuel (
    id int  NOT NULL,
    name varchar(255)  NOT NULL,
    CONSTRAINT fuel_name UNIQUE (name) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT fuel_pk PRIMARY KEY (id)
);

-- Table: memberships
CREATE TABLE memberships (
    id int  NOT NULL,
    chain_id int  NOT NULL,
    discount money  NOT NULL,
    name varchar(225)  NOT NULL,
    CONSTRAINT id PRIMARY KEY (id)
);

-- Table: station
CREATE TABLE station (
    id int  NOT NULL,
    chain_id int  NOT NULL,
    name varchar(255)  NOT NULL,
    lon decimal(9,6)  NOT NULL,
    lat decimal(8,6)  NOT NULL,
    status varchar(1)  NOT NULL,
    CONSTRAINT station_name UNIQUE (name) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT station_pk PRIMARY KEY (id)
);

-- Table: station_fuel
CREATE TABLE station_fuel (
    id int  NOT NULL,
    station_id int  NOT NULL,
    fuel_id int  NOT NULL,
    status varchar(1)  NOT NULL,
    CONSTRAINT station_fuel_pk PRIMARY KEY (id)
);

CREATE INDEX station_fuel_idx_station on station_fuel (station_id ASC);

CREATE INDEX station_fuel_idx_fuel on station_fuel (fuel_id ASC);

-- Table: station_fuel_price
CREATE TABLE station_fuel_price (
    id int  NOT NULL,
    price money  NOT NULL,
    time timestamp  NOT NULL,
    station_fuel_id int  NOT NULL,
    user_id int  NOT NULL,
    CONSTRAINT station_fuel_price_pk PRIMARY KEY (id)
);

-- Table: station_picture
CREATE TABLE station_picture (
    id int  NOT NULL,
    picture bytea  NOT NULL,
    station_id int  NOT NULL,
    CONSTRAINT station_picture_pk PRIMARY KEY (id)
);

-- Table: user
CREATE TABLE "user" (
    id int  NOT NULL,
    username int  NOT NULL,
    password varchar(255)  NOT NULL,
    role varchar(255)  NOT NULL,
    status varchar(1)  NOT NULL,
    CONSTRAINT user_name UNIQUE (username) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT user_pk PRIMARY KEY (id)
);

-- Table: user_membership
CREATE TABLE user_membership (
    id int  NOT NULL,
    user_id int  NOT NULL,
    memberships_id int  NOT NULL,
    CONSTRAINT user_membership_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: favorite_stations_station (table: favorite_stations)
ALTER TABLE favorite_stations ADD CONSTRAINT favorite_stations_station
    FOREIGN KEY (station_id)
    REFERENCES station (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: favorite_stations_user (table: favorite_stations)
ALTER TABLE favorite_stations ADD CONSTRAINT favorite_stations_user
    FOREIGN KEY (user_id)
    REFERENCES "user" (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: memberships_chain (table: memberships)
ALTER TABLE memberships ADD CONSTRAINT memberships_chain
    FOREIGN KEY (chain_id)
    REFERENCES chain (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: station_chain (table: station)
ALTER TABLE station ADD CONSTRAINT station_chain
    FOREIGN KEY (chain_id)
    REFERENCES chain (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: station_fuel_fuel (table: station_fuel)
ALTER TABLE station_fuel ADD CONSTRAINT station_fuel_fuel
    FOREIGN KEY (fuel_id)
    REFERENCES fuel (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: station_fuel_price_station_fuel (table: station_fuel_price)
ALTER TABLE station_fuel_price ADD CONSTRAINT station_fuel_price_station_fuel
    FOREIGN KEY (station_fuel_id)
    REFERENCES station_fuel (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: station_fuel_price_user (table: station_fuel_price)
ALTER TABLE station_fuel_price ADD CONSTRAINT station_fuel_price_user
    FOREIGN KEY (user_id)
    REFERENCES "user" (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: station_fuel_station (table: station_fuel)
ALTER TABLE station_fuel ADD CONSTRAINT station_fuel_station
    FOREIGN KEY (station_id)
    REFERENCES station (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: station_picture_station (table: station_picture)
ALTER TABLE station_picture ADD CONSTRAINT station_picture_station
    FOREIGN KEY (station_id)
    REFERENCES station (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: user_membership_memberships (table: user_membership)
ALTER TABLE user_membership ADD CONSTRAINT user_membership_memberships
    FOREIGN KEY (memberships_id)
    REFERENCES memberships (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: user_membership_user (table: user_membership)
ALTER TABLE user_membership ADD CONSTRAINT user_membership_user
    FOREIGN KEY (user_id)
    REFERENCES "user" (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

