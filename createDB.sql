USE [master]
GO

/*******************************************************************************
   Drop database if it exists
********************************************************************************/
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'Perfume')
BEGIN
	ALTER DATABASE [Perfume] SET OFFLINE WITH ROLLBACK IMMEDIATE;
	ALTER DATABASE [Perfume] SET ONLINE;
	DROP DATABASE [Perfume];
END

GO

CREATE DATABASE [Perfume]
GO

USE [Perfume]
GO

/*******************************************************************************
	Drop tables if exists
*******************************************************************************/
DECLARE @sql nvarchar(MAX) 
SET @sql = N'' 

SELECT @sql = @sql + N'ALTER TABLE ' + QUOTENAME(KCU1.TABLE_SCHEMA) 
    + N'.' + QUOTENAME(KCU1.TABLE_NAME) 
    + N' DROP CONSTRAINT ' -- + QUOTENAME(rc.CONSTRAINT_SCHEMA)  + N'.'  -- not in MS-SQL
    + QUOTENAME(rc.CONSTRAINT_NAME) + N'; ' + CHAR(13) + CHAR(10) 
FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS AS RC 

INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS KCU1 
    ON KCU1.CONSTRAINT_CATALOG = RC.CONSTRAINT_CATALOG  
    AND KCU1.CONSTRAINT_SCHEMA = RC.CONSTRAINT_SCHEMA 
    AND KCU1.CONSTRAINT_NAME = RC.CONSTRAINT_NAME 

EXECUTE(@sql) 

GO
DECLARE @sql2 NVARCHAR(max)=''

SELECT @sql2 += ' Drop table ' + QUOTENAME(TABLE_SCHEMA) + '.'+ QUOTENAME(TABLE_NAME) + '; '
FROM   INFORMATION_SCHEMA.TABLES
WHERE  TABLE_TYPE = 'BASE TABLE'

Exec Sp_executesql @sql2 
GO

/*******************************************************************************
	Create new tables
*******************************************************************************/

CREATE TABLE AccountCustomer
( 
	phone VARCHAR(11) NOT NULL,
	name VARCHAR(25) NOT NULL,
	password VARCHAR(25) NOT NULL,
	sessionKey BIGINT NOT NULL,
	PRIMARY KEY (phone)
);
go


CREATE TABLE Brand
( 
	brandID VARCHAR(3) NOT NULL,
	name VARCHAR(50) NOT NULL,
	PRIMARY KEY (brandID)
);
go

CREATE TABLE Type
( 
	TypeID VARCHAR(3) NOT NULL,
	name VARCHAR(10) NOT NULL,
	PRIMARY KEY (TypeID)
);
go

CREATE TABLE Products
( 
	proID VARCHAR(5) NOT NULL,
	name VARCHAR(150) NOT NULL,
	brandID VARCHAR(3) NOT NULL,
	price float NOT NULL,
	quantity int NOT NULL,
	intro NVARCHAR(4000) NOT NULL,
	origin NVARCHAR(15) NOT NULL,
	typeID VARCHAR(3) NOT NULL,
	img_path1 VARCHAR(100) NOT NULL,
	img_path2 VARCHAR(100),
	img_path3 VARCHAR(100),
	PRIMARY KEY (proID),
	FOREIGN KEY (brandID) REFERENCES Brand(brandID),
	FOREIGN KEY (typeID) REFERENCES Type(typeID),
);
go

CREATE TABLE Invoice
( 
	phone VARCHAR(11) NOT NULL,
	detail VARCHAR(500) NOT NULL,
	time_order BIGINT NOT NULL,
	address NVARCHAR(300) NOT NULL,
	payment VARCHAR(50) NOT NULL,
	isInvoice bit, --boolean,
	PRIMARY KEY (phone, time_order),
	FOREIGN KEY (phone) REFERENCES AccountCustomer(phone),
);
go		

insert AccountCustomer(phone, name, password, sessionKey) values (N'0356415082', N'tiennt', N'123', 1)
insert AccountCustomer(phone, name, password, sessionKey) values (N'0942250655', N'dotien', N'123', 1)
go

