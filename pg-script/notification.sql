-- public."MarketAlert" definition

-- Drop table

-- DROP TABLE public."MarketAlert";

CREATE TABLE public."MarketAlert" (
	"createdAt" int8 NULL,
	"updatedAt" int8 NULL,
	id int4 NOT NULL,
	custid text NULL,
	"type" text NULL,
	code text NULL,
	increase bool NULL,
	"conditionKey" text NULL,
	"conditionValue" float4 NULL,
	"activeTime" float4 NULL,
	fromdate text NULL,
	todate text NULL,
	CONSTRAINT "MarketAlert_pkey" PRIMARY KEY (id)
);

-- public.accountnotifyconfig definition

-- Drop table

-- DROP TABLE public.accountnotifyconfig;

CREATE TABLE public.accountnotifyconfig (
	"createdAt" int8 NULL,
	"updatedAt" int8 NULL,
	custid varchar NOT NULL,
	"types" json NULL,
	CONSTRAINT accountnotifyconfig_pkey PRIMARY KEY (custid)
);

-- public.accountnotifymessage definition

-- Drop table

-- DROP TABLE public.accountnotifymessage;

CREATE TABLE public.accountnotifymessage (
	"createdAt" int8 NULL,
	"updatedAt" int8 NULL,
	id serial4 NOT NULL,
	afacctno text NULL,
	custid text NULL,
	templateid text NULL,
	msgevent json NULL,
	"read" bool NULL,
	CONSTRAINT accountnotifymessage_pkey PRIMARY KEY (id)
);

-- public.analyticmessage definition

-- Drop table

-- DROP TABLE public.analyticmessage;

CREATE TABLE public.analyticmessage (
	"createdAt" int8 NULL,
	"updatedAt" int8 NULL,
	id serial4 NOT NULL,
	"language" text NULL,
	symbol text NULL,
	reportid text NULL,
	subject text NULL,
	"content" text NULL,
	link text NULL,
	filename text NULL,
	public bool NULL,
	effective float4 NULL,
	usermaker text NULL,
	userchecker text NULL,
	status text NULL,
	checkat float4 NULL,
	canceler text NULL,
	CONSTRAINT analyticmessage_pkey PRIMARY KEY (id)
);

-- public.analyticmessagedetails definition

-- Drop table

-- DROP TABLE public.analyticmessagedetails;

CREATE TABLE public.analyticmessagedetails (
	"createdAt" int8 NULL,
	"updatedAt" int8 NULL,
	id serial4 NOT NULL,
	custid text NULL,
	"read" bool NULL,
	"owner" int4 NULL,
	CONSTRAINT analyticmessagedetails_pkey PRIMARY KEY (id)
);