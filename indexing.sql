DROP USER IF EXISTS indexed_cars_user;
CREATE USER indexed_cars_user;
DROP DATABASE IF EXISTS indexed_cars;
CREATE DATABASE indexed_cars OWNER indexed_cars_user;
DROP TABLE IF EXISTS car_models;
\i scripts/car_models.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;

-- *** delete indexes before every test ***
DROP INDEX IF EXISTS make_code_idx;
DROP INDEX IF EXISTS make_and_model_code_idx;
DROP INDEX IF EXISTS year_idx;

-- *** before indexing ***
SELECT DISTINCT make_title FROM "car_models" WHERE make_code = 'LAM'; /* 34.211ms */
SELECT DISTINCT model_title FROM "car_models" WHERE make_code = 'NISSAN' AND model_code = 'GT-R'; /* 55.425ms */
SELECT make_code, model_code, model_title, year FROM "car_models" WHERE make_code = 'LAM'; /* 31.627ms */
SELECT DISTINCT * FROM "car_models" where year >= 2010 AND year <= 2015; /* 271.374ms */
SELECT DISTINCT * FROM "car_models" where year = 2010; /* 97.321 */

-- *** indexing ***
CREATE INDEX make_code_idx ON "car_models" (make_code);
CREATE INDEX make_and_model_code_idx ON "car_models" (make_code, model_code);
CREATE INDEX year_idx ON "car_models" (year);

-- *** after indexing ***
SELECT DISTINCT make_title FROM "car_models" WHERE make_code = 'LAM'; /* 1.367ms */
SELECT DISTINCT model_title FROM "car_models" WHERE make_code = 'NISSAN' AND model_code = 'GT-R';  /* 0.535ms */
SELECT make_code, model_code, model_title, year FROM "car_models" WHERE make_code = 'LAM'; /* 1.796ms */
SELECT DISTINCT * FROM "car_models" where year >= 2010 AND year <= 2015; /* 195.350ms */
SELECT DISTINCT * FROM "car_models" where year = 2010; /* 33.696ms */