-- 2. Заполнить базу данных тестовыми данными
-- (порядка 10к вакансий и 100к резюме)

WITH test_data_specialization as (
    SELECT md5(random()::text)
    FROM generate_series(1, 10)
)
INSERT INTO specialization(name)
SELECT *
FROM test_data_specialization;


WITH test_data_area as (
    SELECT md5(random()::text)
    FROM generate_series(1, 100)
)
INSERT INTO area(name)
SELECT *
FROM test_data_area;

--truncate table employer cascade ;
WITH test_data_employer as (
    SELECT md5(random()::text),
           trunc(random() * 100) + 1
    FROM generate_series(1, 100)
)
INSERT INTO employer(name, id_area)
SELECT *
FROM test_data_employer;


WITH test_data_person as (
    SELECT md5(random()::text),
           md5(random()::text),
           md5(random()::text),
           trunc(random() * 1e5) + 1
    FROM generate_series(1, 1e4)
)
INSERT INTO person(first_name, second_name, middle_name, phone_number)
SELECT *
FROM test_data_person;


WITH test_data_vacancy as (
    SELECT md5(random()::text),
           trunc(random() * 100) + 1,
           trunc(random() * 100) + 1,
           trunc(random()),
           trunc(random() + 10) + 1,
           trunc(random() * 10) + 1,
           random() > 0.5
    FROM generate_series(1, 1e4)
)
INSERT INTO vacancy(name, id_area, id_employer, compensation_from, compensation_to, id_spec, is_active)
SELECT *
FROM test_data_vacancy;


WITH test_data_cv as (
    SELECT md5(random()::text),
           trunc(random() * 1e4) + 1,
           trunc(random() * 100) + 1,
           random() > 0.5,
           md5(random()::text)
    FROM generate_series(1, 1e5)
)
INSERT INTO cv(name, id_person, id_area, is_active, description)
SELECT *
FROM test_data_cv;


WITH test_data_response as (
    SELECT trunc(random() * 1e5) + 1,
           trunc(random() * 1e4) + 1,
           md5(random()::text)
    FROM generate_series(1, 1e6)
)
INSERT INTO response(id_cv, id_vacancy, cover_letter)
SELECT *
FROM test_data_response;

