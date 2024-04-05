-- Databricks notebook source
-- CREATE TABLE IF NOT EXISTS books AS SELECT * EXCEPT (_rescued_data) FROM read_files('dbfs:/user/hive/warehouse/dbacademy.db/books');
DESC dbacademy.books;

-- COMMAND ----------

Select
  *
from
  dbacademy.books;

-- COMMAND ----------

SELECT
  country,
  price
FROM
  dbacademy.books;

-- COMMAND ----------

SELECT * FROM (
  SELECT country, price FROM dbacademy.books
) PIVOT (
  sum(price) for country in ('France','Germany')
);

-- COMMAND ----------

CREATE OR REPLACE FUNCTION convert_f_to_c(temp DOUBLE)
RETURNS DOUBLE

RETURN (temp - 32) * (5/9);

-- COMMAND ----------

SELECT convert_f_to_c(100);

-- COMMAND ----------

DESCRIBE FUNCTION EXTENDED convert_f_to_c;

-- COMMAND ----------

SELECT *, CASE 
   WHEN price > 15 THEN 'expensive' 
   ELSE 'cheap' 
   END
FROM dbacademy.books;

-- COMMAND ----------

SELECT * FROM dbacademy.books ORDER BY (CASE 
   WHEN pages < 500 
   THEN pages 
   ELSE price 
END);

