USE [CozaStore]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 3/23/2023 8:42:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[accountID] [smallint] IDENTITY(1,1) NOT NULL,
	[userName] [varchar](100) NULL,
	[password] [varchar](50) NULL,
	[role] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[accountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart]    Script Date: 3/23/2023 8:42:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart](
	[cartid] [smallint] IDENTITY(1,1) NOT NULL,
	[CustomerID] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[cartid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 3/23/2023 8:42:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[categoryID] [smallint] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 3/23/2023 8:42:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [smallint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](150) NOT NULL,
	[birth] [date] NOT NULL,
	[phone] [varchar](11) NOT NULL,
	[address] [nvarchar](200) NOT NULL,
	[accountID] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 3/23/2023 8:42:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[orderID] [smallint] NOT NULL,
	[productId] [smallint] NOT NULL,
	[size] [varchar](3) NULL,
	[quantity] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC,
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/23/2023 8:42:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[orderID] [smallint] IDENTITY(1,1) NOT NULL,
	[CustomerID] [smallint] NULL,
	[cartId] [smallint] NULL,
	[orderTime] [datetime] NULL,
	[customerName] [nvarchar](150) NULL,
	[address] [nvarchar](200) NULL,
	[phone] [varchar](11) NULL,
	[total] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_cart]    Script Date: 3/23/2023 8:42:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_cart](
	[cartId] [smallint] NOT NULL,
	[productId] [smallint] NOT NULL,
	[quantity] [int] NULL,
	[size] [varchar](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[productId] ASC,
	[cartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/23/2023 8:42:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[productID] [smallint] IDENTITY(1,1) NOT NULL,
	[nameProduct] [nvarchar](100) NOT NULL,
	[quantity] [int] NULL,
	[price] [money] NULL,
	[descript] [text] NULL,
	[categoryID] [smallint] NULL,
	[image] [varchar](200) NULL,
	[dateRelease] [datetime] NULL,
	[color] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 3/23/2023 8:42:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[size] [varchar](3) NOT NULL,
	[description] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[size] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size_Product]    Script Date: 3/23/2023 8:42:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size_Product](
	[size] [varchar](3) NOT NULL,
	[productID] [smallint] NOT NULL,
	[quantity] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[size] ASC,
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vouchers]    Script Date: 3/23/2023 8:42:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vouchers](
	[code] [varchar](20) NOT NULL,
	[discount] [decimal](4, 3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wishlist]    Script Date: 3/23/2023 8:42:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wishlist](
	[wishlistID] [smallint] IDENTITY(1,1) NOT NULL,
	[customerID] [smallint] NULL,
	[productID] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[wishlistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([accountID], [userName], [password], [role]) VALUES (1, N'nmp@gmail.com', N'abc123', 0)
INSERT [dbo].[Accounts] ([accountID], [userName], [password], [role]) VALUES (2, N'laingoclam3112@gmail.com', N'lnl3112', 1)
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[cart] ON 

INSERT [dbo].[cart] ([cartid], [CustomerID]) VALUES (1, 1)
SET IDENTITY_INSERT [dbo].[cart] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([categoryID], [categoryName]) VALUES (1, N'Women')
INSERT [dbo].[Categories] ([categoryID], [categoryName]) VALUES (2, N'Men')
INSERT [dbo].[Categories] ([categoryID], [categoryName]) VALUES (3, N'Bag')
INSERT [dbo].[Categories] ([categoryID], [categoryName]) VALUES (4, N'Shoes')
INSERT [dbo].[Categories] ([categoryID], [categoryName]) VALUES (5, N'Watches')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerID], [name], [birth], [phone], [address], [accountID]) VALUES (1, N'Nguyen Minh Phuong', CAST(N'2002-10-10' AS Date), N'0332916668', N'hoang quoc viet, cau giay, ha noi', 1)
INSERT [dbo].[Customers] ([CustomerID], [name], [birth], [phone], [address], [accountID]) VALUES (2, N'Lai Ngoc Lam', CAST(N'2002-12-31' AS Date), N'0984068859', N'dai hoc fpt, thach hoa, thach that, ha noi', 2)
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (7, 1, N'S', 2)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (7, 2, N'XL', 3)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (8, 3, N'XL', 3)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (8, 4, N'L', 1)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (9, 1, N'XXL', 5)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (11, 2, N'S', 2)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (12, 3, N'L', 1)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (13, 1, N'XL', 5)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (14, 1, N'L', 1)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (14, 3, N'L', 1)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (15, 23, N'XL', 3)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (16, 44, N'XL', 4)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (17, 36, N'XL', 8)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (18, 75, N'XL', 7)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (19, 14, N'XL', 7)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (20, 66, N'XL', 2)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (21, 46, N'XL', 7)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (22, 53, N'XL', 6)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (23, 82, N'XL', 1)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (24, 60, N'XL', 4)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (25, 63, N'XL', 1)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (26, 26, N'XL', 10)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (27, 39, N'XL', 6)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (28, 55, N'XL', 1)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (29, 14, N'XL', 3)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (30, 65, N'XL', 3)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (31, 44, N'XL', 10)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (32, 17, N'XL', 5)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (33, 28, N'XL', 9)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (34, 43, N'XL', 4)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (35, 22, N'XL', 3)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (36, 21, N'XL', 3)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (37, 22, N'XL', 2)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (38, 28, N'XL', 10)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (39, 75, N'XL', 3)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (40, 2, N'XL', 6)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (41, 71, N'XL', 8)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (42, 15, N'XL', 9)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (43, 40, N'XL', 7)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (44, 75, N'XL', 6)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (45, 72, N'XL', 2)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (46, 3, N'XL', 7)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (47, 65, N'XL', 1)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (48, 81, N'XL', 5)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (49, 55, N'XL', 5)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (50, 54, N'XL', 5)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (51, 19, N'XL', 5)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (52, 22, N'XL', 9)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (53, 55, N'XL', 4)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (54, 39, N'XL', 6)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (55, 21, N'XL', 3)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (56, 34, N'XL', 10)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (57, 41, N'XL', 10)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (58, 81, N'XL', 9)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (59, 67, N'XL', 9)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (60, 52, N'XL', 5)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (61, 81, N'XL', 2)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (62, 72, N'XL', 1)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (63, 69, N'XL', 3)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (64, 29, N'XL', 4)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (65, 18, N'XL', 2)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (66, 11, N'XL', 2)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (67, 61, N'XL', 8)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (68, 74, N'XL', 2)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (69, 1, N'XL', 5)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (70, 4, N'XL', 8)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (71, 14, N'XL', 4)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (72, 23, N'XL', 6)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (73, 61, N'XL', 5)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (74, 67, N'XL', 2)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (75, 11, N'XL', 10)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (76, 70, N'XL', 5)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (77, 26, N'XL', 8)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (78, 4, N'XL', 7)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (79, 80, N'XL', 3)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (80, 5, N'XL', 6)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (81, 45, N'XL', 8)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (82, 55, N'XL', 7)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (83, 15, N'XL', 5)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (84, 15, N'XL', 4)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (85, 51, N'XL', 5)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (86, 53, N'XL', 2)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (87, 83, N'XL', 1)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (88, 83, N'XL', 3)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (89, 78, N'XL', 4)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (90, 47, N'XL', 4)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (91, 33, N'XL', 9)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (92, 57, N'XL', 4)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (93, 44, N'XL', 5)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (94, 28, N'XL', 7)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (95, 21, N'XL', 7)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (96, 47, N'XL', 5)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (97, 31, N'XL', 3)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (98, 49, N'XL', 7)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (99, 21, N'XL', 7)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (100, 80, N'XL', 5)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (101, 74, N'XL', 9)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (102, 45, N'XL', 3)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (103, 23, N'XL', 2)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (104, 35, N'XL', 8)
GO
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (105, 60, N'XL', 3)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (106, 48, N'XL', 7)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (107, 51, N'XL', 6)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (108, 15, N'XL', 6)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (109, 70, N'XL', 1)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (110, 60, N'XL', 10)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (111, 7, N'XL', 10)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (112, 6, N'XL', 1)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (113, 54, N'XL', 1)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (114, 44, N'XL', 5)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (115, 33, N'XL', 1)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (116, 53, N'XL', 4)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (117, 6, N'XL', 10)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (118, 8, N'XL', 9)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (119, 58, N'XL', 4)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (120, 31, N'XL', 1)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (121, 18, N'XL', 4)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (122, 77, N'XL', 6)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (123, 6, N'XL', 4)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (124, 82, N'XL', 6)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (125, 37, N'XL', 3)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (126, 6, N'XL', 8)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (127, 34, N'XL', 7)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (128, 10, N'XL', 1)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (129, 71, N'XL', 1)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (130, 49, N'XL', 1)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (131, 7, N'XL', 4)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (132, 18, N'XL', 8)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (133, 11, N'XL', 4)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (134, 42, N'XL', 6)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (135, 14, N'XL', 9)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (136, 59, N'XL', 9)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (137, 12, N'XL', 4)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (138, 44, N'XL', 6)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (139, 42, N'XL', 5)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (140, 59, N'XL', 8)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (141, 62, N'XL', 1)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (142, 59, N'XL', 10)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (143, 46, N'XL', 2)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (144, 51, N'XL', 7)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (145, 59, N'XL', 8)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (146, 60, N'XL', 6)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (147, 32, N'XL', 9)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (148, 15, N'XL', 3)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (149, 9, N'XL', 10)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (150, 66, N'XL', 3)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (151, 43, N'XL', 3)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (152, 1, N'XL', 6)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (153, 69, N'XL', 3)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (154, 63, N'XL', 3)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (155, 63, N'XL', 2)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (156, 33, N'XL', 10)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (157, 38, N'XL', 4)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (158, 7, N'XL', 3)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (159, 44, N'XL', 3)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (160, 57, N'XL', 10)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (161, 38, N'XL', 7)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (162, 62, N'XL', 8)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (163, 63, N'XL', 10)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (164, 54, N'XL', 10)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (165, 63, N'XL', 1)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (166, 55, N'XL', 9)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (167, 38, N'XL', 2)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (168, 19, N'XL', 10)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (169, 43, N'XL', 10)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (170, 36, N'XL', 4)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (171, 73, N'XL', 10)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (172, 30, N'XL', 6)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (173, 57, N'XL', 7)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (174, 52, N'XL', 6)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (175, 15, N'XL', 10)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (176, 79, N'XL', 7)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (177, 4, N'XL', 10)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (178, 81, N'XL', 7)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (179, 66, N'XL', 4)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (180, 10, N'XL', 3)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (181, 26, N'XL', 5)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (182, 59, N'XL', 7)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (183, 36, N'XL', 4)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (184, 58, N'XL', 9)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (185, 78, N'XL', 3)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (186, 50, N'XL', 7)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (187, 82, N'XL', 9)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (188, 73, N'XL', 4)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (189, 30, N'XL', 7)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (190, 66, N'XL', 3)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (191, 37, N'XL', 7)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (192, 67, N'XL', 2)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (193, 27, N'XL', 3)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (194, 53, N'XL', 9)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (195, 43, N'XL', 3)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (196, 4, N'XL', 7)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (197, 41, N'XL', 3)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (198, 45, N'XL', 6)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (199, 83, N'XL', 10)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (200, 83, N'XL', 5)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (201, 39, N'XL', 5)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (202, 37, N'XL', 2)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (203, 59, N'XL', 1)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (204, 52, N'XL', 10)
GO
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (215, 53, N'L', 15)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (216, 27, NULL, 6)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (230, 33, N'M', 3)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (230, 62, NULL, 2)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (240, 34, N'L', 4)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (265, 9, N'38', 3)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (265, 15, N'', 6)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (265, 18, N'', 10)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (266, 2, N'abc', 3)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (266, 3, N'S', 3)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (267, 1, N'abc', 1)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (267, 2, N'abc', 2)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (268, 2, N'abc', 3)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (268, 3, N'L', 3)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (269, 2, N'abc', 3)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (269, 6, N'', 1)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (270, 1, N'L', 1)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (271, 5, N'abc', 3)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (271, 7, N'abc', 3)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (272, 2, N'abc', 3)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (273, 3, N'L', 2)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (275, 2, N'abc', 2)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (276, 3, N'L', 2)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (276, 4, N'abc', 3)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (277, 2, N'abc', 4)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (277, 3, N'L', 4)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (278, 3, N'L', 4)
INSERT [dbo].[OrderDetails] ([orderID], [productId], [size], [quantity]) VALUES (278, 4, N'abc', 2)
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (7, 1, 1, CAST(N'2023-03-13T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 139.2100)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (8, 1, 1, CAST(N'2023-03-13T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 102.0000)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (9, 1, 1, CAST(N'2023-03-14T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 83.2000)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (10, 1, 1, CAST(N'2023-03-14T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 0.0000)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (11, 1, 1, CAST(N'2023-03-14T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 70.6200)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (12, 1, 1, CAST(N'2023-03-14T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 25.5000)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (13, 1, 1, CAST(N'2023-03-14T00:00:00.000' AS DateTime), N'Lai Ngoc Lam', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 41.6000)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (14, 1, 1, CAST(N'2023-03-14T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 42.1400)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (15, 1, 1, CAST(N'2021-05-29T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 734.1400)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (16, 1, 1, CAST(N'2021-06-27T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1812.1500)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (17, 1, 1, CAST(N'2021-08-01T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 573.4200)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (18, 1, 1, CAST(N'2022-10-19T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 983.3000)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (19, 1, 1, CAST(N'2022-12-04T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 267.5400)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (20, 1, 1, CAST(N'2020-03-12T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1806.4400)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (21, 1, 1, CAST(N'2021-08-26T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1708.1200)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (22, 1, 1, CAST(N'2022-07-17T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1396.5200)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (23, 1, 1, CAST(N'2021-06-15T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 178.3900)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (24, 1, 1, CAST(N'2020-01-03T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 385.5500)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (25, 1, 1, CAST(N'2022-06-19T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1140.3800)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (26, 1, 1, CAST(N'2021-10-08T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 36.7900)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (27, 1, 1, CAST(N'2022-03-15T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1562.9700)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (28, 1, 1, CAST(N'2022-04-01T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1731.9800)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (29, 1, 1, CAST(N'2021-06-02T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 69.7000)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (30, 1, 1, CAST(N'2022-07-02T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1241.3700)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (31, 1, 1, CAST(N'2021-06-11T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1383.9900)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (32, 1, 1, CAST(N'2021-06-11T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1192.6800)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (33, 1, 1, CAST(N'2022-03-09T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1760.7400)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (34, 1, 1, CAST(N'2020-10-30T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 84.9200)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (35, 1, 1, CAST(N'2022-04-04T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 780.6600)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (36, 1, 1, CAST(N'2020-11-10T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 471.7000)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (37, 1, 1, CAST(N'2022-12-11T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1342.8100)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (38, 1, 1, CAST(N'2021-10-26T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 386.1500)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (39, 1, 1, CAST(N'2020-04-03T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 816.8200)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (40, 1, 1, CAST(N'2021-12-12T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1480.4500)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (41, 1, 1, CAST(N'2021-07-22T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 401.2000)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (42, 1, 1, CAST(N'2022-06-09T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1071.8200)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (43, 1, 1, CAST(N'2020-12-14T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 535.1700)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (44, 1, 1, CAST(N'2021-04-10T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 16.3000)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (45, 1, 1, CAST(N'2022-08-15T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 526.3800)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (46, 1, 1, CAST(N'2021-12-24T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 971.5700)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (47, 1, 1, CAST(N'2021-03-30T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1895.2900)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (48, 1, 1, CAST(N'2021-09-12T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 830.8600)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (49, 1, 1, CAST(N'2021-10-02T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 882.8300)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (50, 1, 1, CAST(N'2020-09-03T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1706.9100)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (51, 1, 1, CAST(N'2021-07-23T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1642.1400)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (52, 1, 1, CAST(N'2022-03-29T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 606.2400)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (53, 1, 1, CAST(N'2021-08-07T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 918.9300)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (54, 1, 1, CAST(N'2022-06-11T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 699.5300)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (55, 1, 1, CAST(N'2022-01-09T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 929.9000)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (56, 1, 1, CAST(N'2021-03-29T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1541.6600)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (57, 1, 1, CAST(N'2022-04-05T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 13.3600)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (58, 1, 1, CAST(N'2022-05-26T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1757.2200)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (59, 1, 1, CAST(N'2021-06-30T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 563.0400)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (60, 1, 1, CAST(N'2022-06-10T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1792.7100)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (61, 1, 1, CAST(N'2021-09-01T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1091.0800)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (62, 1, 1, CAST(N'2021-01-07T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1840.8000)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (63, 1, 1, CAST(N'2021-12-01T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1862.5000)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (64, 1, 1, CAST(N'2021-12-28T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1682.7300)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (65, 1, 1, CAST(N'2020-04-01T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1364.0900)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (66, 1, 1, CAST(N'2021-09-03T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 161.5200)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (67, 1, 1, CAST(N'2020-09-14T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1420.4700)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (68, 1, 1, CAST(N'2021-06-03T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 259.1100)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (69, 1, 1, CAST(N'2020-10-21T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1798.1100)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (70, 1, 1, CAST(N'2020-12-16T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1306.6300)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (71, 1, 1, CAST(N'2021-12-25T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1621.1200)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (72, 1, 1, CAST(N'2020-04-18T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 67.2000)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (73, 1, 1, CAST(N'2020-12-27T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 616.4400)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (74, 1, 1, CAST(N'2022-11-28T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 370.1000)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (75, 1, 1, CAST(N'2021-08-23T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 568.3600)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (76, 1, 1, CAST(N'2020-08-09T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1901.1600)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (77, 1, 1, CAST(N'2021-02-03T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1886.2700)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (78, 1, 1, CAST(N'2021-05-05T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1296.8400)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (79, 1, 1, CAST(N'2022-10-23T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1833.7100)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (80, 1, 1, CAST(N'2020-07-18T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1034.3100)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (81, 1, 1, CAST(N'2021-12-16T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1331.0400)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (82, 1, 1, CAST(N'2022-05-19T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 981.1100)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (83, 1, 1, CAST(N'2021-04-05T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1699.3700)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (84, 1, 1, CAST(N'2022-01-25T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 490.9300)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (85, 1, 1, CAST(N'2021-10-29T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 504.6000)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (86, 1, 1, CAST(N'2020-06-09T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 934.1900)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (87, 1, 1, CAST(N'2020-07-29T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1651.5000)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (88, 1, 1, CAST(N'2020-05-02T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1468.0200)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (89, 1, 1, CAST(N'2022-10-07T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1089.3800)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (90, 1, 1, CAST(N'2022-01-17T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1982.2500)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (91, 1, 1, CAST(N'2021-07-12T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 568.9000)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (92, 1, 1, CAST(N'2021-01-19T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1118.0600)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (93, 1, 1, CAST(N'2020-01-09T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1540.9200)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (94, 1, 1, CAST(N'2021-04-07T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1432.3700)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (95, 1, 1, CAST(N'2021-01-09T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 560.4700)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (96, 1, 1, CAST(N'2020-09-03T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 683.3700)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (97, 1, 1, CAST(N'2022-01-25T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1885.8500)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (98, 1, 1, CAST(N'2020-10-27T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1683.9100)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (99, 1, 1, CAST(N'2021-05-19T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 302.9000)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (100, 1, 1, CAST(N'2020-06-21T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1928.4900)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (101, 1, 1, CAST(N'2020-08-18T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 778.6500)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (102, 1, 1, CAST(N'2021-06-19T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 132.6500)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (103, 1, 1, CAST(N'2021-04-28T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 756.6000)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (104, 1, 1, CAST(N'2020-08-27T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 679.5900)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (105, 1, 1, CAST(N'2020-01-03T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1635.2600)
GO
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (106, 1, 1, CAST(N'2021-10-07T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1717.3100)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (107, 1, 1, CAST(N'2021-01-13T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1343.8900)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (108, 1, 1, CAST(N'2021-11-26T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1408.7800)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (109, 1, 1, CAST(N'2021-03-04T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 448.2400)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (110, 1, 1, CAST(N'2021-02-26T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 981.3900)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (111, 1, 1, CAST(N'2021-01-06T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1148.2500)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (112, 1, 1, CAST(N'2021-03-01T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 577.0300)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (113, 1, 1, CAST(N'2021-12-27T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1768.6200)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (114, 1, 1, CAST(N'2021-10-04T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 158.8800)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (115, 1, 1, CAST(N'2021-02-28T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 137.4800)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (116, 1, 1, CAST(N'2021-09-21T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1451.5100)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (117, 1, 1, CAST(N'2020-08-14T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 824.8200)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (118, 1, 1, CAST(N'2020-06-25T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1858.4000)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (119, 1, 1, CAST(N'2022-06-29T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1416.6300)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (120, 1, 1, CAST(N'2021-06-23T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1491.8100)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (121, 1, 1, CAST(N'2021-09-26T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 717.2900)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (122, 1, 1, CAST(N'2022-09-13T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1099.4700)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (123, 1, 1, CAST(N'2021-05-14T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1308.7400)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (124, 1, 1, CAST(N'2022-06-15T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 814.8400)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (125, 1, 1, CAST(N'2020-09-10T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 610.8500)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (126, 1, 1, CAST(N'2020-12-20T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1253.5100)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (127, 1, 1, CAST(N'2021-09-15T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1232.4200)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (128, 1, 1, CAST(N'2020-11-24T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 790.2900)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (129, 1, 1, CAST(N'2020-11-27T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1293.3200)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (130, 1, 1, CAST(N'2021-04-30T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1814.4900)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (131, 1, 1, CAST(N'2021-11-07T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 815.6700)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (132, 1, 1, CAST(N'2021-07-04T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1946.5500)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (133, 1, 1, CAST(N'2021-12-17T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 530.3200)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (134, 1, 1, CAST(N'2020-12-01T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1616.2400)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (135, 1, 1, CAST(N'2022-01-20T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 124.6400)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (136, 1, 1, CAST(N'2021-09-26T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 932.3600)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (137, 1, 1, CAST(N'2021-10-27T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 770.9900)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (138, 1, 1, CAST(N'2020-01-30T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 778.6900)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (139, 1, 1, CAST(N'2020-05-01T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1544.2000)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (140, 1, 1, CAST(N'2021-10-21T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 910.8100)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (141, 1, 1, CAST(N'2021-05-10T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1078.4700)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (142, 1, 1, CAST(N'2020-05-23T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1130.9000)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (143, 1, 1, CAST(N'2021-08-21T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 14.8700)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (144, 1, 1, CAST(N'2020-04-03T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 900.4500)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (145, 1, 1, CAST(N'2022-01-07T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 632.4800)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (146, 1, 1, CAST(N'2022-09-07T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 616.6000)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (147, 1, 1, CAST(N'2020-07-06T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1916.8600)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (148, 1, 1, CAST(N'2021-01-13T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 303.0200)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (149, 1, 1, CAST(N'2022-01-07T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1788.2800)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (150, 1, 1, CAST(N'2021-08-26T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1987.1300)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (151, 1, 1, CAST(N'2020-05-22T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 987.7700)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (152, 1, 1, CAST(N'2021-06-10T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 398.4700)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (153, 1, 1, CAST(N'2022-08-24T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1797.6300)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (154, 1, 1, CAST(N'2021-05-25T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 477.4300)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (155, 1, 1, CAST(N'2022-09-23T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 74.7600)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (156, 1, 1, CAST(N'2022-06-18T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1955.7800)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (157, 1, 1, CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1913.0200)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (158, 1, 1, CAST(N'2021-12-25T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 33.0900)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (159, 1, 1, CAST(N'2021-08-27T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1266.1800)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (160, 1, 1, CAST(N'2022-09-21T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1732.4400)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (161, 1, 1, CAST(N'2021-01-10T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1405.6200)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (162, 1, 1, CAST(N'2022-01-12T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 680.3400)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (163, 1, 1, CAST(N'2020-07-21T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 969.7300)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (164, 1, 1, CAST(N'2021-08-11T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 416.4500)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (165, 1, 1, CAST(N'2020-05-08T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 930.9300)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (166, 1, 1, CAST(N'2022-04-16T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 796.3100)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (167, 1, 1, CAST(N'2022-05-01T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 916.6000)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (168, 1, 1, CAST(N'2020-12-15T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 752.0400)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (169, 1, 1, CAST(N'2021-10-08T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1743.8200)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (170, 1, 1, CAST(N'2020-03-27T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1183.9400)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (171, 1, 1, CAST(N'2022-06-06T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 271.4800)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (172, 1, 1, CAST(N'2021-03-28T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 664.4900)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (173, 1, 1, CAST(N'2020-11-08T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1756.2300)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (174, 1, 1, CAST(N'2020-12-11T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1884.5300)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (175, 1, 1, CAST(N'2020-08-14T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1348.4200)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (176, 1, 1, CAST(N'2021-04-21T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 519.9900)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (177, 1, 1, CAST(N'2022-05-10T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 626.3000)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (178, 1, 1, CAST(N'2020-08-19T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1800.9800)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (179, 1, 1, CAST(N'2020-09-16T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1081.5800)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (180, 1, 1, CAST(N'2021-04-26T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 453.7700)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (181, 1, 1, CAST(N'2021-11-14T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 137.8300)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (182, 1, 1, CAST(N'2022-09-29T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1676.5000)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (183, 1, 1, CAST(N'2020-12-11T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1127.6400)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (184, 1, 1, CAST(N'2021-11-11T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 283.2000)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (185, 1, 1, CAST(N'2020-01-21T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 682.4100)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (186, 1, 1, CAST(N'2021-10-23T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 636.9900)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (187, 1, 1, CAST(N'2020-08-09T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 544.0700)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (188, 1, 1, CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1543.1800)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (189, 1, 1, CAST(N'2022-11-26T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1934.6500)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (190, 1, 1, CAST(N'2021-12-05T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1179.9000)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (191, 1, 1, CAST(N'2021-09-04T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1063.4900)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (192, 1, 1, CAST(N'2021-02-24T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 377.8200)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (193, 1, 1, CAST(N'2022-07-25T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1882.9700)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (194, 1, 1, CAST(N'2021-04-01T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1658.8800)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (195, 1, 1, CAST(N'2022-12-01T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1349.5100)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (196, 1, 1, CAST(N'2020-04-26T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1145.8400)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (197, 1, 1, CAST(N'2021-07-15T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1004.0300)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (198, 1, 1, CAST(N'2021-08-29T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 261.5800)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (199, 1, 1, CAST(N'2020-08-18T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 183.7700)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (200, 1, 1, CAST(N'2020-10-10T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 517.2100)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (201, 1, 1, CAST(N'2022-10-09T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1829.4400)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (202, 1, 1, CAST(N'2021-09-05T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1007.2500)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (203, 1, 1, CAST(N'2021-08-16T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 147.3600)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (204, 1, 1, CAST(N'2020-04-20T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 994.9900)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (205, 1, 1, CAST(N'2020-05-02T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 187.1800)
GO
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (206, 1, 1, CAST(N'2022-05-30T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1892.2000)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (207, 1, 1, CAST(N'2022-07-18T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 532.0700)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (208, 1, 1, CAST(N'2022-12-18T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1249.6000)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (209, 1, 1, CAST(N'2020-07-02T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 968.4800)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (210, 1, 1, CAST(N'2022-07-02T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1763.4400)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (211, 1, 1, CAST(N'2021-08-05T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 898.4000)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (212, 1, 1, CAST(N'2022-04-30T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 282.1000)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (213, 1, 1, CAST(N'2022-03-01T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1163.1200)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (214, 1, 1, CAST(N'2021-02-14T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 735.3900)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (215, 1, 1, CAST(N'2023-02-17T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 295.5500)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (216, 1, 1, CAST(N'2023-01-19T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 521.3000)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (217, 1, 1, CAST(N'2023-03-07T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1723.6000)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (218, 1, 1, CAST(N'2023-03-11T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 152.1000)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (219, 1, 1, CAST(N'2023-03-07T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1834.5800)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (220, 1, 1, CAST(N'2023-02-17T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 332.3800)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (221, 1, 1, CAST(N'2023-02-26T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 220.7700)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (222, 1, 1, CAST(N'2023-01-22T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 290.4100)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (223, 1, 1, CAST(N'2023-02-27T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1091.8600)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (224, 1, 1, CAST(N'2023-02-23T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 556.5300)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (225, 1, 1, CAST(N'2023-02-12T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 366.3500)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (226, 1, 1, CAST(N'2023-03-16T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1774.3300)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (227, 1, 1, CAST(N'2023-02-14T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1853.7600)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (228, 1, 1, CAST(N'2023-02-21T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1173.9000)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (229, 1, 1, CAST(N'2023-02-03T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 134.7900)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (230, 1, 1, CAST(N'2023-01-05T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1348.3100)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (231, 1, 1, CAST(N'2023-03-11T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1970.6200)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (232, 1, 1, CAST(N'2023-03-07T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 235.5100)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (233, 1, 1, CAST(N'2023-01-06T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1348.0500)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (234, 1, 1, CAST(N'2023-01-21T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 151.2300)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (235, 1, 1, CAST(N'2023-02-16T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1856.7200)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (236, 1, 1, CAST(N'2023-01-10T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1491.2900)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (237, 1, 1, CAST(N'2023-03-18T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 918.4800)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (238, 1, 1, CAST(N'2023-01-11T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 126.6700)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (239, 1, 1, CAST(N'2023-01-27T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1960.2900)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (240, 1, 1, CAST(N'2023-02-12T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1404.6000)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (241, 1, 1, CAST(N'2023-03-11T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 965.6700)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (242, 1, 1, CAST(N'2023-01-17T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 239.1700)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (243, 1, 1, CAST(N'2023-01-06T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 987.5100)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (244, 1, 1, CAST(N'2023-01-14T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1776.0900)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (245, 1, 1, CAST(N'2023-02-07T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 938.3100)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (246, 1, 1, CAST(N'2023-03-01T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1174.8300)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (247, 1, 1, CAST(N'2023-02-21T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 292.4900)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (248, 1, 1, CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1215.9200)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (249, 1, 1, CAST(N'2023-03-17T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1166.1700)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (250, 1, 1, CAST(N'2023-01-25T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 170.2800)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (251, 1, 1, CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 102.4400)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (252, 1, 1, CAST(N'2023-02-01T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1896.4900)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (253, 1, 1, CAST(N'2023-01-10T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1685.4200)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (254, 1, 1, CAST(N'2023-01-27T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 292.0600)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (255, 1, 1, CAST(N'2023-03-17T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1824.2400)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (256, 1, 1, CAST(N'2023-02-01T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1028.3300)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (257, 1, 1, CAST(N'2023-01-21T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1824.2100)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (258, 1, 1, CAST(N'2023-03-07T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1729.0400)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (259, 1, 1, CAST(N'2023-02-03T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 115.7400)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (260, 1, 1, CAST(N'2023-03-01T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1909.6200)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (261, 1, 1, CAST(N'2023-01-05T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1372.8400)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (262, 1, 1, CAST(N'2023-03-06T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1382.8100)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (263, 1, 1, CAST(N'2023-02-27T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 1981.2200)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (264, 1, 1, CAST(N'2023-02-02T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 594.3000)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (265, 1, 1, CAST(N'2023-03-20T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 8299.5000)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (266, 1, 1, CAST(N'2023-03-21T00:00:00.000' AS DateTime), N'Lam Lai', N'FPT university', N'123456789', 182.4300)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (267, 1, 1, CAST(N'2023-03-21T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 87.2600)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (268, 1, 1, CAST(N'2023-03-21T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 182.4300)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (269, 1, 1, CAST(N'2023-03-21T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 199.1300)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (270, 1, 1, CAST(N'2023-03-21T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 16.6400)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (271, 1, 1, CAST(N'2023-03-23T00:00:00.000' AS DateTime), N'Nguyen Minh Phuong', N'hoang quoc viet, cau giay, ha noi', N'0332916668', 117.2400)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (272, 1, 1, CAST(N'2023-03-23T00:00:00.000' AS DateTime), N'Lam Lai', N'FPT university', N'123456789', 105.9300)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (273, 1, 1, CAST(N'2023-03-23T00:00:00.000' AS DateTime), N'Lam Lai', N'FPT university', N'123456789', 51.0000)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (274, 1, 1, CAST(N'2023-03-23T00:00:00.000' AS DateTime), N'Lam Lai', N'FPT university', N'123456789', 0.0000)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (275, 1, 1, CAST(N'2023-03-23T00:00:00.000' AS DateTime), N'Lam Lai', N'FPT university', N'123456789', 70.6200)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (276, 1, 1, CAST(N'2023-03-23T00:00:00.000' AS DateTime), N'Lam Lai', N'FPT university', N'123456789', 63.7500)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (277, 1, 1, CAST(N'2023-03-23T00:00:00.000' AS DateTime), N'Lam Lai', N'FPT university', N'123456789', 218.9160)
INSERT [dbo].[Orders] ([orderID], [CustomerID], [cartId], [orderTime], [customerName], [address], [phone], [total]) VALUES (278, 1, 1, CAST(N'2023-03-23T00:00:00.000' AS DateTime), N'Lam Lai', N'FPT university', N'123456789', 76.5000)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (1, N'Esprit Ruffle Shirt', 1000, 16.6400, N'A T-shirt is a casual garment made out of cotton or a cotton-synthetic blend fabric. It has short sleeves and a round neckline and is designed to be worn over the head. It is usually plain in design, but can also be printed with a graphic or other design. T-shirts are usually worn as a casual form of clothing and are popular with people of all ages.', 1, N'images/product-01.jpg', CAST(N'2021-12-09T00:00:00.000' AS DateTime), N'Red')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (2, N'Herschel supply', 1000, 35.3100, N'White shirt is one of the closest and most fashionable shirts. It can be suitable for many different content. White shirts are usually made of cotton or polyester fabric. It can easily wear meetings, meetings, or any other occasions. White shirt is a popular shirt, because it is a simple way to create more elegance to any outfit.', 1, N'images/product-02.jpg', CAST(N'2020-12-20T00:00:00.000' AS DateTime), N'Grey')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (3, N'Only Check Trouser', 1000, 25.5000, N'Blue office plaid shirt is a dynamic and modern fashion product. It is designed based on a youthful style, creating a youthful and modern style. The material of the shirt is cotton or polyester, which can help you more comfortable and comfortable in all activities. Blue office plaid shirt can also be a great choice for people who like dynamic fashion style.', 2, N'images/product-03.jpg', CAST(N'2021-04-01T00:00:00.000' AS DateTime), N'Green')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (4, N'Classic Trench Coat', 1000, 25.5000, N'A T-shirt is a casual garment made out of cotton or a cotton-synthetic blend fabric. It has short sleeves and a round neckline and is designed to be worn over the head. It is usually plain in design, but can also be printed with a graphic or other design. T-shirts are usually worn as a casual form of clothing and are popular with people of all ages.', 1, N'images/product-04.jpg', CAST(N'2021-08-23T00:00:00.000' AS DateTime), N'Green')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (5, N'Front Pocket Jumper', 1000, 25.5000, N'Front Pocket Jumper is a casual, comfortable garment. It features a front pocket and a drawstring hood. It comes in various colors and materials, and is perfect for days when you want to look casual while still keeping warm.', 1, N'images/product-05.jpg', CAST(N'2020-07-16T00:00:00.000' AS DateTime), N'Green')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (6, N'Vintage Inspired Classic', 1000, 93.2000, N'Vintage Inspired Classic watches are the perfect blend of classic style and modern features. These watches feature a timeless design, with a classic round face, thin hands and markers, and a stainless steel case. The designs are inspired by the vintage era, but with modern touches like dials, straps and more. With its unique and classic look, these watches are sure to turn heads.', 5, N'images/product-06.jpg', CAST(N'2021-01-28T00:00:00.000' AS DateTime), N'Green')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (7, N'Shirt in Stretch Cotton', 1000, 52.6600, N'A shirt in stretch cotton is a type of clothing made from a material that combines cotton and elastane fibers. The addition of elastane gives the fabric a slight stretch, making the shirt more comfortable to wear and allowing for greater ease of movement. Shirts in stretch cotton are popular for office wear, casual wear, and formal occasions because they are versatile and can work with a variety of outfits. They come in a range of styles, including collared shirts, button-down shirts, and t-shirts, and are available in many different colors and patterns.', 1, N'images/product-07.jpg', CAST(N'2021-01-26T00:00:00.000' AS DateTime), N'Green')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (8, N'Pieces Metallic Printed', 1000, 18.9600, N'A shirt in stretch cotton is a type of clothing made from a material that combines cotton and elastane fibers. The addition of elastane gives the fabric a slight stretch, making the shirt more comfortable to wear and allowing for greater ease of movement. Shirts in stretch cotton are popular for office wear, casual wear, and formal occasions because they are versatile and can work with a variety of outfits. They come in a range of styles, including collared shirts, button-down shirts, and t-shirts, and are available in many different colors and patterns.', 1, N'images/product-08.jpg', CAST(N'2020-02-28T00:00:00.000' AS DateTime), N'Black')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (9, N'Converse All Star Hi Plimsolls', 1000, 75.0000, N'The Converse All Star Hi Plimsolls are a high-top sneaker shoe made by Converse. They feature a canvas upper with a rubber toe cap and sole. The All Star Hi Plimsolls come in a variety of colors and patterns, and are known for their classic, understated style. They are popular among both men and women, and are often worn as a casual fashion statement. The shoe has been around for decades, and has remained a staple in fashion and pop culture.', 4, N'images/product-09.jpg', CAST(N'2021-03-22T00:00:00.000' AS DateTime), N'Green')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (10, N'Femme T-Shirt In Stripe', 1000, 25.8500, N'The Femme T-Shirt In Stripe is a type of womens shirt that features horizontal stripe patterns in different colors. The shirt is made from a comfortable and breathable fabric, usually cotton or a cotton blend, and it comes with a round neck and short sleeves. This shirt is a popular casual wear item and can be paired with jeans, skirts, or shorts for a relaxed and stylish look. It comes in different sizes and colors to suit different body types and personal preferences.', 1, N'images/product-10.jpg', CAST(N'2020-02-17T00:00:00.000' AS DateTime), N'Black')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (11, N'Herschel supply', 1000, 63.1600, N'Herschel Supply Co. is a Canadian brand that specializes in providing high-quality backpacks, bags, travel accessories, and apparel. The brand was founded by two brothers in 2009 with a mission to create timeless products while promoting a sustainable future. The company is known for its signature design, which features a classic look with modern functionality. Herschel products are made with durable materials and offer ample storage space, making them ideal for everyday use and travel. The brand has become popular worldwide and is available in over 90 countries.', 2, N'images/product-11.jpg', CAST(N'2021-10-06T00:00:00.000' AS DateTime), N'Grey')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (12, N'Herschel supply', 1000, 63.1500, N'Herschel Supply Co. is a Canadian brand that specializes in providing high-quality backpacks, bags, travel accessories, and apparel. The brand was founded by two brothers in 2009 with a mission to create timeless products while promoting a sustainable future. The company is known for its signature design, which features a classic look with modern functionality. Herschel products are made with durable materials and offer ample storage space, making them ideal for everyday use and travel. The brand has become popular worldwide and is available in over 90 countries.', 2, N'images/product-12.jpg', CAST(N'2021-01-12T00:00:00.000' AS DateTime), N'Blue')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (13, N'T-Shirt with Sleeve', 1000, 18.4900, N'A T-shirt with sleeves is a type of casual shirt typically made of cotton or a cotton blend fabric. It features short or long sleeves that cover a portion or the entire arm, depending on the style. T-shirts with sleeves come in a variety of colors, patterns, and designs, including solid colors, stripes, graphics, and prints. They are commonly worn as part of a casual outfit for everyday wear or for sports and exercise activities. Some T-shirts with sleeves may also feature additional design elements such as pockets, zippers, or collars.', 1, N'images/product-13.jpg', CAST(N'2020-10-21T00:00:00.000' AS DateTime), N'Black')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (14, N'T-Shirt with Sleeve', 1000, 54.7900, N'PrettyLittleThing is a popular online fashion retailer that offers trendy and affordable clothing, shoes, and accessories for women. The brand was founded in 2012 in Manchester, UK and has since expanded globally, with websites in multiple countries. PrettyLittleThing is known for its fast fashion and celebrity collaborations, as well as a wide range of sizes and inclusive styles. The brand caters to women of all shapes and sizes, and it is a go-to destination for fashion-conscious shoppers who want to stay up-to-date with the latest trends without breaking the bank.', 1, N'images/product-14.jpg', CAST(N'2021-02-09T00:00:00.000' AS DateTime), N'Grey')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (15, N'Mini Silver Mesh Watch', 1000, 86.8500, N'The Mini Silver Mesh Watch is a stylish and elegant timepiece designed for both casual and formal occasions. It features a sleek silver mesh strap that sits comfortably on the wrist and provides a secure fit. The dial has a minimalist design with simple hour markers and hands, making it easy to read the time at a glance. The watch is made from high-quality materials and has a durable construction, ensuring that it will last for many years. With its sophisticated look and reliable performance, the Mini Silver Mesh Watch is a great accessory for anyone who wants to stay on time and look fashionable at the same time.', 5, N'images/product-15.jpg', CAST(N'2021-05-08T00:00:00.000' AS DateTime), N'Black')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (16, N'Square Neck Back', 1000, 29.6400, N'The Mini Silver Mesh Watch is a stylish and elegant timepiece designed for both casual and formal occasions. It features a sleek silver mesh strap that sits comfortably on the wrist and provides a secure fit. The dial has a minimalist design with simple hour markers and hands, making it easy to read the time at a glance. The watch is made from high-quality materials and has a durable construction, ensuring that it will last for many years. With its sophisticated look and reliable performance, the Mini Silver Mesh Watch is a great accessory for anyone who wants to stay on time and look fashionable at the same time.', 1, N'images/product-16.jpg', CAST(N'2021-03-14T00:00:00.000' AS DateTime), N'Black')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (17, N'Product 17', 1000, 541.8300, N'Product 17 ', 1, N'images/product-17.jpg', CAST(N'2020-10-10T00:00:00.000' AS DateTime), N'Blue')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (18, N'Product 18', 1000, 755.3400, N'Product 18 ', 3, N'images/product-18.jpg', CAST(N'2021-10-20T00:00:00.000' AS DateTime), N'Red')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (19, N'Product 19', 1000, 893.9500, N'Product 19 ', 3, N'images/product-19.jpg', CAST(N'2021-07-01T00:00:00.000' AS DateTime), N'Black')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (20, N'Product 20', 1000, 923.6600, N'Product 20 ', 3, N'images/product-20.jpg', CAST(N'2021-01-27T00:00:00.000' AS DateTime), N'Black')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (21, N'Product 21', 1000, 160.3200, N'Product 21 ', 3, N'images/product-21.jpg', CAST(N'2021-07-04T00:00:00.000' AS DateTime), N'Grey')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (22, N'Product 22', 1000, 330.1900, N'Product 22 ', 3, N'images/product-22.jpg', CAST(N'2022-06-26T00:00:00.000' AS DateTime), N'Green')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (23, N'Product 23', 1000, 801.1100, N'Product 23 ', 3, N'images/product-23.jpg', CAST(N'2022-06-29T00:00:00.000' AS DateTime), N'Black')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (24, N'Product 24', 1000, 624.3300, N'Product 24 ', 3, N'images/product-24.jpg', CAST(N'2022-10-01T00:00:00.000' AS DateTime), N'Blue')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (25, N'Product 25', 1000, 28.1500, N'Product 25 ', 3, N'images/product-25.jpg', CAST(N'2021-10-19T00:00:00.000' AS DateTime), N'Blue')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (26, N'Product 26', 1000, 74.8500, N'Product 26 ', 3, N'images/product-26.jpg', CAST(N'2020-01-08T00:00:00.000' AS DateTime), N'Grey')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (27, N'Product 27', 1000, 558.5100, N'Product 27 ', 3, N'images/product-27.jpg', CAST(N'2021-06-24T00:00:00.000' AS DateTime), N'Black')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (28, N'Product 28', 1000, 319.9500, N'Product 28 ', 3, N'images/product-28.jpg', CAST(N'2022-03-24T00:00:00.000' AS DateTime), N'Green')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (29, N'Product 29', 1000, 727.8000, N'Product 29 ', 3, N'images/product-29.jpg', CAST(N'2021-04-17T00:00:00.000' AS DateTime), N'Grey')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (30, N'Product 30', 1000, 26.9500, N'Product 30 ', 2, N'images/product-30.jpg', CAST(N'2021-02-18T00:00:00.000' AS DateTime), N'Red')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (31, N'Product 31', 1000, 354.2100, N'Product 31 ', 2, N'images/product-31.jpg', CAST(N'2020-09-19T00:00:00.000' AS DateTime), N'Blue')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (32, N'Product 32', 1000, 645.9700, N'Product 32 ', 2, N'images/product-32.jpg', CAST(N'2022-05-19T00:00:00.000' AS DateTime), N'Green')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (33, N'Product 33', 1000, 982.9100, N'Product 33 ', 2, N'images/product-33.jpg', CAST(N'2021-07-11T00:00:00.000' AS DateTime), N'Black')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (34, N'Product 34', 1000, 157.6300, N'Product 34 ', 1, N'images/product-34.jpg', CAST(N'2020-08-18T00:00:00.000' AS DateTime), N'Blue')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (35, N'Product 35', 1000, 605.5900, N'Product 35 ', 1, N'images/product-35.jpg', CAST(N'2021-10-11T00:00:00.000' AS DateTime), N'Blue')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (36, N'Product 36', 1000, 691.4300, N'Product 36 ', 3, N'images/product-36.jpg', CAST(N'2022-09-28T00:00:00.000' AS DateTime), N'Black')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (37, N'Product 37', 1000, 617.9900, N'Product 37 ', 2, N'images/product-37.jpg', CAST(N'2020-10-19T00:00:00.000' AS DateTime), N'Red')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (38, N'Product 38', 1000, 451.5900, N'Product 38 ', 2, N'images/product-38.jpg', CAST(N'2021-10-01T00:00:00.000' AS DateTime), N'Red')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (39, N'Product 39', 1000, 611.0900, N'Product 39 ', 2, N'images/product-39.jpg', CAST(N'2020-11-05T00:00:00.000' AS DateTime), N'Blue')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (40, N'Product 40', 1000, 68.8800, N'Product 40 ', 2, N'images/product-40.jpg', CAST(N'2022-04-15T00:00:00.000' AS DateTime), N'Green')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (41, N'Product 41', 1000, 617.0400, N'Product 41 ', 3, N'images/product-41.jpg', CAST(N'2021-01-27T00:00:00.000' AS DateTime), N'Grey')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (42, N'Product 42', 1000, 177.9200, N'Product 42 ', 3, N'images/product-42.jpg', CAST(N'2021-01-12T00:00:00.000' AS DateTime), N'Black')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (43, N'Product 43', 1000, 496.7600, N'Product 43 ', 3, N'images/product-43.jpg', CAST(N'2021-08-11T00:00:00.000' AS DateTime), N'Red')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (44, N'Product 44', 1000, 290.6500, N'Product 44 ', 3, N'images/product-44.jpg', CAST(N'2021-09-25T00:00:00.000' AS DateTime), N'Blue')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (45, N'Product 45', 1000, 599.1700, N'Product 45 ', 3, N'images/product-45.jpg', CAST(N'2021-06-27T00:00:00.000' AS DateTime), N'Black')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (46, N'Product 46', 1000, 206.2200, N'Product 46 ', 3, N'images/product-46.jpg', CAST(N'2022-04-04T00:00:00.000' AS DateTime), N'Green')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (47, N'Product 47', 1000, 176.9800, N'Product 47 ', 4, N'images/product-47.jpg', CAST(N'2021-05-28T00:00:00.000' AS DateTime), N'Black')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (48, N'Product 48', 1000, 42.2100, N'Product 48 ', 4, N'images/product-48.jpg', CAST(N'2020-03-04T00:00:00.000' AS DateTime), N'Black')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (49, N'Product 49', 1000, 8.2100, N'Product 49 ', 4, N'images/product-49.jpg', CAST(N'2021-05-15T00:00:00.000' AS DateTime), N'Red')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (50, N'Product 50', 1000, 196.7000, N'Product 50 ', 4, N'images/product-50.jpg', CAST(N'2021-06-22T00:00:00.000' AS DateTime), N'Blue')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (51, N'Product 51', 1000, 538.3500, N'Product 51 ', 4, N'images/product-51.jpg', CAST(N'2021-07-20T00:00:00.000' AS DateTime), N'Red')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (52, N'Product 52', 1000, 25.0900, N'Product 52 ', 4, N'images/product-52.jpg', CAST(N'2021-12-14T00:00:00.000' AS DateTime), N'Red')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (53, N'Product 53', 1000, 588.8900, N'Product 53 ', 4, N'images/product-53.jpg', CAST(N'2021-09-20T00:00:00.000' AS DateTime), N'Red')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (54, N'Product 54', 1000, 967.3000, N'Product 54 ', 4, N'images/product-54.jpg', CAST(N'2021-01-31T00:00:00.000' AS DateTime), N'Blue')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (55, N'Product 55', 1000, 349.5200, N'Product 55 ', 4, N'images/product-55.jpg', CAST(N'2021-02-10T00:00:00.000' AS DateTime), N'Red')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (56, N'Product 56', 1000, 208.2900, N'Product 56 ', 4, N'images/product-56.jpg', CAST(N'2022-02-08T00:00:00.000' AS DateTime), N'Blue')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (57, N'Product 57', 1000, 277.4500, N'Product 57 ', 5, N'images/product-57.jpg', CAST(N'2020-07-27T00:00:00.000' AS DateTime), N'Grey')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (58, N'Product 58', 1000, 387.4500, N'Product 58 ', 5, N'images/product-58.jpg', CAST(N'2020-06-26T00:00:00.000' AS DateTime), N'Green')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (59, N'Product 59', 1000, 445.3800, N'Product 59 ', 5, N'images/product-59.jpg', CAST(N'2020-06-11T00:00:00.000' AS DateTime), N'Black')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (60, N'Product 60', 1000, 464.0900, N'Product 60 ', 5, N'images/product-60.jpg', CAST(N'2021-11-01T00:00:00.000' AS DateTime), N'Blue')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (61, N'Product 61', 1000, 431.8200, N'Product 61 ', 5, N'images/product-61.jpg', CAST(N'2020-09-07T00:00:00.000' AS DateTime), N'Red')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (62, N'Product 62', 1000, 674.2700, N'Product 62 ', 5, N'images/product-62.jpg', CAST(N'2022-11-03T00:00:00.000' AS DateTime), N'Blue')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (63, N'Product 63', 1000, 604.6800, N'Product 63 ', 5, N'images/product-63.jpg', CAST(N'2021-04-26T00:00:00.000' AS DateTime), N'Green')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (64, N'Product 64', 1000, 775.1200, N'Product 64 ', 5, N'images/product-64.jpg', CAST(N'2021-10-20T00:00:00.000' AS DateTime), N'Black')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (65, N'Product 65', 1000, 484.6000, N'Product 65 ', 5, N'images/product-65.jpg', CAST(N'2021-07-17T00:00:00.000' AS DateTime), N'Grey')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (66, N'Product 66', 1000, 98.5200, N'Product 66 ', 5, N'images/product-66.jpg', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'Grey')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (67, N'Product 67', 1000, 140.6100, N'Product 67 ', 5, N'images/product-67.jpg', CAST(N'2022-06-18T00:00:00.000' AS DateTime), N'Black')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (68, N'Product 68', 1000, 424.0400, N'Product 68 ', 5, N'images/product-68.jpg', CAST(N'2021-03-19T00:00:00.000' AS DateTime), N'Grey')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (69, N'Product 69', 1000, 447.5200, N'Product 69 ', 5, N'images/product-69.jpg', CAST(N'2021-07-18T00:00:00.000' AS DateTime), N'Black')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (70, N'Product 70', 1000, 667.6100, N'Product 70 ', 5, N'images/product-70.jpg', CAST(N'2021-10-21T00:00:00.000' AS DateTime), N'Black')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (71, N'Product 71', 1000, 643.6800, N'Product 71 ', 5, N'images/product-71.jpg', CAST(N'2020-10-23T00:00:00.000' AS DateTime), N'Blue')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (72, N'Product 72', 1000, 830.5800, N'Product 72 ', 2, N'images/product-72.jpg', CAST(N'2021-12-11T00:00:00.000' AS DateTime), N'Red')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (73, N'Product 73', 1000, 400.0200, N'Product 73 ', 2, N'images/product-73.jpg', CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'Black')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (74, N'Product 74', 1000, 564.7800, N'Product 74 ', 2, N'images/product-74.jpg', CAST(N'2021-11-02T00:00:00.000' AS DateTime), N'Grey')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (75, N'Product 75', 1000, 513.6000, N'Product 75 ', 2, N'images/product-75.jpg', CAST(N'2021-10-25T00:00:00.000' AS DateTime), N'Green')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (76, N'Product 76', 1000, 7.5400, N'Product 76 ', 2, N'images/product-76.jpg', CAST(N'2021-04-14T00:00:00.000' AS DateTime), N'Green')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (77, N'Product 77', 1000, 34.8600, N'Product 77 ', 2, N'images/product-77.jpg', CAST(N'2021-06-02T00:00:00.000' AS DateTime), N'Grey')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (78, N'Product 78', 1000, 743.9000, N'Product 78 ', 2, N'images/product-78.jpg', CAST(N'2022-10-09T00:00:00.000' AS DateTime), N'Grey')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (79, N'Product 79', 1000, 856.4400, N'Product 79 ', 2, N'images/product-79.jpg', CAST(N'2020-07-28T00:00:00.000' AS DateTime), N'Green')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (80, N'Product 80', 1000, 894.1200, N'Product 80 ', 2, N'images/product-80.jpg', CAST(N'2021-12-03T00:00:00.000' AS DateTime), N'Black')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (81, N'Product 81', 1000, 569.8800, N'Product 81 ', 2, N'images/product-81.jpg', CAST(N'2021-11-13T00:00:00.000' AS DateTime), N'Grey')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (82, N'Product 82', 1000, 345.8500, N'Product 82 ', 2, N'images/product-82.jpg', CAST(N'2022-09-06T00:00:00.000' AS DateTime), N'Blue')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (83, N'Product 83', 1000, 116.6400, N'Product 83 ', 2, N'images/product-83.jpg', CAST(N'2021-08-27T00:00:00.000' AS DateTime), N'Green')
INSERT [dbo].[Products] ([productID], [nameProduct], [quantity], [price], [descript], [categoryID], [image], [dateRelease], [color]) VALUES (90, N'test product', 1000, 38.0000, N'nice xu', 3, N'', CAST(N'2023-03-14T00:00:00.000' AS DateTime), N'green')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
INSERT [dbo].[Size] ([size], [description]) VALUES (N'38', N'tiny')
INSERT [dbo].[Size] ([size], [description]) VALUES (N'39', N'less tiny')
INSERT [dbo].[Size] ([size], [description]) VALUES (N'40', N'nicexuuuu')
INSERT [dbo].[Size] ([size], [description]) VALUES (N'41', N'helloooo')
INSERT [dbo].[Size] ([size], [description]) VALUES (N'42', N'newwwww')
INSERT [dbo].[Size] ([size], [description]) VALUES (N'abc', N'small123')
INSERT [dbo].[Size] ([size], [description]) VALUES (N'L', N'nai xuuuu')
INSERT [dbo].[Size] ([size], [description]) VALUES (N'M', N'nice')
INSERT [dbo].[Size] ([size], [description]) VALUES (N'S', N'okee ee')
INSERT [dbo].[Size] ([size], [description]) VALUES (N'XL', N'thin')
INSERT [dbo].[Size] ([size], [description]) VALUES (N'XXL', N'thicker')
INSERT [dbo].[Size] ([size], [description]) VALUES (N'xyz', N'small')
GO
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'38', 9, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'38', 47, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'38', 48, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'38', 49, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'38', 50, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'38', 51, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'38', 52, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'38', 53, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'38', 54, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'38', 55, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'38', 56, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'39', 9, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'39', 47, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'39', 48, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'39', 49, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'39', 50, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'39', 51, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'39', 52, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'39', 53, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'39', 54, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'39', 55, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'39', 56, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'40', 9, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'40', 47, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'40', 48, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'40', 49, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'40', 50, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'40', 51, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'40', 52, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'40', 53, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'40', 54, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'40', 55, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'40', 56, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'41', 9, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'41', 47, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'41', 48, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'41', 49, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'41', 50, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'41', 51, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'41', 52, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'41', 53, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'41', 54, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'41', 55, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'41', 56, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'42', 9, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'42', 47, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'42', 48, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'42', 49, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'42', 50, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'42', 51, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'42', 52, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'42', 53, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'42', 54, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'42', 55, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'42', 56, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'abc', 1, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'abc', 2, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'abc', 4, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'abc', 5, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'abc', 7, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'abc', 8, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'abc', 10, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'abc', 13, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'abc', 14, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'abc', 16, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'abc', 17, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'abc', 34, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'abc', 35, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'L', 1, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'L', 2, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'L', 3, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'L', 4, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'L', 5, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'L', 7, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'L', 8, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'L', 10, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'L', 11, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'L', 12, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'L', 13, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'L', 14, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'L', 16, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'L', 17, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'L', 30, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'L', 31, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'L', 32, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'L', 33, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'L', 34, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'L', 35, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'L', 37, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'L', 38, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'L', 39, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'L', 40, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'L', 72, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'L', 73, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'L', 74, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'L', 75, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'L', 76, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'L', 77, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'L', 78, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'L', 79, 200)
GO
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'L', 80, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'L', 81, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'L', 82, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'L', 83, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'M', 1, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'M', 2, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'M', 3, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'M', 4, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'M', 5, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'M', 7, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'M', 8, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'M', 10, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'M', 11, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'M', 12, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'M', 13, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'M', 14, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'M', 16, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'M', 17, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'M', 30, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'M', 31, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'M', 32, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'M', 33, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'M', 34, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'M', 35, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'M', 37, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'M', 38, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'M', 39, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'M', 40, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'M', 72, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'M', 73, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'M', 74, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'M', 75, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'M', 76, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'M', 77, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'M', 78, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'M', 79, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'M', 80, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'M', 81, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'M', 82, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'M', 83, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'S', 1, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'S', 2, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'S', 3, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'S', 4, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'S', 5, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'S', 7, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'S', 8, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'S', 10, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'S', 11, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'S', 12, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'S', 13, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'S', 14, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'S', 16, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'S', 17, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'S', 30, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'S', 31, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'S', 32, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'S', 33, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'S', 34, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'S', 35, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'S', 37, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'S', 38, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'S', 39, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'S', 40, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'S', 72, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'S', 73, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'S', 74, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'S', 75, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'S', 76, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'S', 77, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'S', 78, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'S', 79, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'S', 80, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'S', 81, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'S', 82, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'S', 83, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XL', 1, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XL', 2, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XL', 3, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XL', 4, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XL', 5, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XL', 7, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XL', 8, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XL', 10, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XL', 11, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XL', 12, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XL', 13, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XL', 14, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XL', 16, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XL', 17, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XL', 30, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XL', 31, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XL', 32, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XL', 33, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XL', 34, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XL', 35, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XL', 37, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XL', 38, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XL', 39, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XL', 40, 200)
GO
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XL', 72, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XL', 73, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XL', 74, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XL', 75, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XL', 76, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XL', 77, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XL', 78, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XL', 79, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XL', 80, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XL', 81, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XL', 82, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XL', 83, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XXL', 1, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XXL', 2, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XXL', 3, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XXL', 4, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XXL', 5, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XXL', 7, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XXL', 8, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XXL', 10, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XXL', 11, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XXL', 12, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XXL', 13, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XXL', 14, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XXL', 16, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XXL', 17, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XXL', 30, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XXL', 31, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XXL', 32, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XXL', 33, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XXL', 34, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XXL', 35, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XXL', 37, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XXL', 38, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XXL', 39, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XXL', 40, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XXL', 72, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XXL', 73, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XXL', 74, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XXL', 75, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XXL', 76, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XXL', 77, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XXL', 78, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XXL', 79, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XXL', 80, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XXL', 81, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XXL', 82, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'XXL', 83, 200)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'xyz', 3, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'xyz', 11, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'xyz', 12, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'xyz', 30, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'xyz', 31, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'xyz', 32, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'xyz', 33, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'xyz', 37, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'xyz', 38, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'xyz', 39, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'xyz', 40, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'xyz', 72, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'xyz', 73, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'xyz', 74, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'xyz', 75, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'xyz', 76, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'xyz', 77, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'xyz', 78, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'xyz', 79, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'xyz', 80, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'xyz', 81, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'xyz', 82, 100)
INSERT [dbo].[Size_Product] ([size], [productID], [quantity]) VALUES (N'xyz', 83, 100)
GO
INSERT [dbo].[Vouchers] ([code], [discount]) VALUES (N'cozastore', CAST(0.500 AS Decimal(4, 3)))
INSERT [dbo].[Vouchers] ([code], [discount]) VALUES (N'helloworld', CAST(0.100 AS Decimal(4, 3)))
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD FOREIGN KEY([accountID])
REFERENCES [dbo].[Accounts] ([accountID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[Orders] ([orderID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([productId])
REFERENCES [dbo].[Products] ([productID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([cartId])
REFERENCES [dbo].[cart] ([cartid])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[product_cart]  WITH CHECK ADD FOREIGN KEY([cartId])
REFERENCES [dbo].[cart] ([cartid])
GO
ALTER TABLE [dbo].[product_cart]  WITH CHECK ADD FOREIGN KEY([productId])
REFERENCES [dbo].[Products] ([productID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([categoryID])
REFERENCES [dbo].[Categories] ([categoryID])
GO
ALTER TABLE [dbo].[Size_Product]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[Products] ([productID])
GO
ALTER TABLE [dbo].[Size_Product]  WITH CHECK ADD FOREIGN KEY([size])
REFERENCES [dbo].[Size] ([size])
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD FOREIGN KEY([customerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[Products] ([productID])
GO
