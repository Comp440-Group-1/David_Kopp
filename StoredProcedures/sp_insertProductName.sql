USE [s16guest38]
GO

/****** Object:  StoredProcedure [dbo].[addProduct]    Script Date: 5/5/2016 12:47:46 PM ******/
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