INSERT [dbo].[Brand] ([brandID], [name]) VAlUES (1, N'Armaf')
INSERT [dbo].[Brand] ([brandID], [name]) VAlUES  (2, N'Christian Dior')
INSERT Brand(brandID,name) VAlUES (3, N'DSQUARED2')
INSERT Brand(brandID,name) VAlUES (4, N'Chanel')
INSERT Brand(brandID,name) VAlUES (5, N'Burberry')
INSERT Brand(brandID,name) VAlUES (6, N'Dolce & Gabbana')
INSERT Brand(brandID,name) VAlUES (7, N'Giorgio Armani')
INSERT Brand(brandID,name) VAlUES (8, N'Versace')
INSERT Brand(brandID,name) VAlUES (9, N'Montblanc')
INSERT Brand(brandID,name) VAlUES (10, N'Yves Saint Laurent')
INSERT Brand(brandID,name) VAlUES (11, N'Maison Margiela')
INSERT Brand(brandID,name) VAlUES (12, N'Gucci')
INSERT Brand(brandID,name) VAlUES (13, N'Moschino')
INSERT Brand(brandID,name) VAlUES (14, N'Juicy Couture')
INSERT Brand(brandID,name) VAlUES (15, N'Kenzo')
INSERT Brand(brandID,name) VAlUES (16, N'Viktor & Rolf')
INSERT Brand(brandID,name) VAlUES (17, N'Kilian')
INSERT Brand(brandID,name) VAlUES (18, N'Monotheme')
INSERT Brand(brandID,name) VAlUES (19, N'Jo Malone')
INSERT Brand(brandID,name) VAlUES (20, N'Hermes')
INSERT Brand(brandID,name) VAlUES (21, N'Tom Ford')
go

insert Type(TypeID, name) values (N'1', N'man')
insert Type(TypeID, name) values (N'2', N'woman')
insert Type(TypeID, name) values (N'3', N'unisex')
go

