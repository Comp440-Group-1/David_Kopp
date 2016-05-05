USE [s16guest38]
GO

/****** Object:  StoredProcedure [dbo].[getReleaseFeatures]    Script Date: 5/5/2016 12:46:21 PM ******/
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


