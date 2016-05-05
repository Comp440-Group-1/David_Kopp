USE [s16guest38]
GO

/****** Object:  StoredProcedure [dbo].[monthlyDownloads]    Script Date: 5/5/2016 12:46:53 PM ******/
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


