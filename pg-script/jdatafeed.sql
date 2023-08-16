
-- public.csidxinfor definition

-- Drop table

-- DROP TABLE public.csidxinfor;

CREATE TABLE public.csidxinfor (
	id varchar(255) NOT NULL,
	"AddDate" varchar(255) NULL,
	"FloorCode" varchar(255) NULL,
	"IndexCode" varchar(255) NULL,
	"IndexId" varchar(255) NULL,
	"StockNo" varchar(255) NULL,
	"Symbol" varchar(255) NULL,
	"TotalQtty" varchar(255) NULL,
	"TradingDate" varchar(255) NULL,
	"Weighted" varchar(255) NULL,
	"createAt" int4 NULL,
	"Id" varchar(255) NULL,
	CONSTRAINT csidxinfor_pkey_1 PRIMARY KEY (id)
);


-- public.idxinfor definition

-- Drop table

-- DROP TABLE public.idxinfor;

CREATE TABLE public.idxinfor (
	id varchar(255) NOT NULL,
	"Ceiling" varchar(255) NULL,
	"Change" varchar(255) NULL,
	"CloseIndex" varchar(255) NULL,
	"CurrentStatus" varchar(255) NULL,
	"Down" varchar(255) NULL,
	"Floor" varchar(255) NULL,
	"FloorCode" varchar(255) NULL,
	"HighestIndex" varchar(255) NULL,
	"IndexCode" varchar(255) NULL,
	"IndexId" varchar(255) NULL,
	"IndexName" varchar(255) NULL,
	"IndexValue" varchar(255) NULL,
	"LowestIndex" varchar(255) NULL,
	"NoChange" varchar(255) NULL,
	"PriorIndexVal" varchar(255) NULL,
	"RatioChange" varchar(255) NULL,
	"Time" varchar(255) NULL,
	"TotalQtty" varchar(255) NULL,
	"TotalQttyPT" varchar(255) NULL,
	"TotalStock" varchar(255) NULL,
	"TotalValue" varchar(255) NULL,
	"TotalValuePT" varchar(255) NULL,
	"TradingDate" varchar(255) NULL,
	"TypeIndex" varchar(255) NULL,
	"Up" varchar(255) NULL,
	"createAt" int4 NULL,
	CONSTRAINT idxinfor_pkey PRIMARY KEY (id)
);


-- public.marketinfor definition

-- Drop table

-- DROP TABLE public.marketinfor;

CREATE TABLE public.marketinfor (
	id varchar(255) NOT NULL,
	"AVR_CHG_INDEX" varchar(255) NULL,
	"AVR_MARKET_INDEX" varchar(255) NULL,
	"AVR_PCT_INDEX" varchar(255) NULL,
	"AVR_PRIOR_MARKET_INDEX" varchar(255) NULL,
	"PRV_PRIOR_MARKET_INDEX" varchar(255) NULL,
	"PT_TOTAL_QTTY" varchar(255) NULL,
	"PT_TOTAL_TRADE" varchar(255) NULL,
	"PT_TOTAL_VALUE" varchar(255) NULL,
	advances varchar(255) NULL,
	"advancesVolumn" varchar(255) NULL,
	"createAt" int4 NULL,
	declines varchar(255) NULL,
	"declinesVolumn" varchar(255) NULL,
	"indexChange" varchar(255) NULL,
	"indexColor" varchar(255) NULL,
	"indexPercentChange" varchar(255) NULL,
	"indexTime" varchar(255) NULL,
	"marketCode" varchar(255) NULL,
	"marketId" varchar(255) NULL,
	"marketIndex" varchar(255) NULL,
	"marketStatus" varchar(255) NULL,
	"noChange" varchar(255) NULL,
	"noChangeVolumn" varchar(255) NULL,
	"numberOfCe" varchar(255) NULL,
	"numberOfFl" varchar(255) NULL,
	"oddLotTotalValue" varchar(255) NULL,
	"oddLotTotalVolume" varchar(255) NULL,
	"sequenceMsg" varchar(255) NULL,
	"totalTrade" varchar(255) NULL,
	"totalValue" varchar(255) NULL,
	"totalVolume" varchar(255) NULL,
	tradingdate varchar(255) NULL,
	ts int8 NOT NULL,
	"Id" varchar(255) NULL,
	CONSTRAINT marketinfor_pkey PRIMARY KEY (id)
);


-- public.oddlotstockinfor definition

-- Drop table

-- DROP TABLE public.oddlotstockinfor;

