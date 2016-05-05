/*
/***ProductId = 1***/
insert into product (productName, productDescription) 
values ('EHR System', 'health records system for the patients');

/*** VersionId = 1***/
insert into productVersion (productId, versionNumber, versionPlatform)
values (1,'1.1','Windows');

/*** VersionId = 2***/
insert into productVersion (productId, versionNumber, versionPlatform)
values (1,'1.2','Linux');

/*** VersionId = 3***/
insert into productVersion (productId, versionNumber, versionPlatform)
values (1,'2.1','Windows');

/*** VersionId = 4***/
insert into productVersion (productId, versionNumber, versionPlatform)
values (1,'2.2','Linux');

/*** featureId = 1***/
insert into feature (featureDescription)
values ('login module');

/*** featureId = 2***/
insert into feature (featureDescription)
values ('patient registration');

/*** featureId = 3***/
insert into feature (featureDescription)
values ('patient profile');

/*** featureId = 4***/
insert into feature (featureDescription)
values ('patient release form');

/*** featureId = 5***/
insert into feature (featureDescription)
values ('physician profile');

/*** featureId = 6***/
insert into feature (featureDescription)
values ('address verification');

/*** featureId = 7***/
insert into feature (featureDescription)
values ('patient authentication');

/*** featureId = 8***/
insert into feature (featureDescription)
values ('patient medication form');

/*** featureId = 9***/
insert into feature (featureDescription)
values ('patient e-bill');

/*** featureId = 10***/
insert into feature (featureDescription)
values ('patient reporting');

/*** featureId = 11***/
insert into feature (featureDescription, newFeature)
values ('patient reporting bug fix', 0);

/*** iterationId = 1***/
insert into iteration (productId, versionId, sprintNumber)
values (1,1,1);

/*** iterationId = 2***/
insert into iteration (productId, versionId, sprintNumber)
values (1,2,1);

/*** iterationId = 3***/
insert into iteration (productId, versionId, sprintNumber)
values (1,3,2);

/*** iterationId = 4***/
insert into iteration (productId, versionId, sprintNumber)
values (1,4,2);

/*** iterationId = 5***/
insert into iteration (productId, versionId, sprintNumber)
values (1,4,3);

/*** branchId = 1***/
insert into branch (iterationId, branchName, fileLocation)
values (1, 'EHR version 1.1', '\ehr\v\1\1\git.git');

/*** branchId = 2***/
insert into branch (iterationId, branchName, fileLocation)
values (2, 'EHR version 1.2 Linux', '\ehr\v\1\2\git.git');

/*** branchId = 3***/
insert into branch (iterationId, branchName, fileLocation)
values (3, 'EHR version 2.1', '\ehr\v\2\1\git.git');

/*** branchId = 4***/
insert into branch (iterationId, branchName, fileLocation)
values (4, 'EHR version 2.2 Linux', '\ehr\v\2\2\git.git');

/*** branchId = 8***/
insert into branch (iterationId, branchName, fileLocation)
values (5, 'EHR version 2.2 Linux patient reporting fix', '\ehr\v\2\2\patientreportfix\git.git');

/*** internalReleaseId = 1***/
insert into internalRelease (branchId)
values (1);

/*** internalReleaseId = 2***/
insert into internalRelease (branchId)
values (2);

/*** internalReleaseId = 3***/
insert into internalRelease (branchId)
values (3);

/*** internalReleaseId = 4***/
insert into internalRelease (branchId)
values (4);

/*** internalReleaseId = 7***/
insert into internalRelease (branchId)
values (8);

/*** releaseId = 1***/
insert into productRelease (internalReleaseId, releaseUrl, releaseVersion, releaseDate, releaseType, releaseDiscontinued)
values (1, 'http://www.ehrsystem.com/windows/1.1/install.exe', '1.1', '1/1/00' ,'new product release', 1);

/*** releaseId = 2***/
insert into productRelease (internalReleaseId, releaseUrl, releaseVersion, releaseDate, releaseType, releaseDiscontinued)
values (2, 'http://www.ehrsystem.com/linux/1.1/install.tar.gz', '1.1', '1/1/00' ,'new product release', 1);

/*** releaseId = 6***/
insert into productRelease (internalReleaseId, releaseUrl, releaseVersion, releaseDate, releaseType)
values (3, 'http://www.ehrsystem.com/windows/2.1/install.exe', '2.1', '5/1/00' ,'new features release');

/*** releaseId = 7***/
insert into productRelease (internalReleaseId, releaseUrl, releaseVersion, releaseDate, releaseType, releaseDiscontinued)
values (4, 'http://www.ehrsystem.com/linux/2.1/install.tar.gz', '2.1', '5/1/00', 'new features release', 1);

/*** releaseId = 8***/
insert into productRelease (internalReleaseId, releaseUrl, releaseVersion, releaseDate, releaseType)
values (7, 'http://www.ehrsystem.com/linux/2.2/install.tar.gz', '2.2', '6/13/00' ,'bug-fix release');

