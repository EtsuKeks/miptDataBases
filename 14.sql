/*
Сначала создадим матрицы и заполним их некоторыми значениями, положим в таблицу Matrix.
Мы вынужденны, для построения нетривиального примера, положить тип значений матриц A и B
как дробными. Это вытекает из того, что матрица A обязана быть ортогональной, а при
ортогональности матрицы на ее норму, и как следствие на значение ее элементов накладывается
некоторое условие, которое мы обязаны в задаче встречать. Как итог, значения матрицы A
обязаны быть числами с плавающей точкой.
*/

DROP TABLE [A];

CREATE TABLE [A] (
	row_id tinyint NOT NULL,
	col_id tinyint NOT NULL,
	val float NOT NULL,
	PRIMARY KEY(row_id, col_id)
);

DELETE FROM [A];

insert into [A] (row_id, col_id, val) values (1, 1, CAST(3 AS float)/7)
insert into [A] (row_id, col_id, val) values (1, 2, CAST(2 AS float)/7)
insert into [A] (row_id, col_id, val) values (1, 3, CAST(6 AS float)/7)
insert into [A] (row_id, col_id, val) values (2, 1, CAST(-6 AS float)/7)
insert into [A] (row_id, col_id, val) values (2, 2, CAST(3 AS float)/7)
insert into [A] (row_id, col_id, val) values (2, 3, CAST(2 AS float)/7)
insert into [A] (row_id, col_id, val) values (3, 1, CAST(2 AS float)/7)
insert into [A] (row_id, col_id, val) values (3, 2, CAST(6 AS float)/7)
insert into [A] (row_id, col_id, val) values (3, 3, CAST(-3 AS float)/7);

/*
Объявим параметры, входящие в запрос:
(Поскольку матрица A заполнена дробными числами, матрицу
B мы ради простоты тоже положим заполненной дробными числами.)
*/

DECLARE @B TABLE (row_id tinyint, col_id tinyint, val float)
INSERT INTO @B VALUES (1, 1, CAST(1 AS float)), (1, 2, CAST(2 AS float)), (1, 3, CAST(3 AS float)),
(2, 1, CAST(4 AS float)), (2, 2, CAST(5 AS float)), (2, 3, CAST(6 AS float)),
(3, 1, CAST(7 AS float)), (3, 2, CAST(8 AS float)), (3, 3, CAST(9 AS float));

/*
Выведем соответствующие результаты:
(Как хорошо известно, ортогональная матрица -- это такая
матрица, что при перемножении на себя же транспонированную
даёт единичную: A^T * A = A * A^T = E.
Чтобы найти решение уравнения AX = B, в случае если оно существует,
достаточно найти A^(-1) * B, где A^(-1) -- обратная к A матрица. При
этом оно будет единственно.
Отсюда понятно, что если дана матрица A[nxm] и B[axb], и целостность 
входного параметра A не нарушена (на вход обязательно подана именно 
ортогональная матрица A, опечаток пользователем при постановке задачи 
быть не может), то для проверки существования решения достаточно
проверить размеры матриц A и B -- операция A^T * B тогда имеет смысл,
когда a = n.
Для поиска A^T воспользуемся результатом задачи 3. Для поиска результата
умножения A^T * B -- результатом задачи 13.
*/


BEGIN TRY  
    
	DECLARE @flag BIT
	SET @flag = (
	SELECT
	CASE 
	WHEN MAX(M1.row_id) = MAX(M2.row_id) THEN 1
	ELSE 0
	END
	FROM (SELECT *
	FROM @B) AS M1,
	(SELECT *
	FROM A) AS M2);

	IF @flag = 0
		THROW 99000, 'Размеры матриц A и B не удовлетворяют необходимым 
		условиям', 1;

	SELECT M1.row_id AS row_id, M2.col_id AS col_id, SUM(M1.val * M2.val) AS val
	FROM
	(SELECT col_id AS row_id, row_id AS col_id, val
	FROM A) AS M1,
	(SELECT *
	FROM @B) AS M2
	WHERE M1.col_id = M2.row_id
	GROUP BY M1.row_id, M2.col_id
	ORDER BY row_id ASC, col_id ASC;

END TRY  
BEGIN CATCH 

    SELECT
        ERROR_MESSAGE() AS Ошибка;  

END CATCH; 