-- roles
INSERT INTO role (id, name) VALUES (1, 'ADMIN');
INSERT INTO role (id, name) VALUES (2, 'USER');


-- chains
INSERT INTO chain (id, name, status) VALUES (1, 'Olerex',   'A');
INSERT INTO chain (id, name, status) VALUES (2, 'Circle K', 'A');
INSERT INTO chain (id, name, status) VALUES (3, 'Neste',    'A');
INSERT INTO chain (id, name, status) VALUES (4, 'Alexela',  'D');


-- chain logos
INSERT INTO chain_image (id, chain_id, logo) VALUES (1, 1, decode('iVBORw0KGgoAAAANSUhEUgAAADwAAAA8CAMAAAANIilAAAAAY1BMVEVHcEz/zQD/zQD/zgD/zQD/zQD/zQD/zQD/zQD/0gD8ywD/0ABjUg6egQgSExbQqAMoJRMeHRRwXQz2xgC4lgXFoATwwQHbsQJSRg+afgh4YwyNdAlEOxDmugJ/aQs2MBKsjAZ/3clxAAAACHRSTlMA8UcLl37Vs8C8JyIAAAHoSURBVEjH7ZfbkqMgEIZjNAnSHOXgAVDe/ymnMWbiXmztjN5t5b+gjeHj71aLai6XVfW1uVfkR6ruzbW+7HR9/JDc+Mf1G61vv0JX/LaZ1w35vWjzpG/kkG5rvdUxuMK66wc5qEd92Hi1bshhNZf7cfh+qY7D1YWc0Af+wP85DNQbArivodb9bZV5xtcfL5Ft0gZT26EcBcfYlPD3iHFik8fYsc6RHsepY7ZEmSbm3jAd1ZRSpzjxUcy4KlitbB+iKTHopadMsN4NIw1CScNm/w2DU0sC6BclCRMckwSpVN8aS6VePC6Y21lMAFKCH8ScO7+reRYM7cwgAjqML9hJnK6X1CslAWGTDRQjHSW8YSS6Lbxh3cVcYNXFmCnCkcViSGcxePIPGGu1T1gPHhBmbvbFMWjNd84QxGDWtEeywtSXtKkxBtOWWA0paYOhvryP8gDhDZdHBa1TMaEzb1sbEE4tBFtqzjh5fWBt6nxizjAx7d+zi4O1Q3S4jGB8jBPXOvCwZIwWM2L9IAbOWXQDGkxCj3T3haUcQk5Ael40OrtG3mN0ROLwvJ/xMpnMeTZ/fNsAsIWdyPfwvvGc89kMPvAH/it8qpU61cSdah9PNa6nWuZTzfq5Y8KxAwpp6vNHo3OHssPHwS+hKICM6p/LBwAAAABJRU5ErkJggg==', 'base64'));
INSERT INTO chain_image (id, chain_id, logo) VALUES (2, 2, decode('/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAgFBgcGBQgHBgcJCAgJDBMMDAsLDBgREg4THBgdHRsYGxofIywlHyEqIRobJjQnKi4vMTIxHiU2OjYwOiwwMTD/2wBDAQgJCQwKDBcMDBcwIBsgMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDD/wAARCAA8ADwDASIAAhEBAxEB/8QAHAAAAgIDAQEAAAAAAAAAAAAABgcABQIDBAgB/8QAPhAAAQIEAgYFCgILAAAAAAAAAQIDAAQFEQYxBxIhNlFxExVBdLEiVWGBgpGUobLBMtEUJENSYnJzkqLw8f/EABkBAAMBAQEAAAAAAAAAAAAAAAQFBgMAB//EADERAAEDAQYCCAYDAAAAAAAAAAEAAgMEBREhMVFxEkETFCIzNGHR8AZSkZKhsUKBwf/aAAwDAQACEQMRAD8A+413nnfY+gRSRd413nnfY+gR34DwgrELypibKmpFo2JGbh7UjgBx/wChCWOkkLW6r1BtTHS0jJZTcAB+kMMtuPOBDaFLUckpFyfVG5+nT0ujpH5OZaSRfWW0oDncx6AplLkKUwGKfLNMI4JFieZ7Tzjusm20CDBQ4YuU8/4lPF2I8PM4/peaIkOrFWB6ZW2HHZVtEpO2ulxAslR/iAzvxz55Qm52UfkJt2Um0Ft5pWqtJ7OR4cIEmgdEcck+s+0oq5p4cHDMH3iE3NDu7DneV+CYNoCdDu7DneV+CYNobwd23ZQNo+Lk3KQWNd55z2PoEOzD1ORSaNKSDYFmGwkkZE9p9ZufXCUxirVxVNL/AHVIP+CYe8s6h5ht1tQUhaQpJGREDUoHG4pzbbnCngbyu/OCTWlckYvdF/2KPvBFpNxT+jyKKNIuEPOtgvrB/CgjYnmfDnA7pY3wd/pI+8YY2oM1Qau1UGip2XfWHUOL8vVXmUm+fHbmONjGDnOBfw64/lMYoYZGU3SZhpIGpuCNNGeFzTJPrOeR+uzCfISrNpB+5zPu2bYotMtNbYnpOoNgBUwlTblha5TaxvxsbeoQb4PxCxiOlJfbsiYbsl5oH8CuXA5j84FtNTyUydNZNtZbi1+4AfeCJGt6vhklNFLObVBkwcSQR5XZbKy0O7sOd5X4Jg2gJ0O7sOd5X4Jg2giDu27JXaPi5NykDjTeac9j6BDB0XYmanqa3SZtwCalk6rYOzpEDK3pA2W4AHjC/wAa7zzvsfQIpmHnGHUusuKbcbOslaTYg32EHjCpspikJ81cS0Da2iZGcDcCDobk5sTYDlcQVVc+9OvNKUkI1UAWAHOCCrUqVqtLXITqOkaWnVJyIPYRwIzhXUfSZVZNCWp9lqeSkWuTqLPC5Gz5euLJ7SwstnoqQErtsKpi4B/t/KDWzwYnK/NTctm2ne1mYbkQRh/vJDjS6jgLFJCgVBJsRkl9o9v+3sRHLjGvqxDWVzQSUsoSG2kHMJF9p9JJJ+UasR4iqGIX0OVBSAG79GhCbBN89u07bDO8VELnyYFjD2VW09LeW1E7R0l1xI9+8k4tDu7DneV+CYNoCdDu7DneV+CYNocwd23ZefWj4uTcpcV6nUJyqvqmqQp106t1iaWnW2C2wRw9WYb8xr+MXFjiIAVqZAyCgPkI4BEjPWTtkc0EYE8hrsqKAOMbe0ch/I6brHqzDfmNfxi4nVmG/Ma/jFxlEjDr02o+g9Frwu+d33H1WPVmG/Ma/jFxOrMN+Y1/GLjKJHdem1H0Hou4XfO77j6omw3N02j0pLUlJPNh15Wqy2suEm173UQMhl6CeMEsu63MNB1FyDccrEgj3gwDSks1MSsu08kqQrplkBRG0JSBtG3YFq98GFCUpVKZUolROsST/MYraKV0kbSdFNVsYbfICbyef9r/2Q==', 'base64'));
INSERT INTO chain_image (id, chain_id, logo) VALUES (3, 3, decode('iVBORw0KGgoAAAANSUhEUgAAADwAAAA8CAMAAAANIilAAAAAvVBMVEVHcEw9a68PSJwjVqSasdUVTJ4QSJxfhb4IQpkDPpcAO5UpW6YsXahmi8EHQZktXqkSSZ2Go8wAO5XR3O10lcYKQ5opW6cPR5waUKFUfLkYTqAaUKE6Z602ZKySrNJEb7JEcLIwYaouX6k2ZawgVKMjVqQEP5iOqdBehb0TSp5+nMpSergKQ5oQSJwwYaoUS54fU6IlWKUiVqSRq9IuX6mnu9sqXKcZT6EAO5UAOZUDPpcBPJYhVKMWTJ8GQJgvLrGRAAAAOHRSTlMANPRYUJ5oBK/9oOVoUepvsiC0Awn4UcONHd2tJEgbVhN2LWLLO/YSD/MxOdejk4Lutfo9pxCtfkjt67MAAAJWSURBVEjH7ZbbdqIwFIYDVBFlEAsigoiI4tnWdjoTk47v/1iTEwHF09WsueC/KH938q2VtbP3jgDUqlXrf9P4hWtMvPPJ/QJ8ieiXK8zLp5NvXRdw/PHNdJgQ/859AvbcfKSeWP7ubJYH7mYTCWvGkcnQgGtze7TXW+EavjBHbOY7s3kJhkw4BFOLWzhIRRDaoTAQ/w4xd4ZXgeF2ouEc9nEV9rfwNmxNC6SRIw2fcgzxxbnOj22oRH2cRTvIrLpKdrDPXRqvVPVE/wuSTARnwwJGA4VIswzNhqHCtGyjhDvXJX9s7CvKSDMsjcVGoAS36McdYPMVmSLYwnun2NLATboRD9zLIiGwTr9t1H095akgx06cC9hEtnMXjkSQpG4VV+A2uAun416vtwCgiSAMNpdwiyz2xs4NGL93iH66rFywzGoO9+lqJ7oFs/KzpqRQMcT4sDiHIV2FbzdgXgW0CDYBKQ20d89hVmmNhzCIV9QlVRjehPNjk9bu9o+kZJXnjy0TRun9ibZSNWHzR1dFtfhFzmnrT1/VqXwNYDjDpE+fLxLvbImk3Bo9XZ6yMYQitQQ/aAwb5y0JRuwbbUuwd70lBWwWw2AYMKOiEhxl+MowkDDpJTE9vYwbuB1KmNR7dXpKODXlAGxKt5Tw5MoA9BC7S7BDaTF6cxiHjoSdsArPM16svhG5A16A0PbEfEdduvSGNPpJT0d4cexhwDboWjAiz80fJpIwbnhu4oBWO1geRLB4bhyF+8lGJw/dD6YFWHPD37SlovM3sRy8I73++VCr1j/XX0volHgasxwlAAAAAElFTkSuQmCC', 'base64'));
INSERT INTO chain_image (id, chain_id, logo) VALUES (4, 4, decode('iVBORw0KGgoAAAANSUhEUgAAADwAAAA8BAMAAADI0sRBAAAAKlBMVEX///8CvfH8/v8AufEAtfAfxPPT9P1b1PY/zfXp+v7A7/yS4/mp6ft12/hHuznjAAACEElEQVQ4y62Vy0sjQRCHm4JMNq4eOjMowUsxIgt7C/HF6iVE9+ADViV6WIWIouBJiZf1AUISjOjCeFgQT6Io7Jx8wop7ENaD4EVBXRD8X6weH5CZ7paAPTOX/nVVfVU1U8PYuy3bfuMA6DTXdXR6PlHjoFLFQ95QrTEf4TyeUZt/iHPzmxrtY5LzLqV3MDh5d9TBc5xbe8rgeMS5uajObJS8a1IjdB1bFaG3qDMzyJprCtOvR7/Ro28LdHVdQjp0+wldnVmFQHcU79lFOh1XouOnVCKeE+hSGfKcNxO6GZOqYcJqEuitMjb8J/yGlehUUPNMoMteGKgkoRFt71CQDUSvewCzJE9J0NdI/gIeQUxB1sfYLzrVFmQTXq0rhDDJzUE5YpL1Jj4ROlLwltf8MFCz55h4LkUnJMvbFd9hnwzcCwkCIoBO4NaAt4kjySB6xHoZHBCZTiT96JHTv5lnEzQuTx310ALUjzx4c/yVuYAhOWUIzEaKjeVZz9N1UXhYXH8orv4AY9lfNKxlR72z3TM7jcMxAF/ZcOzsOzs2nOxs6GAjxvDaF3x7iuScs3ZVn70j65tNLJk5g9Ehtn/PqjpDK0aU1RdKO153111cuP1/MpgO/ZwbnjufiJZ2O1PMp2bal76O/WnvsTqKRmnHx+Gz6066k5kK1/3t7m6xcU0Bwf/LAdEmulE8dJdbVfl6BDroeg818WPFAAAAAElFTkSuQmCC', 'base64'));


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
INSERT INTO station (id, chain_id, name, lng, lat, status) VALUES (7,  4, 'Alexela Pärnu mnt',    24.712345, 59.420123, 'D');
INSERT INTO station (id, chain_id, name, lng, lat, status) VALUES (8,  1, 'Olerex Tartu Ringtee', 26.727890, 58.364123, 'A');
INSERT INTO station (id, chain_id, name, lng, lat, status) VALUES (9,  2, 'Circle K Tartu Kaubamaja', 26.718456, 58.380234, 'A');
INSERT INTO station (id, chain_id, name, lng, lat, status) VALUES (10, 3, 'Neste Pärnu Rääma',    24.536789, 58.385678, 'A');
INSERT INTO station (id, chain_id, name, lng, lat, status) VALUES (11, 1, 'Olerex Narva',         28.179012, 59.377345, 'A');
INSERT INTO station (id, chain_id, name, lng, lat, status) VALUES (12, 2, 'Circle K Viljandi',    25.597234, 58.363456, 'A');


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
INSERT INTO station_fuel (id, station_id, fuel_id, status) VALUES (20, 7,  1, 'D');
INSERT INTO station_fuel (id, station_id, fuel_id, status) VALUES (21, 7,  3, 'D');
-- Olerex Tartu Ringtee: 95, 98, Diisel, AdBlue
INSERT INTO station_fuel (id, station_id, fuel_id, status) VALUES (22, 8,  1, 'A');
INSERT INTO station_fuel (id, station_id, fuel_id, status) VALUES (23, 8,  2, 'A');
INSERT INTO station_fuel (id, station_id, fuel_id, status) VALUES (24, 8,  3, 'A');
INSERT INTO station_fuel (id, station_id, fuel_id, status) VALUES (25, 8,  4, 'A');
-- Circle K Tartu Kaubamaja: 95, 98, Diisel, CNG
INSERT INTO station_fuel (id, station_id, fuel_id, status) VALUES (26, 9,  1, 'A');
INSERT INTO station_fuel (id, station_id, fuel_id, status) VALUES (27, 9,  2, 'A');
INSERT INTO station_fuel (id, station_id, fuel_id, status) VALUES (28, 9,  3, 'A');
INSERT INTO station_fuel (id, station_id, fuel_id, status) VALUES (29, 9,  5, 'A');
-- Neste Pärnu Rääma: 95, 98, Diisel
INSERT INTO station_fuel (id, station_id, fuel_id, status) VALUES (30, 10, 1, 'A');
INSERT INTO station_fuel (id, station_id, fuel_id, status) VALUES (31, 10, 2, 'A');
INSERT INTO station_fuel (id, station_id, fuel_id, status) VALUES (32, 10, 3, 'A');
-- Olerex Narva: 95, Diisel
INSERT INTO station_fuel (id, station_id, fuel_id, status) VALUES (33, 11, 1, 'A');
INSERT INTO station_fuel (id, station_id, fuel_id, status) VALUES (34, 11, 3, 'A');
-- Circle K Viljandi: 95, Diisel
INSERT INTO station_fuel (id, station_id, fuel_id, status) VALUES (35, 12, 1, 'A');
INSERT INTO station_fuel (id, station_id, fuel_id, status) VALUES (36, 12, 3, 'A');


