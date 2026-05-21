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