CREATE TABLE public.oddlotstockinfor (
	symbol varchar(255) NOT NULL,
	"CoveredWarrantType" varchar(255) NULL,
	"ExercisePrice" varchar(255) NULL,
	"ExerciseRatio" varchar(255) NULL,
	"FloorCode" varchar(255) NULL,
	"FullName" varchar(255) NULL,
	"IssuerName" varchar(255) NULL,
	"ListedShare" varchar(255) NULL,
	"MaturityDate" varchar(255) NULL,
	"PRIOR_PRICE" float4 NULL,
	"PT_MATCH_PRICE" float4 NULL,
	"PT_MATCH_QTTY" float4 NULL,
	"PT_TOTAL_TRADED_QTTY" float4 NULL,
	"PT_TOTAL_TRADED_VALUE" float4 NULL,
	"Status" varchar(255) NULL,
	"StockId" varchar(255) NULL,
	"StockType" varchar(255) NULL,
	"TOTAL_BID_QTTY" float4 NULL,
	"TOTAL_OFFER_QTTY" float4 NULL,
	"averagePrice" float4 NULL,
	"bidPrice1" varchar(255) NULL,
	"bidPrice2" float4 NULL,
	"bidPrice3" float4 NULL,
	"bidVol1" float4 NULL,
	"bidVol2" float4 NULL,
	"bidVol3" float4 NULL,
	"ceiling" float4 NOT NULL,
	"change" float4 NULL,
	"changePercent" float4 NULL,
	"closePrice" float4 NULL,
	"closeVol" float4 NULL,
	exchange varchar(255) NULL,
	"firstTradingDate" varchar(255) NULL,
	floor float4 NULL,
	"foreignBuy" float4 NULL,
	"foreignRemain" float4 NULL,
	"foreignRoom" float4 NULL,
	"foreignSell" float4 NULL,
	high float4 NOT NULL,
	"lastTradingDate" varchar(255) NULL,
	low float4 NOT NULL,
	"offerPrice1" varchar(255) NULL,
	"offerPrice2" float4 NULL,
	"offerPrice3" float4 NULL,
	"offerVol1" float4 NULL,
	"offerVol2" float4 NULL,
	"offerVol3" float4 NULL,
	"open" float4 NULL,
	"openInterest" varchar(255) NULL,
	"openInterestChange" varchar(255) NULL,
	"priceOne" varchar(255) NULL,
	"priceTwo" varchar(255) NULL,
	reference float4 NULL,
	"totalTrading" float4 NULL,
	"totalTradingValue" float4 NULL,
	"tradingSessionID" varchar(255) NULL,
	tradingdate varchar(255) NULL,
	"underlyingSymbol" varchar(255) NULL,
	CONSTRAINT oddlotstockinfor_pkey PRIMARY KEY (symbol)
);


-- public.oddlottopnprice definition

-- Drop table

-- DROP TABLE public.oddlottopnprice;

CREATE TABLE public.oddlottopnprice (
	topnpriceid varchar(255) NOT NULL,
	"Action" varchar(255) NULL,
	"BuyPrice" varchar(255) NULL,
	"BuyQuantity" varchar(255) NULL,
	"CumulativeBuyVolume" varchar(255) NULL,
	"CumulativeSellVolume" varchar(255) NULL,
	"SellPrice" varchar(255) NULL,
	"SellQuantity" varchar(255) NULL,
	"Symbol" varchar(255) NULL,
	"Top" varchar(255) NULL,
	CONSTRAINT oddlottopnprice_pkey PRIMARY KEY (topnpriceid)
);


-- public.oddlottranslog definition

-- Drop table

-- DROP TABLE public.oddlottranslog;

CREATE TABLE public.oddlottranslog (
	id varchar(255) NOT NULL,
	"changeColor" varchar(255) NULL,
	"createAt" int4 NULL,
	"formattedAccVal" varchar(255) NULL,
	"formattedAccVol" varchar(255) NULL,
	"formattedChangeValue" varchar(255) NULL,
	"formattedMatchPrice" varchar(255) NULL,
	"formattedTime" varchar(255) NULL,
	"formattedVol" varchar(255) NULL,
	"lastColor" varchar(255) NULL,
	"sequenceMsg" varchar(255) NULL,
	symbol varchar(255) NULL,
	tradingdate varchar(255) NULL,
	CONSTRAINT oddlottranslog_pkey PRIMARY KEY (id)
);


-- public.ptmatch definition

-- Drop table

-- DROP TABLE public.ptmatch;

CREATE TABLE public.ptmatch (
	id varchar(255) NOT NULL,
	"ConfirmNo" varchar(255) NULL,
	"IsActive" bool NULL,
	"LastSeq" varchar(255) NULL,
	"MarketCode" varchar(255) NULL,
	"MarketId" varchar(255) NULL,
	"MatchVol" float4 NULL,
	"PColor" varchar(255) NULL,
	"Price" varchar(255) NULL,
	"Symbol" varchar(255) NULL,
	"Time" varchar(255) NULL,
	"ceiling" float4 NOT NULL,
	"createAt" int4 NULL,
	floor float4 NOT NULL,
	reference float4 NOT NULL,
	tradingdate varchar(255) NULL,
	CONSTRAINT ptmatch_pkey PRIMARY KEY (id)
);


