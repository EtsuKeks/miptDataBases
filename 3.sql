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
insert into [Matrix] (M_id, row_id, col_id, val) values (1, 1, 2, 2)
insert into [Matrix] (M_id, row_id, col_id, val) values (1, 1, 3, 3)
insert into [Matrix] (M_id, row_id, col_id, val) values (1, 2, 1, 4)
insert into [Matrix] (M_id, row_id, col_id, val) values (1, 2, 2, 5)
insert into [Matrix] (M_id, row_id, col_id, val) values (1, 2, 3, 6)
insert into [Matrix] (M_id, row_id, col_id, val) values (2, 1, 1, 7)
insert into [Matrix] (M_id, row_id, col_id, val) values (2, 1, 2, 8)
insert into [Matrix] (M_id, row_id, col_id, val) values (2, 1, 3, 9)
insert into [Matrix] (M_id, row_id, col_id, val) values (2, 2, 1, 10)
insert into [Matrix] (M_id, row_id, col_id, val) values (2, 2, 2, 11)
insert into [Matrix] (M_id, row_id, col_id, val) values (2, 2, 3, 12)

/*
Объявим параметр, входящий в запрос:
*/

DECLARE @param as int
SET @param = 1;

/*
Выведем исходный вид матрицы:
*/

SELECT *
FROM Matrix
WHERE M_id = @param
ORDER BY row_id ASC, col_id ASC;

/*
Выведем транспонированный:
*/

SELECT M_id, col_id AS row_id, row_id AS col_id, val
FROM Matrix
WHERE M_id = @param
ORDER BY row_id ASC, col_id ASC;
