-- 5. Написать запрос для получения id и title вакансий, которые собрали больше 5 откликов в первую неделю после публикации

SELECT vacancy.id_vacancy, vacancy.name
FROM vacancy
         INNER JOIN response ON vacancy.id_vacancy = response.id_vacancy
WHERE response.time_response between vacancy.date_publish and vacancy.date_publish + interval '7 day'
GROUP BY vacancy.id_vacancy, vacancy.name
HAVING count(response.id_vacancy) > 5

