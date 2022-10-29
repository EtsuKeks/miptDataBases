﻿/*
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
insert into [Matrix] (M_id, row_id, col_id, val) values (2, 1, 3, 2)
insert into [Matrix] (M_id, row_id, col_id, val) values (2, 2, 1, 2)
insert into [Matrix] (M_id, row_id, col_id, val) values (2, 2, 2, 2)
insert into [Matrix] (M_id, row_id, col_id, val) values (2, 2, 3, 2)

/*
Объявим параметры, входящие в запрос:
*/

DECLARE @param1 as int
SET @param1 = 1;

DECLARE @param2 as int
SET @param2 = 2;

/*
Выведем соответствующие результаты:
(Воспользуемся результатами задачи 10 для проверки складываемости.
Также, здесь мы наблюдаем возможность возникновения ошибки, явно классифицируемой
как исключение. Воспользуемся здесь механизмом обработки исключений в MSSQL.)
*/

BEGIN TRY  
    
	DECLARE @flag BIT
	SET @flag = (SELECT		
	CASE
	WHEN MAX(M1.row_id) = MAX(M2.row_id) AND MAX(M1.col_id) = MAX(M2.col_id) THEN 1
	ELSE 0
	END
	FROM 
	(SELECT *
	FROM Matrix
	WHERE M_id = @param1) AS M1,
	(SELECT *
	FROM Matrix
	WHERE M_id = @param2) AS M2);

	IF @flag = 0
		THROW 99000, 'Матрицы невозможно сложить', 1;

	SELECT M1.row_id AS row_id, M1.col_id AS col_id, (M1.val + M2.val) AS val
	FROM 
	(SELECT *
	FROM Matrix
	WHERE M_id = @param1) AS M1,
	(SELECT *
	FROM Matrix
	WHERE M_id = @param2) AS M2
	WHERE M1.row_id = M2.row_id AND M1.col_id = M2.col_id
	ORDER BY row_id ASC, col_id ASC;

END TRY  
BEGIN CATCH 

    SELECT
        ERROR_MESSAGE() AS Ошибка;  

END CATCH; 