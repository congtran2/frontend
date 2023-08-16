-- public.csidxinfor definition

-- Drop table

-- DROP TABLE public.csidxinfor;

CREATE TABLE public.csidxinfor (
	id serial4 NOT NULL,
	"Id" text NULL,
	"IndexCode" text NULL,
	"StockNo" text NULL,
	"Symbol" text NULL,
	"TotalQtty" text NULL,
	"Weighted" text NULL,
	"AddDate" text NULL,
	"IndexId" text NULL,
	"FloorCode" text NULL,
	"TradingDate" text NULL,
	CONSTRAINT csidxinfor_pkey PRIMARY KEY (id)
);


-- public.idxinfor definition

-- Drop table

-- DROP TABLE public.idxinfor;

CREATE TABLE public.idxinfor (
	id serial4 NOT NULL,
	"Id" text NULL,
	"IndexCode" text NULL,
	"IndexValue" text NULL,
	"TradingDate" text NULL,
	"Time" text NULL,
	"Change" text NULL,
	"RatioChange" text NULL,
	"TotalQtty" text NULL,
	"TotalValue" text NULL,
	"CurrentStatus" text NULL,
	"TotalStock" text NULL,
	"PriorIndexVal" text NULL,
	"HighestIndex" text NULL,
	"LowestIndex" text NULL,
	"CloseIndex" text NULL,
	"TypeIndex" text NULL,
	"IndexName" text NULL,
	"TotalQttyPT" text NULL,
	"TotalValuePT" text NULL,
	"Up" text NULL,
	"Down" text NULL,
	"NoChange" text NULL,
	"Ceiling" text NULL,
	"Floor" text NULL,
	"FloorCode" text NULL,
	"IndexId" text NULL,
	CONSTRAINT idxinfor_pkey PRIMARY KEY (id)
);


-- public.marketinfor definition

-- Drop table

-- DROP TABLE public.marketinfor;

CREATE TABLE public.marketinfor (
	id serial4 NOT NULL,
	"Id" text NULL,
	"sequenceMsg" text NULL,
	tradingdate text NULL,
	"marketIndex" text NULL,
	"indexTime" text NULL,
	"indexColor" text NULL,
	"indexChange" text NULL,
	"indexPercentChange" text NULL,
	"totalTrade" text NULL,
	"totalVolume" text NULL,
	"totalValue" text NULL,
	"marketStatus" text NULL,
	advances text NULL,
	declines text NULL,
	"noChange" text NULL,
	"advancesVolumn" text NULL,
	"declinesVolumn" text NULL,
	"noChangeVolumn" text NULL,
	"marketId" text NULL,
	"marketCode" text NULL,
	"PRV_PRIOR_MARKET_INDEX" text NULL,
	"AVR_MARKET_INDEX" text NULL,
	"AVR_PRIOR_MARKET_INDEX" text NULL,
	"AVR_CHG_INDEX" text NULL,
	"AVR_PCT_INDEX" text NULL,
	"PT_TOTAL_QTTY" text NULL,
	"PT_TOTAL_VALUE" text NULL,
	"PT_TOTAL_TRADE" text NULL,
	CONSTRAINT marketinfor_pkey PRIMARY KEY (id)
);


-- public.ptmatch definition

-- Drop table

-- DROP TABLE public.ptmatch;

CREATE TABLE public.ptmatch (
	id serial4 NOT NULL,
	"Id" text NULL,
	"Symbol" text NULL,
	"ConfirmNo" text NULL,
	"MatchVol" float4 NULL,
	"Price" text NULL,
	"MarketId" text NULL,
	"IsActive" bool NULL,
	tradingdate text NULL,
	"Time" text NULL,
	"LastSeq" text NULL,
	"PColor" text NULL,
	"ceiling" float4 NULL,
	floor float4 NULL,
	reference float4 NULL,
	"MarketCode" text NULL,
	CONSTRAINT ptmatch_pkey PRIMARY KEY (id)
);


-- public.putthroughinfo definition

-- Drop table

-- DROP TABLE public.putthroughinfo;

