-- В этом задании написала идеи индексов, не опираясь только на данные из task1.

---------- Индексы для поиска вакансий ----------

-- по локации // по умолчанию B-tree
CREATE INDEX vacancy_compensation_from_idx ON vacancy (id_area);

-- по локации и компенсации
CREATE INDEX vacancy_area_compensation_from_idx ON vacancy (id_area, compensation_from);

-- по локации и специализации
CREATE INDEX vacancy_area_spec_idx ON vacancy (id_area, id_spec);

-- Для отображения вакансий на карте можно построить k-d tree
-- (при условии, что работодатель указывает адрес(т.е. координаты points(latitude, longitude))
CREATE INDEX employer_location_idx on employer using spgist(coordinates kd_point_ops);


-- Для простой реализации опции "к Вашему резюме подходят эти вакансии" можно аналогично индексу выше построить пространственный индекс для описаний вакансий.
-- Для этого сначала текстовое описание вакансии нужно представить в виде вектора в семантическом пространстве (для простоты можно использовать модель word2vec (doc2vec)),
-- затем построить пространственный индекс на получившихся векторах.
-- Повторить эти действия и для описания резюме. Таким образом можно предложить подходящие вакансии соискателю.


---------- Индексы для поиска резюме ----------
-- по локации
CREATE INDEX cv_location_idx ON cv (id_area);

-- по специализации
CREATE INDEX cv_spec_idx ON cv_specialization(id_spec);

-- по дате обновления резюме
CREATE INDEX cv_update_idx ON cv (date_update);

