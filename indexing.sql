DROP INDEX IF EXISTS make_code_idx;
DROP INDEX IF EXISTS make_and_model_code_idx;
DROP INDEX IF EXISTS year_idx;

SELECT DISTINCT make_title FROM "car_models" WHERE make_code = 'LAM'; /* 34.211ms */
SELECT DISTINCT model_title FROM "car_models" WHERE make_code = 'NISSAN' AND model_code = 'GT-R'; /* 55.425ms */
SELECT make_code, model_code, model_title, year FROM "car_models" WHERE make_code = 'LAM'; /* 31.627ms */
SELECT DISTINCT * FROM "car_models" where year >= 2010 AND year <= 2015; /* 271.374ms */
SELECT DISTINCT * FROM "car_models" where year = 2010; /* 97.321 */

CREATE INDEX make_code_idx ON "car_models" (make_code);
CREATE INDEX make_and_model_code_idx ON "car_models" (make_code, model_code);
CREATE INDEX year_idx ON "car_models" (year);

SELECT DISTINCT make_title FROM "car_models" WHERE make_code = 'LAM';
SELECT DISTINCT model_title FROM "car_models" WHERE make_code = 'NISSAN' AND model_code = 'GT-R';
SELECT make_code, model_code, model_title, year FROM "car_models" WHERE make_code = 'LAM';
SELECT DISTINCT * FROM "car_models" where year >= 2010 AND year <= 2015;
SELECT DISTINCT * FROM "car_models" where year = 2010;