-- station_fuel_price (price history per station_fuel)
-- Olerex Ülemiste - 95 (station_fuel id=1)
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (1,  1, 1,  1.689, '2026-03-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (2,  2, 1,  1.699, '2026-03-15 09:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (3,  1, 1,  1.709, '2026-04-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (4,  3, 1,  1.719, '2026-04-15 10:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (5,  1, 1,  1.729, '2026-05-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (6,  2, 1,  1.749, '2026-05-05 09:15:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (7,  2, 1,  1.769, '2026-05-10 07:30:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (8,  1, 1,  1.779, '2026-05-20 08:00:00');
-- Olerex Ülemiste - 98 (station_fuel id=2)
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (9,  1, 2,  1.839, '2026-03-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (10, 3, 2,  1.849, '2026-03-15 10:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (11, 1, 2,  1.859, '2026-04-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (12, 2, 2,  1.869, '2026-04-20 11:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (13, 1, 2,  1.879, '2026-05-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (14, 3, 2,  1.899, '2026-05-08 10:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (15, 1, 2,  1.909, '2026-05-20 08:00:00');
-- Olerex Ülemiste - Diisel (station_fuel id=3)
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (16, 1, 3,  1.489, '2026-03-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (17, 2, 3,  1.499, '2026-03-20 09:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (18, 1, 3,  1.509, '2026-04-05 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (19, 3, 3,  1.519, '2026-04-20 10:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (20, 1, 3,  1.529, '2026-05-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (21, 2, 3,  1.549, '2026-05-07 11:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (22, 1, 3,  1.559, '2026-05-18 08:00:00');
-- Olerex Järve - 95 (station_fuel id=5)
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (23, 1, 5,  1.689, '2026-03-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (24, 2, 5,  1.699, '2026-03-15 09:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (25, 1, 5,  1.709, '2026-04-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (26, 3, 5,  1.719, '2026-04-20 10:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (27, 1, 5,  1.729, '2026-05-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (28, 2, 5,  1.749, '2026-05-10 09:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (29, 3, 5,  1.769, '2026-05-20 08:00:00');
-- Olerex Järve - Diisel (station_fuel id=6)
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (30, 1, 6,  1.489, '2026-03-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (31, 2, 6,  1.499, '2026-03-20 09:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (32, 1, 6,  1.509, '2026-04-05 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (33, 3, 6,  1.519, '2026-04-20 10:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (34, 1, 6,  1.529, '2026-05-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (35, 2, 6,  1.549, '2026-05-15 08:00:00');
-- Circle K Mustamäe - 95 (station_fuel id=7)
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (36, 1, 7,  1.699, '2026-03-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (37, 3, 7,  1.709, '2026-03-15 10:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (38, 1, 7,  1.719, '2026-04-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (39, 2, 7,  1.729, '2026-04-20 11:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (40, 1, 7,  1.739, '2026-05-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (41, 3, 7,  1.759, '2026-05-09 14:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (42, 2, 7,  1.769, '2026-05-18 08:00:00');
-- Circle K Mustamäe - Diisel (station_fuel id=9)
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (43, 1, 9,  1.499, '2026-03-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (44, 3, 9,  1.509, '2026-03-20 10:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (45, 1, 9,  1.519, '2026-04-10 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (46, 2, 9,  1.529, '2026-04-25 09:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (47, 1, 9,  1.539, '2026-05-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (48, 3, 9,  1.549, '2026-05-12 10:00:00');
-- Circle K Ülemiste - 95 (station_fuel id=11)
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (49, 1, 11, 1.699, '2026-03-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (50, 2, 11, 1.709, '2026-03-15 09:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (51, 1, 11, 1.719, '2026-04-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (52, 3, 11, 1.729, '2026-04-20 10:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (53, 1, 11, 1.739, '2026-05-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (54, 2, 11, 1.759, '2026-05-14 08:00:00');
-- Circle K Ülemiste - Diisel (station_fuel id=13)
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (55, 1, 13, 1.499, '2026-03-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (56, 3, 13, 1.509, '2026-03-20 10:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (57, 1, 13, 1.519, '2026-04-10 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (58, 2, 13, 1.529, '2026-04-25 09:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (59, 1, 13, 1.539, '2026-05-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (60, 3, 13, 1.549, '2026-05-15 08:00:00');
-- Neste Laagri - 95 (station_fuel id=14)
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (61, 1, 14, 1.679, '2026-03-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (62, 3, 14, 1.689, '2026-03-15 10:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (63, 1, 14, 1.699, '2026-04-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (64, 2, 14, 1.709, '2026-04-20 09:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (65, 1, 14, 1.719, '2026-05-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (66, 2, 14, 1.739, '2026-05-11 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (67, 3, 14, 1.749, '2026-05-20 08:00:00');
-- Neste Laagri - Diisel (station_fuel id=16)
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (68, 1, 16, 1.479, '2026-03-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (69, 3, 16, 1.489, '2026-03-20 10:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (70, 1, 16, 1.499, '2026-04-10 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (71, 2, 16, 1.509, '2026-04-25 09:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (72, 1, 16, 1.519, '2026-05-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (73, 3, 16, 1.529, '2026-05-12 10:00:00');
-- Neste Järvevana - 95 (station_fuel id=17)
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (74, 1, 17, 1.679, '2026-03-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (75, 2, 17, 1.689, '2026-03-15 09:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (76, 1, 17, 1.699, '2026-04-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (77, 3, 17, 1.709, '2026-04-20 10:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (78, 1, 17, 1.719, '2026-05-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (79, 2, 17, 1.739, '2026-05-14 08:00:00');
-- Neste Järvevana - Diisel (station_fuel id=18)
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (80, 1, 18, 1.479, '2026-03-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (81, 3, 18, 1.489, '2026-03-20 10:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (82, 1, 18, 1.499, '2026-04-10 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (83, 2, 18, 1.509, '2026-04-25 09:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (84, 1, 18, 1.519, '2026-05-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (85, 3, 18, 1.539, '2026-05-15 08:00:00');
-- Olerex Tartu Ringtee - 95 (station_fuel id=22)
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (86,  1, 22, 1.683, '2026-03-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (87,  2, 22, 1.693, '2026-03-15 09:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (88,  1, 22, 1.703, '2026-04-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (89,  3, 22, 1.713, '2026-04-20 10:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (90,  1, 22, 1.723, '2026-05-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (91,  2, 22, 1.743, '2026-05-10 09:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (92,  3, 22, 1.763, '2026-05-20 08:00:00');
-- Olerex Tartu Ringtee - 98 (station_fuel id=23)
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (93,  1, 23, 1.833, '2026-03-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (94,  3, 23, 1.843, '2026-03-15 10:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (95,  1, 23, 1.853, '2026-04-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (96,  2, 23, 1.863, '2026-04-20 11:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (97,  1, 23, 1.873, '2026-05-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (98,  3, 23, 1.893, '2026-05-15 08:00:00');
-- Olerex Tartu Ringtee - Diisel (station_fuel id=24)
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (99,  1, 24, 1.483, '2026-03-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (100, 2, 24, 1.493, '2026-03-20 09:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (101, 1, 24, 1.503, '2026-04-05 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (102, 3, 24, 1.513, '2026-04-20 10:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (103, 1, 24, 1.523, '2026-05-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (104, 2, 24, 1.543, '2026-05-15 08:00:00');
-- Circle K Tartu Kaubamaja - 95 (station_fuel id=26)
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (105, 1, 26, 1.693, '2026-03-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (106, 3, 26, 1.703, '2026-03-15 10:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (107, 1, 26, 1.713, '2026-04-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (108, 2, 26, 1.723, '2026-04-20 11:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (109, 1, 26, 1.733, '2026-05-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (110, 3, 26, 1.753, '2026-05-10 14:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (111, 2, 26, 1.763, '2026-05-20 08:00:00');
-- Circle K Tartu Kaubamaja - 98 (station_fuel id=27)
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (112, 1, 27, 1.843, '2026-03-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (113, 3, 27, 1.853, '2026-03-15 10:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (114, 1, 27, 1.863, '2026-04-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (115, 2, 27, 1.873, '2026-04-20 11:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (116, 1, 27, 1.883, '2026-05-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (117, 3, 27, 1.903, '2026-05-15 08:00:00');
-- Circle K Tartu Kaubamaja - Diisel (station_fuel id=28)
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (118, 1, 28, 1.493, '2026-03-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (119, 3, 28, 1.503, '2026-03-20 10:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (120, 1, 28, 1.513, '2026-04-10 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (121, 2, 28, 1.523, '2026-04-25 09:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (122, 1, 28, 1.533, '2026-05-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (123, 3, 28, 1.553, '2026-05-15 08:00:00');
-- Neste Pärnu Rääma - 95 (station_fuel id=30)
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (124, 1, 30, 1.685, '2026-03-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (125, 2, 30, 1.695, '2026-03-15 09:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (126, 1, 30, 1.705, '2026-04-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (127, 3, 30, 1.715, '2026-04-20 10:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (128, 1, 30, 1.725, '2026-05-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (129, 2, 30, 1.745, '2026-05-10 09:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (130, 3, 30, 1.755, '2026-05-20 08:00:00');
-- Neste Pärnu Rääma - 98 (station_fuel id=31)
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (131, 1, 31, 1.835, '2026-03-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (132, 3, 31, 1.845, '2026-03-15 10:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (133, 1, 31, 1.855, '2026-04-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (134, 2, 31, 1.865, '2026-04-20 11:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (135, 1, 31, 1.875, '2026-05-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (136, 3, 31, 1.895, '2026-05-15 08:00:00');
-- Neste Pärnu Rääma - Diisel (station_fuel id=32)
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (137, 1, 32, 1.481, '2026-03-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (138, 3, 32, 1.491, '2026-03-20 10:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (139, 1, 32, 1.501, '2026-04-10 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (140, 2, 32, 1.511, '2026-04-25 09:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (141, 1, 32, 1.521, '2026-05-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (142, 3, 32, 1.541, '2026-05-15 08:00:00');
-- Olerex Narva - 95 (station_fuel id=33)
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (143, 1, 33, 1.679, '2026-03-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (144, 2, 33, 1.689, '2026-03-15 09:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (145, 1, 33, 1.699, '2026-04-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (146, 3, 33, 1.709, '2026-04-20 10:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (147, 1, 33, 1.719, '2026-05-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (148, 2, 33, 1.739, '2026-05-12 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (149, 3, 33, 1.759, '2026-05-20 08:00:00');
-- Olerex Narva - Diisel (station_fuel id=34)
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (150, 1, 34, 1.477, '2026-03-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (151, 3, 34, 1.487, '2026-03-20 10:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (152, 1, 34, 1.497, '2026-04-10 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (153, 2, 34, 1.507, '2026-04-25 09:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (154, 1, 34, 1.517, '2026-05-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (155, 3, 34, 1.537, '2026-05-15 08:00:00');
-- Circle K Viljandi - 95 (station_fuel id=35)
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (156, 1, 35, 1.691, '2026-03-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (157, 2, 35, 1.701, '2026-03-15 09:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (158, 1, 35, 1.711, '2026-04-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (159, 3, 35, 1.721, '2026-04-20 10:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (160, 1, 35, 1.731, '2026-05-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (161, 2, 35, 1.751, '2026-05-12 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (162, 3, 35, 1.761, '2026-05-20 08:00:00');
-- Circle K Viljandi - Diisel (station_fuel id=36)
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (163, 1, 36, 1.491, '2026-03-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (164, 3, 36, 1.501, '2026-03-20 10:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (165, 1, 36, 1.511, '2026-04-10 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (166, 2, 36, 1.521, '2026-04-25 09:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (167, 1, 36, 1.531, '2026-05-01 08:00:00');
INSERT INTO station_fuel_price (id, user_id, station_fuel_id, price, time) VALUES (168, 3, 36, 1.551, '2026-05-15 08:00:00');


-- memberships
INSERT INTO membership (id, chain_id, discount, name, status) VALUES (1, 1, 0.030, 'Olerex Kuldkaart','A');
INSERT INTO membership (id, chain_id, discount, name, status) VALUES (2, 1, 0.050, 'Olerex Hõbekaart','D');
INSERT INTO membership (id, chain_id, discount, name, status) VALUES (3, 2, 0.040, 'Circle K Extra','A');
INSERT INTO membership (id, chain_id, discount, name, status) VALUES (4, 3, 0.030, 'Neste+ kaart','A');


-- user_membership
INSERT INTO user_membership (id, user_id, membership_id) VALUES (1, 2, 1);
INSERT INTO user_membership (id, user_id, membership_id) VALUES (2, 2, 3);
INSERT INTO user_membership (id, user_id, membership_id) VALUES (3, 3, 4);


-- favorite_station
INSERT INTO favorite_station (id, user_id, station_id) VALUES (1, 2, 1);
INSERT INTO favorite_station (id, user_id, station_id) VALUES (2, 2, 3);
INSERT INTO favorite_station (id, user_id, station_id) VALUES (3, 3, 5);
INSERT INTO favorite_station (id, user_id, station_id) VALUES (4, 3, 6);


-- reset sequences
SELECT setval(pg_get_serial_sequence('kutus.role',               'id'), (SELECT MAX(id) FROM kutus.role));
SELECT setval(pg_get_serial_sequence('kutus.chain',              'id'), (SELECT MAX(id) FROM kutus.chain));
SELECT setval(pg_get_serial_sequence('kutus.chain_image',        'id'), (SELECT MAX(id) FROM kutus.chain_image));
SELECT setval(pg_get_serial_sequence('kutus.fuel',               'id'), (SELECT MAX(id) FROM kutus.fuel));
SELECT setval(pg_get_serial_sequence('kutus."user"',             'id'), (SELECT MAX(id) FROM kutus."user"));
SELECT setval(pg_get_serial_sequence('kutus.station',            'id'), (SELECT MAX(id) FROM kutus.station));
SELECT setval(pg_get_serial_sequence('kutus.station_fuel',       'id'), (SELECT MAX(id) FROM kutus.station_fuel));
SELECT setval(pg_get_serial_sequence('kutus.station_fuel_price', 'id'), (SELECT MAX(id) FROM kutus.station_fuel_price));
SELECT setval(pg_get_serial_sequence('kutus.membership',         'id'), (SELECT MAX(id) FROM kutus.membership));
SELECT setval(pg_get_serial_sequence('kutus.user_membership',    'id'), (SELECT MAX(id) FROM kutus.user_membership));
SELECT setval(pg_get_serial_sequence('kutus.favorite_station',   'id'), (SELECT MAX(id) FROM kutus.favorite_station));