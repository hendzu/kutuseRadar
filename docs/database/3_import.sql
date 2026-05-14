-- roles
INSERT INTO role (id, name) VALUES (1, 'ADMIN');
INSERT INTO role (id, name) VALUES (2, 'USER');


-- chains
INSERT INTO chain (id, name, status) VALUES (1, 'Olerex',   'A');
INSERT INTO chain (id, name, status) VALUES (2, 'Circle K', 'A');
INSERT INTO chain (id, name, status) VALUES (3, 'Neste',    'A');
INSERT INTO chain (id, name, status) VALUES (4, 'Alexela',  'D');


-- chain logos (empty placeholder)
INSERT INTO chain_image (id, chain_id, logo) VALUES (1, 1, '\x'::bytea);
INSERT INTO chain_image (id, chain_id, logo) VALUES (2, 2, '\x'::bytea);
INSERT INTO chain_image (id, chain_id, logo) VALUES (3, 3, '\x'::bytea);
INSERT INTO chain_image (id, chain_id, logo) VALUES (4, 4, '\x'::bytea);


-- fuel types
INSERT INTO fuel (id, name) VALUES (1, '95');
INSERT INTO fuel (id, name) VALUES (2, '98');
INSERT INTO fuel (id, name) VALUES (3, 'Diisel');
INSERT INTO fuel (id, name) VALUES (4, 'AdBlue');
INSERT INTO fuel (id, name) VALUES (5, 'CNG');


-- users
INSERT INTO "user" (id, role_id, username, password, status) VALUES (1, 1, 'admin',  'admin123', 'A');
INSERT INTO "user" (id, role_id, username, password, status) VALUES (2, 2, 'jaan',   'pass123',  'A');
INSERT INTO "user" (id, role_id, username, password, status) VALUES (3, 2, 'mari',   'pass123',  'A');
INSERT INTO "user" (id, role_id, username, password, status) VALUES (4, 2, 'peeter', 'pass123',  'D');


-- stations
INSERT INTO station (id, chain_id, name, lng, lat, status) VALUES (1, 1, 'Olerex Ülemiste',   24.807123, 59.418456, 'A');
INSERT INTO station (id, chain_id, name, lng, lat, status) VALUES (2, 1, 'Olerex Järve',       24.705678, 59.417234, 'A');
INSERT INTO station (id, chain_id, name, lng, lat, status) VALUES (3, 2, 'Circle K Mustamäe', 24.694321, 59.401234, 'A');
INSERT INTO station (id, chain_id, name, lng, lat, status) VALUES (4, 2, 'Circle K Ülemiste', 24.809456, 59.419012, 'A');
INSERT INTO station (id, chain_id, name, lng, lat, status) VALUES (5, 3, 'Neste Laagri',       24.629789, 59.344567, 'A');
INSERT INTO station (id, chain_id, name, lng, lat, status) VALUES (6, 3, 'Neste Järvevana',    24.723456, 59.418901, 'A');
INSERT INTO station (id, chain_id, name, lng, lat, status) VALUES (7, 4, 'Alexela Pärnu mnt', 24.712345, 59.420123, 'D');


