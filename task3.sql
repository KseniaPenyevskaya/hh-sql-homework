-- 3. Написать запрос для получения средних значений по регионам (area_id) следующих величин:
-- compensation_from, compensation_to, среднее_арифметическое_from_и_to

SELECT id_area,
       avg(compensation_from)                         avg_from,
       avg(compensation_to)                           avg_to,
       avg((compensation_to + compensation_from) / 2) avg_arithmetic_mean
FROM vacancy
GROUP BY id_area;


-- Если нужно глазами посмотреть на статистику с названиями регионов(текст, а не id)
SELECT area.name,
       avg_comp.avg_from,
       avg_comp.avg_to,
       avg_comp.avg_arithmetic_mean
FROM (
         SELECT id_area,
                avg(compensation_from)                         avg_from,
                avg(compensation_to)                           avg_to,
                avg((compensation_to + compensation_from) / 2) avg_arithmetic_mean
         FROM vacancy
         GROUP BY id_area
     ) as avg_comp
         INNER JOIN area ON area.id_area == avg_comp.id_area

