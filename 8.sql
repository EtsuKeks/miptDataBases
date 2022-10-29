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
insert into [Matrix] (M_id, row_id, col_id, val) values (1, 1, 3, 1)
insert into [Matrix] (M_id, row_id, col_id, val) values (1, 1, 4, 2)
insert into [Matrix] (M_id, row_id, col_id, val) values (1, 2, 1, 1)
insert into [Matrix] (M_id, row_id, col_id, val) values (1, 2, 2, 1)
insert into [Matrix] (M_id, row_id, col_id, val) values (1, 2, 3, 1)
insert into [Matrix] (M_id, row_id, col_id, val) values (1, 2, 4, 1)
insert into [Matrix] (M_id, row_id, col_id, val) values (1, 3, 1, 1)
insert into [Matrix] (M_id, row_id, col_id, val) values (1, 3, 2, 2)
insert into [Matrix] (M_id, row_id, col_id, val) values (1, 3, 3, 1)
insert into [Matrix] (M_id, row_id, col_id, val) values (1, 3, 4, 2)

/*
Объявим параметр, входящий в запрос:
*/

DECLARE @param as int
SET @param = 1;

/*
Выведем необработанную матрицу (для сравнения):
*/

SELECT *
FROM Matrix
WHERE M_id = @param
ORDER BY row_id ASC, col_id ASC;

/*
Выведем соответствующие результаты:
*/

SELECT M_id, (row_id / 2 + 1) as row_id, (col_id / 2) as col_id, val
FROM Matrix
WHERE M_id = @param AND row_id % 2 = 1 AND col_id % 2 = 0
ORDER BY row_id ASC, col_id ASC