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


select size, color ,count(size) as gh
from test t
group by size, color


select sum(count(size)) as gh
	from test t
	group by size, color

UPDATE acc_login SET session = 'oke' WHERE [user] = 'admin'

insert acc_login([user], password) values (N'acc1', N'123')

SELECT i.phone, i.detail, i.time_order, i.address, i.payment, i.isInvoice, a.name FROM Invoice i JOIN AccountCustomer a on i.phone = a.phone ORDER BY time_order desc


UPDATE Invoice SET isInvoice = 1 WHERE phone = '' AND time_order = ''

DELETE FROM Invoice WHERE phone = '' AND time_order = ''



insert AccountCustomer(phone, name, password, sessionKey) values ('0356415081', N'tein', N'pass', 0)

