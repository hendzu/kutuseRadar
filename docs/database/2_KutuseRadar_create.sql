-- Created by Redgate Data Modeler (https://datamodeler.redgate-platform.com)
-- Last modification date: 2026-05-14 08:16:32.408

-- tables
-- Table: chain
CREATE TABLE chain (
    id serial  NOT NULL,
    name varchar(225)  NOT NULL,
    status varchar(1)  NOT NULL,
    CONSTRAINT chain_name UNIQUE (name) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT chain_pk PRIMARY KEY (id)
);

-- Table: chain_image
CREATE TABLE chain_image (
    id serial  NOT NULL,
    chain_id int  NOT NULL,
    logo bytea  NOT NULL,
    CONSTRAINT chain_image_pk PRIMARY KEY (id)
);

-- Table: favorite_station
CREATE TABLE favorite_station (
    id serial  NOT NULL,
    user_id int  NOT NULL,
    station_id int  NOT NULL,
    CONSTRAINT favorite_station_pk PRIMARY KEY (id)
);

-- Table: fuel
CREATE TABLE fuel (
    id serial  NOT NULL,
    name varchar(255)  NOT NULL,
    CONSTRAINT fuel_name UNIQUE (name) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT fuel_pk PRIMARY KEY (id)
);

-- Table: membership
CREATE TABLE membership (
    id serial  NOT NULL,
    chain_id int  NOT NULL,
    discount decimal(4,3)  NOT NULL,
    name varchar(225)  NOT NULL,
    CONSTRAINT id PRIMARY KEY (id)
);

-- Table: role
CREATE TABLE role (
    id serial  NOT NULL,
    name varchar(20)  NOT NULL,
    CONSTRAINT role_pk PRIMARY KEY (id)
);

-- Table: station
CREATE TABLE station (
    id serial  NOT NULL,
    chain_id int  NOT NULL,
    name varchar(255)  NOT NULL,
    lng decimal(9,6)  NOT NULL,
    lat decimal(8,6)  NOT NULL,
    status varchar(1)  NOT NULL,
    CONSTRAINT station_name UNIQUE (name) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT station_pk PRIMARY KEY (id)
);

-- Table: station_fuel
CREATE TABLE station_fuel (
    id serial  NOT NULL,
    station_id int  NOT NULL,
    fuel_id int  NOT NULL,
    status varchar(1)  NOT NULL,
    CONSTRAINT station_fuel_pk PRIMARY KEY (id)
);

CREATE INDEX station_fuel_idx_station on station_fuel (station_id ASC);

CREATE INDEX station_fuel_idx_fuel on station_fuel (fuel_id ASC);

-- Table: station_fuel_price
CREATE TABLE station_fuel_price (
    id serial  NOT NULL,
    user_id int  NOT NULL,
    station_fuel_id int  NOT NULL,
    price decimal(4,3)  NOT NULL,
    time timestamp  NOT NULL,
    CONSTRAINT station_fuel_price_pk PRIMARY KEY (id)
);

-- Table: station_picture
CREATE TABLE station_picture (
    id serial  NOT NULL,
    station_id int  NOT NULL,
    picture bytea  NOT NULL,
    CONSTRAINT station_picture_pk PRIMARY KEY (id)
);

-- Table: user
CREATE TABLE "user" (
    id serial  NOT NULL,
    role_id int  NOT NULL,
    username varchar(255)  NOT NULL,
    password varchar(255)  NOT NULL,
    status varchar(1)  NOT NULL,
    CONSTRAINT user_name UNIQUE (username) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT user_pk PRIMARY KEY (id)
);

-- Table: user_membership
CREATE TABLE user_membership (
    id serial  NOT NULL,
    user_id int  NOT NULL,
    membership_id int  NOT NULL,
    CONSTRAINT user_membership_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: chain_image_chain (table: chain_image)
ALTER TABLE chain_image ADD CONSTRAINT chain_image_chain
    FOREIGN KEY (chain_id)
    REFERENCES chain (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: favorite_stations_station (table: favorite_station)
ALTER TABLE favorite_station ADD CONSTRAINT favorite_stations_station
    FOREIGN KEY (station_id)
    REFERENCES station (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: favorite_stations_user (table: favorite_station)
ALTER TABLE favorite_station ADD CONSTRAINT favorite_stations_user
    FOREIGN KEY (user_id)
    REFERENCES "user" (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: memberships_chain (table: membership)
ALTER TABLE membership ADD CONSTRAINT memberships_chain
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

-- Reference: user_membership_membership (table: user_membership)
ALTER TABLE user_membership ADD CONSTRAINT user_membership_membership
    FOREIGN KEY (membership_id)
    REFERENCES membership (id)  
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

-- Reference: user_role (table: user)
ALTER TABLE "user" ADD CONSTRAINT user_role
    FOREIGN KEY (role_id)
    REFERENCES role (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

