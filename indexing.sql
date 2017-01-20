SELECT DISTINCT make_title FROM "car_models" WHERE make_code = 'LAM';
SELECT DISTINCT model_title FROM "car_models" WHERE make_code = 'NISSAN' AND model_code = 'GT-R';
SELECT make_code, model_code, model_title, year FROM "car_models" WHERE make_code = 'LAM';
SELECT DISTINCT * FROM "car_models" where year >= 2010 AND year <= 2015;
SELECT DISTINCT * FROM "car_models" where year = 2010;