CREATE TABLE public.putthroughinfo (
	id serial4 NOT NULL,
	"Id" text NULL,
	"Symbol" text NULL,
	"Vol" float4 NULL,
	"MatchVol" float4 NULL,
	"Price" float4 NULL,
	"Side" text NULL,
	"Time" text NULL,
	"IsActive" bool NULL,
	"MarketId" text NULL,
	"OrderId" text NULL,
	tradingdate text NULL,
	"LastSeq" text NULL,
	"PColor" text NULL,
	"ceiling" float4 NULL,
	floor float4 NULL,
	reference float4 NULL,
	"MarketCode" text NULL,
	CONSTRAINT putthroughinfo_pkey PRIMARY KEY (id)
);


-- public.stockinfor definition

-- Drop table

-- DROP TABLE public.stockinfor;

CREATE TABLE public.stockinfor (
	"Id" text NULL,
	symbol varchar NOT NULL,
	"StockId" text NULL,
	"FullName" text NULL,
	tradingdate text NULL,
	"FloorCode" text NULL,
	"StockType" text NULL,
	"ceiling" float4 NULL,
	floor float4 NULL,
	reference float4 NULL,
	"bidPrice3" float4 NULL,
	"bidVol3" float4 NULL,
	"bidPrice2" float4 NULL,
	"bidVol2" float4 NULL,
	"bidPrice1" text NULL,
	"bidVol1" float4 NULL,
	"closePrice" float4 NULL,
	"closeVol" float4 NULL,
	"change" float4 NULL,
	"offerPrice1" text NULL,
	"offerVol1" float4 NULL,
	"offerPrice2" float4 NULL,
	"offerVol2" float4 NULL,
	"offerPrice3" float4 NULL,
	"offerVol3" float4 NULL,
	"totalTrading" float4 NULL,
	"totalTradingValue" float4 NULL,
	"averagePrice" float4 NULL,
	"open" float4 NULL,
	high float4 NULL,
	low float4 NULL,
	"foreignBuy" float4 NULL,
	"foreignSell" float4 NULL,
	"foreignRemain" float4 NULL,
	"foreignRoom" float4 NULL,
	"TOTAL_OFFER_QTTY" float4 NULL,
	"TOTAL_BID_QTTY" float4 NULL,
	"PRIOR_PRICE" float4 NULL,
	"PT_MATCH_QTTY" float4 NULL,
	"PT_MATCH_PRICE" float4 NULL,
	"PT_TOTAL_TRADED_QTTY" float4 NULL,
	"PT_TOTAL_TRADED_VALUE" float4 NULL,
	"Status" text NULL,
	"priceOne" text NULL,
	"priceTwo" text NULL,
	"tradingSessionID" text NULL,
	"openInterest" text NULL,
	"openInterestChange" text NULL,
	"firstTradingDate" text NULL,
	"lastTradingDate" text NULL,
	"underlyingSymbol" text NULL,
	"IssuerName" text NULL,
	"CoveredWarrantType" text NULL,
	"MaturityDate" text NULL,
	"ExercisePrice" text NULL,
	"ExerciseRatio" text NULL,
	"ListedShare" text NULL,
	exchange text NULL,
	CONSTRAINT stockinfor_pkey PRIMARY KEY (symbol)
);


-- public.topnprice definition

-- Drop table

-- DROP TABLE public.topnprice;

CREATE TABLE public.topnprice (
	topnpriceid varchar NOT NULL,
	"Id" text NULL,
	"Symbol" text NULL,
	"Top" text NULL,
	"BuyPrice" text NULL,
	"BuyQuantity" text NULL,
	"CumulativeBuyVolume" text NULL,
	"SellPrice" text NULL,
	"SellQuantity" text NULL,
	"CumulativeSellVolume" text NULL,
	"Action" text NULL,
	CONSTRAINT topnprice_pkey PRIMARY KEY (topnpriceid)
);


-- public.translog definition

-- Drop table

-- DROP TABLE public.translog;

CREATE TABLE public.translog (
	id serial4 NOT NULL,
	"Id" text NULL,
	"sequenceMsg" text NULL,
	tradingdate text NULL,
	symbol text NULL,
	"formattedTime" text NULL,
	"lastColor" text NULL,
	"formattedMatchPrice" text NULL,
	"changeColor" text NULL,
	"formattedChangeValue" text NULL,
	"formattedVol" text NULL,
	"formattedAccVol" text NULL,
	"formattedAccVal" text NULL,
	CONSTRAINT translog_pkey PRIMARY KEY (id)
);


