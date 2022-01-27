-- 4. Написать запрос для получения месяца с наибольшим количеством вакансий
-- и месяца с наибольшим количеством резюме

WITH max_vacancies as (
    SELECT count(id_vacancy) vacancy_num, date_part('month', date_publish) as month
    FROM vacancy
    GROUP BY month
    ORDER BY vacancy_num desc
    LIMIT 1
),
     max_cvs as (
         SELECT count(id_cv) cv_num, date_part('month', date_publish) as month
         FROM cv
         GROUP BY month
         ORDER BY cv_num desc
         LIMIT 1
     )
SELECT max_vacancies.month as max_vac_month,
       max_cvs.month       as max_cv_month
FROM max_vacancies,
     max_cvs

