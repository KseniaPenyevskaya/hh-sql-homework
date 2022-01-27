-- 1. Спроектировать базу данных hh
-- (основные таблицы: вакансии, резюме, отклики, специализации).
-- По необходимым столбцам ориентироваться на сайт hh.ru

-- основные таблицы: специализации
CREATE TABLE specialization
(
    id_spec serial primary key,
    name    text not null
);


CREATE TABLE area
(
    id_area serial primary key,
    name    text not null
);


CREATE TABLE employer
(
    id_employer serial primary key,
    name        text,
    id_area     int references area (id_area) not null
);


CREATE TABLE person
(
    id_person    serial primary key,
    first_name   text    not null,
    second_name  text    not null,
    middle_name  text,
    phone_number integer not null
);

-- основные таблицы: вакансии
CREATE TABLE vacancy
(
    id_vacancy        serial primary key,
    name              text    not null,
    id_area           integer references area (id_area),
    id_employer       integer not null references employer (id_employer),
    compensation_from integer,
    compensation_to   integer,
    id_spec           integer references specialization (id_spec),
    date_publish      timestamp default now(),
    is_active         bool    not null
);

-- основные таблицы: резюме
CREATE TABLE cv
(
    id_cv        serial primary key,
    name         text      not null,
    id_person    integer references person (id_person),
    id_area      integer references area (id_area),
    date_publish timestamp not null default now(),
    is_active    bool      not null,
    description  text
);


CREATE TABLE skill_tag
(
    id_skill serial primary key,
    name     text
);

-- таблички many-to-many: резюме -- специализация, резюме -- тэг навыков
CREATE TABLE cv_specialization
(
    id_cv   integer references cv (id_cv),
    id_spec integer references specialization (id_spec)
);


CREATE TABLE cv_skill
(
    id_cv    integer references cv (id_cv),
    id_skill integer references skill_tag (id_skill)
);

-- основные таблицы: отклики
CREATE TABLE response
(
    id_response   serial primary key,
    id_cv         integer references cv (id_cv),
    id_vacancy    integer references vacancy (id_vacancy),
    time_response timestamp not null default now(),
    cover_letter  text
);

