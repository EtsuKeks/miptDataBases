/*
Сначала создадим матрицы и заполним их некоторыми значениями, положим в таблицу Matrix.
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
insert into [Matrix] (M_id, row_id, col_id, val) values (1, 1, 3, 1)
insert into [Matrix] (M_id, row_id, col_id, val) values (1, 2, 1, 1)
insert into [Matrix] (M_id, row_id, col_id, val) values (1, 2, 2, 1)
insert into [Matrix] (M_id, row_id, col_id, val) values (1, 2, 3, 1)
insert into [Matrix] (M_id, row_id, col_id, val) values (2, 1, 1, 2)
insert into [Matrix] (M_id, row_id, col_id, val) values (2, 1, 2, 2)
insert into [Matrix] (M_id, row_id, col_id, val) values (2, 2, 1, 2)
insert into [Matrix] (M_id, row_id, col_id, val) values (2, 2, 2, 2)
insert into [Matrix] (M_id, row_id, col_id, val) values (2, 3, 1, 2)
insert into [Matrix] (M_id, row_id, col_id, val) values (2, 3, 2, 2)

/*
Объявим параметры, входящие в запрос:
*/

DECLARE @param1 as int
SET @param1 = 1;

DECLARE @param2 as int
SET @param2 = 2;

/*
Выведем соответствующие результаты:
(Матрицы A[nxm] и B[axb] перемножить (в порядке A x B) можно тогда и только тогда,
когда m = a. Значит, количество столбцов матрицы A должно совпадать с количеством
строк матрицы B.)
*/

SELECT
CASE 
WHEN MAX(M1.col_id) = MAX(M2.row_id) THEN 'да'
ELSE 'нет'
END AS Ответ
FROM (SELECT *
FROM Matrix
WHERE M_id = @param1) AS M1,
(SELECT *
FROM Matrix
WHERE M_id = @param2) AS M2;