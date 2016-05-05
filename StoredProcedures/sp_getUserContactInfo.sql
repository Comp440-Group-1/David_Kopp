USE [s16guest38]
GO

/****** Object:  StoredProcedure [dbo].[getCustomerContactInfo]    Script Date: 5/5/2016 12:47:16 PM ******/
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


