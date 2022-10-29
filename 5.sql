/*
Сначала создадим матрицу и заполним ее некоторыми значениями, положим в таблицу Matrix.
Также, добавим еще одну:
*/

DROP TABLE [Matrix];

CREATE TABLE [Matrix] (
	M_id tinyint NOT NULL,
	row_id tinyint NOT NULL,
	col_id tinyint NOT NULL,
	val integer NOT NULL,
	PRIMARY KEY(M_id, col_id, row_id)
);

DELETE FROM [Matrix];

insert into [Matrix] (M_id, row_id, col_id, val) values (1, 1, 1, 1)
insert into [Matrix] (M_id, row_id, col_id, val) values (1, 1, 2, 1)
insert into [Matrix] (M_id, row_id, col_id, val) values (2, 1, 1, 2)
insert into [Matrix] (M_id, row_id, col_id, val) values (2, 1, 2, 2)
insert into [Matrix] (M_id, row_id, col_id, val) values (2, 2, 1, 2)
insert into [Matrix] (M_id, row_id, col_id, val) values (2, 2, 2, 2)

/*
Объявим параметр, входящий в запрос:
*/

DECLARE @param as int
SET @param = 1;

/*
Выведем соответствующие результаты:
*/

SELECT 
CASE 
WHEN MAX(row_id) = 1 OR MAX(col_id) = 1 THEN 'да' 
WHEN MAX(row_id) <> 1 AND MAX(col_id) <> 1 THEN 'нет'
END AS Ответ
FROM Matrix
WHERE M_id = @param
GROUP BY M_id
