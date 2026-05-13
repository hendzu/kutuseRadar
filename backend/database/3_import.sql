-- chains (logo bytea is required; using empty placeholder)
INSERT INTO chain (id, name, logo, status) VALUES (1, 'Olerex', '\x'::bytea, 'A');
INSERT INTO chain (id, name, logo, status) VALUES (2, 'Circle K', '\x'::bytea, 'A');
INSERT INTO chain (id, name, logo, status) VALUES (3, 'Neste', '\x'::bytea, 'A');
INSERT INTO chain (id, name, logo, status) VALUES (4, 'Alexela', '\x'::bytea, 'D');


-- fuel types
INSERT INTO fuel (id, name) VALUES (1, '95');
INSERT INTO fuel (id, name) VALUES (2, '98');
INSERT INTO fuel (id, name) VALUES (3, 'Diisel');
INSERT INTO fuel (id, name) VALUES (4, 'AdBlue');
INSERT INTO fuel (id, name) VALUES (5, 'CNG');


-- users (username column is int)
INSERT INTO "user" (id, username, password, role, status) VALUES (1, 1001, 'admin123', 'ADMIN', 'A');
INSERT INTO "user" (id, username, password, role, status) VALUES (2, 1002, 'pass123', 'USER', 'A');
INSERT INTO "user" (id, username, password, role, status) VALUES (3, 1003, 'pass123', 'USER', 'A');
INSERT INTO "user" (id, username, password, role, status) VALUES (4, 1004, 'pass123', 'USER', 'D');


-- stations
INSERT INTO station (id, chain_id, name, lon, lat, status) VALUES (1, 1, 'Olerex Ülemiste',   24.807123, 59.418456, 'A');
INSERT INTO station (id, chain_id, name, lon, lat, status) VALUES (2, 1, 'Olerex Järve',       24.705678, 59.417234, 'A');
INSERT INTO station (id, chain_id, name, lon, lat, status) VALUES (3, 2, 'Circle K Mustamäe', 24.694321, 59.401234, 'A');
INSERT INTO station (id, chain_id, name, lon, lat, status) VALUES (4, 2, 'Circle K Ülemiste', 24.809456, 59.419012, 'A');
INSERT INTO station (id, chain_id, name, lon, lat, status) VALUES (5, 3, 'Neste Laagri',       24.629789, 59.344567, 'A');
INSERT INTO station (id, chain_id, name, lon, lat, status) VALUES (6, 3, 'Neste Järvevana',    24.723456, 59.418901, 'A');
INSERT INTO station (id, chain_id, name, lon, lat, status) VALUES (7, 4, 'Alexela Pärnu mnt', 24.712345, 59.420123, 'D');


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
INSERT INTO station_fuel_price (id, price, time, station_fuel_id, user_id) VALUES (1,  1.729::money, '2026-05-01 08:00:00', 1,  1);
INSERT INTO station_fuel_price (id, price, time, station_fuel_id, user_id) VALUES (2,  1.749::money, '2026-05-05 09:15:00', 1,  2);
INSERT INTO station_fuel_price (id, price, time, station_fuel_id, user_id) VALUES (3,  1.769::money, '2026-05-10 07:30:00', 1,  2);
-- Olerex Ülemiste - 98 (station_fuel id=2)
INSERT INTO station_fuel_price (id, price, time, station_fuel_id, user_id) VALUES (4,  1.879::money, '2026-05-01 08:00:00', 2,  1);
INSERT INTO station_fuel_price (id, price, time, station_fuel_id, user_id) VALUES (5,  1.899::money, '2026-05-08 10:00:00', 2,  3);
-- Olerex Ülemiste - Diisel (station_fuel id=3)
INSERT INTO station_fuel_price (id, price, time, station_fuel_id, user_id) VALUES (6,  1.529::money, '2026-05-01 08:00:00', 3,  1);
INSERT INTO station_fuel_price (id, price, time, station_fuel_id, user_id) VALUES (7,  1.549::money, '2026-05-07 11:00:00', 3,  2);
-- Circle K Mustamäe - 95 (station_fuel id=7)
INSERT INTO station_fuel_price (id, price, time, station_fuel_id, user_id) VALUES (8,  1.739::money, '2026-05-01 08:00:00', 7,  1);
INSERT INTO station_fuel_price (id, price, time, station_fuel_id, user_id) VALUES (9,  1.759::money, '2026-05-09 14:00:00', 7,  3);
-- Circle K Mustamäe - Diisel (station_fuel id=9)
INSERT INTO station_fuel_price (id, price, time, station_fuel_id, user_id) VALUES (10, 1.539::money, '2026-05-01 08:00:00', 9,  1);
-- Neste Laagri - 95 (station_fuel id=14)
INSERT INTO station_fuel_price (id, price, time, station_fuel_id, user_id) VALUES (11, 1.719::money, '2026-05-01 08:00:00', 14, 1);
INSERT INTO station_fuel_price (id, price, time, station_fuel_id, user_id) VALUES (12, 1.739::money, '2026-05-11 08:00:00', 14, 2);
-- Neste Laagri - Diisel (station_fuel id=16)
INSERT INTO station_fuel_price (id, price, time, station_fuel_id, user_id) VALUES (13, 1.519::money, '2026-05-01 08:00:00', 16, 1);


-- memberships
INSERT INTO memberships (id, chain_id, discount, name) VALUES (1, 1, 0.03::money, 'Olerex Kuldkaart');
INSERT INTO memberships (id, chain_id, discount, name) VALUES (2, 1, 0.05::money, 'Olerex Hõbekaart');
INSERT INTO memberships (id, chain_id, discount, name) VALUES (3, 2, 0.04::money, 'Circle K Extra');
INSERT INTO memberships (id, chain_id, discount, name) VALUES (4, 3, 0.03::money, 'Neste+ kaart');


-- user_membership
INSERT INTO user_membership (id, user_id, memberships_id) VALUES (1, 2, 1);
INSERT INTO user_membership (id, user_id, memberships_id) VALUES (2, 2, 3);
INSERT INTO user_membership (id, user_id, memberships_id) VALUES (3, 3, 4);


-- favorite_stations
INSERT INTO favorite_stations (id, user_id, station_id) VALUES (1, 2, 1);
INSERT INTO favorite_stations (id, user_id, station_id) VALUES (2, 2, 3);
INSERT INTO favorite_stations (id, user_id, station_id) VALUES (3, 3, 5);
INSERT INTO favorite_stations (id, user_id, station_id) VALUES (4, 3, 6);
