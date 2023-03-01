create database CozaStore
go
use CozaStore
go
create table Accounts 
(
	accountID SMALLINT IDENTITY(1,1) primary key,
	userName varchar(100),
	password varchar(50),
);

create table Customers
(
	CustomerID SMALLINT IDENTITY(1,1) primary key,
	
	[name] nvarchar(150) not null,
	birth date not null,
	phone varchar(11) not null,
	[address] nvarchar(200) not null, 
	accountID SMALLINT foreign key references Accounts(accountID),

)

create table Categories 
(
	categoryID SMALLINT IDENTITY(1,1) primary key,
	categoryName nvarchar(100) not null,
)

create table Products
(
	productID SMALLINT IDENTITY(1,1) primary key,
	nameProduct nvarchar(100) not null,
	quantity int,
	price MONEY,
	
	[descript] text,
	categoryID SMALLINT foreign key references Categories(categoryID),
	[image] varchar(200),

)

create table Wishlist
(
	wishlistID SMALLINT IDENTITY(1,1) primary key,
	customerID SMALLINT,
	productID SMALLINT foreign key references Products(productID),

	foreign key(customerID) references Customers(CustomerID)
)



create table Vouchers
(
	code varchar(20) primary key,
	discount DECIMAL(4,3) not null,
)

create table Orders
(
	orderID SMALLINT IDENTITY(1,1) primary key,
	CustomerID SMALLINT foreign key references Customers(CustomerID),
	code varchar(20) foreign key references Vouchers(code),
)

create table OrderDetails
(
	orderID SMALLINT primary key,
	productID SMALLINT foreign key references Products(productID), 
	orderTime datetime,
	foreign key (orderID) references Orders(orderID),
)

create table OrderDetails_Products
(
	orderID SMALLINT,
	productID SMALLINT,
	price money,
	quantity smallint,

	primary key (orderID,productID),
	foreign key (orderID) references OrderDetails(orderID),
	foreign key (productID) references Products(productID),
)

create table Cart 
(
	cartID SMALLINT IDENTITY(1,1) primary key,
	productID SMALLINT references Products(productID),
	codeDiscount varchar(20) foreign key references Vouchers(code),
)

create table Cart_Product
(
	cartID SMALLINT,
	productID SMALLINT,
	price money,
	quantity smallint,


	primary key (cartID,productID),
	foreign key (cartID) references Cart(cartID),
	foreign key (productID) references Products(productID),
)

INSERT INTO [dbo].[Categories] ([categoryName]) VALUES ('Women')
INSERT INTO [dbo].[Categories] ([categoryName]) VALUES ('Man')
INSERT INTO [dbo].[Categories] ([categoryName]) VALUES ('Bag')
INSERT INTO [dbo].[Categories] ([categoryName]) VALUES ('Shoes')
INSERT INTO [dbo].[Categories] ([categoryName]) VALUES ('Watches')

INSERT INTO [dbo].[Products]([nameProduct],[quantity],[price],[descript],[categoryID],[image]) 
VALUES ('Esprit Ruffle Shirt',1000,16.64,'A T-shirt is a casual garment made out of cotton or a cotton-synthetic blend fabric. It has short sleeves and a round neckline and is designed to be worn over the head. It is usually plain in design, but can also be printed with a graphic or other design. T-shirts are usually worn as a casual form of clothing and are popular with people of all ages.',1,'images/product-01.jpg')

INSERT INTO [dbo].[Products]([nameProduct],[quantity],[price],[descript],[categoryID],[image]) 
VALUES ('Herschel supply',1000,35.31,'White shirt is one of the closest and most fashionable shirts. It can be suitable for many different content. White shirts are usually made of cotton or polyester fabric. It can easily wear meetings, meetings, or any other occasions. White shirt is a popular shirt, because it is a simple way to create more elegance to any outfit.',1,'images/product-02.jpg')
INSERT INTO [dbo].[Products]([nameProduct],[quantity],[price],[descript],[categoryID],[image]) 
VALUES ('Only Check Trouser',1000,25.50,'Blue office plaid shirt is a dynamic and modern fashion product. It is designed based on a youthful style, creating a youthful and modern style. The material of the shirt is cotton or polyester, which can help you more comfortable and comfortable in all activities. Blue office plaid shirt can also be a great choice for people who like dynamic fashion style.',2,'images/product-03.jpg')
INSERT INTO [dbo].[Products]([nameProduct],[quantity],[price],[descript],[categoryID],[image]) 
VALUES ('Classic Trench Coat',1000,25.50,'A T-shirt is a casual garment made out of cotton or a cotton-synthetic blend fabric. It has short sleeves and a round neckline and is designed to be worn over the head. It is usually plain in design, but can also be printed with a graphic or other design. T-shirts are usually worn as a casual form of clothing and are popular with people of all ages.',1,'images/product-04.jpg')
INSERT INTO [dbo].[Products]([nameProduct],[quantity],[price],[descript],[categoryID],[image]) 
VALUES ('Front Pocket Jumper',1000,25.50,'Front Pocket Jumper is a casual, comfortable garment. It features a front pocket and a drawstring hood. It comes in various colors and materials, and is perfect for days when you want to look casual while still keeping warm.',1,'images/product-05.jpg')
INSERT INTO [dbo].[Products]([nameProduct],[quantity],[price],[descript],[categoryID],[image]) 
VALUES ('Vintage Inspired Classic',93.20,'Vintage Inspired Classic
 watches are the perfect blend of classic style and modern features. These watches feature a timeless design, with a classic round face, thin hands and markers, and a stainless steel case. The designs are inspired by the vintage era, but with modern touches like dials, straps and more. With its unique and classic look, these watches are sure to turn heads.',5,'images/product-06.jpg')
