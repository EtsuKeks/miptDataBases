/*
Сначала создадим матрицу и заполним ее некоторыми значениями, положим в таблицу Matrix.
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

insert into [Matrix] (M_id, row_id, col_id, val) values (1, 1, 1, 7)
insert into [Matrix] (M_id, row_id, col_id, val) values (1, 1, 2, 8)
insert into [Matrix] (M_id, row_id, col_id, val) values (1, 1, 3, 9)
insert into [Matrix] (M_id, row_id, col_id, val) values (1, 2, 1, 10)
insert into [Matrix] (M_id, row_id, col_id, val) values (1, 2, 2, 11)
insert into [Matrix] (M_id, row_id, col_id, val) values (1, 2, 3, 12)
insert into [Matrix] (M_id, row_id, col_id, val) values (1, 3, 1, 13)
insert into [Matrix] (M_id, row_id, col_id, val) values (1, 3, 2, 14)
insert into [Matrix] (M_id, row_id, col_id, val) values (1, 3, 3, 15)

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
WHEN MAX(col_id) = MAX(row_id) THEN 'да'
WHEN MAX(col_id) <> MAX(row_id) THEN 'нет'
END AS Ответ
FROM Matrix
WHERE M_id = @param
