USE [s16guest38]
GO
/****** Object:  User [s16guest38]    Script Date: 5/5/2016 1:38:25 PM ******/
CREATE USER [s16guest38] FOR LOGIN [s16guest38] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [s16guest38]
GO
/****** Object:  Table [dbo].[branch]    Script Date: 5/5/2016 1:38:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[branch](
	[branchId] [int] IDENTITY(1,1) NOT NULL,
	[iterationId] [int] NOT NULL,
	[branchName] [varchar](50) NULL,
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
/****** Object:  Table [dbo].[company]    Script Date: 5/5/2016 1:38:25 PM ******/
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
/****** Object:  Table [dbo].[customer]    Script Date: 5/5/2016 1:38:25 PM ******/
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
/****** Object:  Table [dbo].[customerAddress]    Script Date: 5/5/2016 1:38:25 PM ******/
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
	[city] [varchar](60) NOT NULL,
	[stateId] [tinyint] NOT NULL,
	[postalCode] [varchar](12) NULL,
	[country] [varchar](45) NOT NULL,
 CONSTRAINT [pk_customerAddress] PRIMARY KEY CLUSTERED 
(
	[customerId] ASC,
	[companyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[customerPhone]    Script Date: 5/5/2016 1:38:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[customerPhone](
	[phoneId] [int] IDENTITY(1,1) NOT NULL,
	[customerId] [int] NOT NULL,
	[areaCode] [smallint] NULL,
	[phoneNumber] [varchar](50) NULL,
	[phoneTypeId] [int] NULL,
 CONSTRAINT [pk_customerPhone] PRIMARY KEY CLUSTERED 
(
	[phoneId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[feature]    Script Date: 5/5/2016 1:38:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[feature](
	[featureId] [int] IDENTITY(1,1) NOT NULL,
	[featureDescription] [text] NOT NULL,
	[featureDeprecated] [bit] NULL,
	[featureDate] [datetime] NOT NULL,
 CONSTRAINT [pk_feature] PRIMARY KEY CLUSTERED 
(
	[featureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[internalRelease]    Script Date: 5/5/2016 1:38:25 PM ******/
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
/****** Object:  Table [dbo].[iteration]    Script Date: 5/5/2016 1:38:25 PM ******/
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
/****** Object:  Table [dbo].[nameSuffix]    Script Date: 5/5/2016 1:38:25 PM ******/
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
/****** Object:  Table [dbo].[nameTitle]    Script Date: 5/5/2016 1:38:25 PM ******/
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
/****** Object:  Table [dbo].[phoneType]    Script Date: 5/5/2016 1:38:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[phoneType](
	[phoneTypeId] [int] IDENTITY(1,1) NOT NULL,
	[phoneType] [varchar](10) NULL,
 CONSTRAINT [pk_phoneType] PRIMARY KEY CLUSTERED 
(
	[phoneTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[product]    Script Date: 5/5/2016 1:38:25 PM ******/
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
/****** Object:  Table [dbo].[productFeature]    Script Date: 5/5/2016 1:38:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productFeature](
	[versionId] [int] NOT NULL,
	[featureId] [int] NOT NULL,
	[newFeature] [bit] NOT NULL,
 CONSTRAINT [pk_productFeature] PRIMARY KEY CLUSTERED 
(
	[versionId] ASC,
	[featureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[productRelease]    Script Date: 5/5/2016 1:38:25 PM ******/
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
	[releaseVersion] [varchar](7) NOT NULL,
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
/****** Object:  Table [dbo].[productVersion]    Script Date: 5/5/2016 1:38:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[productVersion](
	[versionId] [int] IDENTITY(1,1) NOT NULL,
	[productId] [int] NOT NULL,
	[versionNumber] [varchar](7) NOT NULL,
	[versionPlatform] [varchar](12) NOT NULL,
 CONSTRAINT [pk_productVersion] PRIMARY KEY CLUSTERED 
(
	[versionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[releaseDownload]    Script Date: 5/5/2016 1:38:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[releaseDownload](
	[releaseId] [int] NOT NULL,
	[customerId] [int] NOT NULL,
	[downloadDate] [datetime] NOT NULL,
	[releaseDownloadId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [pk_releaseDownloadId] PRIMARY KEY CLUSTERED 
(
	[releaseDownloadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[userLogin]    Script Date: 5/5/2016 1:38:25 PM ******/
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
/****** Object:  Table [dbo].[usState]    Script Date: 5/5/2016 1:38:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usState](
	[stateId] [tinyint] IDENTITY(1,1) NOT NULL,
	[stateName] [varchar](16) NULL,
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
ALTER TABLE [dbo].[customerPhone] ADD  CONSTRAINT [df_areaCode]  DEFAULT (NULL) FOR [areaCode]
GO
ALTER TABLE [dbo].[feature] ADD  CONSTRAINT [df_featureDeprecated]  DEFAULT ((0)) FOR [featureDeprecated]
GO
ALTER TABLE [dbo].[feature] ADD  CONSTRAINT [df_featureDate]  DEFAULT (getdate()) FOR [featureDate]
GO
ALTER TABLE [dbo].[internalRelease] ADD  CONSTRAINT [df_internalReleaseDate]  DEFAULT (getdate()) FOR [internalReleaseDate]
GO
ALTER TABLE [dbo].[iteration] ADD  CONSTRAINT [df_startDate]  DEFAULT (getdate()) FOR [startDate]
GO
ALTER TABLE [dbo].[iteration] ADD  CONSTRAINT [df_endDate]  DEFAULT (dateadd(week,(2),getdate())) FOR [endDate]
GO
ALTER TABLE [dbo].[productFeature] ADD  CONSTRAINT [df_newFeature]  DEFAULT ((0)) FOR [newFeature]
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
ALTER TABLE [dbo].[iteration]  WITH CHECK ADD  CONSTRAINT [fk_productName] FOREIGN KEY([productId])
REFERENCES [dbo].[product] ([productId])
GO
ALTER TABLE [dbo].[iteration] CHECK CONSTRAINT [fk_productName]
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
ALTER TABLE [dbo].[releaseDownload]  WITH CHECK ADD  CONSTRAINT [fk_customerInfoId] FOREIGN KEY([customerId])
REFERENCES [dbo].[customer] ([customerId])
GO
ALTER TABLE [dbo].[releaseDownload] CHECK CONSTRAINT [fk_customerInfoId]
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
/****** Object:  StoredProcedure [dbo].[addProduct]    Script Date: 5/5/2016 1:38:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* Programmer: David Kopp
** Class: Comp440 Thu
** Project: Database
** Date: 5-4-16 */

CREATE procedure [dbo].[addProduct]
	-- Parameters for the stored procedure
	@productName varchar(35),
	@desc varchar(80)
as
begin
	
	declare @errorMessage varchar(52)

	set nocount on;

	if exists (Select productName from product where productName=@productName)
		begin
		set @errorMessage = 'Error: Product name already exists in table product!'
		raiserror(@errorMessage,11,1)
		end
	else
		begin
		insert into product
		values (@productName, @desc);
		end
end
GO
/****** Object:  StoredProcedure [dbo].[getCustomerContactInfo]    Script Date: 5/5/2016 1:38:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* Programmer: David Kopp
** Class: Comp440 Thu
** Project: Database
** Description: This stored procedure returns the first name, last name,
**				and phone number of a specified user. 
*/

create procedure [dbo].[getCustomerContactInfo]
	-- Parameters for the stored procedure
	@customerId int

as
begin
	
	declare @errorMessage varchar(55)

	set nocount on;
	if not exists (select customerId from customer where customerId = @customerId)
		begin
		set @errorMessage = 'Error: CustomerId could not be found in table customer!'
		raiserror(@errorMessage, 11, 1)
		end
	else
		begin
		select customer.firstName, customer.lastName, customer.customerEmail,
		customerPhone.areaCode, customerPhone.phoneNumber, phoneType.phoneType 
		from customer, customerPhone, phoneType
		where customer.customerId = @customerId 
		AND customerPhone.customerId = customer.customerId 
		AND phoneType.phoneTypeId = customerPhone.phoneTypeId
		end
end
GO
/****** Object:  StoredProcedure [dbo].[getReleaseFeatures]    Script Date: 5/5/2016 1:38:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* Programmer: David Kopp
** Class: Comp440 Thu
** Project: Database
** Description: This stored procedure considers new features for a 
**				particular release version for use on a web site. 
*/

create procedure [dbo].[getReleaseFeatures]
	-- Parameters for the stored procedure
	@productId int,
	@releaseVersion varchar(7)

as
begin

	set nocount on;

	if not exists (select releaseVersion from productRelease 
					where releaseVersion = @releaseVersion)
		begin			 
			raiserror('Error: The release version entered does not exists in the database!', 20,1);
			return 1;
		end
	
	if not exists (select productId from product
					where productId = @productId)
		begin
			raiserror('Error: The productId entered does not exists in the database!', 20,1);
			return 1;
		end

	declare @count int;	
	
	begin try
		set @count = (select count(*) as 'count' from (select releaseVersion, productRelease.internalReleaseId
						from productRelease
						inner join internalRelease on productRelease.internalReleaseId = internalRelease.internalReleaseId
						inner join branch on internalRelease.branchId = branch.branchId
						inner join iteration on branch.iterationId = iteration.iterationId
						inner join product on iteration.productId = product.productId
						inner join productVersion on iteration.versionId = productVersion.versionId
						inner join productFeature on productVersion.versionId = productFeature.versionId
						where product.productId = @productId and productFeature.newFeature = 1 
						and productRelease.releaseVersion = @releaseVersion
						and productRelease.releaseDiscontinued = 0) I)
	end try
	begin catch
		raiserror('Error executing stored procedure!',26,1);
			return 1;
	end catch
	
	if @count > 0
	begin
		print(cast(@count as varchar(10)) + ' features in the release version ' + 
				@releaseVersion + '.')
	end
	else
		print('It is a bug-fix release. There are no new features.')
	end
GO
/****** Object:  StoredProcedure [dbo].[monthlyDownloads]    Script Date: 5/5/2016 1:38:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* Programmer: David Kopp
** Class: Comp440 Thu
** Project: Database
** Description: This stored procedure displays the number of times a release
**				version was downloaded per month. 
*/

create procedure [dbo].[monthlyDownloads]
as
begin
	set nocount on;

	begin try
		select productRelease.releaseVersion, product.productName, releaseDownload.downloadDate, 
		count(*) as 'count'
		from releaseDownload
		inner join productRelease on releaseDownload.releaseId = productRelease.releaseId
		inner join internalRelease on productRelease.internalReleaseId = internalRelease.internalReleaseId
		inner join branch on internalRelease.branchId = branch.branchId
		inner join iteration on branch.iterationId = iteration.iterationId
		inner join product on iteration.productId = product.productId
		group by		
		product.productName,
		productRelease.releaseVersion,
		releaseDownload.downloadDate
	end try
	begin catch
		raiserror('Error retrieving monthly report!',10,1);
	end catch
end
GO
