-- Агрегация с нарастающим итогом

SELECT
  date,
  amount,
  SUM(amount) OVER (ORDER BY date) AS cumulative_amount
FROM transactions;


-- Сравнение со среднимп по группе

SELECT
  id,
  category,
  price,
  ROUND(price - AVG(price) OVER (PARTITION BY category), 2) AS price_diff_from_avg
FROM products;

-- Работа с границами окна

SELECT
  log_time,
  temperature,
  ROUND(AVG(temperature) OVER (
    ORDER BY log_time 
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
  ), 2) AS moving_avg_temp
FROM temperature_logs;

-- Поиск первого и последнего значения

SELECT
  task_id,
  project_id,
  start_date,
  MIN(start_date) OVER (PARTITION BY project_id) AS first_task_date,
  MAX(start_date) OVER (PARTITION BY project_id) AS last_task_date
FROM project_tasks;
