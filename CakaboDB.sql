USE [CakaboStoreDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2.04.2024 13:45:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 2.04.2024 13:45:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](20) NOT NULL,
	[Password] [varchar](32) NOT NULL,
	[NameSurname] [varchar](50) NOT NULL,
	[LastLoginDate] [datetime2](7) NOT NULL,
	[LastLoginIP] [nvarchar](max) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 2.04.2024 13:45:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[DisplayIndex] [int] NOT NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 2.04.2024 13:45:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ParentID] [int] NULL,
	[Name] [varchar](50) NULL,
	[DisplayIndex] [int] NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 2.04.2024 13:45:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderNumber] [varchar](20) NULL,
	[PaymentOption] [int] NOT NULL,
	[OrderStatus] [int] NOT NULL,
	[RecDate] [datetime2](7) NOT NULL,
	[Address] [varchar](120) NULL,
	[Country] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Distinct] [varchar](50) NULL,
	[ZipCode] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[MailAddress] [varchar](80) NULL,
	[NameSurname] [varchar](120) NULL,
	[ShippedFee] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 2.04.2024 13:45:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[ProductName] [varchar](100) NULL,
	[ProductPicture] [varchar](150) NULL,
	[ProductPrice] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2.04.2024 13:45:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Stock] [int] NOT NULL,
	[Description] [varchar](250) NULL,
	[DisplayIndex] [int] NOT NULL,
	[CategoryID] [int] NULL,
	[BrandID] [int] NULL,
	[Detail] [text] NULL,
	[CargoDetail] [text] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPicture]    Script Date: 2.04.2024 13:45:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPicture](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Picture] [varchar](150) NULL,
	[DisplayIndex] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
 CONSTRAINT [PK_ProductPicture] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slide]    Script Date: 2.04.2024 13:45:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slide](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Slogan] [varchar](50) NULL,
	[Title] [varchar](50) NOT NULL,
	[Description] [varchar](250) NOT NULL,
	[Picture] [varchar](150) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Link] [varchar](150) NULL,
	[DisplayIndex] [nvarchar](max) NULL,
 CONSTRAINT [PK_Slide] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240330073041_Initial', N'8.0.3')
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([ID], [UserName], [Password], [NameSurname], [LastLoginDate], [LastLoginIP]) VALUES (1, N'mustafa', N'202cb962ac59075b964b07152d234b70', N'Mustafa Güzel', CAST(N'2024-03-30T10:30:38.3378698' AS DateTime2), N'')
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([ID], [Name], [DisplayIndex]) VALUES (1, N'Cakabo', 1)
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [ParentID], [Name], [DisplayIndex]) VALUES (1, NULL, N'Ayakkabı', 0)
INSERT [dbo].[Category] ([ID], [ParentID], [Name], [DisplayIndex]) VALUES (2, 1, N'Spor Ayakkabı', 0)
INSERT [dbo].[Category] ([ID], [ParentID], [Name], [DisplayIndex]) VALUES (3, NULL, N'Aksesuar', 0)
INSERT [dbo].[Category] ([ID], [ParentID], [Name], [DisplayIndex]) VALUES (4, 3, N'Saat', 0)
INSERT [dbo].[Category] ([ID], [ParentID], [Name], [DisplayIndex]) VALUES (5, NULL, N'Çanta', 1)
INSERT [dbo].[Category] ([ID], [ParentID], [Name], [DisplayIndex]) VALUES (6, 5, N'Sırt Çantası', 1)
INSERT [dbo].[Category] ([ID], [ParentID], [Name], [DisplayIndex]) VALUES (7, 3, N'Kulaklık', 1)
INSERT [dbo].[Category] ([ID], [ParentID], [Name], [DisplayIndex]) VALUES (8, NULL, N'Giyim', 1)
INSERT [dbo].[Category] ([ID], [ParentID], [Name], [DisplayIndex]) VALUES (9, 8, N'T-Shirt', 1)
INSERT [dbo].[Category] ([ID], [ParentID], [Name], [DisplayIndex]) VALUES (10, 8, N'Hoodie', 0)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [OrderNumber], [PaymentOption], [OrderStatus], [RecDate], [Address], [Country], [City], [Distinct], [ZipCode], [Phone], [MailAddress], [NameSurname], [ShippedFee]) VALUES (3, N'86105912893893', 3, 0, CAST(N'2024-04-02T12:00:59.0137770' AS DateTime2), N'sadasdas', N'asdasd', N'asdasda', N'asdasdas', N'dasd', N'asdasdas', N'dasdsadas', N'dsadasdasd', CAST(50 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductID], [ProductName], [ProductPicture], [ProductPrice], [Quantity]) VALUES (3, 3, 18, N'MonoScript ', N'/img/ProductPicture/WhatsApp Image 2024-02-16 at 14.22.37.jpeg', CAST(850.00 AS Decimal(18, 2)), 1)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Name], [Price], [Stock], [Description], [DisplayIndex], [CategoryID], [BrandID], [Detail], [CargoDetail]) VALUES (2, N'Armortime', CAST(950.00 AS Decimal(18, 2)), 1000, N'Armortime Su Geçirmez Spor Saati', 0, 4, 1, N'<p><strong>Armortime Su Ge&ccedil;irmez Spor Saati</strong></p>

<p>Hem şıklığı hem de dayanıklılığı bir araya getiren Armortime Su Ge&ccedil;irmez Spor Saati, aktif yaşam tarzınız i&ccedil;in m&uuml;kemmel bir tamamlayıcıdır. Bu saatin tasarımı, g&uuml;nl&uuml;k kullanımınızda sizi tarzınızla ifade etmenize olanak tanırken, su ge&ccedil;irmez &ouml;zelliğiyle de spor aktivitelerinde g&uuml;venle kullanabilirsiniz.</p>

<p><strong>&Uuml;r&uuml;n Detayları:</strong></p>

<ul>
	<li><strong>Suya Dayanıklı Tasarım:</strong> Armortime Su Ge&ccedil;irmez Spor Saati, 50 metreye kadar su direnciyle su altı aktivitelerinde rahatlıkla kullanılabilir.</li>
	<li><strong>Dayanıklı Malzemeler:</strong> Saat, g&uuml;&ccedil;l&uuml; ve dayanıklı malzemelerden &uuml;retilmiştir, b&ouml;ylece uzun &ouml;m&uuml;rl&uuml;d&uuml;r ve yoğun kullanıma dayanıklıdır.</li>
	<li><strong>Kolay Okunabilir Ekran:</strong> B&uuml;y&uuml;k dijital ekranı sayesinde zamanı hızlıca g&ouml;rebilirsiniz, aydınlatmalı &ouml;zelliği ise d&uuml;ş&uuml;k ışık koşullarında bile okunabilirliği artırır.</li>
	<li><strong>Şık Tasarım:</strong> Armortime&#39;un &ouml;zg&uuml;n tasarımı, her tarza uyum sağlar ve kullanıcısına şıklık katar.</li>
	<li><strong>Cakabo Store Tasarımı:</strong> Bu &uuml;r&uuml;n, Cakabo Store&#39;un &ouml;zel tasarımıdır, kalite ve tarzı bir araya getirir.</li>
</ul>

<p>Armortime Su Ge&ccedil;irmez Spor Saati, g&uuml;nl&uuml;k kullanımınızda ve spor aktivitelerinde tarzınızı ve performansınızı &ouml;n plana &ccedil;ıkarırken, sağlamlığıyla da g&uuml;ven verir. Şimdi Cakabo Store&#39;un &ouml;zel tasarımıyla bu harika saate sahip olun!</p>
', N'<p><strong>Kargo Detayı:</strong></p>

<p>Armortime Su Ge&ccedil;irmez Spor Saati&#39;nizi satın aldığınızda, hızlı ve g&uuml;venilir bir kargo s&uuml;reciyle sizlere ulaştırılır. Cakabo Store&#39;un profesyonel lojistik ağı sayesinde, &uuml;r&uuml;n&uuml;n&uuml;z en kısa s&uuml;rede kapınıza kadar gelir.</p>

<p><strong>Kargo S&uuml;reci:</strong></p>

<ol>
	<li>Sipariş Onayı: Siparişiniz onaylandıktan sonra, &uuml;r&uuml;n&uuml;n&uuml;z hızla işleme alınır ve kargoya verilir.</li>
	<li>Takip Numarası: Kargo firması tarafından &uuml;r&uuml;n&uuml;n&uuml;z&uuml;n g&ouml;nderildiği anda size bir takip numarası sağlanır. Bu numara sayesinde &uuml;r&uuml;n&uuml;n&uuml;z&uuml;n kargo s&uuml;recini kolaylıkla takip edebilirsiniz.</li>
	<li>Teslimat: Kargo s&uuml;reci boyunca, &uuml;r&uuml;n&uuml;n&uuml;z g&uuml;venli bir şekilde paketlenir ve adresinize teslim edilir. Teslimat sırasında, &uuml;r&uuml;n&uuml;n&uuml;z&uuml;n hasar g&ouml;rmemesi i&ccedil;in &ouml;zenle paketlenmiş olacağından emin olabilirsiniz.</li>
	<li>M&uuml;şteri Hizmetleri Desteği: Herhangi bir sorunuz veya endişeniz olduğunda, Cakabo Store&#39;un m&uuml;şteri hizmetleri ekibi size yardımcı olmaktan memnuniyet duyacaktır. İletişim bilgilerimiz, herhangi bir sorunuz olduğunda size ulaşabileceğiniz şekilde paketinizle birlikte sağlanacaktır.</li>
</ol>

<p>Cakabo Store&#39;un kargo s&uuml;reci, hızlı, g&uuml;venilir ve m&uuml;şteri odaklıdır. &Uuml;r&uuml;n&uuml;n&uuml;z&uuml; g&uuml;venle sipariş edin ve kısa s&uuml;rede kapınızda olmasının keyfini yaşayın!</p>
')
INSERT [dbo].[Product] ([ID], [Name], [Price], [Stock], [Description], [DisplayIndex], [CategoryID], [BrandID], [Detail], [CargoDetail]) VALUES (3, N'GentleBrown Classic', CAST(750.00 AS Decimal(18, 2)), 50, N'GentleBrown Classic Deri Kordonlu Saat', 0, 4, 1, N'<p><strong>GentleBrown Classic Deri Kordonlu Saat</strong></p>

<p>GentleBrown Classic, klasik tasarımı ve &ouml;zenle se&ccedil;ilmiş detaylarıyla dikkat &ccedil;eken bir saat modelidir. Saat, zarif ve dayanıklı kahverengi deri kordonuyla dikkat &ccedil;ekerken, i&ccedil; kısmındaki gri tonlar da saate modern bir hava katmaktadır.</p>

<p><strong>&Uuml;r&uuml;n Detayları:</strong></p>

<ul>
	<li><strong>Kahverengi Deri Kordon:</strong> Saat, şık ve dayanıklı kahverengi deri kordonuyla tarzınızı tamamlar. Deri kordon, kullanıcıya rahat bir kullanım deneyimi sunar.</li>
	<li><strong>Gri İ&ccedil; Kısım:</strong> Saatin i&ccedil; kısmı, sofistike bir g&ouml;r&uuml;n&uuml;m sunan gri tonlarla tasarlanmıştır. Bu renk se&ccedil;imi, saatı klasik ve modern tarzın m&uuml;kemmel bir kombinasyonu haline getirir.</li>
	<li><strong>Analog G&ouml;sterge:</strong> Saat, kolay okunabilir analog g&ouml;stergesiyle zamanı hızlıca ve kolayca g&ouml;sterir.</li>
	<li><strong>Dayanıklı Malzemeler:</strong> Saat, y&uuml;ksek kaliteli malzemelerden &uuml;retilmiştir ve uzun s&uuml;reli kullanım i&ccedil;in tasarlanmıştır.</li>
</ul>

<p>GentleBrown Classic, klasik tarzı modern detaylarla birleştirerek kullanıcısına zarafet ve şıklık sunar. G&uuml;nl&uuml;k kullanımınızda veya &ouml;zel g&uuml;nlerde tarzınızı tamamlamak i&ccedil;in m&uuml;kemmel bir se&ccedil;imdir.</p>
', N'<p><strong>Cakabo Design GentleBrown Classic Deri Kordonlu Saat - Kargo Detayı:</strong></p>

<p>Cakabo Design GentleBrown Classic Deri Kordonlu Saat&#39;inizi sipariş ettiğinizde, hızlı ve g&uuml;venilir bir kargo s&uuml;reciyle size ulaştırılır. Cakabo Store&#39;un &ouml;zenle se&ccedil;ilmiş lojistik ağı sayesinde, &uuml;r&uuml;n&uuml;n&uuml;z g&uuml;venli bir şekilde kapınıza kadar gelir.</p>

<p><strong>Kargo S&uuml;reci:</strong></p>

<ol>
	<li><strong>Sipariş Onayı:</strong> Siparişiniz onaylandıktan sonra, &uuml;r&uuml;n&uuml;n&uuml;z hızla işleme alınır ve kargoya verilir.</li>
	<li><strong>Takip Numarası:</strong> &Uuml;r&uuml;n&uuml;n&uuml;z&uuml;n kargoya verilmesiyle birlikte size bir takip numarası sağlanır. Bu numara sayesinde, &uuml;r&uuml;n&uuml;n&uuml;z&uuml;n kargo s&uuml;recini kolaylıkla takip edebilirsiniz.</li>
	<li><strong>G&uuml;venli Paketleme:</strong> &Uuml;r&uuml;n, &ouml;zel olarak tasarlanmış ambalajında g&uuml;venli bir şekilde paketlenir. Bu sayede, &uuml;r&uuml;n&uuml;n&uuml;z&uuml;n hasar g&ouml;rmemesi i&ccedil;in gerekli &ouml;nlemler alınmış olur.</li>
	<li><strong>Hızlı Teslimat:</strong> Cakabo Store&#39;un hızlı teslimat politikası sayesinde, &uuml;r&uuml;n&uuml;n&uuml;z en kısa s&uuml;rede adresinize teslim edilir.</li>
	<li><strong>M&uuml;şteri Desteği:</strong> Herhangi bir sorunuz veya endişeniz olduğunda, Cakabo Store&#39;un m&uuml;şteri hizmetleri ekibi size yardımcı olmaktan memnuniyet duyacaktır. İletişim bilgilerimiz, herhangi bir sorunuz olduğunda size ulaşabileceğiniz şekilde paketinizle birlikte sağlanacaktır.</li>
</ol>

<p>Cakabo Design GentleBrown Classic Deri Kordonlu Saat&#39;i g&uuml;venle sipariş edin ve hızlı, g&uuml;venilir bir kargo s&uuml;reciyle kapınıza kadar ulaşmasının keyfini yaşayın!</p>
')
INSERT [dbo].[Product] ([ID], [Name], [Price], [Stock], [Description], [DisplayIndex], [CategoryID], [BrandID], [Detail], [CargoDetail]) VALUES (4, N'ShadowSteel ', CAST(750.00 AS Decimal(18, 2)), 30, N'ShadowSteel Classic Siyah Kordonlu Saat', 0, 4, 1, N'<p><strong>ShadowSteel Classic Siyah Kordonlu Saat</strong></p>

<p>ShadowSteel Classic, zarif tasarımı ve &ouml;zenle se&ccedil;ilmiş detaylarıyla dikkat &ccedil;eken bir saat modelidir. Saat, şık ve dayanıklı siyah deri kordonuyla tamamlanmıştır. İ&ccedil; kısmında yer alan siyah akrep ve yelkovanı ise modern bir g&ouml;r&uuml;n&uuml;m sunar.</p>

<p><strong>&Uuml;r&uuml;n Detayları:</strong></p>

<ul>
	<li><strong>Siyah Deri Kordon:</strong> Saat, şıklığı ve dayanıklılığı bir arada sunan siyah deri kordonuyla &ouml;ne &ccedil;ıkar. Deri kordon, kullanıcıya rahat bir kullanım sağlar.</li>
	<li><strong>Gri Metal Detaylar:</strong> Saatin i&ccedil; kısmında yer alan gri metal akrep ve yelkovan, saate modern bir hava katarak g&ouml;z alıcı bir g&ouml;r&uuml;n&uuml;m elde etmenizi sağlar.</li>
	<li><strong>Analog G&ouml;sterge:</strong> Kolay okunabilir analog g&ouml;stergesiyle zamanı net bir şekilde g&ouml;sterir.</li>
	<li><strong>Dayanıklı Malzemeler:</strong> Y&uuml;ksek kaliteli malzemeler kullanılarak &uuml;retilmiştir, uzun s&uuml;reli kullanım i&ccedil;in idealdir.</li>
</ul>

<p>ShadowSteel Classic Siyah Kordonlu Saat, şıklığı ve modern detayları bir araya getirerek kullanıcısına zarafet ve tarz sunar. G&uuml;nl&uuml;k kullanımınızda veya &ouml;zel g&uuml;nlerde stilinizi tamamlamak i&ccedil;in m&uuml;kemmel bir se&ccedil;imdir.</p>
', N'<p><strong>Cakabo ShadowSteel Classic Siyah Kordonlu Saat - Kargo Detayı:</strong></p>

<p>Cakabo ShadowSteel Classic Siyah Kordonlu Saat&#39;inizi sipariş ettiğinizde, hızlı ve g&uuml;venilir bir kargo s&uuml;reciyle size ulaştırılır. Cakabo&#39;nun m&uuml;şteri memnuniyetine verdiği &ouml;nemle, &uuml;r&uuml;n&uuml;n&uuml;z &ouml;zenle paketlenir ve g&uuml;venli bir şekilde adresinize teslim edilir.</p>

<p><strong>Kargo S&uuml;reci:</strong></p>

<ol>
	<li><strong>Sipariş Onayı:</strong> Siparişiniz onaylandıktan sonra, &uuml;r&uuml;n&uuml;n&uuml;z en kısa s&uuml;rede işleme alınır ve kargoya verilir.</li>
	<li><strong>Takip Numarası:</strong> &Uuml;r&uuml;n&uuml;n&uuml;z kargoya verildiğinde, size bir takip numarası sağlanır. Bu numara sayesinde, &uuml;r&uuml;n&uuml;n&uuml;z&uuml;n kargo s&uuml;recini kolaylıkla takip edebilirsiniz.</li>
	<li><strong>G&uuml;venli Paketleme:</strong> &Uuml;r&uuml;n, Cakabo&#39;nun &ouml;zel ambalajında g&uuml;venli bir şekilde paketlenir. Bu sayede, &uuml;r&uuml;n&uuml;n&uuml;z&uuml;n hasar g&ouml;rmemesi i&ccedil;in gerekli &ouml;nlemler alınmış olur.</li>
	<li><strong>Hızlı Teslimat:</strong> Cakabo&#39;nun hızlı teslimat politikası sayesinde, &uuml;r&uuml;n&uuml;n&uuml;z en kısa s&uuml;rede adresinize teslim edilir.</li>
	<li><strong>M&uuml;şteri Desteği:</strong> Herhangi bir sorunuz veya endişeniz olduğunda, Cakabo&#39;nun m&uuml;şteri hizmetleri ekibi size yardımcı olmaktan memnuniyet duyacaktır. İletişim bilgileri, paketinizle birlikte sağlanır ve herhangi bir sorunuz olduğunda kolayca ulaşabilirsiniz.</li>
</ol>

<p>Cakabo ShadowSteel Classic Siyah Kordonlu Saat&#39;i g&uuml;venle sipariş edin ve hızlı, g&uuml;venilir bir kargo s&uuml;reciyle kapınıza kadar ulaşmasının keyfini yaşayın!</p>
')
INSERT [dbo].[Product] ([ID], [Name], [Price], [Stock], [Description], [DisplayIndex], [CategoryID], [BrandID], [Detail], [CargoDetail]) VALUES (5, N'StealthFit', CAST(800.00 AS Decimal(18, 2)), 1000, N'StealthFit Siyah Spor Saat', 0, 4, 1, N'<p><strong>StealthFit Siyah Spor Saat</strong></p>

<p>StealthFit, dinamik tasarımı ve &uuml;st&uuml;n &ouml;zellikleriyle dikkat &ccedil;eken bir spor saati modelidir. Siyah renkli şık ve dayanıklı kordonu, sporcuların aktif yaşam tarzına uyum sağlarken, saatin modern detayları ve işlevselliği de performanslarını destekler.</p>

<p><strong>&Uuml;r&uuml;n Detayları:</strong></p>

<ul>
	<li><strong>Şık Tasarım:</strong> StealthFit, siyah renkli şık tasarımıyla her tarz giyimle uyum sağlar ve sporculara modern bir g&ouml;r&uuml;n&uuml;m sunar.</li>
	<li><strong>Dayanıklı Kordon:</strong> Saatin dayanıklı kordonu, spor esnasında rahat&ccedil;a kullanılabilir ve uzun s&uuml;reli kullanıma uygun bir yapıya sahiptir.</li>
	<li><strong>Hafif ve Konforlu:</strong> Hafif yapısı ve konforlu tasarımıyla StealthFit, sporcuların rahatlıkla kullanabileceği bir saat modelidir.</li>
	<li><strong>Dijital Ekran:</strong> Kolay okunabilir dijital ekranı, sporcuların antrenman verilerini hızlı ve net bir şekilde g&ouml;rmelerini sağlar.</li>
	<li><strong>&Ccedil;eşitli Fonksiyonlar:</strong> Saat, adım sayar, kalori hesaplayıcı, uyku takibi gibi bir&ccedil;ok faydalı fonksiyona sahiptir.</li>
</ul>

<p>StealthFit Siyah Spor Saat, modern tasarımı, işlevselliği ve dayanıklılığı bir araya getirerek sporcuların ihtiya&ccedil;larına cevap verir. G&uuml;nl&uuml;k spor aktivitelerinden egzersizlere kadar her t&uuml;rl&uuml; spor etkinliğinde kullanılmak &uuml;zere tasarlanmıştır.</p>
', N'<p><strong>Cakabo StealthFit Siyah Spor Saat - Kargo Detayı:</strong></p>

<p>Cakabo StealthFit Siyah Spor Saat&#39;inizi sipariş ettiğinizde, hızlı ve g&uuml;venilir bir kargo s&uuml;reciyle size ulaştırılır. Cakabo&#39;nun &ouml;zenle se&ccedil;ilmiş lojistik ağı ve profesyonel kargo partnerleri sayesinde, &uuml;r&uuml;n&uuml;n&uuml;z g&uuml;venli bir şekilde paketlenir ve adresinize en kısa s&uuml;rede teslim edilir.</p>

<p><strong>Kargo S&uuml;reci:</strong></p>

<ol>
	<li><strong>Sipariş Onayı ve Hazırlık:</strong> Siparişiniz onaylandıktan sonra, &uuml;r&uuml;n&uuml;n&uuml;z hızla işleme alınır ve hazırlanır.</li>
	<li><strong>Hızlı Teslimat:</strong> &Uuml;r&uuml;n, Cakabo&#39;nun hızlı teslimat politikası kapsamında en kısa s&uuml;rede kargoya verilir.</li>
	<li><strong>Takip Numarası:</strong> &Uuml;r&uuml;n kargoya verildiğinde, size bir takip numarası sağlanır. Bu numara sayesinde, &uuml;r&uuml;n&uuml;n&uuml;z&uuml;n kargo s&uuml;recini kolaylıkla takip edebilirsiniz.</li>
	<li><strong>G&uuml;venli Ambalaj:</strong> Cakabo StealthFit Siyah Spor Saat, &ouml;zel olarak tasarlanmış g&uuml;venli bir ambalajla paketlenir. Bu sayede, &uuml;r&uuml;n&uuml;n&uuml;z&uuml;n hasar g&ouml;rmemesi i&ccedil;in gerekli &ouml;nlemler alınmış olur.</li>
	<li><strong>M&uuml;şteri Desteği:</strong> Herhangi bir sorunuz veya endişeniz olduğunda, Cakabo&#39;nun m&uuml;şteri hizmetleri ekibi size yardımcı olmaktan memnuniyet duyacaktır. İletişim bilgileri, &uuml;r&uuml;nle birlikte sağlanır ve herhangi bir sorunuz olduğunda kolayca ulaşabilirsiniz.</li>
</ol>

<p>Cakabo StealthFit Siyah Spor Saat&#39;i g&uuml;venle sipariş edin ve hızlı, g&uuml;venilir bir kargo s&uuml;reciyle kapınıza kadar ulaşmasının keyfini yaşayın!</p>
')
INSERT [dbo].[Product] ([ID], [Name], [Price], [Stock], [Description], [DisplayIndex], [CategoryID], [BrandID], [Detail], [CargoDetail]) VALUES (6, N'Copper Noir Timepiece', CAST(800.00 AS Decimal(18, 2)), 1000, N'Copper Noir Timepiece - Siyah Kordonlu Saat', 0, 4, 1, N'<p><strong>Copper Noir Timepiece - Siyah Kordonlu Saat</strong></p>

<p>Copper Noir Timepiece, şık ve sofistike tasarımıyla &ouml;ne &ccedil;ıkan bir saat modelidir. Siyah kordonu ve siyah merkeziyle dikkat &ccedil;eken bu saat, bakır rengi yelkovanı ve akrebiyle modern bir dokunuş sağlar.</p>

<p><strong>&Uuml;r&uuml;n Detayları:</strong></p>

<ul>
	<li><strong>Şık Tasarım:</strong> Copper Noir Timepiece, siyah kordonu ve siyah merkeziyle minimalist bir şıklık sunar. Bakır rengi yelkovanı ve akrebi ise saate zarif bir detay katar.</li>
	<li><strong>Siyah Deri Kordon:</strong> Saat, dayanıklı ve şık siyah deri kordonuyla tasarlanmıştır. Bu kordon, kullanıcıya rahat bir kullanım deneyimi sunar.</li>
	<li><strong>Bakır Rengi Detaylar:</strong> Saatin yelkovanı ve akrebi, bakır rengiyle kaplanmıştır, b&ouml;ylece saatteki detaylar daha belirgin hale gelir.</li>
	<li><strong>Analog G&ouml;sterge:</strong> Kolay okunabilir analog g&ouml;stergesiyle zamanı net bir şekilde g&ouml;sterir.</li>
	<li><strong>Dayanıklı Malzemeler:</strong> &Uuml;st&uuml;n kaliteli malzemeler kullanılarak &uuml;retilmiştir, uzun s&uuml;reli kullanım i&ccedil;in idealdir.</li>
</ul>

<p>Copper Noir Timepiece, şıklığı, zarafeti ve modern detayları bir araya getirerek kullanıcısına benzersiz bir deneyim sunar. G&uuml;nl&uuml;k kullanımdan &ouml;zel g&uuml;nlerdeki şık etkinliklere kadar her ortamda tarzınızı yansıtmanızı sağlar.</p>
', N'<p><strong>Copper Noir Timepiece - Siyah Kordonlu Saat - Kargo Detayı:</strong></p>

<p>Copper Noir Timepiece&#39;i sipariş ettiğinizde, hızlı ve g&uuml;venilir bir kargo s&uuml;reciyle size ulaştırılır. &Uuml;r&uuml;n&uuml;m&uuml;z, &ouml;zenle paketlenmiş ve g&uuml;venli bir şekilde adresinize teslim edilir.</p>

<p><strong>Kargo S&uuml;reci:</strong></p>

<ol>
	<li><strong>Sipariş Onayı ve Hazırlık:</strong> Siparişiniz onaylandıktan sonra, &uuml;r&uuml;n&uuml;m&uuml;z hızla işleme alınır ve hazırlanır.</li>
	<li><strong>Hızlı Teslimat:</strong> &Uuml;r&uuml;n, kargo firması aracılığıyla en kısa s&uuml;rede adresinize g&ouml;nderilir. Kargo s&uuml;resi, bulunduğunuz b&ouml;lgeye ve kargo firmasının &ccedil;alışma prensiplerine g&ouml;re değişiklik g&ouml;sterebilir.</li>
	<li><strong>Takip Numarası:</strong> &Uuml;r&uuml;n kargoya verildiğinde, size bir takip numarası sağlanır. Bu numara sayesinde, &uuml;r&uuml;n&uuml;n&uuml;z&uuml;n kargo s&uuml;recini kolaylıkla takip edebilirsiniz.</li>
	<li><strong>G&uuml;venli Ambalaj:</strong> &Uuml;r&uuml;n&uuml;m&uuml;z, &ouml;zel ambalajında g&uuml;venli bir şekilde paketlenir. Bu sayede, &uuml;r&uuml;n&uuml;n&uuml;z&uuml;n hasar g&ouml;rmemesi i&ccedil;in gerekli &ouml;nlemler alınmış olur.</li>
	<li><strong>M&uuml;şteri Desteği:</strong> Herhangi bir sorunuz veya endişeniz olduğunda, m&uuml;şteri hizmetleri ekibimiz size yardımcı olmaktan memnuniyet duyacaktır. İletişim bilgileri, paketinizle birlikte sağlanır ve herhangi bir sorunuz olduğunda kolayca ulaşabilirsiniz.</li>
</ol>

<p>Copper Noir Timepiece&#39;i g&uuml;venle sipariş edin ve hızlı, g&uuml;venilir bir kargo s&uuml;reciyle kapınıza kadar ulaşmasının keyfini yaşayın!</p>
')
INSERT [dbo].[Product] ([ID], [Name], [Price], [Stock], [Description], [DisplayIndex], [CategoryID], [BrandID], [Detail], [CargoDetail]) VALUES (7, N'PurityStride', CAST(1200.00 AS Decimal(18, 2)), 1000, N'PurityStride Beyaz Spor Ayakkabı', 0, 2, 1, N'<p><strong>PurityStride Beyaz Spor Ayakkabı</strong></p>

<p>PurityStride, beyaz rengiyle &ouml;ne &ccedil;ıkan modern ve şık bir spor ayakkabı modelidir. İster spor yaparken ister g&uuml;nl&uuml;k kullanımda olsun, bu ayakkabı rahatlığı ve tarzı bir araya getirir.</p>

<p><strong>&Uuml;r&uuml;n Detayları:</strong></p>

<ul>
	<li><strong>Şık Tasarım:</strong> PurityStride, beyaz rengi ve modern tasarımıyla dikkat &ccedil;eker. Her tarz giyimle uyum sağlar ve stilinizi tamamlar.</li>
	<li><strong>Konforlu İ&ccedil; Yapı:</strong> Ayakkabının i&ccedil; kısmı, konforlu bir deneyim sunmak i&ccedil;in &ouml;zel olarak tasarlanmıştır. Ayak anatomisine uygun olarak şekillendirilmiş i&ccedil; tabanı, uzun s&uuml;reli kullanımlarda bile rahatlık sağlar.</li>
	<li><strong>Dayanıklı Malzeme:</strong> &Uuml;st&uuml;n kaliteli malzemelerden &uuml;retilmiştir, b&ouml;ylece uzun &ouml;m&uuml;rl&uuml; ve dayanıklı bir ayakkabı deneyimi sunar.</li>
	<li><strong>Esnek Taban:</strong> Esnek tabanı, her t&uuml;rl&uuml; spor aktivitesinde veya g&uuml;nl&uuml;k koşuşturmalarda m&uuml;kemmel bir performans sunar.</li>
	<li><strong>Hafif Tasarım:</strong> Hafif yapısıyla yorulmadan ve &ouml;zg&uuml;rce hareket etmenizi sağlar.</li>
	<li><strong>Stil Sahibi Detaylar:</strong> Ayakkabının detayları, zarafetin ve şıklığın birleşimini temsil eder.</li>
</ul>

<p>PurityStride Beyaz Spor Ayakkabı, stilinizi ve konforunuzu bir araya getirerek, her adımda &ouml;zg&uuml;veninizi arttırır. Spor yaparken veya g&uuml;nl&uuml;k kullanımda size eşlik edecek m&uuml;kemmel bir se&ccedil;enektir.</p>
', N'<p><strong>Kargo Detayı:</strong></p>

<p>UrbanBlend Tri-Tone Sneakers&#39;ı sipariş ettiğinizde, hızlı ve g&uuml;venilir bir kargo s&uuml;reciyle size ulaştırılır. &Uuml;r&uuml;n&uuml;m&uuml;z, &ouml;zel ambalajında korunaklı bir şekilde paketlenir ve adresinize en kısa s&uuml;rede teslim edilir.</p>

<p><strong>Kargo S&uuml;reci:</strong></p>

<ol>
	<li><strong>Sipariş Onayı ve Hazırlık:</strong> Siparişiniz onaylandıktan sonra, &uuml;r&uuml;n&uuml;m&uuml;z hızla işleme alınır ve hazırlanır.</li>
	<li><strong>Hızlı Teslimat:</strong> &Uuml;r&uuml;n, kargo firması aracılığıyla en kısa s&uuml;rede adresinize g&ouml;nderilir. Kargo s&uuml;resi, bulunduğunuz b&ouml;lgeye ve kargo firmasının &ccedil;alışma prensiplerine g&ouml;re değişiklik g&ouml;sterebilir.</li>
	<li><strong>Takip Numarası:</strong> &Uuml;r&uuml;n kargoya verildiğinde, size bir takip numarası sağlanır. Bu numara sayesinde, &uuml;r&uuml;n&uuml;n&uuml;z&uuml;n kargo s&uuml;recini kolaylıkla takip edebilirsiniz.</li>
	<li><strong>G&uuml;venli Ambalaj:</strong> &Uuml;r&uuml;n&uuml;m&uuml;z, &ouml;zel ambalajında g&uuml;venli bir şekilde paketlenir. Bu sayede, &uuml;r&uuml;n&uuml;n&uuml;z&uuml;n hasar g&ouml;rmemesi i&ccedil;in gerekli &ouml;nlemler alınmış olur.</li>
	<li><strong>M&uuml;şteri Desteği:</strong> Herhangi bir sorunuz veya endişeniz olduğunda, m&uuml;şteri hizmetleri ekibimiz size yardımcı olmaktan memnuniyet duyacaktır. İletişim bilgileri, paketinizle birlikte sağlanır ve herhangi bir sorunuz olduğunda kolayca ulaşabilirsiniz.</li>
</ol>

<p>UrbanBlend Tri-Tone Sneakers&#39;ı g&uuml;venle sipariş edin ve hızlı, g&uuml;venilir bir kargo s&uuml;reciyle kapınıza kadar ulaşmasının keyfini yaşayın!</p>
')
INSERT [dbo].[Product] ([ID], [Name], [Price], [Stock], [Description], [DisplayIndex], [CategoryID], [BrandID], [Detail], [CargoDetail]) VALUES (8, N'UrbanBlend Tri-Tone Sneakers', CAST(1300.00 AS Decimal(18, 2)), 1000, N'UrbanBlend Tri-Tone Sneakers, şehir hayatının enerjisini ve dinamizmini yansıtan modern ve şık bir spor ayakkabıdır.', 0, 2, 1, N'<p><strong>UrbanBlend Tri-Tone Sneakers</strong></p>

<p>UrbanBlend Tri-Tone Sneakers, şehir hayatının enerjisini ve dinamizmini yansıtan modern ve şık bir spor ayakkabıdır. Beyaz tabanıyla dikkat &ccedil;eken bu ayakkabı, gri, siyah ve beyaz renklerin harmonisiyle tasarlanmıştır, şıklığı ve tarzı bir araya getirir.</p>

<p><strong>&Uuml;r&uuml;n Detayları:</strong></p>

<ul>
	<li><strong>&Uuml;&ccedil; Tonlu Tasarım:</strong> Gri, siyah ve beyaz renklerin uyumlu kombinasyonuyla, ayakkabıya modern ve şık bir g&ouml;r&uuml;n&uuml;m kazandırır.</li>
	<li><strong>Konfor ve Esneklik:</strong> Esnek tabanı ve konforlu i&ccedil; yapısıyla, g&uuml;n boyu rahat bir kullanım sunar ve her adımda destek sağlar.</li>
	<li><strong>Dayanıklı Malzeme:</strong> Y&uuml;ksek kaliteli malzemelerden &uuml;retilmiştir, b&ouml;ylece uzun s&uuml;reli kullanıma dayanıklıdır ve performansını korur.</li>
	<li><strong>Hava Akışı:</strong> &Ouml;zel tasarlanmış &uuml;st kısım, s&uuml;rekli hava akışını sağlayarak ayaklarınızın serin kalmasını ve terlemesini &ouml;nler.</li>
	<li><strong>Stil Sahibi Detaylar:</strong> Ayakkabının detayları, şıklığı ve zarafeti &ouml;n plana &ccedil;ıkarır, her tarz giyimle m&uuml;kemmel uyum sağlar.</li>
	<li><strong>&Ccedil;eşitli Kullanım Alanları:</strong> Spor yaparken, g&uuml;nl&uuml;k hayatta veya şehir gezintilerinde rahatlıkla kullanılabilir, her ortamda tarzınızı yansıtır.</li>
</ul>

<p>UrbanBlend Tri-Tone Sneakers, şehirli ve aktif yaşam tarzına uyum sağlayan, tarzını ve konforunu &ouml;nemseyen kullanıcılar i&ccedil;in ideal bir se&ccedil;enektir. Hem g&ouml;r&uuml;n&uuml;m&uuml;yle hem de performansıyla beklentilerinizi karşılamak i&ccedil;in tasarlanmıştır.</p>
', N'<p><strong>UrbanBlend Tri-Tone Sneakers - Kargo Detayı:</strong></p>

<p>UrbanBlend Tri-Tone Sneakers&#39;ı sipariş ettiğinizde, hızlı ve g&uuml;venilir bir kargo s&uuml;reciyle size ulaştırılır. &Uuml;r&uuml;n&uuml;m&uuml;z, &ouml;zel ambalajında korunaklı bir şekilde paketlenir ve adresinize en kısa s&uuml;rede teslim edilir.</p>

<p><strong>Kargo S&uuml;reci:</strong></p>

<ol>
	<li><strong>Sipariş Onayı ve Hazırlık:</strong> Siparişiniz onaylandıktan sonra, &uuml;r&uuml;n&uuml;m&uuml;z hızla işleme alınır ve hazırlanır.</li>
	<li><strong>Hızlı Teslimat:</strong> &Uuml;r&uuml;n, kargo firması aracılığıyla en kısa s&uuml;rede adresinize g&ouml;nderilir. Kargo s&uuml;resi, bulunduğunuz b&ouml;lgeye ve kargo firmasının &ccedil;alışma prensiplerine g&ouml;re değişiklik g&ouml;sterebilir.</li>
	<li><strong>Takip Numarası:</strong> &Uuml;r&uuml;n kargoya verildiğinde, size bir takip numarası sağlanır. Bu numara sayesinde, &uuml;r&uuml;n&uuml;n&uuml;z&uuml;n kargo s&uuml;recini kolaylıkla takip edebilirsiniz.</li>
	<li><strong>G&uuml;venli Ambalaj:</strong> &Uuml;r&uuml;n&uuml;m&uuml;z, &ouml;zel ambalajında g&uuml;venli bir şekilde paketlenir. Bu sayede, &uuml;r&uuml;n&uuml;n&uuml;z&uuml;n hasar g&ouml;rmemesi i&ccedil;in gerekli &ouml;nlemler alınmış olur.</li>
	<li><strong>M&uuml;şteri Desteği:</strong> Herhangi bir sorunuz veya endişeniz olduğunda, m&uuml;şteri hizmetleri ekibimiz size yardımcı olmaktan memnuniyet duyacaktır. İletişim bilgileri, paketinizle birlikte sağlanır ve herhangi bir sorunuz olduğunda kolayca ulaşabilirsiniz.</li>
</ol>

<p>UrbanBlend Tri-Tone Sneakers&#39;ı g&uuml;venle sipariş edin ve hızlı, g&uuml;venilir bir kargo s&uuml;reciyle kapınıza kadar ulaşmasının keyfini yaşayın!</p>
')
INSERT [dbo].[Product] ([ID], [Name], [Price], [Stock], [Description], [DisplayIndex], [CategoryID], [BrandID], [Detail], [CargoDetail]) VALUES (9, N'ShadowStride', CAST(1600.00 AS Decimal(18, 2)), 100, N'Cakabo ShadowStride Siyah Spor Ayakkabı', 0, 2, 1, N'<p><strong>Cakabo ShadowStride Siyah Spor Ayakkabı</strong></p>

<p>Cakabo ShadowStride, şıklığı ve performansı bir araya getiren siyah tabanlı, siyah renkli bir spor ayakkabıdır. Her adımda g&uuml;ven veren sağlam yapısı ve modern tasarımıyla dikkat &ccedil;eker.</p>

<p><strong>&Uuml;r&uuml;n Detayları:</strong></p>

<ul>
	<li><strong>G&uuml;&ccedil;l&uuml; ve Dayanıklı Tasarım:</strong> Cakabo ShadowStride, dayanıklı malzemelerden &uuml;retilmiştir ve uzun s&uuml;reli kullanım i&ccedil;in tasarlanmıştır. Her t&uuml;rl&uuml; y&uuml;zeyde maksimum performans sağlar.</li>
	<li><strong>Siyah Renkli Tasarım:</strong> Siyah tabanı ve siyah &uuml;st kısmıyla, sade ve şık bir g&ouml;r&uuml;n&uuml;m sunar. Bu minimalist tasarım, her tarza ve her duruma uyum sağlar.</li>
	<li><strong>Konforlu İ&ccedil; Yapı:</strong> Ayakkabının i&ccedil; kısmı, ayak anatomisine uygun olarak tasarlanmıştır ve konforlu bir kullanım sağlar. G&uuml;n boyu ayaklarınızı rahat hissetmenizi sağlar.</li>
	<li><strong>Esnek Taban:</strong> Esnek tabanı, her t&uuml;rl&uuml; spor aktivitesinde hareket &ouml;zg&uuml;rl&uuml;ğ&uuml; sağlar ve ayaklarınıza m&uuml;kemmel bir uyum sunar.</li>
	<li><strong>Nefes Alabilir Malzeme:</strong> Ayakkabının &uuml;st kısmı, nefes alabilir malzemeden yapılmıştır, b&ouml;ylece ayaklarınızın serin kalmasını sağlar ve terlemeyi &ouml;nler.</li>
	<li><strong>Cakabo Kalitesi:</strong> Cakabo&#39;nun y&uuml;ksek kalite standartlarına uygun olarak &uuml;retilmiştir, g&uuml;venilir bir performans sunar ve uzun &ouml;m&uuml;rl&uuml;d&uuml;r.</li>
</ul>

<p>Cakabo ShadowStride Siyah Spor Ayakkabı, g&uuml;nl&uuml;k kullanımdan spor salonuna kadar geniş bir kullanım yelpazesine sahiptir. Şıklığı ve dayanıklılığı bir arada arayanlar i&ccedil;in ideal bir tercihtir.</p>
', N'<p><strong>Cakabo ShadowStride Siyah Spor Ayakkabı - Kargo Detayı:</strong></p>

<p>Cakabo ShadowStride Siyah Spor Ayakkabı&#39;nızı sipariş ettiğinizde, hızlı ve g&uuml;venilir bir kargo s&uuml;reciyle size ulaştırılır. &Uuml;r&uuml;n&uuml;m&uuml;z, &ouml;zel ambalajında korunaklı bir şekilde paketlenir ve adresinize en kısa s&uuml;rede teslim edilir.</p>

<p><strong>Kargo S&uuml;reci:</strong></p>

<ol>
	<li><strong>Sipariş Onayı ve Hazırlık:</strong> Siparişiniz onaylandıktan sonra, &uuml;r&uuml;n&uuml;m&uuml;z hızla işleme alınır ve hazırlanır.</li>
	<li><strong>Hızlı Teslimat:</strong> &Uuml;r&uuml;n, kargo firması aracılığıyla en kısa s&uuml;rede adresinize g&ouml;nderilir. Kargo s&uuml;resi, bulunduğunuz b&ouml;lgeye ve kargo firmasının &ccedil;alışma prensiplerine g&ouml;re değişiklik g&ouml;sterebilir.</li>
	<li><strong>Takip Numarası:</strong> &Uuml;r&uuml;n kargoya verildiğinde, size bir takip numarası sağlanır. Bu numara sayesinde, &uuml;r&uuml;n&uuml;n&uuml;z&uuml;n kargo s&uuml;recini kolaylıkla takip edebilirsiniz.</li>
	<li><strong>G&uuml;venli Ambalaj:</strong> &Uuml;r&uuml;n&uuml;m&uuml;z, &ouml;zel ambalajında g&uuml;venli bir şekilde paketlenir. Bu sayede, &uuml;r&uuml;n&uuml;n&uuml;z&uuml;n hasar g&ouml;rmemesi i&ccedil;in gerekli &ouml;nlemler alınmış olur.</li>
	<li><strong>M&uuml;şteri Desteği:</strong> Herhangi bir sorunuz veya endişeniz olduğunda, m&uuml;şteri hizmetleri ekibimiz size yardımcı olmaktan memnuniyet duyacaktır. İletişim bilgileri, paketinizle birlikte sağlanır ve herhangi bir sorunuz olduğunda kolayca ulaşabilirsiniz.</li>
</ol>

<p>Cakabo ShadowStride Siyah Spor Ayakkabı&#39;yı g&uuml;venle sipariş edin ve hızlı, g&uuml;venilir bir kargo s&uuml;reciyle kapınıza kadar ulaşmasının keyfini yaşayın!</p>
')
INSERT [dbo].[Product] ([ID], [Name], [Price], [Stock], [Description], [DisplayIndex], [CategoryID], [BrandID], [Detail], [CargoDetail]) VALUES (10, N'Dusky Shadow Backpack', CAST(950.00 AS Decimal(18, 2)), 1000, N'Dusky Shadow Sırt Çantası, şıklığı ve fonksiyonelliği bir araya getiren zarif bir tasarıma sahip. ', 0, 6, 1, N'<p><strong>Dusky Shadow Sırt &Ccedil;antası</strong></p>

<p>Dusky Shadow Sırt &Ccedil;antası, şıklığı ve fonksiyonelliği bir araya getiren zarif bir tasarıma sahip. F&uuml;me rengi tonlarındaki derinlik, &ccedil;antanın modern ve &ccedil;ekici g&ouml;r&uuml;n&uuml;m&uuml;n&uuml; vurgularken, sağlam yapısıyla g&uuml;nl&uuml;k kullanım i&ccedil;in ideal bir se&ccedil;enektir.</p>

<p><strong>&Uuml;r&uuml;n Detayları:</strong></p>

<ul>
	<li><strong>Zarif ve Dayanıklı Tasarım:</strong> Y&uuml;ksek kaliteli malzemelerden &uuml;retilmiş olan bu sırt &ccedil;antası, dayanıklı ve uzun &ouml;m&uuml;rl&uuml;d&uuml;r. G&uuml;nl&uuml;k kullanıma uygun sağlam tasarımıyla &ouml;ne &ccedil;ıkar.</li>
	<li><strong>Geniş Kapasite:</strong> &Ccedil;eşitli b&ouml;lmeleri ve cepleriyle, eşyalarınızı d&uuml;zenli bir şekilde taşımanızı sağlar. Diz&uuml;st&uuml; bilgisayar, kitaplar, tablet ve diğer g&uuml;nl&uuml;k ihtiya&ccedil;larınızı kolayca yerleştirebilirsiniz.</li>
	<li><strong>Konforlu Taşıma:</strong> Ayarlanabilir omuz askıları ve sırt b&ouml;lgesindeki destekleyici pedler, uzun s&uuml;reli kullanımlarda bile konfor sağlar. Ayrıca, nefes alabilir arka paneli terlemeyi &ouml;nler.</li>
	<li><strong>Şık ve Modern Tasarım:</strong> F&uuml;me rengi tonlarındaki &ccedil;arpıcı tasarımı, her ortama uyum sağlar ve tarzınızı tamamlar. İş veya g&uuml;nl&uuml;k kullanım i&ccedil;in m&uuml;kemmel bir se&ccedil;imdir.</li>
	<li><strong>&Ccedil;eşitli Kullanım Alanları:</strong> İş, seyahat veya g&uuml;nl&uuml;k kullanım i&ccedil;in idealdir. Hem şehirde hem de doğada rahatlıkla kullanılabilir.</li>
</ul>

<p>Dusky Shadow Sırt &Ccedil;antası, şıklığı ve fonksiyonelliği bir araya getirerek, g&uuml;nl&uuml;k yaşamınızı kolaylaştıran ve tarzınızı yansıtan bir aksesuardır.</p>
', N'<p><strong>Dusky Shadow Sırt &Ccedil;antası - Kargo Detayı:</strong></p>

<p>Dusky Shadow Sırt &Ccedil;antası&#39;nı sipariş ettiğinizde, hızlı ve g&uuml;venilir bir kargo s&uuml;reciyle size ulaştırılır. &Uuml;r&uuml;n, &ouml;zel koruma malzemeleriyle paketlenmiş ve hasar g&ouml;rmemesi i&ccedil;in titizlikle korunmuştur.</p>

<p><strong>Kargo S&uuml;reci:</strong></p>

<ol>
	<li><strong>Hazırlık ve Paketleme:</strong> Siparişiniz alındıktan sonra, sırt &ccedil;antası &ouml;zenle paketlenir ve kargo firmasına teslim edilmeye hazır hale getirilir.</li>
	<li><strong>Hızlı G&ouml;nderim:</strong> &Uuml;r&uuml;n, kargo firması aracılığıyla en kısa s&uuml;rede adresinize g&ouml;nderilir. Kargo s&uuml;resi, bulunduğunuz b&ouml;lgeye ve kargo firmasının &ccedil;alışma prensiplerine bağlı olarak değişebilir.</li>
	<li><strong>Takip Numarası:</strong> &Uuml;r&uuml;n&uuml;n&uuml;z kargoya verildiğinde, size bir takip numarası sağlanır. Bu numara ile g&ouml;nderinizin durumunu kolayca takip edebilirsiniz.</li>
	<li><strong>G&uuml;venli Teslimat:</strong> Sırt &ccedil;antası, dikkatle taşınarak adresinize ulaştırılır. Teslimat sırasında herhangi bir sorun yaşamanız durumunda m&uuml;şteri hizmetlerimiz size destek sağlayacaktır.</li>
</ol>

<p>Dusky Shadow Sırt &Ccedil;antası&#39;nın kargo s&uuml;reci, &uuml;r&uuml;n&uuml;n&uuml;z&uuml;n g&uuml;venli ve hızlı bir şekilde elinize ulaşmasını sağlamak i&ccedil;in &ouml;zenle y&ouml;netilir.</p>
')
INSERT [dbo].[Product] ([ID], [Name], [Price], [Stock], [Description], [DisplayIndex], [CategoryID], [BrandID], [Detail], [CargoDetail]) VALUES (11, N'Misty Day Bag', CAST(1200.00 AS Decimal(18, 2)), 1000, N'Misty Day Bag, sofistike ve şık bir tasarıma sahip gri bir çantadır.', 0, 6, 1, N'<p><strong>Misty Day Bag</strong></p>

<p>Misty Day Bag, sofistike ve şık bir tasarıma sahip gri bir &ccedil;antadır. Hem g&uuml;nl&uuml;k kullanıma uygun hem de &ouml;zel g&uuml;nlerde şıklığınızı tamamlayacak kadar zariftir. Bu &ccedil;anta, dayanıklı yapısıyla g&uuml;nl&uuml;k taşıma ihtiya&ccedil;larınızı karşılamak i&ccedil;in m&uuml;kemmel bir se&ccedil;enektir.</p>

<p><strong>&Uuml;r&uuml;n Detayları:</strong></p>

<ul>
	<li><strong>Zarif Tasarım:</strong> Gri rengi ve modern detaylarıyla Misty Day Bag, her tarza uyum sağlayacak şekilde tasarlanmıştır.</li>
	<li><strong>Dayanıklı Malzeme:</strong> Y&uuml;ksek kaliteli malzemeden &uuml;retilmiş olan bu &ccedil;anta, uzun &ouml;m&uuml;rl&uuml; kullanım i&ccedil;in dayanıklıdır.</li>
	<li><strong>Geniş Kapasite:</strong> İ&ccedil;indeki &ccedil;eşitli b&ouml;lmeler sayesinde, telefonunuzdan c&uuml;zdanınıza kadar t&uuml;m eşyalarınızı d&uuml;zenli bir şekilde taşıyabilirsiniz.</li>
	<li><strong>Rahat Kullanım:</strong> Ayarlanabilir askıları sayesinde, &ccedil;antayı omuzunuzda ya da &ccedil;apraz olarak rahat&ccedil;a taşıyabilirsiniz.</li>
	<li><strong>&Ccedil;eşitli Kullanım Alanları:</strong> İşe gitmek, alışveriş yapmak veya arkadaşlarla buluşmak i&ccedil;in idealdir. G&uuml;ndelik kullanımdan &ouml;zel etkinliklere kadar &ccedil;eşitli durumlar i&ccedil;in uygundur.</li>
</ul>

<p>Misty Day Bag, hem şıklığıyla hem de fonksiyonelliğiyle g&uuml;nl&uuml;k yaşamınızı kolaylaştıracak ve tarzınızı tamamlayacak m&uuml;kemmel bir &ccedil;antadır.</p>
', N'<p><strong>Misty Day Bag - Kargo Detayı:</strong></p>

<p>Misty Day Bag&#39;i sipariş ettiğinizde, hızlı ve g&uuml;venilir bir kargo s&uuml;reciyle size ulaştırılır. &Uuml;r&uuml;n, &ouml;zel koruma malzemeleriyle paketlenmiş ve hasar g&ouml;rmemesi i&ccedil;in titizlikle korunmuştur.</p>

<p><strong>Kargo S&uuml;reci:</strong></p>

<ol>
	<li><strong>Hazırlık ve Paketleme:</strong> Siparişiniz alındıktan sonra, &ccedil;anta &ouml;zenle paketlenir ve kargo firmasına teslim edilmeye hazır hale getirilir.</li>
	<li><strong>Hızlı G&ouml;nderim:</strong> &Uuml;r&uuml;n, kargo firması aracılığıyla en kısa s&uuml;rede adresinize g&ouml;nderilir. Kargo s&uuml;resi, bulunduğunuz b&ouml;lgeye ve kargo firmasının &ccedil;alışma prensiplerine bağlı olarak değişebilir.</li>
	<li><strong>Takip Numarası:</strong> &Uuml;r&uuml;n&uuml;n&uuml;z kargoya verildiğinde, size bir takip numarası sağlanır. Bu numara ile g&ouml;nderinizin durumunu kolayca takip edebilirsiniz.</li>
	<li><strong>G&uuml;venli Teslimat:</strong> &Ccedil;anta, dikkatle taşınarak adresinize ulaştırılır. Teslimat sırasında herhangi bir sorun yaşamanız durumunda m&uuml;şteri hizmetlerimiz size destek sağlayacaktır.</li>
</ol>

<p>Misty Day Bag&#39;in kargo s&uuml;reci, &uuml;r&uuml;n&uuml;n&uuml;z&uuml;n g&uuml;venli ve hızlı bir şekilde elinize ulaşmasını sağlamak i&ccedil;in &ouml;zenle y&ouml;netilir.</p>
')
INSERT [dbo].[Product] ([ID], [Name], [Price], [Stock], [Description], [DisplayIndex], [CategoryID], [BrandID], [Detail], [CargoDetail]) VALUES (12, N'ShadowBeat Pro', CAST(1200.00 AS Decimal(18, 2)), 2000, N'ShadowBeat Pro Kulak Üstü Kulaklık', 0, 7, 1, N'<p><strong>ShadowBeat Pro Kulak &Uuml;st&uuml; Kulaklık</strong></p>

<p>ShadowBeat Pro, g&uuml;&ccedil;l&uuml; ses performansıyla dikkat &ccedil;eken, şık ve ergonomik tasarıma sahip siyah bir kulak &uuml;st&uuml; kulaklıktır. &Uuml;st&uuml;n ses kalitesi, rahat kullanımı ve şık g&ouml;r&uuml;n&uuml;m&uuml;yle m&uuml;zik deneyiminizi bir &uuml;st seviyeye taşır.</p>

<p><strong>&Uuml;r&uuml;n Detayları:</strong></p>

<ul>
	<li><strong>G&uuml;&ccedil;l&uuml; Ses Performansı:</strong> Y&uuml;ksek kaliteli hoparl&ouml;rler sayesinde, derin baslar ve net tizlerle zenginleştirilmiş bir ses deneyimi sunar.</li>
	<li><strong>Rahat ve Ergonomik Tasarım:</strong> Yumuşak kulak pedleri ve ayarlanabilir kafa bandı, uzun s&uuml;reli kullanımda bile konfor sağlar.</li>
	<li><strong>M&uuml;kemmel Uyum:</strong> Esnek ve ayarlanabilir kafa bandı, farklı baş boyutlarına uyum sağlar ve kulaklığın g&uuml;venli bir şekilde oturmasını sağlar.</li>
	<li><strong>Dahili Mikrofon ve Kontrol D&uuml;ğmeleri:</strong> Aramaları cevaplamak, m&uuml;ziği duraklatmak veya şarkıları ge&ccedil;mek i&ccedil;in entegre kontrol d&uuml;ğmeleri ve mikrofon bulunur.</li>
	<li><strong>Dayanıklı Malzeme:</strong> Y&uuml;ksek kaliteli malzemelerden &uuml;retilmiş olan ShadowBeat Pro, uzun &ouml;m&uuml;rl&uuml; kullanım i&ccedil;in dayanıklıdır.</li>
	<li><strong>Şık Tasarım:</strong> Mat siyah kaplaması ve modern detaylarıyla, şıklık ve tarzı bir araya getirir.</li>
</ul>

<p>ShadowBeat Pro, m&uuml;zik tutkunları i&ccedil;in ideal bir se&ccedil;enektir ve g&uuml;nl&uuml;k kullanımdan seyahatlere kadar her ortamda m&uuml;kemmel bir eşlik&ccedil;idir.</p>
', N'<p><strong>ShadowBeat Pro Kulak &Uuml;st&uuml; Kulaklık - Kargo Detayı:</strong></p>

<p>ShadowBeat Pro Kulak &Uuml;st&uuml; Kulaklık&#39;ı sipariş ettiğinizde, hızlı ve g&uuml;venilir bir kargo s&uuml;reciyle size ulaştırılır. &Uuml;r&uuml;n, &ouml;zel koruma malzemeleriyle paketlenmiş ve hasar g&ouml;rmemesi i&ccedil;in titizlikle korunmuştur.</p>

<p><strong>Kargo S&uuml;reci:</strong></p>

<ol>
	<li><strong>Hazırlık ve Paketleme:</strong> Siparişiniz alındıktan sonra, kulaklık &ouml;zenle paketlenir ve kargo firmasına teslim edilmeye hazır hale getirilir.</li>
	<li><strong>Hızlı G&ouml;nderim:</strong> &Uuml;r&uuml;n, kargo firması aracılığıyla en kısa s&uuml;rede adresinize g&ouml;nderilir. Kargo s&uuml;resi, bulunduğunuz b&ouml;lgeye ve kargo firmasının &ccedil;alışma prensiplerine bağlı olarak değişebilir.</li>
	<li><strong>Takip Numarası:</strong> &Uuml;r&uuml;n&uuml;n&uuml;z kargoya verildiğinde, size bir takip numarası sağlanır. Bu numara ile g&ouml;nderinizin durumunu kolayca takip edebilirsiniz.</li>
	<li><strong>G&uuml;venli Teslimat:</strong> Kulaklık, dikkatle taşınarak adresinize ulaştırılır. Teslimat sırasında herhangi bir sorun yaşamanız durumunda m&uuml;şteri hizmetlerimiz size destek sağlayacaktır.</li>
</ol>

<p>ShadowBeat Pro Kulak &Uuml;st&uuml; Kulaklık&#39;ın kargo s&uuml;reci, &uuml;r&uuml;n&uuml;n&uuml;z&uuml;n g&uuml;venli ve hızlı bir şekilde elinize ulaşmasını sağlamak i&ccedil;in &ouml;zenle y&ouml;netilir.</p>
')
INSERT [dbo].[Product] ([ID], [Name], [Price], [Stock], [Description], [DisplayIndex], [CategoryID], [BrandID], [Detail], [CargoDetail]) VALUES (13, N'SnowBeat Pro', CAST(1250.00 AS Decimal(18, 2)), 100, N'SnowBeat Pro Kulak Üstü Kulaklık', 0, 7, 1, N'<p><strong>SnowBeat Pro Kulak &Uuml;st&uuml; Kulaklık</strong></p>

<p>SnowBeat Pro, zarif ve şık tasarımıyla dikkat &ccedil;eken, beyaz renkli bir kulak &uuml;st&uuml; kulaklıktır. &Uuml;st&uuml;n ses kalitesi, rahat kullanımı ve modern tasarımıyla m&uuml;zik deneyiminizi bir &uuml;st seviyeye taşır.</p>

<p><strong>&Uuml;r&uuml;n Detayları:</strong></p>

<ul>
	<li><strong>&Uuml;st&uuml;n Ses Performansı:</strong> SnowBeat Pro, y&uuml;ksek kaliteli hoparl&ouml;rleri sayesinde net ve derin bir ses sunar, m&uuml;zik deneyiminizi daha da keyifli hale getirir.</li>
	<li><strong>Rahat ve Hafif Tasarım:</strong> Yumuşak kulak pedleri ve hafif yapı, uzun s&uuml;reli kullanımda bile konfor sağlar ve kulaklarınızı rahatsız etmez.</li>
	<li><strong>Esnek ve Ayarlanabilir Kafa Bandı:</strong> Kafa bandı, farklı baş boyutlarına uyum sağlayacak şekilde tasarlanmıştır, b&ouml;ylece herkes i&ccedil;in m&uuml;kemmel bir uyum sağlar.</li>
	<li><strong>Entegre Mikrofon ve Kontrol D&uuml;ğmeleri:</strong> Aramaları cevaplamak, m&uuml;ziği duraklatmak veya şarkıları ge&ccedil;mek i&ccedil;in entegre mikrofon ve kontrol d&uuml;ğmeleri bulunur.</li>
	<li><strong>Dayanıklı Yapı:</strong> Y&uuml;ksek kaliteli malzemelerden &uuml;retilmiş olan SnowBeat Pro, uzun &ouml;m&uuml;rl&uuml; kullanım i&ccedil;in dayanıklıdır ve g&uuml;nl&uuml;k taşıma ihtiya&ccedil;larınızı karşılar.</li>
	<li><strong>Şık ve Modern Tasarım:</strong> Beyaz renkli modern ve şık tasarımıyla her tarza uyum sağlar, kullanıcılarına zarif bir g&ouml;r&uuml;n&uuml;m sunar.</li>
</ul>

<p>SnowBeat Pro Kulak &Uuml;st&uuml; Kulaklık, ses kalitesi ve konforu bir araya getirerek, m&uuml;zik severlere &uuml;st d&uuml;zey bir deneyim sunar.</p>
', N'<p><strong>SnowBeat Pro Kulak &Uuml;st&uuml; Kulaklık - Kargo Detayı:</strong></p>

<p>SnowBeat Pro Kulak &Uuml;st&uuml; Kulaklık&#39;ı sipariş ettiğinizde, hızlı ve g&uuml;venilir bir kargo s&uuml;reciyle size ulaştırılır. &Uuml;r&uuml;n, &ouml;zel koruma malzemeleriyle paketlenmiş ve hasar g&ouml;rmemesi i&ccedil;in titizlikle korunmuştur.</p>

<p><strong>Kargo S&uuml;reci:</strong></p>

<ol>
	<li><strong>Hazırlık ve Paketleme:</strong> Siparişiniz alındıktan sonra, kulaklık &ouml;zenle paketlenir ve kargo firmasına teslim edilmeye hazır hale getirilir.</li>
	<li><strong>Hızlı G&ouml;nderim:</strong> &Uuml;r&uuml;n, kargo firması aracılığıyla en kısa s&uuml;rede adresinize g&ouml;nderilir. Kargo s&uuml;resi, bulunduğunuz b&ouml;lgeye ve kargo firmasının &ccedil;alışma prensiplerine bağlı olarak değişebilir.</li>
	<li><strong>Takip Numarası:</strong> &Uuml;r&uuml;n&uuml;n&uuml;z kargoya verildiğinde, size bir takip numarası sağlanır. Bu numara ile g&ouml;nderinizin durumunu kolayca takip edebilirsiniz.</li>
	<li><strong>G&uuml;venli Teslimat:</strong> Kulaklık, dikkatle taşınarak adresinize ulaştırılır. Teslimat sırasında herhangi bir sorun yaşamanız durumunda m&uuml;şteri hizmetlerimiz size destek sağlayacaktır.</li>
</ol>

<p>SnowBeat Pro Kulak &Uuml;st&uuml; Kulaklık&#39;ın kargo s&uuml;reci, &uuml;r&uuml;n&uuml;n&uuml;z&uuml;n g&uuml;venli ve hızlı bir şekilde elinize ulaşmasını sağlamak i&ccedil;in &ouml;zenle y&ouml;netilir.</p>
')
INSERT [dbo].[Product] ([ID], [Name], [Price], [Stock], [Description], [DisplayIndex], [CategoryID], [BrandID], [Detail], [CargoDetail]) VALUES (14, N'Firewave Pro', CAST(1750.00 AS Decimal(18, 2)), 100, N'Firewave Pro Kulak Üstü Kulaklık', 0, 7, 1, N'<p><strong>Firewave Pro Kulak &Uuml;st&uuml; Kulaklık</strong></p>

<p>Firewave Pro, dinamik tasarımı ve &uuml;st&uuml;n ses kalitesi ile &ouml;ne &ccedil;ıkan, turuncu ve siyah renklere sahip bir kulak &uuml;st&uuml; kulaklıktır. Hem tarz sahibi kullanıcılar i&ccedil;in bir moda ifadesi hem de y&uuml;ksek performans arayanlar i&ccedil;in ideal bir se&ccedil;enektir.</p>

<p><strong>&Uuml;r&uuml;n Detayları:</strong></p>

<ul>
	<li><strong>G&uuml;&ccedil;l&uuml; Ses Performansı:</strong> Firewave Pro, gelişmiş hoparl&ouml;rleri ve ses yalıtımı ile m&uuml;kemmel bir ses deneyimi sunar. Net baslar ve kristal berraklığında tizler ile m&uuml;zik keyfinizi artırır.</li>
	<li><strong>Rahat ve Esnek Tasarım:</strong> Yumuşak kulak pedleri ve ayarlanabilir kafa bandı, uzun s&uuml;reli kullanımlarda bile rahatlık sağlar. Esnek tasarımı, farklı baş boyutlarına uyum sağlar.</li>
	<li><strong>Entegre Mikrofon ve Kontrol D&uuml;ğmeleri:</strong> Aramaları cevaplamak, m&uuml;ziği duraklatmak veya ses seviyesini ayarlamak i&ccedil;in entegre mikrofon ve kontrol d&uuml;ğmeleri bulunur.</li>
	<li><strong>Dayanıklı Malzeme:</strong> Y&uuml;ksek kaliteli malzemelerden &uuml;retilmiş olan Firewave Pro, dayanıklı ve uzun &ouml;m&uuml;rl&uuml;d&uuml;r. G&uuml;nl&uuml;k kullanıma uygun sağlam yapıya sahiptir.</li>
	<li><strong>Moda ve Tarz:</strong> Turuncu ve siyah renk kombinasyonu, kulaklığa modern ve &ccedil;ekici bir g&ouml;r&uuml;n&uuml;m kazandırır. Kullanıcılarına tarzlarını &ouml;ne &ccedil;ıkarma fırsatı sunar.</li>
	<li><strong>&Ccedil;eşitli Kullanım Alanları:</strong> Evde, işte, seyahatte veya spor yaparken kullanım i&ccedil;in uygundur. Her t&uuml;rl&uuml; ortamda m&uuml;kemmel bir ses deneyimi sunar.</li>
</ul>

<p>Firewave Pro Kulak &Uuml;st&uuml; Kulaklık, şıklığı ve performansı bir araya getirerek kullanıcılarına y&uuml;ksek kaliteli bir ses deneyimi sunar.</p>
', N'<p><strong>Firewave Pro Kulak &Uuml;st&uuml; Kulaklık - Kargo Detayı:</strong></p>

<p>Firewave Pro Kulak &Uuml;st&uuml; Kulaklık&#39;ı sipariş ettiğinizde, hızlı ve g&uuml;venilir bir kargo s&uuml;reciyle size ulaştırılır. &Uuml;r&uuml;n, &ouml;zel koruma malzemeleriyle paketlenmiş ve hasar g&ouml;rmemesi i&ccedil;in titizlikle korunmuştur.</p>

<p><strong>Kargo S&uuml;reci:</strong></p>

<ol>
	<li><strong>Hazırlık ve Paketleme:</strong> Siparişiniz alındıktan sonra, kulaklık &ouml;zenle paketlenir ve kargo firmasına teslim edilmeye hazır hale getirilir.</li>
	<li><strong>Hızlı G&ouml;nderim:</strong> &Uuml;r&uuml;n, kargo firması aracılığıyla en kısa s&uuml;rede adresinize g&ouml;nderilir. Kargo s&uuml;resi, bulunduğunuz b&ouml;lgeye ve kargo firmasının &ccedil;alışma prensiplerine bağlı olarak değişebilir.</li>
	<li><strong>Takip Numarası:</strong> &Uuml;r&uuml;n&uuml;n&uuml;z kargoya verildiğinde, size bir takip numarası sağlanır. Bu numara ile g&ouml;nderinizin durumunu kolayca takip edebilirsiniz.</li>
	<li><strong>G&uuml;venli Teslimat:</strong> Kulaklık, dikkatle taşınarak adresinize ulaştırılır. Teslimat sırasında herhangi bir sorun yaşamanız durumunda m&uuml;şteri hizmetlerimiz size destek sağlayacaktır.</li>
</ol>

<p>Firewave Pro Kulak &Uuml;st&uuml; Kulaklık&#39;ın kargo s&uuml;reci, &uuml;r&uuml;n&uuml;n&uuml;z&uuml;n g&uuml;venli ve hızlı bir şekilde elinize ulaşmasını sağlamak i&ccedil;in &ouml;zenle y&ouml;netilir.</p>
')
INSERT [dbo].[Product] ([ID], [Name], [Price], [Stock], [Description], [DisplayIndex], [CategoryID], [BrandID], [Detail], [CargoDetail]) VALUES (15, N'ShadowFit Tee', CAST(450.00 AS Decimal(18, 2)), 1000, N'ShadowFit Tee, şıklığı ve rahatlığı bir araya getiren, siyah renkte klasik bir tişörttür. ', 0, 9, 1, N'<p><strong>ShadowFit Tee</strong></p>

<p>ShadowFit Tee, şıklığı ve rahatlığı bir araya getiren, siyah renkte klasik bir tiş&ouml;rtt&uuml;r. Y&uuml;ksek kaliteli pamuk kumaşıyla &uuml;retilmiş olan bu tiş&ouml;rt, g&uuml;nl&uuml;k kullanım i&ccedil;in m&uuml;kemmel bir se&ccedil;enektir.</p>

<p><strong>&Uuml;r&uuml;n Detayları:</strong></p>

<ul>
	<li><strong>Y&uuml;ksek Kaliteli Malzeme:</strong> %100 pamuk kumaştan &uuml;retilmiş olan ShadowFit Tee, yumuşak dokusuyla g&uuml;n boyu rahatlık sağlar.</li>
	<li><strong>Klasik ve Şık Tasarım:</strong> Basit ve zarif tasarımıyla her tarza uyum sağlar. Siyah rengi, her mevsim ve her ortam i&ccedil;in ideal bir se&ccedil;imdir.</li>
	<li><strong>Rahat ve Esnek Giyim:</strong> Esnek yapıya sahip olan bu tiş&ouml;rt, v&uuml;cuda tam olarak uyum sağlar ve hareket &ouml;zg&uuml;rl&uuml;ğ&uuml; sunar.</li>
	<li><strong>Dayanıklı ve Uzun &Ouml;m&uuml;rl&uuml;:</strong> Kaliteli malzemeden &uuml;retilmiş olan ShadowFit Tee, uzun s&uuml;reli kullanıma dayanıklıdır ve renk solması yapmaz.</li>
	<li><strong>&Ccedil;eşitli Kombin Se&ccedil;enekleri:</strong> Jeanlerle, şortlarla veya eşofman altlarıyla rahatlıkla kombinlenebilir. Her tarza ve her duruma uyum sağlar.</li>
	<li><strong>&Ccedil;eşitli Beden Se&ccedil;enekleri:</strong> XS&#39;den XXXL&#39;e kadar geniş beden se&ccedil;enekleri bulunur, b&ouml;ylece her bedene uyum sağlar.</li>
</ul>

<p>ShadowFit Tee, basit ve şık tasarımıyla g&uuml;nl&uuml;k giyimde vazge&ccedil;ilmez bir par&ccedil;adır. Hem tarzınıza hem de konforunuza &ouml;nem verenler i&ccedil;in ideal bir se&ccedil;imdir.</p>
', N'<p><strong>ShadowFit Tee - Kargo Detayı:</strong></p>

<p>ShadowFit Tee&#39;yi sipariş ettiğinizde, hızlı ve g&uuml;venilir bir kargo s&uuml;reciyle size ulaştırılır. &Uuml;r&uuml;n, &ouml;zel koruma malzemeleriyle paketlenmiş ve hasar g&ouml;rmemesi i&ccedil;in titizlikle korunmuştur.</p>

<p><strong>Kargo S&uuml;reci:</strong></p>

<ol>
	<li><strong>Hazırlık ve Paketleme:</strong> Siparişiniz alındıktan sonra, tiş&ouml;rt &ouml;zenle paketlenir ve kargo firmasına teslim edilmeye hazır hale getirilir.</li>
	<li><strong>Hızlı G&ouml;nderim:</strong> &Uuml;r&uuml;n, kargo firması aracılığıyla en kısa s&uuml;rede adresinize g&ouml;nderilir. Kargo s&uuml;resi, bulunduğunuz b&ouml;lgeye ve kargo firmasının &ccedil;alışma prensiplerine bağlı olarak değişebilir.</li>
	<li><strong>Takip Numarası:</strong> &Uuml;r&uuml;n&uuml;n&uuml;z kargoya verildiğinde, size bir takip numarası sağlanır. Bu numara ile g&ouml;nderinizin durumunu kolayca takip edebilirsiniz.</li>
	<li><strong>G&uuml;venli Teslimat:</strong> Tiş&ouml;rt, dikkatle taşınarak adresinize ulaştırılır. Teslimat sırasında herhangi bir sorun yaşamanız durumunda m&uuml;şteri hizmetlerimiz size destek sağlayacaktır.</li>
</ol>

<p>ShadowFit Tee&#39;nin kargo s&uuml;reci, &uuml;r&uuml;n&uuml;n&uuml;z&uuml;n g&uuml;venli ve hızlı bir şekilde elinize ulaşmasını sağlamak i&ccedil;in &ouml;zenle y&ouml;netilir.</p>
')
INSERT [dbo].[Product] ([ID], [Name], [Price], [Stock], [Description], [DisplayIndex], [CategoryID], [BrandID], [Detail], [CargoDetail]) VALUES (17, N'InkSplash Tee', CAST(460.00 AS Decimal(18, 2)), 100, N'InkSplash Tee, siyah bir tişört üzerine renkli bir baskı ile öne çıkan bir tasarıma sahiptir.', 0, 9, 1, N'<p><strong>InkSplash Tee</strong></p>

<p>InkSplash Tee, siyah bir tiş&ouml;rt &uuml;zerine renkli bir baskı ile &ouml;ne &ccedil;ıkan bir tasarıma sahiptir. Enerjik ve dinamik renklerle s&uuml;slenmiş olan bu tiş&ouml;rt, tarzınıza ve kişiliğinize hareket katmak i&ccedil;in m&uuml;kemmel bir se&ccedil;enektir.</p>

<p><strong>&Uuml;r&uuml;n Detayları:</strong></p>

<ul>
	<li><strong>Renkli Baskı:</strong> &Ouml;n y&uuml;z&uuml;nde canlı ve etkileyici bir renkli baskı bulunur. Dinamik desenler ve enerjik renklerle tiş&ouml;rt, dikkat &ccedil;ekici bir g&ouml;r&uuml;n&uuml;me sahiptir.</li>
	<li><strong>Y&uuml;ksek Kaliteli Malzeme:</strong> %100 pamuk kumaştan &uuml;retilmiş olan InkSplash Tee, yumuşak ve konforlu bir giyim deneyimi sunar.</li>
	<li><strong>Rahat ve Esnek Giyim:</strong> Esnek yapıya sahip olan tiş&ouml;rt, v&uuml;cuda tam olarak uyum sağlar ve g&uuml;n boyu rahatlık sunar.</li>
	<li><strong>Tarz ve Kişilik:</strong> Renkli baskı, kişiliğinizi ve tarzınızı yansıtan dinamik bir detaydır. Enerji dolu renklerle s&uuml;slenmiş olan tiş&ouml;rt, sizi her zaman &ouml;ne &ccedil;ıkarır.</li>
	<li><strong>&Ccedil;eşitli Kombin Se&ccedil;enekleri:</strong> Jeanlerle, şortlarla veya eşofman altlarıyla rahatlıkla kombinlenebilir. Her tarza ve her duruma uyum sağlar.</li>
	<li><strong>&Ccedil;eşitli Beden Se&ccedil;enekleri:</strong> XS&#39;den XXXL&#39;e kadar geniş beden se&ccedil;enekleri bulunur, b&ouml;ylece her bedene uyum sağlar.</li>
</ul>

<p>InkSplash Tee, renkli baskısı ve rahat giyimiyle g&ouml;zleri &uuml;zerinize &ccedil;ekmek i&ccedil;in ideal bir se&ccedil;enektir.</p>
', N'<p><strong>InkSplash Tee - Kargo Detayı:</strong></p>

<p>InkSplash Tee&#39;yi sipariş ettiğinizde, hızlı ve g&uuml;venilir bir kargo s&uuml;reciyle size ulaştırılır. &Uuml;r&uuml;n, &ouml;zel koruma malzemeleriyle paketlenmiş ve hasar g&ouml;rmemesi i&ccedil;in titizlikle korunmuştur.</p>

<p><strong>Kargo S&uuml;reci:</strong></p>

<ol>
	<li><strong>Hazırlık ve Paketleme:</strong> Siparişiniz alındıktan sonra, tiş&ouml;rt &ouml;zenle paketlenir ve kargo firmasına teslim edilmeye hazır hale getirilir.</li>
	<li><strong>Hızlı G&ouml;nderim:</strong> &Uuml;r&uuml;n, kargo firması aracılığıyla en kısa s&uuml;rede adresinize g&ouml;nderilir. Kargo s&uuml;resi, bulunduğunuz b&ouml;lgeye ve kargo firmasının &ccedil;alışma prensiplerine bağlı olarak değişebilir.</li>
	<li><strong>Takip Numarası:</strong> &Uuml;r&uuml;n&uuml;n&uuml;z kargoya verildiğinde, size bir takip numarası sağlanır. Bu numara ile g&ouml;nderinizin durumunu kolayca takip edebilirsiniz.</li>
	<li><strong>G&uuml;venli Teslimat:</strong> Tiş&ouml;rt, dikkatle taşınarak adresinize ulaştırılır. Teslimat sırasında herhangi bir sorun yaşamanız durumunda m&uuml;şteri hizmetlerimiz size destek sağlayacaktır.</li>
</ol>

<p>InkSplash Tee&#39;nin kargo s&uuml;reci, &uuml;r&uuml;n&uuml;n&uuml;z&uuml;n g&uuml;venli ve hızlı bir şekilde elinize ulaşmasını sağlamak i&ccedil;in &ouml;zenle y&ouml;netilir.</p>
')
INSERT [dbo].[Product] ([ID], [Name], [Price], [Stock], [Description], [DisplayIndex], [CategoryID], [BrandID], [Detail], [CargoDetail]) VALUES (18, N'MonoScript ', CAST(850.00 AS Decimal(18, 2)), 100, N'MonoScript Hoodie, beyaz rengin zarafetiyle siyah Cakabo logosunun mükemmel bir uyumunu sunar.', 0, 10, 1, N'<p><strong>MonoScript Hoodie</strong></p>

<p>MonoScript Hoodie, beyaz rengin zarafetiyle siyah Cakabo logosunun m&uuml;kemmel bir uyumunu sunar. Bu hoodie, rahatlığı ve tarzı bir araya getirerek g&uuml;nl&uuml;k giyiminizin vazge&ccedil;ilmez par&ccedil;ası olmaya adaydır.</p>

<p><strong>&Uuml;r&uuml;n Detayları:</strong></p>

<ul>
	<li><strong>Minimalist Tasarım:</strong> Beyaz zemin &uuml;zerine yerleştirilmiş siyah Cakabo logosu, minimalist ve modern bir g&ouml;r&uuml;n&uuml;m sunar.</li>
	<li><strong>Y&uuml;ksek Kaliteli Malzeme:</strong> Pamuklu karışım malzemeden &uuml;retilmiş olan hoodie, yumuşak dokusuyla g&uuml;n boyu konfor sağlar.</li>
	<li><strong>Rahat ve Esnek Giyim:</strong> Esnek yapıya sahip olan hoodie, v&uuml;cuda tam olarak uyum sağlar ve hareket &ouml;zg&uuml;rl&uuml;ğ&uuml; sunar.</li>
	<li><strong>&Ouml;zel Cakabo Detayı:</strong> Siyah Cakabo logosu, hoodieye &ouml;zg&uuml;nl&uuml;k ve marka kimliği katarken tarzınıza da kişilik katar.</li>
	<li><strong>&Ccedil;eşitli Kombin Se&ccedil;enekleri:</strong> Jeanlerle, eşofman altlarıyla veya şortlarla rahatlıkla kombinlenebilir. Her tarza uyum sağlar.</li>
	<li><strong>Geniş Beden Se&ccedil;enekleri:</strong> XS&#39;den XXXL&#39;e kadar geniş beden se&ccedil;enekleri bulunur, b&ouml;ylece her bedene uyum sağlar.</li>
</ul>

<p>MonoScript Hoodie, zarafetin ve şıklığın m&uuml;kemmel bir kombinasyonunu sunar ve Cakabo&#39;nun &ouml;zg&uuml;n tarzını yansıtır.</p>
', N'<p><strong>MonoScript Hoodie - Kargo Detayı:</strong></p>

<p>MonoScript Hoodie&#39;yi sipariş ettiğinizde, hızlı ve g&uuml;venilir bir kargo s&uuml;reciyle size ulaştırılır. &Uuml;r&uuml;n, &ouml;zel koruma malzemeleriyle paketlenmiş ve hasar g&ouml;rmemesi i&ccedil;in titizlikle korunmuştur.</p>

<p><strong>Kargo S&uuml;reci:</strong></p>

<ol>
	<li><strong>Hazırlık ve Paketleme:</strong> Siparişiniz alındıktan sonra, hoodie &ouml;zenle paketlenir ve kargo firmasına teslim edilmeye hazır hale getirilir.</li>
	<li><strong>Hızlı G&ouml;nderim:</strong> &Uuml;r&uuml;n, kargo firması aracılığıyla en kısa s&uuml;rede adresinize g&ouml;nderilir. Kargo s&uuml;resi, bulunduğunuz b&ouml;lgeye ve kargo firmasının &ccedil;alışma prensiplerine bağlı olarak değişebilir.</li>
	<li><strong>Takip Numarası:</strong> &Uuml;r&uuml;n&uuml;n&uuml;z kargoya verildiğinde, size bir takip numarası sağlanır. Bu numara ile g&ouml;nderinizin durumunu kolayca takip edebilirsiniz.</li>
	<li><strong>G&uuml;venli Teslimat:</strong> Hoodie, dikkatle taşınarak adresinize ulaştırılır. Teslimat sırasında herhangi bir sorun yaşamanız durumunda m&uuml;şteri hizmetlerimiz size destek sağlayacaktır.</li>
</ol>

<p>MonoScript Hoodie&#39;nin kargo s&uuml;reci, &uuml;r&uuml;n&uuml;n&uuml;z&uuml;n g&uuml;venli ve hızlı bir şekilde elinize ulaşmasını sağlamak i&ccedil;in &ouml;zenle y&ouml;netilir.</p>
')
INSERT [dbo].[Product] ([ID], [Name], [Price], [Stock], [Description], [DisplayIndex], [CategoryID], [BrandID], [Detail], [CargoDetail]) VALUES (19, N'Cityscape Noir Hoodie', CAST(850.00 AS Decimal(18, 2)), 100, N'Cityscape Noir Hoodie, siyah rengin asaletiyle önünde Cakabo logosu bulunan şehir temalı bir tasarıma sahiptir.', 0, 10, 1, N'<p><strong>Cityscape Noir Hoodie</strong></p>

<p>Cityscape Noir Hoodie, siyah rengin asaletiyle &ouml;n&uuml;nde Cakabo logosu bulunan şehir temalı bir tasarıma sahiptir. Bu hoodie, şehrin enerjisini ve dinamizmini yansıtarak stilinizi tamamlar.</p>

<p><strong>&Uuml;r&uuml;n Detayları:</strong></p>

<ul>
	<li><strong>Şehir Temalı Tasarım:</strong> &Ouml;nde yer alan Cakabo logosu, şehir manzarasına sahip bir tasarımla birleşerek modern ve şık bir g&ouml;r&uuml;n&uuml;m sunar.</li>
	<li><strong>Y&uuml;ksek Kaliteli Malzeme:</strong> %100 pamuklu kumaştan &uuml;retilmiş olan hoodie, yumuşak ve konforlu bir giyim deneyimi sunar.</li>
	<li><strong>Rahat ve Esnek Giyim:</strong> Esnek yapıya sahip olan hoodie, v&uuml;cuda tam olarak uyum sağlar ve hareket &ouml;zg&uuml;rl&uuml;ğ&uuml; sunar.</li>
	<li><strong>Cakabo Detayı:</strong> &Ouml;n y&uuml;z&uuml;nde yer alan Cakabo logosu, markanın &ouml;zg&uuml;nl&uuml;ğ&uuml;n&uuml; ve tarzını yansıtarak hoodieye karakter kazandırır.</li>
	<li><strong>&Ccedil;eşitli Kombin Se&ccedil;enekleri:</strong> Jeanlerle, eşofman altlarıyla veya şortlarla rahatlıkla kombinlenebilir. Her tarza uyum sağlar.</li>
	<li><strong>&Ccedil;eşitli Beden Se&ccedil;enekleri:</strong> XS&#39;den XXXL&#39;e kadar geniş beden se&ccedil;enekleri bulunur, b&ouml;ylece her bedene uyum sağlar.</li>
</ul>

<p>Cityscape Noir Hoodie, şehir hayatının enerjisini ve tarzını &uuml;zerinizde taşıyarak &ouml;zg&uuml;n bir g&ouml;r&uuml;n&uuml;m sunar.</p>
', N'<p><strong>Cityscape Noir Hoodie - Kargo Detayı:</strong></p>

<p>Cityscape Noir Hoodie&#39;yi sipariş ettiğinizde, hızlı ve g&uuml;venilir bir kargo s&uuml;reciyle size ulaştırılır. &Uuml;r&uuml;n, &ouml;zel koruma malzemeleriyle paketlenmiş ve hasar g&ouml;rmemesi i&ccedil;in titizlikle korunmuştur.</p>

<p><strong>Kargo S&uuml;reci:</strong></p>

<ol>
	<li><strong>Hazırlık ve Paketleme:</strong> Siparişiniz alındıktan sonra, hoodie &ouml;zenle paketlenir ve kargo firmasına teslim edilmeye hazır hale getirilir.</li>
	<li><strong>Hızlı G&ouml;nderim:</strong> &Uuml;r&uuml;n, kargo firması aracılığıyla en kısa s&uuml;rede adresinize g&ouml;nderilir. Kargo s&uuml;resi, bulunduğunuz b&ouml;lgeye ve kargo firmasının &ccedil;alışma prensiplerine bağlı olarak değişebilir.</li>
	<li><strong>Takip Numarası:</strong> &Uuml;r&uuml;n&uuml;n&uuml;z kargoya verildiğinde, size bir takip numarası sağlanır. Bu numara ile g&ouml;nderinizin durumunu kolayca takip edebilirsiniz.</li>
	<li><strong>G&uuml;venli Teslimat:</strong> Hoodie, dikkatle taşınarak adresinize ulaştırılır. Teslimat sırasında herhangi bir sorun yaşamanız durumunda m&uuml;şteri hizmetlerimiz size destek sağlayacaktır.</li>
</ol>

<p>Cityscape Noir Hoodie&#39;nin kargo s&uuml;reci, &uuml;r&uuml;n&uuml;n&uuml;z&uuml;n g&uuml;venli ve hızlı bir şekilde elinize ulaşmasını sağlamak i&ccedil;in &ouml;zenle y&ouml;netilir.</p>
')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductPicture] ON 

INSERT [dbo].[ProductPicture] ([ID], [Name], [Picture], [DisplayIndex], [ProductID]) VALUES (2, N'Armortime ', N'/img/ProductPicture/WhatsApp Image 2024-02-16 at 14.29.07.jpeg', 1, 2)
INSERT [dbo].[ProductPicture] ([ID], [Name], [Picture], [DisplayIndex], [ProductID]) VALUES (3, N'Armortime', N'/img/ProductPicture/WhatsApp Image 2024-02-16 at 14.30.48.jpeg', 2, 2)
INSERT [dbo].[ProductPicture] ([ID], [Name], [Picture], [DisplayIndex], [ProductID]) VALUES (4, N'Armortime', N'/img/ProductPicture/WhatsApp Image 2024-02-16 at 14.29.23.jpeg', 3, 2)
INSERT [dbo].[ProductPicture] ([ID], [Name], [Picture], [DisplayIndex], [ProductID]) VALUES (7, N'GentleBrown clasic', N'/img/ProductPicture/cizgi incisi.jpeg', 1, 3)
INSERT [dbo].[ProductPicture] ([ID], [Name], [Picture], [DisplayIndex], [ProductID]) VALUES (8, N'ShadowSteel ', N'/img/ProductPicture/gecenin incisi.jpeg', 1, 4)
INSERT [dbo].[ProductPicture] ([ID], [Name], [Picture], [DisplayIndex], [ProductID]) VALUES (9, N'StealthFit ', N'/img/ProductPicture/WhatsApp Image 2024-02-16 at 14.25.50.jpeg', 1, 5)
INSERT [dbo].[ProductPicture] ([ID], [Name], [Picture], [DisplayIndex], [ProductID]) VALUES (10, N'Copper Noir Timepiece', N'/img/ProductPicture/WhatsApp Image 2024-02-16 at 14.26.43.jpeg', 1, 6)
INSERT [dbo].[ProductPicture] ([ID], [Name], [Picture], [DisplayIndex], [ProductID]) VALUES (11, N'PurityStride ', N'/img/ProductPicture/Pırıltılı koşu.jpeg', 1, 7)
INSERT [dbo].[ProductPicture] ([ID], [Name], [Picture], [DisplayIndex], [ProductID]) VALUES (12, N'UrbanBlend Tri-Tone Sneakers', N'/img/ProductPicture/Sehir Kosusu.jpeg', 1, 8)
INSERT [dbo].[ProductPicture] ([ID], [Name], [Picture], [DisplayIndex], [ProductID]) VALUES (13, N'ShadowStride ', N'/img/ProductPicture/WhatsApp Image 2024-02-16 at 14.08.27.jpeg', 1, 9)
INSERT [dbo].[ProductPicture] ([ID], [Name], [Picture], [DisplayIndex], [ProductID]) VALUES (14, N'Dusky Shadow', N'/img/ProductPicture/WhatsApp Image 2024-02-16 at 13.32.35.jpeg', 1, 10)
INSERT [dbo].[ProductPicture] ([ID], [Name], [Picture], [DisplayIndex], [ProductID]) VALUES (15, N'Misty Day Bag', N'/img/ProductPicture/WhatsApp Image 2024-02-16 at 13.34.50.jpeg', 1, 11)
INSERT [dbo].[ProductPicture] ([ID], [Name], [Picture], [DisplayIndex], [ProductID]) VALUES (16, N'ShadowBeat ', N'/img/ProductPicture/WhatsApp Image 2024-02-16 at 15.02.30.jpeg', 1, 12)
INSERT [dbo].[ProductPicture] ([ID], [Name], [Picture], [DisplayIndex], [ProductID]) VALUES (17, N'SnowBeat ', N'/img/ProductPicture/WhatsApp Image 2024-02-16 at 15.04.54.jpeg', 1, 13)
INSERT [dbo].[ProductPicture] ([ID], [Name], [Picture], [DisplayIndex], [ProductID]) VALUES (18, N'Firewave ', N'/img/ProductPicture/WhatsApp Image 2024-02-16 at 15.12.40.jpeg', 1, 14)
INSERT [dbo].[ProductPicture] ([ID], [Name], [Picture], [DisplayIndex], [ProductID]) VALUES (19, N'Firewave ', N'/img/ProductPicture/WhatsApp Image 2024-02-16 at 15.12.21.jpeg', 2, 14)
INSERT [dbo].[ProductPicture] ([ID], [Name], [Picture], [DisplayIndex], [ProductID]) VALUES (26, N'MonoScript ', N'/img/ProductPicture/WhatsApp Image 2024-02-16 at 14.22.37.jpeg', 1, 18)
INSERT [dbo].[ProductPicture] ([ID], [Name], [Picture], [DisplayIndex], [ProductID]) VALUES (27, N'Cityscape ', N'/img/ProductPicture/WhatsApp Image 2024-02-16 at 14.16.21.jpeg', 1, 19)
INSERT [dbo].[ProductPicture] ([ID], [Name], [Picture], [DisplayIndex], [ProductID]) VALUES (31, N'ShadowFit Tee Cakabo', N'/img/ProductPicture/WhatsApp Image 2024-02-16 at 12.56.30.jpeg', 1, 15)
INSERT [dbo].[ProductPicture] ([ID], [Name], [Picture], [DisplayIndex], [ProductID]) VALUES (33, N'İnkSplash', N'/img/ProductPicture/WhatsApp Image 2024-02-16 at 12.57.32.jpeg', 3, 17)
SET IDENTITY_INSERT [dbo].[ProductPicture] OFF
GO
SET IDENTITY_INSERT [dbo].[Slide] ON 

INSERT [dbo].[Slide] ([ID], [Slogan], [Title], [Description], [Picture], [Price], [Link], [DisplayIndex]) VALUES (1, N'Kalitenin Tek Adresi', N'Cakabo Store', N'ss', N'/img/slide/plant-2004483_1280.jpg', CAST(1.00 AS Decimal(18, 2)), N'#', N'1')
INSERT [dbo].[Slide] ([ID], [Slogan], [Title], [Description], [Picture], [Price], [Link], [DisplayIndex]) VALUES (2, N'Kapıda Hizmet', N'Cakabo Store', N'd', N'/img/slide/plant-2004483_1920.jpg', CAST(1.00 AS Decimal(18, 2)), N'#', N'2')
SET IDENTITY_INSERT [dbo].[Slide] OFF
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_Category_ParentID] FOREIGN KEY([ParentID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_Category_ParentID]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Order_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Order_OrderID]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Brand_BrandID] FOREIGN KEY([BrandID])
REFERENCES [dbo].[Brand] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Brand_BrandID]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category_CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category_CategoryID]
GO
ALTER TABLE [dbo].[ProductPicture]  WITH CHECK ADD  CONSTRAINT [FK_ProductPicture_Product_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductPicture] CHECK CONSTRAINT [FK_ProductPicture_Product_ProductID]
GO