-- public.tvhistory15m definition

-- Drop table

-- DROP TABLE public.tvhistory15m;

CREATE TABLE public.tvhistory15m (
	id serial4 NOT NULL,
	symbol text NULL,
	tradingdate text NULL,
	tradingtime text NULL,
	"open" float4 NULL,
	high float4 NULL,
	low float4 NULL,
	"close" float4 NULL,
	volume float4 NULL,
	unixtime int4 NULL,
	"SymbolUnixtimeIndex" text NULL,
	CONSTRAINT "tvhistory15m_SymbolUnixtimeIndex_key" UNIQUE ("SymbolUnixtimeIndex"),
	CONSTRAINT tvhistory15m_pkey PRIMARY KEY (id)
);


-- public.tvhistory1d definition

-- Drop table

-- DROP TABLE public.tvhistory1d;

CREATE TABLE public.tvhistory1d (
	id serial4 NOT NULL,
	symbol text NULL,
	tradingdate text NULL,
	tradingtime text NULL,
	"open" float4 NULL,
	high float4 NULL,
	low float4 NULL,
	"close" float4 NULL,
	volume float4 NULL,
	unixtime int4 NULL,
	"SymbolUnixtimeIndex" text NULL,
	CONSTRAINT "tvhistory1d_SymbolUnixtimeIndex_key" UNIQUE ("SymbolUnixtimeIndex"),
	CONSTRAINT tvhistory1d_pkey PRIMARY KEY (id)
);


-- public.tvhistory1m definition

-- Drop table

-- DROP TABLE public.tvhistory1m;

CREATE TABLE public.tvhistory1m (
	id serial4 NOT NULL,
	symbol text NULL,
	tradingdate text NULL,
	tradingtime text NULL,
	"open" float4 NULL,
	high float4 NULL,
	low float4 NULL,
	"close" float4 NULL,
	volume float4 NULL,
	unixtime int4 NULL,
	"SymbolUnixtimeIndex" text NULL,
	CONSTRAINT "tvhistory1m_SymbolUnixtimeIndex_key" UNIQUE ("SymbolUnixtimeIndex"),
	CONSTRAINT tvhistory1m_pkey PRIMARY KEY (id)
);


-- public.tvhistory60m definition

-- Drop table

-- DROP TABLE public.tvhistory60m;

CREATE TABLE public.tvhistory60m (
	id serial4 NOT NULL,
	symbol text NULL,
	tradingdate text NULL,
	tradingtime text NULL,
	"open" float4 NULL,
	high float4 NULL,
	low float4 NULL,
	"close" float4 NULL,
	volume float4 NULL,
	unixtime int4 NULL,
	"SymbolUnixtimeIndex" text NULL,
	CONSTRAINT "tvhistory60m_SymbolUnixtimeIndex_key" UNIQUE ("SymbolUnixtimeIndex"),
	CONSTRAINT tvhistory60m_pkey PRIMARY KEY (id)
);


-- public.tvsymbolinfo definition

-- Drop table

-- DROP TABLE public.tvsymbolinfo;

CREATE TABLE public.tvsymbolinfo (
	id serial4 NOT NULL,
	"name" text NULL,
	ticker text NULL,
	description text NULL,
	"type" text NULL,
	"session" text NULL,
	symbol text NULL,
	exchange text NULL,
	listed_exchange text NULL,
	timezone text NULL,
	minmov float4 NULL,
	pricescale float4 NULL,
	minmov2 float4 NULL,
	has_intraday bool NULL,
	supported_resolutions text NULL,
	intraday_multipliers text NULL,
	has_seconds bool NULL,
	seconds_multipliers text NULL,
	has_daily bool NULL,
	has_weekly_and_monthly bool NULL,
	has_empty_bars bool NULL,
	force_session_rebuild bool NULL,
	has_no_volume bool NULL,
	volume_precision float4 NULL,
	data_status text NULL,
	expired bool NULL,
	expiration_date text NULL,
	sector text NULL,
	industry text NULL,
	pointvalue float4 NULL,
	underlying_symbol text NULL,
	CONSTRAINT tvsymbolinfo_pkey PRIMARY KEY (id),
	CONSTRAINT tvsymbolinfo_symbol_key UNIQUE (symbol)
);