-- public.putthroughinfo definition

-- Drop table

-- DROP TABLE public.putthroughinfo;

CREATE TABLE public.putthroughinfo (
	id varchar(255) NOT NULL,
	"IsActive" bool NULL,
	"LastSeq" varchar(255) NULL,
	"MarketCode" varchar(255) NULL,
	"MarketId" varchar(255) NULL,
	"MatchVol" float4 NULL,
	"OrderId" varchar(255) NULL,
	"PColor" varchar(255) NULL,
	"Price" float4 NULL,
	"Side" varchar(255) NULL,
	"Symbol" varchar(255) NULL,
	"Time" varchar(255) NULL,
	"Vol" float4 NULL,
	"ceiling" float4 NOT NULL,
	"createAt" int4 NULL,
	floor float4 NOT NULL,
	reference float4 NOT NULL,
	tradingdate varchar(255) NULL,
	CONSTRAINT putthroughinfo_pkey PRIMARY KEY (id)
);


-- public.referencehistory definition

-- Drop table

-- DROP TABLE public.referencehistory;

CREATE TABLE public.referencehistory (
	symbol varchar(255) NOT NULL,
	reference float4 NOT NULL,
	CONSTRAINT referencehistory_pkey PRIMARY KEY (symbol)
);


-- public.stockinfor definition

-- Drop table

-- DROP TABLE public.stockinfor;

CREATE TABLE public.stockinfor (
	symbol varchar(255) NOT NULL,
	"CoveredWarrantType" varchar(255) NULL,
	"ExercisePrice" varchar(255) NULL,
	"ExerciseRatio" varchar(255) NULL,
	"FloorCode" varchar(255) NULL,
	"FullName" varchar(255) NULL,
	"IssuerName" varchar(255) NULL,
	"ListedShare" varchar(255) NULL,
	"MaturityDate" varchar(255) NULL,
	"PRIOR_PRICE" float4 NULL,
	"PT_MATCH_PRICE" float4 NULL,
	"PT_MATCH_QTTY" float4 NULL,
	"PT_TOTAL_TRADED_QTTY" float4 NULL,
	"PT_TOTAL_TRADED_VALUE" float4 NULL,
	"Status" varchar(255) NULL,
	"StockId" varchar(255) NULL,
	"StockType" varchar(255) NULL,
	"TOTAL_BID_QTTY" float4 NULL,
	"TOTAL_OFFER_QTTY" float4 NULL,
	"averagePrice" float4 NULL,
	"bidPrice1" varchar(255) NULL,
	"bidPrice2" float4 NULL,
	"bidPrice3" float4 NULL,
	"bidVol1" float4 NULL,
	"bidVol2" float4 NULL,
	"bidVol3" float4 NULL,
	"ceiling" float4 NOT NULL,
	"change" float4 NULL,
	"changePercent" float4 NULL,
	"closePrice" float4 NULL,
	"closeVol" float4 NULL,
	exchange varchar(255) NULL,
	"firstTradingDate" varchar(255) NULL,
	floor float4 NULL,
	"foreignBuy" float4 NULL,
	"foreignRemain" float4 NULL,
	"foreignRoom" float4 NULL,
	"foreignSell" float4 NULL,
	high float4 NOT NULL,
	"lastTradingDate" varchar(255) NULL,
	low float4 NOT NULL,
	"offerPrice1" varchar(255) NULL,
	"offerPrice2" float4 NULL,
	"offerPrice3" float4 NULL,
	"offerVol1" float4 NULL,
	"offerVol2" float4 NULL,
	"offerVol3" float4 NULL,
	"open" float4 NULL,
	"openInterest" varchar(255) NULL,
	"openInterestChange" varchar(255) NULL,
	"priceOne" varchar(255) NULL,
	"priceTwo" varchar(255) NULL,
	reference float4 NULL,
	"totalTrading" float4 NULL,
	"totalTradingValue" float4 NULL,
	"tradingSessionID" varchar(255) NULL,
	tradingdate varchar(255) NULL,
	ts int8 NOT NULL,
	"underlyingSymbol" varchar(255) NULL,
	id varchar(255) NULL,
	CONSTRAINT stockinfor_pkey PRIMARY KEY (symbol)
);
CREATE INDEX stockinfor_symbols_i ON public.stockinfor USING btree (symbol);


-- public.symbol_infor definition

-- Drop table

-- DROP TABLE public.symbol_infor;

