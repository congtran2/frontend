
-- public."ChartInfo" definition

-- Drop table

-- DROP TABLE public."ChartInfo";

CREATE TABLE public."ChartInfo" (
	"createdAt" int8 NULL,
	"updatedAt" int8 NULL,
	id int4 NOT NULL,
	"name" text NULL,
	"content" text NULL,
	"user" text NULL,
	"timestamp" float4 NULL,
	symbol text NULL,
	resolution text NULL,
	active bool NULL,
	CONSTRAINT "ChartInfo_pkey" PRIMARY KEY (id)
);


-- public."Config" definition

-- Drop table

-- DROP TABLE public."Config";

CREATE TABLE public."Config" (
	"createdAt" int8 NULL,
	"updatedAt" int8 NULL,
	id serial NOT NULL,
	username text NULL,
	"configLayout" json NULL,
	CONSTRAINT "Config_pkey" PRIMARY KEY (id)
);

-- public."DefaultConfig" definition

-- Drop table

-- DROP TABLE public."DefaultConfig";

CREATE TABLE public."DefaultConfig" (
	"createdAt" int8 NULL,
	"updatedAt" int8 NULL,
	id serial NOT NULL,
	username text NULL,
	accountid text NULL,
	symbol text NULL,
	benefitaccount text NULL,
	"showReconfirmOrder" bool NULL,
	"language" text NULL,
	theme text NULL,
	confirm json NULL,
	CONSTRAINT "DefaultConfig_pkey" PRIMARY KEY (id)
);

-- public."Industry" definition

-- Drop table

-- DROP TABLE public."Industry";

CREATE TABLE public."Industry" (
	"createdAt" int8 NULL,
	"updatedAt" int8 NULL,
	id int4 NOT NULL,
	"industryName" text NULL,
	"industryNameEn" text NULL,
	"codeList" text NULL,
	CONSTRAINT "Industry_pkey" PRIMARY KEY (id)
);


-- public."LoginHistory" definition

-- Drop table

-- DROP TABLE public."LoginHistory";

CREATE TABLE public."LoginHistory" (
	"createdAt" int8 NULL,
	"updatedAt" int8 NULL,
	id serial NOT NULL,
	custid text NULL,
	username text NULL,
	"loginTime" text NULL,
	"logoutTime" text NULL,
	ipaddress text NULL,
	"sessionID" text NULL,
	"userAgent" text NULL,
	"allowModify" bool NULL,
	CONSTRAINT "LoginHistory_pkey" PRIMARY KEY (id)
);


-- public."StudyTemplate" definition

-- Drop table

-- DROP TABLE public."StudyTemplate";

CREATE TABLE public."StudyTemplate" (
	"createdAt" int8 NULL,
	"updatedAt" int8 NULL,
	id int4 NOT NULL,
	"name" text NULL,
	"user" text NULL,
	"content" text NULL,
	"timestamp" float4 NULL,
	active bool NULL,
	CONSTRAINT "StudyTemplate_pkey" PRIMARY KEY (id)
);


-- public."UserData" definition

-- Drop table

-- DROP TABLE public."UserData";

CREATE TABLE public."UserData" (
	"createdAt" int8 NULL,
	"updatedAt" int8 NULL,
	id int4 NOT NULL,
	username text NULL,
	"priceboardSymbols" text NULL,
	CONSTRAINT "UserData_pkey" PRIMARY KEY (id),
	CONSTRAINT "UserData_username_key" UNIQUE (username)
);


-- public.favcustomer definition

-- Drop table

-- DROP TABLE public.favcustomer;

CREATE TABLE public.favcustomer (
	"createdAt" int8 NULL,
	"updatedAt" int8 NULL,
	id serial4 NOT NULL,
	"brokerId" text NULL,
	custid text NULL,
	"customerInfo" json NULL,
	CONSTRAINT favcustomer_pkey PRIMARY KEY (id)
);


-- public.limitcondorder definition

-- Drop table

-- DROP TABLE public.limitcondorder;

CREATE TABLE public.limitcondorder (
	username varchar NOT NULL,
	CONSTRAINT limitcondorder_pkey PRIMARY KEY (username)
);


-- public.watchlist definition

-- Drop table

-- DROP TABLE public.watchlist;

CREATE TABLE public.watchlist (
	"createdAt" int8 NULL,
	"updatedAt" int8 NULL,
	id serial4 NOT NULL,
	username text NULL,
	"name" text NULL,
	symbols text NULL,
	CONSTRAINT watchlist_pkey PRIMARY KEY (id)
);