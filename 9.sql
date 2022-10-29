/*
Сначала создадим матрицу D как в примере и заполним ее некоторыми значениями, 
положим в таблицу D, таблицу при этом сохраним в базе.
*/


DROP TABLE [D];

CREATE TABLE [D] (	
	row_id tinyint NOT NULL,
	col_id tinyint NOT NULL,
	PRIMARY KEY(row_id, col_id)
);

DELETE FROM [D];

insert into [D] (row_id, col_id) values (1, 2)
insert into [D] (row_id, col_id) values (3, 3)
insert into [D] (row_id, col_id) values (3, 1);

/*
Создадим матрицу A как в примере и заполним ее некоторыми значениями, 
положим в таблицу A, объявленную как переменную.
*/

DECLARE @A TABLE (row_id tinyint, col_id tinyint, val integer)
INSERT INTO @A VALUES (1, 1, 1), (1, 2, 4), (1, 3, 7), (2, 1, 2), 
(2, 2, 5), (2, 3, 8), (3, 1, 3), (3, 2, 6), (3, 3, 9);

/*
Выведем соответствующие результаты:
*/

SELECT M1.row_id AS row_id, M1.col_id AS col_id, val
FROM D AS M1, @A AS M2
WHERE M1.row_id = M2.row_id AND M1.col_id = M2.col_id