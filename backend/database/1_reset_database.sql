-- Kustutab public schema (mis põhimõtteliselt kustutab kõik tabelid)
DROP SCHEMA IF EXISTS kutus CASCADE;
-- Loob uue public schema vajalikud õigused
CREATE SCHEMA kutus
-- taastab vajalikud andmebaasi õigused
    GRANT ALL ON SCHEMA kutus TO postgres;
GRANT ALL ON SCHEMA kutus TO PUBLIC;