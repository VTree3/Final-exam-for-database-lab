USE LugiOh
GO
SELECT *FROM Cards



--1
SELECT
	[CustomerName] = c.CustomerName,
	c.customerGender,
	c.CustomerPhone,
	c.CustomerAddress,
	c.CustomerDOB
FROM customer c
WHERE c.customerName LIKE '%l%'

--2
SELECT
	c.CustomerName,
	c.CustomerGender,
	c.CustomerPhone,
	c.customeraddress,
	[Transaction Month] = DATENAME(MONTH,ht.transactiondate)
FROM customer c, HeaderTransaction ht
WHERE ht.CustomerID = c.CustomerID
	AND c.CustomerID LIKE 'CU002'

--3
SELECT
	[CardName] = LOWER(ca.CardName),
	ca.CardElement,
	ca.CardLevel,
	ca.CardAttack,
	ca.CardDefense,
	[Total Transaction] = CAST(COUNT(ht.transactionID) AS VARCHAR) + ' time(s)' --kalau ikuti output soal
FROM Cards ca, HeaderTransaction ht, DetailTransaction dt
WHERE dt.CardsID = ca.CardsID 
	AND ht.TransactionID = dt.TransactionID
	AND ca.CardElement LIKE 'Dark'
GROUP BY ca.cardName, ca.CardElement, ca.CardLevel, ca.CardAttack, ca.CardDefense

--4
SELECT
	ca.CardName,
	ca.CardElement,
	[Total Price] = SUM(ca.CardPrice),
	[Total Transaction] = CAST(COUNT(ht.transactionID) AS VARCHAR) + ' time(s)' --kalau ikuti output soal
FROM cards ca, HeaderTransaction ht, DetailTransaction dt
WHERE 
	dt.CardsID = ca.CardsID 
	AND ht.TransactionID = dt.TransactionID
	AND DATEDIFF(MONTH,   ht.TransactionDate, '2017-12-31') > 8
GROUP BY ca.CardName, ca.CardElement
UNION
SELECT
	ca.CardName,
	ca.CardElement,
	[Total Price] = SUM(ca.CardPrice),
	[Total Transaction] = CAST(COUNT(ht.transactionID) AS VARCHAR) + ' time(s)' --kalau ikuti output soal
FROM cards ca, HeaderTransaction ht, DetailTransaction dt
WHERE 
	dt.CardsID = ca.CardsID 
	AND ht.TransactionID = dt.TransactionID
	AND ca.CardPrice > 500000
	GROUP BY ca.CardName, ca.CardElement
	ORDER BY ca.CardName ASC


--5
SELECT
	c.CustomerName,
	c.CustomerGender,
	[CustomerDOB] = CONVERT(VARCHAR, c.customerDOB, 107)
FROM customer c, headertransaction ht
WHERE c.customerID = ht.CustomerID
	--AND DAY(ht.TransactionDate) IN(5)
	AND DATEPART(weekday, ht.transactiondate) IN ('5')  --pakai datepart kan hasilnya integer?
	--AND DATENAME(weekday, ht.transactiondate) IN ('Friday') --bukannya harusnya begini?? Atau mungkin saya salah ): 

--6
SELECT
	ca.CardName,
	[Type] = UPPER(cat.CardTypeName),
	ca.CardElement,
	[Total Card] = CAST(dt.quantity AS VARCHAR) + ' Cards',
	[Total Price] = ca.CardPrice * dt.quantity
FROM cards ca, DetailTransaction dt, CardType cat, (SELECT Average = AVG(ca.CardPrice) FROM cards ca) as alias
WHERE ca.CardsID = dt.CardsID
	AND ca.CardTypeID = cat.CardTypeID
	AND ca.cardprice < alias.Average
	AND ca.CardElement LIKE 'Dark'
GROUP BY ca.CardName, cat.CardTypeName, ca.CardElement, ca.CardPrice, dt.Quantity
ORDER BY dt.Quantity ASC

--7
CREATE VIEW DragonDeck AS
SELECT
	SUBSTRING(ca.CardName, 1, CHARINDEX(' ', ca.CardName)-1) AS [Monster Card],
	cat.CardTypeName,
	ca.CardElement,
	ca.CardLevel,
	ca.CardAttack,
	ca.CardDefense
FROM cards ca, CardType cat
WHERE ca.CardTypeID = cat.CardTypeID
	AND cat.CardTypeName LIKE 'Dragon'
	GO
SELECT *FROM DragonDeck

--8
CREATE VIEW MayTransaction AS
SELECT
	c.CustomerName, 
	c.CustomerPhone,
	s.StaffName,
	s.StaffPhone,
	ht.TransactionDate,
	[Sold Card] = SUM(dt.quantity)
FROM customer c, staff s, HeaderTransaction ht, DetailTransaction dt
WHERE
	c.CustomerID = ht.CustomerID
	AND ht.TransactionID = dt.TransactionID
	AND s.StaffID = ht.StaffID
	AND MONTH(ht.TransactionDate) = 5
	AND c.CustomerGender LIKE 'Female'
GROUP BY c.CustomerName, c.CustomerPhone, s.StaffName, s.StaffPhone, ht.TransactionDate
GO
SELECT *FROM MayTransaction

--9
BEGIN TRAN
ALTER TABLE Staff
	ADD StaffSalary int
ALTER TABLE Staff
	ADD CONSTRAINT staff_salary_constraint CHECK(StaffSalary > 100000)
ROLLBACK
COMMIT
SELECT *FROM Staff

--10
BEGIN TRAN
UPDATE Cards
	set CardPrice = CardPrice - 200000
	FROM CardType cat, DetailTransaction dt
	WHERE cards.CardTypeID = cat.CardTypeID
		AND dt.CardsID = cards.cardsID
		AND cat.CardTypeName LIKE 'Divine-Beast'
		AND dt.Quantity > 10
ROLLBACK
COMMIT
SELECT *FROM Cards

