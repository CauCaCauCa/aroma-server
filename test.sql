select * from Products p where p.typeID = 1

SELECT data FROM Cart WHERE phone='0356415082'
go

INSERT Invoice(phone, detail, time_order, address, isInvoice) VAlUES (N'0356415082', N'sos', 23122312, N'sos', 1)


SELECT * FROM Invoice


select count(b.name) as amount from Brand b

UPDATE Products SET name = 'trong tien' where proID = 'P021'

DELETE FROM Products where proID='P021';  


select * from Products
order by price desc