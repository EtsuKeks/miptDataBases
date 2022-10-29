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


insert into [Matrix] (M_id, row_id, col_id, val) values (1, 1, 1, 1)
insert into [Matrix] (M_id, row_id, col_id, val) values (1, 1, 2, 2)
insert into [Matrix] (M_id, row_id, col_id, val) values (1, 1, 3, 3)
insert into [Matrix] (M_id, row_id, col_id, val) values (1, 2, 1, 2)
insert into [Matrix] (M_id, row_id, col_id, val) values (1, 2, 2, 5)
insert into [Matrix] (M_id, row_id, col_id, val) values (1, 2, 3, 6)
insert into [Matrix] (M_id, row_id, col_id, val) values (1, 3, 1, 3)
insert into [Matrix] (M_id, row_id, col_id, val) values (1, 3, 2, 6)
insert into [Matrix] (M_id, row_id, col_id, val) values (1, 3, 3, 6)

/*
Объявим параметр, входящий в запрос:
*/

DECLARE @param as int
SET @param = 1;

/*
Выведем соответствующие результаты:
(Пользуемся здесь тем, что матрица A симметрична тогда и только когда, когда
A транспонированная совпадает с A. Значит, если мы проанализируем те строки
из A и из A транспонированная, в которых позиция (i, j) совпадает, а значение 
нет, и их окажется нулевое число, то A -- симметричная. Иначе - нет.
*/

SELECT
CASE
WHEN COUNT(*) = 0 THEN 'да'
ELSE 'нет'
END AS Ответ
FROM 
(SELECT M_id, row_id, col_id, val
FROM Matrix
WHERE M_id = @param)
AS M1,
(SELECT M_id, col_id AS row_id, row_id AS col_id, val
FROM Matrix
WHERE M_id = @param) AS M2
WHERE M1.row_id = M2.row_id AND M1.col_id = M2.col_id AND M1.val <> M2.val