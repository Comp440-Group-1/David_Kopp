USE [s16guest38]
GO
/****** Object:  User [s16guest38]    Script Date: 5/3/2016 11:25:14 PM ******/
CREATE USER [s16guest38] FOR LOGIN [s16guest38] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [s16guest38]
GO
/****** Object:  Table [dbo].[branch]    Script Date: 5/3/2016 11:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[branch](
	[branchId] [int] IDENTITY(1,1) NOT NULL,
	[iterationId] [int] NOT NULL,
	[branchName] [varchar](25) NOT NULL,
	[fileLocation] [varchar](254) NOT NULL,
	[branchDate] [datetime] NOT NULL,
 CONSTRAINT [pk_branch] PRIMARY KEY CLUSTERED 
(
	[branchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[city]    Script Date: 5/3/2016 11:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[city](
	[cityId] [int] IDENTITY(1,1) NOT NULL,
	[stateId] [tinyint] NOT NULL,
	[cityName] [varchar](22) NOT NULL,
 CONSTRAINT [pk_city] PRIMARY KEY CLUSTERED 
(
	[cityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[company]    Script Date: 5/3/2016 11:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[company](
	[companyId] [int] IDENTITY(1,1) NOT NULL,
	[companyName] [varchar](60) NULL,
 CONSTRAINT [pk_company] PRIMARY KEY CLUSTERED 
(
	[companyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[customer]    Script Date: 5/3/2016 11:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[customer](
	[customerId] [int] IDENTITY(1,1) NOT NULL,
	[companyId] [int] NOT NULL,
	[nameTitleId] [int] NOT NULL,
	[firstName] [varchar](35) NOT NULL,
	[lastName] [varchar](35) NOT NULL,
	[nameSuffixId] [int] NOT NULL,
	[customerEmail] [varchar](80) NOT NULL,
 CONSTRAINT [pk_customer] PRIMARY KEY CLUSTERED 
(
	[customerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[customerAddress]    Script Date: 5/3/2016 11:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[customerAddress](
	[customerId] [int] NOT NULL,
	[companyId] [int] NOT NULL,
	[streetNumber] [binary](17) NOT NULL,
	[streetName] [varchar](100) NOT NULL,
	[cityId] [int] NOT NULL,
	[stateId] [tinyint] NOT NULL,
	[zipCode] [binary](17) NOT NULL,
 CONSTRAINT [pk_customerAddress] PRIMARY KEY CLUSTERED 
(
	[customerId] ASC,
	[companyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[customerPhone]    Script Date: 5/3/2016 11:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[customerPhone](
	[phoneId] [int] IDENTITY(1,1) NOT NULL,
	[customerId] [int] NOT NULL,
	[areaCode] [smallint] NOT NULL,
	[phoneNumber] [binary](24) NOT NULL,
	[phoneTypeId] [int] NULL,
 CONSTRAINT [pk_customerPhone] PRIMARY KEY CLUSTERED 
(
	[phoneId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[download]    Script Date: 5/3/2016 11:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[download](
	[releaseId] [int] NOT NULL,
	[customerId] [int] NOT NULL,
	[downloadDate] [datetime] NOT NULL,
 CONSTRAINT [pk_download] PRIMARY KEY CLUSTERED 
(
	[releaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[feature]    Script Date: 5/3/2016 11:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[feature](
	[featureId] [int] IDENTITY(1,1) NOT NULL,
	[featureDescription] [text] NOT NULL,
	[featureDeprecated] [bit] NULL,
	[featureDate] [datetime] NOT NULL,
	[newFeature] [bit] NOT NULL,
 CONSTRAINT [pk_feature] PRIMARY KEY CLUSTERED 
(
	[featureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[instructorData]    Script Date: 5/3/2016 11:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[instructorData](
	[product] [varchar](10) NULL,
	[productDescription] [varchar](254) NULL,
	[productPlatform] [varchar](12) NULL,
	[productVersion] [tinyint] NULL,
	[productFeature] [varchar](254) NULL,
	[releaseVersion] [tinyint] NULL,
	[typeOfRelease] [varchar](254) NULL,
	[releaseDate] [date] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[internalRelease]    Script Date: 5/3/2016 11:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[internalRelease](
	[internalReleaseId] [int] IDENTITY(1,1) NOT NULL,
	[branchId] [int] NOT NULL,
	[internalReleaseDate] [datetime] NOT NULL,
 CONSTRAINT [pk_internalRelease] PRIMARY KEY CLUSTERED 
(
	[internalReleaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[iteration]    Script Date: 5/3/2016 11:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[iteration](
	[iterationId] [int] IDENTITY(1,1) NOT NULL,
	[productId] [int] NOT NULL,
	[versionId] [int] NOT NULL,
	[sprintNumber] [smallint] NOT NULL,
	[startDate] [datetime] NOT NULL,
	[endDate] [datetime] NOT NULL,
 CONSTRAINT [pd_iteration] PRIMARY KEY CLUSTERED 
(
	[iterationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nameSuffix]    Script Date: 5/3/2016 11:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[nameSuffix](
	[nameSuffixId] [int] IDENTITY(1,1) NOT NULL,
	[suffix] [varchar](20) NULL,
 CONSTRAINT [pk_nameSuffix] PRIMARY KEY CLUSTERED 
(
	[nameSuffixId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[nameTitle]    Script Date: 5/3/2016 11:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[nameTitle](
	[nameTitleId] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](20) NULL,
 CONSTRAINT [pk_nameTitle] PRIMARY KEY CLUSTERED 
(
	[nameTitleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[phoneType]    Script Date: 5/3/2016 11:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[phoneType](
	[phoneTypeId] [int] IDENTITY(1,1) NOT NULL,
	[phoneType] [varchar](10) NOT NULL,
 CONSTRAINT [pk_phoneType] PRIMARY KEY CLUSTERED 
(
	[phoneTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[product]    Script Date: 5/3/2016 11:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[product](
	[productId] [int] IDENTITY(1,1) NOT NULL,
	[productName] [varchar](35) NOT NULL,
	[productDescription] [varchar](80) NULL,
 CONSTRAINT [pk_product] PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[productFeature]    Script Date: 5/3/2016 11:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productFeature](
	[versionId] [int] NOT NULL,
	[featureId] [int] NOT NULL,
 CONSTRAINT [pk_productFeature] PRIMARY KEY CLUSTERED 
(
	[versionId] ASC,
	[featureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[productRelease]    Script Date: 5/3/2016 11:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[productRelease](
	[releaseId] [int] IDENTITY(1,1) NOT NULL,
	[internalReleaseId] [int] NOT NULL,
	[releaseUrl] [varchar](254) NOT NULL,
	[releaseVersion] [tinyint] NOT NULL,
	[releaseDate] [datetime] NOT NULL,
	[releaseDiscontinued] [bit] NOT NULL,
	[releaseType] [varchar](80) NULL,
 CONSTRAINT [pk_productRelease] PRIMARY KEY CLUSTERED 
(
	[releaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[productVersion]    Script Date: 5/3/2016 11:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[productVersion](
	[versionId] [int] IDENTITY(1,1) NOT NULL,
	[productId] [int] NOT NULL,
	[version_Number] [varchar](7) NOT NULL,
	[versionPlatform] [varchar](12) NOT NULL,
 CONSTRAINT [pk_productVersion] PRIMARY KEY CLUSTERED 
(
	[versionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[releaseDownload]    Script Date: 5/3/2016 11:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[releaseDownload](
	[releaseId] [int] NOT NULL,
	[customerId] [int] NOT NULL,
	[downloadDate] [datetime] NOT NULL,
 CONSTRAINT [pk_releaseDownload] PRIMARY KEY CLUSTERED 
(
	[releaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[userLogin]    Script Date: 5/3/2016 11:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[userLogin](
	[customerId] [int] NOT NULL,
	[loginName] [varchar](15) NOT NULL,
	[loginPassword] [varchar](88) NULL,
 CONSTRAINT [pk_userLogin] PRIMARY KEY CLUSTERED 
(
	[customerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[usState]    Script Date: 5/3/2016 11:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usState](
	[stateId] [tinyint] IDENTITY(1,1) NOT NULL,
	[stateName] [varchar](16) NOT NULL,
 CONSTRAINT [pk_usState] PRIMARY KEY CLUSTERED 
(
	[stateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[branch] ADD  CONSTRAINT [df_branchDate]  DEFAULT (getdate()) FOR [branchDate]
GO
ALTER TABLE [dbo].[download] ADD  CONSTRAINT [df_downloadDate]  DEFAULT (getdate()) FOR [downloadDate]
GO
ALTER TABLE [dbo].[feature] ADD  CONSTRAINT [df_featureDeprecated]  DEFAULT ((0)) FOR [featureDeprecated]
GO
ALTER TABLE [dbo].[feature] ADD  CONSTRAINT [df_featureDate]  DEFAULT (getdate()) FOR [featureDate]
GO
ALTER TABLE [dbo].[feature] ADD  CONSTRAINT [df_newFeature]  DEFAULT ((0)) FOR [newFeature]
GO
ALTER TABLE [dbo].[internalRelease] ADD  CONSTRAINT [df_internalReleaseDate]  DEFAULT (getdate()) FOR [internalReleaseDate]
GO
ALTER TABLE [dbo].[iteration] ADD  CONSTRAINT [df_startDate]  DEFAULT (getdate()) FOR [startDate]
GO
ALTER TABLE [dbo].[iteration] ADD  CONSTRAINT [df_endDate]  DEFAULT (dateadd(week,(2),getdate())) FOR [endDate]
GO
ALTER TABLE [dbo].[productRelease] ADD  CONSTRAINT [df_releaseDate]  DEFAULT (getdate()) FOR [releaseDate]
GO
ALTER TABLE [dbo].[productRelease] ADD  CONSTRAINT [df_releaseDiscontinued]  DEFAULT ((0)) FOR [releaseDiscontinued]
GO
ALTER TABLE [dbo].[releaseDownload] ADD  CONSTRAINT [df_ReleaseDownloadDate]  DEFAULT (getdate()) FOR [downloadDate]
GO
ALTER TABLE [dbo].[branch]  WITH CHECK ADD  CONSTRAINT [fk_iterationBranch] FOREIGN KEY([iterationId])
REFERENCES [dbo].[iteration] ([iterationId])
GO
ALTER TABLE [dbo].[branch] CHECK CONSTRAINT [fk_iterationBranch]
GO
ALTER TABLE [dbo].[city]  WITH CHECK ADD  CONSTRAINT [fk_usState] FOREIGN KEY([stateId])
REFERENCES [dbo].[usState] ([stateId])
GO
ALTER TABLE [dbo].[city] CHECK CONSTRAINT [fk_usState]
GO
ALTER TABLE [dbo].[customer]  WITH CHECK ADD  CONSTRAINT [fk_customerCompany] FOREIGN KEY([companyId])
REFERENCES [dbo].[company] ([companyId])
GO
ALTER TABLE [dbo].[customer] CHECK CONSTRAINT [fk_customerCompany]
GO
ALTER TABLE [dbo].[customer]  WITH CHECK ADD  CONSTRAINT [fk_nameSuffix] FOREIGN KEY([nameSuffixId])
REFERENCES [dbo].[nameSuffix] ([nameSuffixId])
GO
ALTER TABLE [dbo].[customer] CHECK CONSTRAINT [fk_nameSuffix]
GO
ALTER TABLE [dbo].[customer]  WITH CHECK ADD  CONSTRAINT [fk_nameTitle] FOREIGN KEY([nameTitleId])
REFERENCES [dbo].[nameTitle] ([nameTitleId])
GO
ALTER TABLE [dbo].[customer] CHECK CONSTRAINT [fk_nameTitle]
GO
ALTER TABLE [dbo].[customerAddress]  WITH CHECK ADD  CONSTRAINT [fk_city] FOREIGN KEY([cityId])
REFERENCES [dbo].[city] ([cityId])
GO
ALTER TABLE [dbo].[customerAddress] CHECK CONSTRAINT [fk_city]
GO
ALTER TABLE [dbo].[customerAddress]  WITH CHECK ADD  CONSTRAINT [fk_contact] FOREIGN KEY([customerId])
REFERENCES [dbo].[customer] ([customerId])
GO
ALTER TABLE [dbo].[customerAddress] CHECK CONSTRAINT [fk_contact]
GO
ALTER TABLE [dbo].[customerAddress]  WITH CHECK ADD  CONSTRAINT [fk_state] FOREIGN KEY([stateId])
REFERENCES [dbo].[usState] ([stateId])
GO
ALTER TABLE [dbo].[customerAddress] CHECK CONSTRAINT [fk_state]
GO
ALTER TABLE [dbo].[customerAddress]  WITH CHECK ADD  CONSTRAINT [fk_work] FOREIGN KEY([companyId])
REFERENCES [dbo].[company] ([companyId])
GO
ALTER TABLE [dbo].[customerAddress] CHECK CONSTRAINT [fk_work]
GO
ALTER TABLE [dbo].[customerPhone]  WITH CHECK ADD  CONSTRAINT [fk_customerInfo] FOREIGN KEY([customerId])
REFERENCES [dbo].[customer] ([customerId])
GO
ALTER TABLE [dbo].[customerPhone] CHECK CONSTRAINT [fk_customerInfo]
GO
ALTER TABLE [dbo].[customerPhone]  WITH CHECK ADD  CONSTRAINT [fk_customerPhoneType] FOREIGN KEY([phoneTypeId])
REFERENCES [dbo].[phoneType] ([phoneTypeId])
GO
ALTER TABLE [dbo].[customerPhone] CHECK CONSTRAINT [fk_customerPhoneType]
GO
ALTER TABLE [dbo].[download]  WITH CHECK ADD  CONSTRAINT [fk_customerAccountInfo] FOREIGN KEY([customerId])
REFERENCES [dbo].[customer] ([customerId])
GO
ALTER TABLE [dbo].[download] CHECK CONSTRAINT [fk_customerAccountInfo]
GO
ALTER TABLE [dbo].[download]  WITH CHECK ADD  CONSTRAINT [fk_productPublicRelease] FOREIGN KEY([releaseId])
REFERENCES [dbo].[productRelease] ([releaseId])
GO
ALTER TABLE [dbo].[download] CHECK CONSTRAINT [fk_productPublicRelease]
GO
ALTER TABLE [dbo].[internalRelease]  WITH CHECK ADD  CONSTRAINT [fk_branchInternalRelease] FOREIGN KEY([branchId])
REFERENCES [dbo].[branch] ([branchId])
GO
ALTER TABLE [dbo].[internalRelease] CHECK CONSTRAINT [fk_branchInternalRelease]
GO
ALTER TABLE [dbo].[iteration]  WITH CHECK ADD  CONSTRAINT [fk_internalProductVersion] FOREIGN KEY([versionId])
REFERENCES [dbo].[productVersion] ([versionId])
GO
ALTER TABLE [dbo].[iteration] CHECK CONSTRAINT [fk_internalProductVersion]
GO
ALTER TABLE [dbo].[productFeature]  WITH CHECK ADD  CONSTRAINT [fk_productFeature] FOREIGN KEY([featureId])
REFERENCES [dbo].[feature] ([featureId])
GO
ALTER TABLE [dbo].[productFeature] CHECK CONSTRAINT [fk_productFeature]
GO
ALTER TABLE [dbo].[productFeature]  WITH CHECK ADD  CONSTRAINT [fk_productVersion] FOREIGN KEY([versionId])
REFERENCES [dbo].[productVersion] ([versionId])
GO
ALTER TABLE [dbo].[productFeature] CHECK CONSTRAINT [fk_productVersion]
GO
ALTER TABLE [dbo].[productRelease]  WITH CHECK ADD  CONSTRAINT [fk_CustomerRelease] FOREIGN KEY([internalReleaseId])
REFERENCES [dbo].[internalRelease] ([internalReleaseId])
GO
ALTER TABLE [dbo].[productRelease] CHECK CONSTRAINT [fk_CustomerRelease]
GO
ALTER TABLE [dbo].[productVersion]  WITH CHECK ADD  CONSTRAINT [fk_product] FOREIGN KEY([productId])
REFERENCES [dbo].[product] ([productId])
GO
ALTER TABLE [dbo].[productVersion] CHECK CONSTRAINT [fk_product]
GO
ALTER TABLE [dbo].[releaseDownload]  WITH CHECK ADD  CONSTRAINT [fk_productRelease] FOREIGN KEY([releaseId])
REFERENCES [dbo].[productRelease] ([releaseId])
GO
ALTER TABLE [dbo].[releaseDownload] CHECK CONSTRAINT [fk_productRelease]
GO
ALTER TABLE [dbo].[userLogin]  WITH CHECK ADD  CONSTRAINT [fk_customerRecord] FOREIGN KEY([customerId])
REFERENCES [dbo].[customer] ([customerId])
GO
ALTER TABLE [dbo].[userLogin] CHECK CONSTRAINT [fk_customerRecord]
GO
ALTER TABLE [dbo].[customerAddress]  WITH CHECK ADD  CONSTRAINT [chk_ZipCode] CHECK  (([zipCode]<(100000) AND [zipCode]>(500)))
GO
ALTER TABLE [dbo].[customerAddress] CHECK CONSTRAINT [chk_ZipCode]
GO
ALTER TABLE [dbo].[customerPhone]  WITH CHECK ADD  CONSTRAINT [chk_PhoneNumber] CHECK  (([phoneNumber]<(10000000) AND [phoneNumber]>=(1000000)))
GO
ALTER TABLE [dbo].[customerPhone] CHECK CONSTRAINT [chk_PhoneNumber]
GO
