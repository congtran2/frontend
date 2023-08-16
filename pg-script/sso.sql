
-- public."FooterLink" definition

-- Drop table

-- DROP TABLE public."FooterLink";

CREATE TABLE public."FooterLink" (
	id int4 NOT NULL,
	"nameId" text NULL,
	link text NULL,
	CONSTRAINT "FooterLink_pkey" PRIMARY KEY (id)
);

-- public."Permission" definition

-- Drop table

-- DROP TABLE public."Permission";

CREATE TABLE public."Permission" (
	"createdAt" int8 NULL,
	"updatedAt" int8 NULL,
	id serial4 NOT NULL,
	"userName" text NULL,
	notimaker bool NULL,
	notichecker bool NULL,
	industry bool NULL,
	CONSTRAINT "Permission_pkey" PRIMARY KEY (id)
);
ALTER TABLE public."Permission"
ADD "uploadAds" bool NULL;

-- public."Permission" definition

-- public."SSORolloutUsers" definition

-- Drop table

-- DROP TABLE public."SSORolloutUsers";

CREATE TABLE public."SSORolloutUsers" (
	id serial NOT NULL,
	username text NULL,
	CONSTRAINT "SSORolloutUsers_pkey" PRIMARY KEY (id)
);