-- db indexed_cars

CREATE TABLE IF NOT EXISTS car_models
(
 id serial,
 make_code character varying(125) NOT NULL,
 make_title character varying(125) NOT NULL,
 model_code character varying(125) NOT NULL,
 model_title character varying(125) NOT NULL,
 year integer NOT NULL,
 PRIMARY KEY (id)
)

DROP INDEX IF EXISTS make_code_idx;
DROP INDEX IF EXISTS make_and_model_code_idx;
DROP INDEX IF EXISTS year_idx;

CREATE INDEX make_code_idx ON "car_models" (make_code);
CREATE INDEX make_and_model_code_idx ON "car_models" (make_code, model_code);
CREATE INDEX year_idx ON "car_models" (year);