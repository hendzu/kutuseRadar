-- Created by Redgate Data Modeler (https://datamodeler.redgate-platform.com)
-- Last modification date: 2026-05-08 11:46:27.635

-- tables
-- Table: chain
CREATE TABLE chain (
    id int  NOT NULL,
    name varchar(225)  NOT NULL,
    logo bytea  NOT NULL,
    CONSTRAINT chain_pk PRIMARY KEY (id)
);

-- Table: fuel
CREATE TABLE fuel (
    id int  NOT NULL,
    name varchar(255)  NOT NULL,
    CONSTRAINT fuel_pk PRIMARY KEY (id)
);

-- Table: memberships
CREATE TABLE memberships (
    id int  NOT NULL,
    chain_id int  NOT NULL,
    user_id int  NOT NULL,
    discount decimal(3,2)  NOT NULL,
    CONSTRAINT id PRIMARY KEY (id)
);

-- Table: station
CREATE TABLE station (
    id int  NOT NULL,
    chain_id int  NOT NULL,
    name varchar(255)  NOT NULL,
    CONSTRAINT station_pk PRIMARY KEY (id)
);

-- Table: station_fuel
CREATE TABLE station_fuel (
    id int  NOT NULL,
    station_id int  NOT NULL,
    fuel_id int  NOT NULL,
    CONSTRAINT station_fuel_pk PRIMARY KEY (id)
);

-- Table: station_fuel_price
CREATE TABLE station_fuel_price (
    id int  NOT NULL,
    price money  NOT NULL,
    time timestamp  NOT NULL,
    station_fuel_id int  NOT NULL,
    CONSTRAINT station_fuel_price_pk PRIMARY KEY (id)
);

-- Table: user
CREATE TABLE "user" (
    id int  NOT NULL,
    username int  NOT NULL,
    password varchar(255)  NOT NULL,
    role varchar(255)  NOT NULL,
    CONSTRAINT user_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: memberships_chain (table: memberships)
ALTER TABLE memberships ADD CONSTRAINT memberships_chain
    FOREIGN KEY (chain_id)
    REFERENCES chain (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: memberships_user (table: memberships)
ALTER TABLE memberships ADD CONSTRAINT memberships_user
    FOREIGN KEY (user_id)
    REFERENCES "user" (id)  
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

-- Reference: station_fuel_station (table: station_fuel)
ALTER TABLE station_fuel ADD CONSTRAINT station_fuel_station
    FOREIGN KEY (station_id)
    REFERENCES station (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