insert Products(proID, name,brandID, price, quantity,intro, origin, typeID, img_path1, img_path2, img_path3) values ('P001', 'Armaf Club De Nuit Intense For Man 105ml',1, 1180000, 999,N'Những nốt hương vừa lạ nhưng vừa quen đậm chất gây thương nhớ của nước hoa nam Armaf Club De Nuit Intense Man khắc hoạ hình ảnh một người đàn ông nam tính và đầy dung dị, khiến đoá hồng mong manh nào cũng muốn tựa vào.', N'Pháp', 1, './perfume/man/Armaf Club De Nuit Intense For Man/img1.png', './perfume/man/Armaf Club De Nuit Intense For Man/img2.png', './perfume/man/Armaf Club De Nuit Intense For Man/img3.png')
insert Products(proID, name,brandID, price, quantity,intro, origin, typeID, img_path1, img_path2, img_path3) values ('P002', N'BURBERRY Mr. Burberry Eau de Toilette 150ml',5, 2450000, 999,N'Năm 2016, Mr.Burberry dành cho nam giới là cái tên gia nhập vào bộ sưu tập My Burberry của Burberry do nhà sáng chế Francis Kurkdjian chế tạo ra. Mr. Burberry thuộc hương gỗ thơm mang lại cảm giác tươi mới, mạnh mẽ và nam tính.', N'Anh', 1, N'./perfume/man/BURBERRY Mr. Burberry Eau de Toilette/img1.png', N'./perfume/man/BURBERRY Mr. Burberry Eau de Toilette/img2.png', N'./perfume/man/BURBERRY Mr. Burberry Eau de Toilette/img3.png')
insert Products(proID, name,brandID, price, quantity,intro, origin, typeID, img_path1, img_path2, img_path3) values ('P003', N'Chanel Allure Homme Sport Eau Extreme Eau de Parfum 100ml',5, 3450000, 999,N'Allure đại diện cho cách thể hiện cá tính và quan điểm sống riêng của từng cá nhân. ALLURE HOMME SPORT EAU EXTRÊME thể hiện sức hút của một người đàn ông không bao giờ khuất phục hay thỏa hiệp. ', N'Pháp', 1, N'./perfume/man/Chanel Allure Homme Sport Eau Extreme Eau de Parfum/img1.png', N'./perfume/man/Chanel Allure Homme Sport Eau Extreme Eau de Parfum/img2.png', N'./perfume/man/Chanel Allure Homme Sport Eau Extreme Eau de Parfum/img3.png')
insert Products(proID, name,brandID, price, quantity,intro, origin, typeID, img_path1, img_path2, img_path3) values ('P004', N'Chanel Bleu De Chanel Eau de Parfum 100ml',5, 3450000, 999,N'Khúc ca tôn vinh sự tự do nam tính được thể hiện trong một mùi hương gỗ thơm quyến rũ và kinh điển, chứa bên trong thiết kế chai màu xanh đầy bí ẩn. Tinh thần quyết đoán của BLEU DE CHANEL được thể hiện qua dòng Eau de Parfum.', N'Pháp', 1, N'./perfume/man/Chanel Bleu De Chanel Eau de Parfum/img1.png', N'./perfume/man/Chanel Bleu De Chanel Eau de Parfum/img2.png', N'./perfume/man/Chanel Bleu De Chanel Eau de Parfum/img3.png')
insert Products(proID, name,brandID, price, quantity,intro, origin, typeID, img_path1, img_path2, img_path3) values ('P005', N'Dior Homme Intense 100ml',2, 3200000, 999,N'Với thông điệp I’m your man, Dior Homme Intense đã thực sự trở thành một phiên bản nước hoa nam hoàn chỉnh, thể hiện phong thái lịch lãm và vẻ đẹp mạnh mẽ đầy hấp dẫn của cánh mày râu.', N'Pháp', 1, N'./perfume/man/Armaf Club De Nuit Intense For Man/img1.png', N'./perfume/man/Dior Homme Intense/img2.png', N'./perfume/man/Dior Homme Intense/img3.png')
insert Products(proID, name,brandID, price, quantity,intro, origin, typeID, img_path1, img_path2, img_path3) values ('P006', N'Dior Sauvage Eau de Toilette 100ml',2, 3200000, 999,N'Như đem người đàn ông trở về những ngày rong ruổi trên bất kể nẻo đường, lửa trại đêm bùng lên tí tách từng vệt đỏ tía, nước hoa Dior Sauvage EAU dành cho nam nhen nhúm cho ta sự tò mò, thích thú cùng ít nhiều niềm thỏa mãn được tận hưởng, được chinh phục, được yêu chính bản thân mình trong từng khắc.', N'Pháp', 1, N'./perfume/man/Dior Sauvage Eau de Toilette/img1.png', N'./perfume/man/Dior Sauvage Eau de Toilette/img2.png', N'./perfume/man/Dior Sauvage Eau de Toilette/img3.png')
insert Products(proID, name,brandID, price, quantity,intro, origin, typeID, img_path1, img_path2, img_path3) values ('P007', N'Dolce & Gabbana Light Blue Pour Homme 125ml',6, 2300000, 999,N'Nước hoa D&G Light Blue pour Homme của thương hiệu Dolce&Gabbana là dòng nước hoa rất thơm mùi vị cam chanh tươi mát dành riêng cho phái mạnh. D&G Light Blue EDT đem đến một cảm giác tươi mát như vùng Địa Trung Hải. Mùi hương này có thể giết chết cái nóng tại Hồ Chí Minh và Việt Nam.', N'Pháp', 1, N'./perfume/man/Dolce _ Gabbana Light Blue Pour Homme/img1.png', N'./perfume/man/Dolce _ Gabbana Light Blue Pour Homme/img2.png', N'./perfume/man/Dolce _ Gabbana Light Blue Pour Homme/img3.png')
insert Products(proID, name,brandID, price, quantity,intro, origin, typeID, img_path1, img_path2, img_path3) values ('P008', N'Dolce & Gabbana The One Eau de Parfum for Men 100ml',6, 2660000, 999,N'Nước hoa nam D&G The One EDP được tạo ra để trở thành hương thơm không thể thiếu của phái mạnh, mùi hương tồn tại mãi với thời gian và được lòng bất cứ người phụ nữ nào.', N'Pháp', 1, N'./perfume/man/Dolce _ Gabbana The One Eau de Parfum for Men/img1.png', N'./perfume/man/Dolce _ Gabbana The One Eau de Parfum for Men/img2.png', N'./perfume/man/Dolce _ Gabbana The One Eau de Parfum for Men/img3.png')
insert Products(proID, name,brandID, price, quantity,intro, origin, typeID, img_path1, img_path2, img_path3) values ('P009', N'Dolce & Gabbana The One Eau de Toilette for Men 100ml',6, 2480000, 999,N'Mùi hương của D&G The One For Men thể hiện hình ảnh một người đàn ông trưởng thành, chững chạc mang một phong cách thanh lịch, nam tính và mạnh mẽ. Người sản xuất và pha chế nước hoa là Olivier Polge.', N'Pháp', 1, N'./perfume/man/Dolce _ Gabbana The One Eau de Toilette for Men/img1.png', N'./perfume/man/Dolce _ Gabbana The One Eau de Toilette for Men/img2.png', N'./perfume/man/Dolce _ Gabbana The One Eau de Toilette for Men/img3.png')
insert Products(proID, name,brandID, price, quantity,intro, origin, typeID, img_path1, img_path2, img_path3) values ('P010', N'DSQUARED² Green Wood Pour Homme 100ml',3, 1850000, 999,N'Ra mắt song song với Red Wood Pour Femme, mùi hương DSQUARED² Green Wood Pour Homme được tạo ra như cặp bài trùng cuốn hút giới mộ điệu nước hoa từ năm 2019 vừa qua. Được xếp vào dòng hương Woody Aromatic, thật không quá khó hiểu khi những nốt hương chủ đạo luôn đem lại sự ấm áp, lãng mạn khiến cho chị em phụ nữ mê mệt.', N'Ý', 1, N'./perfume/man/DSQUARED2 Green Wood Pour Homme/img1.png', N'./perfume/man/DSQUARED2 Green Wood Pour Homme/img2.png', N'./perfume/man/DSQUARED2 Green Wood Pour Homme/img3.png')
insert Products(proID, name,brandID, price, quantity,intro, origin, typeID, img_path1, img_path2, img_path3) values ('P011', N'DSQUARED² Original Wood 100ml',3, 2080000, 999,N'Wood pour Homme là một mùi hương nam tính của Dsquared2. Mùi hương được ra mắt vào năm 2018 và hương thơm được tạo ra bởi các nhà sáng chế nước hoa Marie Salamagne, Daphne Bugey và Alberto Morillas.', N'Ý', 1, N'./perfume/man/DSQUARED2 Original Wood/img1.png', N'./perfume/man/DSQUARED2 Original Wood/img2.png', N'./perfume/man/DSQUARED2 Original Wood/img3.png')
insert Products(proID, name,brandID, price, quantity,intro, origin, typeID, img_path1, img_path2, img_path3) values ('P012', N'DSQUARED2 Wood for Him 100ml',3, 1850000, 999,N'Nước hoa nam DSquared2 Wood EDT sở hữu hương thơm đặc trưng từ nhóm hương hoa cỏ xạ hương ấm áp nhưng vẫn rất lôi cuốn và quyến rũ. Nước hoa có nồng độ EDT lưu giữ mùi hương khá lâu giúp các chàng luôn tự tin khi đứng trước nửa kia của mình. Hương thơm từ lá hoa tím và hương gỗ trắng là hai mùi hương bạn có thể cảm nhận được khi sử dụng nước hoa này.', N'Ý', 1, N'./perfume/man/DSQUARED2 Wood for Him/img1.png', N'./perfume/man/DSQUARED2 Wood for Him/img2.png', N'./perfume/man/DSQUARED2 Wood for Him/img3.png')
insert Products(proID, name,brandID, price, quantity,intro, origin, typeID, img_path1, img_path2, img_path3) values ('P013', N'Giorgio Armani Acqua Di Gio Pour Homme 100ml',7, 2350000, 999,N'Nước hoa nam Giorgio Armani Acqua Di Giò Pour Homme EDT mang hơi hướng của vùng Địa Trung Hải đầy nắng và gió cùng hương cam quýt, hương thơm của hương thảo hòa quyện với vị mặn của biển và tinh chất hoa nhài trong suốt dành cho chàng trai mùi hương của sự tự do, thỏa sức vũng vẫy giữa nước biển và ánh nắng ấm áp mơn trớn trên làn da.', N'Pháp', 1, N'./perfume/man/Giorgio Armani Acqua Di Gio Pour Homme/img1.png', N'./perfume/man/Giorgio Armani Acqua Di Gio Pour Homme/img2.png', N'./perfume/man/Giorgio Armani Acqua Di Gio Pour Homme/img3.png')
insert Products(proID, name,brandID, price, quantity,intro, origin, typeID, img_path1, img_path2, img_path3) values ('P014', N'Gucci Guilty Pour Homme 50ml',12, 2200000, 9999,N'Gucci Guilty pour Homme được thiết kế đặc biệt dành cho những người biết được và giành lấy những gì họ muốn. Với hương thơm quyến rũ và khiêu khích, họ như thỏi nam châm thu hút mọi ánh nhìn và làm say đắm các quý cô.', N'Anh', 1, N'./perfume/man/Gucci Guilty Pour Homme/img1.png', N'./perfume/man/Gucci Guilty Pour Homme/img2.png', N'./perfume/man/Gucci Guilty Pour Homme/img3.png')
insert Products(proID, name,brandID, price, quantity,intro, origin, typeID, img_path1, img_path2, img_path3) values ('P015', N'Maison Margiela Replica Jazz Club 100ml',11, 3250000, 999,N'Replica Jazz Club EDT là tuyển tập của những nốt nhạc cổ điển chứa đựng sự ngọt ngào, khiến bạn trở nên thú vị và gây hiếu kỳ với mọi người xung quanh. Bạn sẽ như một quý ông lịch lãm, nhâm nhi chậm rãi ly rượu rum trên tay.', N'Pháp', 1, N'./perfume/man/Maison Margiela Replica Jazz Club/img1.png', N'./perfume/man/Maison Margiela Replica Jazz Club/img2.png', N'./perfume/man/Maison Margiela Replica Jazz Club/img3.png')
insert Products(proID, name,brandID, price, quantity,intro, origin, typeID, img_path1, img_path2, img_path3) values ('P016', N'Montblanc Explorer 100ml',9, 2300000, 999,N'Montblanc Explorer sở hữu nốt hương đầu mang cảm giác sảng khoái với cam Bergamot tươi mát. Với những Quý Ông sành về nước hoa có thể cảm nhận ngay mùi hương quyến rũ của cỏ hương bài ở tầng giữa và khi lắng xuống ở nốt cuối cùng là mùi hương nổi bật của hoắc hương & hương gỗ nam tính.', N'Pháp', 1, N'./perfume/man/Montblanc Explorer/img1.png', N'./perfume/man/Montblanc Explorer/img2.png', N'./perfume/man/Montblanc Explorer/img3.png')
insert Products(proID, name,brandID, price, quantity,intro, origin, typeID, img_path1, img_path2, img_path3) values ('P017', N'Versace Eros For Men 100ml',8, 1990000, 999,N'Nước hoa Versace Eros For Men 100ml với những nốt hương thảo mộc phương Đông mạnh mẽ, bí ẩn nhằm khích lệ tinh thần, đam mê của phái mạnh. Cùng thiết kế tỉ mỉ, sắc xảo mang đặc trưng của một thương hiệu xa xỉ. Chắc chắn sẽ làm hài lòng những anh chàng khó tính nhất.', N'Ý', 1, N'./perfume/man/Versace Eros For Men/img1.png', N'./perfume/man/Versace Eros For Men/img2.png', N'./perfume/man/Versace Eros For Men/img3.png')
insert Products(proID, name,brandID, price, quantity,intro, origin, typeID, img_path1, img_path2, img_path3) values ('P018', N'Versace Pour Homme 100ml',8, 1990000, 999,N'Nước Hoa Nam Versace Pour Homme - Eau De Toilette (100ml) là sự pha trộn các thành phần tinh chất có nguồn gốc Địa Trung Hải với hỗn hợp hương thơm hàng đầu rất phù hợp cho nam giới ngày nay: đó là những người đàn ông tri thức và tự tin, năng động, mạnh mẽ và đầy đam mê, sống hài hòa với thế giới tự nhiên.', N'Ý', 1, N'./perfume/man/Versace Pour Homme/img1.png', N'./perfume/man/Versace Pour Homme/img2.png', N'./perfume/man/Versace Pour Homme/img3.png')
insert Products(proID, name,brandID, price, quantity,intro, origin, typeID, img_path1, img_path2, img_path3) values ('P019', N'Versace Pour Homme Dylan Blue 100ml',8, 1990000, 999,N'Nước Hoa Nam Versace Pour Homme Dylan Blue - Eau De Toilette (100ml) có hương thơm cây cỏ và gỗ của nó chứa đựng thành phần tươi mát của nước, cam bergamot xứ Calabria, bưởi và lá vả (lá sung) ở lớp hương đầu, phát triển hơn nữa với hương trung tâm của lá violet, gỗ giấy cói, cây hoắc hương, hạt tiêu đen và long diên hương.', N'Ý', 1, N'./perfume/man/Versace Pour Homme Dylan Blue/img1.png', N'./perfume/man/Versace Pour Homme Dylan Blue/img2.png', N'./perfume/man/Versace Pour Homme Dylan Blue/img3.png')
insert Products(proID, name,brandID, price, quantity,intro, origin, typeID, img_path1, img_path2, img_path3) values ('P020', N'Yves Saint Laurent Y Eau de Parfum 100ml',10, 3200000, 999,N'YSL Y Men EDP được giới thiệu lần đầu vào tháng 9 năm 2018, với thông điệp là một người đàn ông mặc sơ mi trắng cùng áo khoác màu đen, nam tính, mạnh mẽ và cuốn hút. Yves Saint Laurent Y thể hiện sự cân bằng giữa những nốt hương mạnh mẽ và nhẹ nhàng, nồng nàn và tươi mát.', N'Pháp', 1, N'./perfume/man/Yves Saint Laurent Y Eau de Parfum/img1.png', N'./perfume/man/Yves Saint Laurent Y Eau de Parfum/img2.png', N'./perfume/man/Yves Saint Laurent Y Eau de Parfum/img3.png')
go