CREATE TABLE public.symbol_infor (
	symbol varchar(255) NOT NULL,
	data_status varchar(255) NULL,
	description varchar(255) NULL,
	exchange_date varchar(255) NULL,
	exchange_listed varchar(255) NULL,
	exchange varchar(255) NULL,
	expiration_date varchar(255) NULL,
	expired bool NOT NULL,
	force_session_rebuild bool NULL,
	has_daily bool NULL,
	has_empty_bars bool NULL,
	has_intraday bool NULL,
	has_no_volume bool NULL,
	has_seconds bool NULL,
	has_weekly_and_monthly bool NULL,
	industry varchar(255) NULL,
	intraday_multipliers varchar(255) NULL,
	minmov float4 NOT NULL,
	minmov2 float4 NOT NULL,
	"name" varchar(255) NULL,
	pointvalue float4 NOT NULL,
	pricescale float4 NOT NULL,
	seconds_multipliers varchar(255) NULL,
	sector varchar(255) NULL,
	"session" varchar(255) NULL,
	supported_resolutions varchar(255) NULL,
	ticker varchar(255) NULL,
	timezone varchar(255) NULL,
	"type" varchar(255) NULL,
	underlying_symbol varchar(255) NULL,
	volume_precision int4 NULL,
	CONSTRAINT symbol_infor_pkey PRIMARY KEY (symbol)
);


-- public.topnprice definition

-- Drop table

-- DROP TABLE public.topnprice;

CREATE TABLE public.topnprice (
	topnpriceid varchar(255) NOT NULL,
	"Action" varchar(255) NULL,
	"BuyPrice" varchar(255) NULL,
	"BuyQuantity" varchar(255) NULL,
	"CumulativeBuyVolume" varchar(255) NULL,
	"CumulativeSellVolume" varchar(255) NULL,
	"SellPrice" varchar(255) NULL,
	"SellQuantity" varchar(255) NULL,
	"Symbol" varchar(255) NULL,
	"Top" varchar(255) NULL,
	id varchar(255) NULL,
	CONSTRAINT topnprice_pkey PRIMARY KEY (topnpriceid)
);
CREATE INDEX topnprice_symbols_i ON public.topnprice USING btree (topnpriceid);


-- public.translog definition

-- Drop table

-- DROP TABLE public.translog;

CREATE TABLE public.translog (
	id varchar(255) NOT NULL,
	"changeColor" varchar(255) NULL,
	"createAt" int4 NULL,
	"formattedAccVal" varchar(255) NULL,
	"formattedAccVol" varchar(255) NULL,
	"formattedChangeValue" varchar(255) NULL,
	"formattedMatchPrice" varchar(255) NULL,
	"formattedTime" varchar(255) NULL,
	"formattedVol" varchar(255) NULL,
	"lastColor" varchar(255) NULL,
	"sequenceMsg" varchar(255) NULL,
	symbol varchar(255) NULL,
	tradingdate varchar(255) NULL,
	"Id" varchar(255) NULL,
	CONSTRAINT translog_pkey PRIMARY KEY (id)
);


-- public.tvhistory1d definition

-- Drop table

-- DROP TABLE public.tvhistory1d;

CREATE TABLE public.tvhistory1d (
	id varchar(255) NOT NULL,
	adjratio float4 NULL,
	"close" float4 NULL,
	low float4 NULL,
	"open" float4 NULL,
	symbol varchar(255) NULL,
	high float4 NULL,
	tradingdate varchar(255) NULL,
	unixtime int4 NOT NULL,
	volume float4 NOT NULL,
	CONSTRAINT tvhistory1d_pkey PRIMARY KEY (id)
);
CREATE INDEX history_marketcodes_i ON public.tvhistory1d USING btree (symbol);
CREATE INDEX history_unixtimes_i ON public.tvhistory1d USING btree (unixtime);


-- public.tvhistory1m definition

-- Drop table

-- DROP TABLE public.tvhistory1m;

CREATE TABLE public.tvhistory1m (
	id varchar(255) NOT NULL,
	adjratio float4 NULL,
	"close" float4 NULL,
	formattedtime varchar(255) NULL,
	low float4 NULL,
	"open" float4 NULL,
	symbol varchar(255) NULL,
	high float4 NULL,
	tradingdate varchar(255) NULL,
	unixtime int4 NOT NULL,
	volume float4 NOT NULL,
	symbolunixtimeindex varchar(1024) NULL,
	CONSTRAINT tvhistory1m_pkey PRIMARY KEY (id)
);
CREATE INDEX intraday_symbols_i ON public.tvhistory1m USING btree (symbol);
CREATE INDEX intraday_unixtimes_i ON public.tvhistory1m USING btree (unixtime);