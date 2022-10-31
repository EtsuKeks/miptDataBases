IF (OBJECT_ID('CSV_Export') IS NOT NULL) DROP TABLE dbo.CSV_Export;

CREATE TABLE CSV_Export (
	PassengerId INT,
	Survived INT,
	Pclass INT,
	Name VARCHAR(200),
	Sex VARCHAR(200),
	Age FLOAT,
	SibSp INT,
	Parch INT,
	Ticket VARCHAR(200),
	Fare FLOAT,
	Cabin VARCHAR(200),
	EMBARKED VARCHAR(200)
)

BULK INSERT dbo.CSV_Export
FROM 'C:\Users\timur\Desktop\БД\МДЗ2\Titanic_train_edit.csv'
WITH (firstrow = 2, fieldterminator = ';', rowterminator = '\n');

/*
Проверка корректности импорта:
*/

SELECT *
FROM CSV_Export;

/*
Запросы:
*/

/*
1.	Выведите суммарное колво пассажиров и колво выживших. Вычислите долю выживших:
*/

SELECT (SUM(Survived)) AS [Всего выжило], (MAX(PassengerId)) AS [Общее количество пассажиров], 
ROUND((CAST(SUM(Survived) AS float) / MAX(PassengerId)), 3) AS [Доля выживших]
FROM CSV_Export;

/*
2.	Посчитайте по каждому классу билета суммарное колво пассажиров и колво выживших. Вычислите долю выживших по каждому классу билета:
*/

SELECT (SUM(Survived)) AS [Всего выжило], (COUNT(PassengerId)) AS [Общее количество пассажиров], 
ROUND((CAST(SUM(Survived) AS float) / MAX(PassengerId)), 3) AS [Доля выживших], Pclass
FROM CSV_Export
GROUP BY Pclass
ORDER BY Pclass ASC;

/*
3.	По каждому классу билета и полу пассажира посчитайте: суммарное колво пассажиров, колво выживших и долю выживших:
*/

SELECT (SUM(Survived)) AS [Всего выжило], (COUNT(PassengerId)) AS [Общее количество пассажиров], 
ROUND((CAST(SUM(Survived) AS float) / MAX(PassengerId)), 3) AS [Доля выживших], Pclass, Sex
FROM CSV_Export
GROUP BY Pclass, Sex
ORDER BY Pclass ASC, Sex ASC;

/*
4.	По каждому порту отправления посчитайте колво пассажиров, колво выживших и долю выживших:
*/

SELECT (SUM(Survived)) AS [Всего выжило], (COUNT(PassengerId)) AS [Общее количество пассажиров], 
ROUND((CAST(SUM(Survived) AS float) / MAX(PassengerId)), 3) AS [Доля выживших], EMBARKED
FROM CSV_Export
WHERE EMBARKED IS NOT NULL
GROUP BY EMBARKED;

/*
5.	Выведите порт отправления с наибольшим колвом пассажиров:
*/

SELECT TOP 1 WITH TIES (COUNT(PassengerId)) AS [Максимальное число пассажиров], EMBARKED
FROM CSV_Export
WHERE EMBARKED IS NOT NULL
GROUP BY EMBARKED
ORDER BY COUNT(PassengerId) DESC;

/*
6.	Посчитайте средний возраст пассажиров и средний возраст выживших в группировке по классу билета и полу. При подсчете 
среднего возврата посмотрите, а как у Вас проимпортировались данные, где возраст указан не был. Если как NULL, то средний 
возраст посчитается верно при использовании AVG (позже изучим обработку NULL значений), иначе, если неизвестные возраста 
заменились на 0, подумайте, как правильно посчитать средний возраст только по ненулевым age? (хинт: CASE WHEN):
*/

SELECT AVG(CASE WHEN Age IS NOT NULL THEN Age END) AS [Средний возраст пассажиров], 
AVG(CASE WHEN Survived = 1 AND Age IS NOT NULL THEN Age END) AS [Средний возраст выживших], Pclass, Sex
FROM CSV_Export
GROUP BY Pclass, Sex
ORDER BY Pclass ASC, Sex ASC;

/*
7.	Выведите первые 10 строк по убыванию стоимости билета. Как Вы считаете, стоимость билета указана на человека?:

(На всю группу, очевидно. К примеру см строки 4, 12. Цена отличается в два раза, хотя кабины соседние и классы
одинаковые)
*/

SELECT TOP 10 Fare 
FROM CSV_Export
ORDER BY Fare DESC;

/*
8.	Проверьте, есть ли билеты, для которых цена в разных строках отличается? Аналогично для порта отправления (можно в два запроса):

(Не понял смысл первого запроса..)
*/

SELECT COUNT(*) AS [Количество строк с разными ценами, без группировки по портам]
FROM (SELECT DISTINCT Fare
FROM CSV_Export) AS T;

SELECT COUNT(*) AS [Количество строк с разными ценами, с группировкой по портам], EMBARKED
FROM 
(SELECT DISTINCT Fare, EMBARKED
FROM CSV_Export) AS T
WHERE EMBARKED IS NOT NULL
GROUP BY EMBARKED;

/*
9.	Для каждого номера билета, класса, цены и порта отправления посчитайте колво строк (колво пассажиров), колво выживших пассажиров:
*/

SELECT (SUM(Survived)) AS [Всего выжило], Ticket, Pclass, Fare, EMBARKED
FROM CSV_Export
WHERE EMBARKED IS NOT NULL
GROUP BY Ticket, Pclass, Fare, EMBARKED
ORDER BY EMBARKED ASC, Pclass DESC, Ticket ASC, Fare ASC;

/*
10.	Выведите билеты, для которых колво пассажиров более 1 и все пассажиры выжили:
*/

SELECT Ticket, COUNT(PassengerId) AS [Количество пассажиров]
FROM CSV_Export
GROUP BY Ticket
HAVING COUNT(PassengerId) > 1 AND SUM(Survived) = COUNT(PassengerId);

/*
11.	Напишите запрос, который посчитает вероятность выжить, если Вас зовут Elizabeth, если Вас зовут Mary 
(достаточно посчитать, что такая подстрока должна входить в имя пассажира):
*/

SELECT ROUND((CAST(SUM(Survived) AS float) / MAX(PassengerId)), 3) AS [Доля выживших], 'Elizabeth' AS Имя
FROM CSV_Export
WHERE Name LIKE '%Elizabeth%'
UNION
SELECT ROUND((CAST(SUM(Survived) AS float) / MAX(PassengerId)), 3) AS [Доля выживших], 'Mary' AS Имя
FROM CSV_Export
WHERE Name LIKE '%Mary%'