/*** versionId = 1 featureId = 1-6***/
insert into productFeature (versionId, featureId)
values (1,1);
insert into productFeature (versionId, featureId)
values (1,2);
insert into productFeature (versionId, featureId)
values (1,3);
insert into productFeature (versionId, featureId)
values (1,4);
insert into productFeature (versionId, featureId)
values (1,5);
insert into productFeature (versionId, featureId)
values (1,6);

/*** versionId = 2 featureId = 1-6***/
insert into productFeature (versionId, featureId)
values (2,1);
insert into productFeature (versionId, featureId)
values (2,2);
insert into productFeature (versionId, featureId)
values (2,3);
insert into productFeature (versionId, featureId)
values (2,4);
insert into productFeature (versionId, featureId)
values (2,5);
insert into productFeature (versionId, featureId)
values (2,6);

/*** versionId = 3 featureId = 1-10***/
insert into productFeature (versionId, featureId)
values (3,1);
insert into productFeature (versionId, featureId)
values (3,2);
insert into productFeature (versionId, featureId)
values (3,3);
insert into productFeature (versionId, featureId)
values (3,4);
insert into productFeature (versionId, featureId)
values (3,5);
insert into productFeature (versionId, featureId)
values (3,6);
insert into productFeature (versionId, featureId)
values (3,7);
insert into productFeature (versionId, featureId)
values (3,8);
insert into productFeature (versionId, featureId)
values (3,9);
insert into productFeature (versionId, featureId)
values (3,10);

/*** versionId = 4 featureId = 1-11***/
insert into productFeature (versionId, featureId)
values (4,1);
insert into productFeature (versionId, featureId)
values (4,2);
insert into productFeature (versionId, featureId)
values (4,3);
insert into productFeature (versionId, featureId)
values (4,4);
insert into productFeature (versionId, featureId)
values (4,5);
insert into productFeature (versionId, featureId)
values (4,6);
insert into productFeature (versionId, featureId)
values (4,7);
insert into productFeature (versionId, featureId)
values (4,8);
insert into productFeature (versionId, featureId)
values (4,9);
insert into productFeature (versionId, featureId)
values (4,10);
insert into productFeature (versionId, featureId)
values (4,11);

/* companyId = 1 'ABC records' */
insert into company (companyName)
values ('ABC records');

/* companyId = 2 'ZYX Corp' */
insert into company (companyName)
values ('ZYX Corp');

/* companyId = 3 '99 Store' */
insert into company (companyName)
values ('99 Store');

/* customerId = 1 'Peter Smith' */
insert into customer (companyId, nameTitleId, firstName, lastName, nameSuffixId, customerEmail)
values (1,1,'Peter','Smith',1,'p.smith@abc.com');

/* customerId = 2 'Maria Bounte' */
insert into customer (companyId, nameTitleId, firstName, lastName, nameSuffixId, customerEmail)
values (2,1,'Maria','Bounte',1,'maria@zyx.com');

/* customerId = 3 'David Sommerset' */
insert into customer (companyId, nameTitleId, firstName, lastName, nameSuffixId, customerEmail)
values (3,1,'David','Sommerset',1,'david.sommerset@99cents.store');

/* customerId = 4 'Maria Bounte' */
insert into customer (companyId, nameTitleId, firstName, lastName, nameSuffixId, customerEmail)
values (3,1,'Maria','Bounte',1,'maria.bounte@99cents.store');

/* phoneId = 2 'Peter Smith' */
insert into customerPhone (customerId, areaCode, phoneNumber, phoneTypeId)
values (1, 123, '485-8973', 2);

/* phoneId = 3 'Maria Bounte' */
insert into customerPhone (customerId, phoneNumber, phoneTypeId)
values (2, '1-28-397863896', 2);

/* phoneId = 4 'David Sommerset' */
insert into customerPhone (customerId, phoneNumber, phoneTypeId)
values (3, '179-397-87968', 3);

/* phoneId = 1 'Maria Bounte' */ 
insert into customerPhone (customerId, phoneNumber, phoneTypeId)
values (4, '178-763-98764', 3);

/* customerAddress = 1 customerId = 1*/
insert into customerAddress (customerId, companyId, streetNumber, streetName, city, stateId, postalCode, country)
values (1, 1, 123, 'Privet Street', 'Los Angeles', 2, '91601', 'US');

/* customerAddress = 2 customerId = 2*/
insert into customerAddress (customerId, companyId, streetNumber, streetName, city, stateId, postalCode, country)
values (2, 2, 348, 'Jinx Road', 'London', 2, null, 'UK');

/* releaseId = 6 customerId = 1 */
insert into releaseDownload (releaseId, customerId, downloadDate)
values (6, 1, '6/1/00');

/* releaseId = 6 customerId = 2 */
insert into releaseDownload (releaseId, customerId, downloadDate)
values (6, 2, '3/1/00');

/* releaseId = 8 customerId = 3 */
insert into releaseDownload (releaseId, customerId, downloadDate)
values (8, 3, '7/1/00');

/* releaseId = 8 customerId = 4 */
insert into releaseDownload (releaseId, customerId, downloadDate)
values (8, 4, '9/1/00');
*/