-- station_fuel (which fuel types are available at each station)
-- Olerex Ülemiste: 95, 98, Diisel, AdBlue
INSERT INTO station_fuel (id, station_id, fuel_id, status) VALUES (1,  1, 1, 'A');
INSERT INTO station_fuel (id, station_id, fuel_id, status) VALUES (2,  1, 2, 'A');
INSERT INTO station_fuel (id, station_id, fuel_id, status) VALUES (3,  1, 3, 'A');
INSERT INTO station_fuel (id, station_id, fuel_id, status) VALUES (4,  1, 4, 'A');
-- Olerex Järve: 95, Diisel
INSERT INTO station_fuel (id, station_id, fuel_id, status) VALUES (5,  2, 1, 'A');
INSERT INTO station_fuel (id, station_id, fuel_id, status) VALUES (6,  2, 3, 'A');
-- Circle K Mustamäe: 95, 98, Diisel, CNG
INSERT INTO station_fuel (id, station_id, fuel_id, status) VALUES (7,  3, 1, 'A');
INSERT INTO station_fuel (id, station_id, fuel_id, status) VALUES (8,  3, 2, 'A');
INSERT INTO station_fuel (id, station_id, fuel_id, status) VALUES (9,  3, 3, 'A');
INSERT INTO station_fuel (id, station_id, fuel_id, status) VALUES (10, 3, 5, 'A');
-- Circle K Ülemiste: 95, 98, Diisel
INSERT INTO station_fuel (id, station_id, fuel_id, status) VALUES (11, 4, 1, 'A');
INSERT INTO station_fuel (id, station_id, fuel_id, status) VALUES (12, 4, 2, 'A');
INSERT INTO station_fuel (id, station_id, fuel_id, status) VALUES (13, 4, 3, 'A');
-- Neste Laagri: 95, 98, Diisel
INSERT INTO station_fuel (id, station_id, fuel_id, status) VALUES (14, 5, 1, 'A');
INSERT INTO station_fuel (id, station_id, fuel_id, status) VALUES (15, 5, 2, 'A');
INSERT INTO station_fuel (id, station_id, fuel_id, status) VALUES (16, 5, 3, 'A');
-- Neste Järvevana: 95, Diisel, AdBlue
INSERT INTO station_fuel (id, station_id, fuel_id, status) VALUES (17, 6, 1, 'A');
INSERT INTO station_fuel (id, station_id, fuel_id, status) VALUES (18, 6, 3, 'A');
INSERT INTO station_fuel (id, station_id, fuel_id, status) VALUES (19, 6, 4, 'A');
-- Alexela Pärnu mnt: 95, Diisel (chain is inactive)
INSERT INTO station_fuel (id, station_id, fuel_id, status) VALUES (20, 7, 1, 'D');
INSERT INTO station_fuel (id, station_id, fuel_id, status) VALUES (21, 7, 3, 'D');


-- station_fuel_price (price history per station_fuel)
-- Olerex Ülemiste - 95 (station_fuel id=1)
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (1,  1, 1,  1.729, '2026-05-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (2,  2, 1,  1.749, '2026-05-05 09:15:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (3,  2, 1,  1.769, '2026-05-10 07:30:00');
-- Olerex Ülemiste - 98 (station_fuel id=2)
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (4,  1, 2,  1.879, '2026-05-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (5,  3, 2,  1.899, '2026-05-08 10:00:00');
-- Olerex Ülemiste - Diisel (station_fuel id=3)
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (6,  1, 3,  1.529, '2026-05-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (7,  2, 3,  1.549, '2026-05-07 11:00:00');
-- Circle K Mustamäe - 95 (station_fuel id=7)
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (8,  1, 7,  1.739, '2026-05-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (9,  3, 7,  1.759, '2026-05-09 14:00:00');
-- Circle K Mustamäe - Diisel (station_fuel id=9)
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (10, 1, 9,  1.539, '2026-05-01 08:00:00');
-- Neste Laagri - 95 (station_fuel id=14)
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (11, 1, 14, 1.719, '2026-05-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (12, 2, 14, 1.739, '2026-05-11 08:00:00');
-- Neste Laagri - Diisel (station_fuel id=16)
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (13, 1, 16, 1.519, '2026-05-01 08:00:00');


-- memberships
INSERT INTO membership (id, chain_id, discount, name) VALUES (1, 1, 0.030, 'Olerex Kuldkaart');
INSERT INTO membership (id, chain_id, discount, name) VALUES (2, 1, 0.050, 'Olerex Hõbekaart');
INSERT INTO membership (id, chain_id, discount, name) VALUES (3, 2, 0.040, 'Circle K Extra');
INSERT INTO membership (id, chain_id, discount, name) VALUES (4, 3, 0.030, 'Neste+ kaart');


-- user_membership
INSERT INTO user_membership (id, user_id, membership_id) VALUES (1, 2, 1);
INSERT INTO user_membership (id, user_id, membership_id) VALUES (2, 2, 3);
INSERT INTO user_membership (id, user_id, membership_id) VALUES (3, 3, 4);


-- favorite_station
INSERT INTO favorite_station (id, user_id, station_id) VALUES (1, 2, 1);
INSERT INTO favorite_station (id, user_id, station_id) VALUES (2, 2, 3);
INSERT INTO favorite_station (id, user_id, station_id) VALUES (3, 3, 5);
INSERT INTO favorite_station (id, user_id, station_id) VALUES (4, 3, 6);