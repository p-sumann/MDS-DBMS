SELECT TOP 100
	ApplicationDataID,
	CreatedBy,
	Created,
	LastModifiedBy,
	LastModified,
	Title,
	TemplateName,
	Status,
	AppFormdata,
	InitiatedDate,
	InitiatorId,
	CompletedDate,
	Active,
	ExternalFormDataId,
	AppTemplateID
FROM
	PaperPlateQaDb.dbo.InternalForm;