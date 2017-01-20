\timing
SELECT DISTINCT make_title FROM "car_models" WHERE make_code = 'LAM'; /* 34.211ms */
SELECT DISTINCT model_title FROM "car_models" WHERE make_code = 'NISSAN' AND model_code = 'GT-R'; /* 55.425ms */
SELECT make_code, model_code, model_title, year FROM "car_models" WHERE make_code = 'LAM'; /* 31.627ms */
SELECT DISTINCT * FROM "car_models" where year >= 2010 AND year <= 2015; /* 271.374ms */
SELECT DISTINCT * FROM "car_models" where year = 2010; /* 97.321 */