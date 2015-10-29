--
-- PostgreSQL database dump
--
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 7 (class 2615 OID 16590)
-- Name: configuration; Type: SCHEMA; Schema: -; Owner: stAdmins
--

CREATE SCHEMA configuration;


ALTER SCHEMA configuration OWNER TO "stAdmins";

--
-- TOC entry 6 (class 2615 OID 16591)
-- Name: travelerInfo; Type: SCHEMA; Schema: -; Owner: stAdmins
--

CREATE SCHEMA "travelerInfo";


ALTER SCHEMA "travelerInfo" OWNER TO "stAdmins";

--
-- TOC entry 9 (class 2615 OID 16592)
-- Name: tripInfo; Type: SCHEMA; Schema: -; Owner: stAdmins
--

CREATE SCHEMA "tripInfo";


ALTER SCHEMA "tripInfo" OWNER TO "stAdmins";

--
-- TOC entry 201 (class 3079 OID 11935)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2239 (class 0 OID 0)
-- Dependencies: 201
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = configuration, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;


--
-- TOC entry 177 (class 1259 OID 16598)
-- Name: accountType; Type: TABLE; Schema: configuration; Owner: stAdmins; Tablespace: 
--

CREATE TABLE "accountType" (
    id smallserial NOT NULL,
    description character varying(50),
    "hasValidityPeriod" boolean,
    "from" timestamp without time zone,
    "to" timestamp without time zone,
    "order" smallint,
    image character varying(50),
    enabled boolean
);


ALTER TABLE "accountType" OWNER TO "stAdmins";

--
-- TOC entry 178 (class 1259 OID 16602)
-- Name: accountType_id_seq; Type: SEQUENCE; Schema: configuration; Owner: stAdmins
--

--CREATE SEQUENCE "accountType_id_seq"
--   START WITH 1
--    INCREMENT BY 1
--    NO MINVALUE
--    NO MAXVALUE
--    CACHE 1;


ALTER TABLE "accountType_id_seq" OWNER TO "stAdmins";

--
-- TOC entry 2240 (class 0 OID 0)
-- Dependencies: 178
-- Name: accountType_id_seq; Type: SEQUENCE OWNED BY; Schema: configuration; Owner: stAdmins
--

ALTER SEQUENCE "accountType_id_seq" OWNED BY "accountType".id;


--
-- TOC entry 179 (class 1259 OID 16604)
-- Name: deviceType; Type: TABLE; Schema: configuration; Owner: stAdmins; Tablespace: 
--

CREATE TABLE "deviceType" (
    id smallserial NOT NULL,
    description character varying(20),
    image character varying(50),
    enabled boolean

);


ALTER TABLE "deviceType" OWNER TO "stAdmins";

--
-- TOC entry 180 (class 1259 OID 16607)
-- Name: deviceType_id_seq; Type: SEQUENCE; Schema: configuration; Owner: stAdmins
--

--CREATE SEQUENCE "deviceType_id_seq"
--    START WITH 1
--    INCREMENT BY 1
--    NO MINVALUE
--    NO MAXVALUE
--    CACHE 1;


ALTER TABLE "deviceType_id_seq" OWNER TO "stAdmins";

--
-- TOC entry 2241 (class 0 OID 0)
-- Dependencies: 180
-- Name: deviceType_id_seq; Type: SEQUENCE OWNED BY; Schema: configuration; Owner: stAdmins
--

ALTER SEQUENCE "deviceType_id_seq" OWNED BY "deviceType".id;


--
-- TOC entry 181 (class 1259 OID 16609)
-- Name: eventType; Type: TABLE; Schema: configuration; Owner: stAdmins; Tablespace: 
--

CREATE TABLE "eventType" (
    id smallserial NOT NULL,
    description character varying(140),
    image character varying(100),
    enabled boolean

);


ALTER TABLE "eventType" OWNER TO "stAdmins";

--
-- TOC entry 182 (class 1259 OID 16612)
-- Name: eventType_id_seq; Type: SEQUENCE; Schema: configuration; Owner: stAdmins
--

--CREATE SEQUENCE "eventType_id_seq"
--    START WITH 1
--    INCREMENT BY 1
--    NO MINVALUE
--    NO MAXVALUE
--    CACHE 1;


ALTER TABLE "eventType_id_seq" OWNER TO "stAdmins";

--
-- TOC entry 2242 (class 0 OID 0)
-- Dependencies: 182
-- Name: eventType_id_seq; Type: SEQUENCE OWNED BY; Schema: configuration; Owner: stAdmins
--

ALTER SEQUENCE "eventType_id_seq" OWNED BY "eventType".id;


--
-- TOC entry 183 (class 1259 OID 16614)
-- Name: socialNetwork; Type: TABLE; Schema: configuration; Owner: stAdmins; Tablespace: 
--

CREATE TABLE "socialNetwork" (
    id smallserial NOT NULL,
    name character(50),
    "userIdFormat" character(100),
    enabled boolean
);


ALTER TABLE "socialNetwork" OWNER TO "stAdmins";

--
-- TOC entry 184 (class 1259 OID 16617)
-- Name: socialNetwork_id_seq; Type: SEQUENCE; Schema: configuration; Owner: stAdmins
--

--CREATE SEQUENCE "socialNetwork_id_seq"
--    START WITH 1
--    INCREMENT BY 1
--    NO MINVALUE
--    NO MAXVALUE
--    CACHE 1;


ALTER TABLE "socialNetwork_id_seq" OWNER TO "stAdmins";

--
-- TOC entry 2243 (class 0 OID 0)
-- Dependencies: 184
-- Name: socialNetwork_id_seq; Type: SEQUENCE OWNED BY; Schema: configuration; Owner: stAdmins
--

ALTER SEQUENCE "socialNetwork_id_seq" OWNED BY "socialNetwork".id;


--
-- TOC entry 185 (class 1259 OID 16619)
-- Name: status; Type: TABLE; Schema: configuration; Owner: stAdmins; Tablespace: 
--

CREATE TABLE status (
    id serial NOT NULL,
    "tableId" smallint,
    description character varying(50),
    "order" smallint,
    enabled boolean
);


ALTER TABLE status OWNER TO "stAdmins";

--
-- TOC entry 186 (class 1259 OID 16622)
-- Name: status_id_seq; Type: SEQUENCE; Schema: configuration; Owner: stAdmins
--

--CREATE SEQUENCE status_id_seq
--    START WITH 1
--    INCREMENT BY 1
--    NO MINVALUE
--    NO MAXVALUE
--    CACHE 1;


ALTER TABLE status_id_seq OWNER TO "stAdmins";

--
-- TOC entry 2244 (class 0 OID 0)
-- Dependencies: 186
-- Name: status_id_seq; Type: SEQUENCE OWNED BY; Schema: configuration; Owner: stAdmins
--

ALTER SEQUENCE status_id_seq OWNED BY status.id;


--
-- TOC entry 200 (class 1259 OID 24587)
-- Name: table; Type: TABLE; Schema: configuration; Owner: stAdmins; Tablespace: 
--

CREATE TABLE "table" (
    id smallserial NOT NULL,
    "tableName" character varying(50),
    enabled boolean

);


ALTER TABLE "table" OWNER TO "stAdmins";

--
-- TOC entry 199 (class 1259 OID 24585)
-- Name: table_id_seq; Type: SEQUENCE; Schema: configuration; Owner: stAdmins
--

--CREATE SEQUENCE table_id_seq
--    START WITH 1
--    INCREMENT BY 1
--    NO MINVALUE
--    NO MAXVALUE
--    CACHE 1;


ALTER TABLE table_id_seq OWNER TO "stAdmins";

--
-- TOC entry 2245 (class 0 OID 0)
-- Dependencies: 199
-- Name: table_id_seq; Type: SEQUENCE OWNED BY; Schema: configuration; Owner: stAdmins
--

ALTER SEQUENCE table_id_seq OWNED BY "table".id;


--
-- TOC entry 187 (class 1259 OID 16624)
-- Name: tripType; Type: TABLE; Schema: configuration; Owner: stAdmins; Tablespace: 
--

CREATE TABLE "tripType" (
    id smallserial NOT NULL,
    description character varying(20),
    image character varying(100),
    "timeToNextPosition" integer,
    enabled boolean

);


ALTER TABLE "tripType" OWNER TO "stAdmins";

--
-- TOC entry 188 (class 1259 OID 16627)
-- Name: tripType_id_seq; Type: SEQUENCE; Schema: configuration; Owner: stAdmins
--

--CREATE SEQUENCE "tripType_id_seq"
--    START WITH 1
--    INCREMENT BY 1
--    NO MINVALUE
--    NO MAXVALUE
--    CACHE 1;


ALTER TABLE "tripType_id_seq" OWNER TO "stAdmins";

--
-- TOC entry 2246 (class 0 OID 0)
-- Dependencies: 188
-- Name: tripType_id_seq; Type: SEQUENCE OWNED BY; Schema: configuration; Owner: stAdmins
--

ALTER SEQUENCE "tripType_id_seq" OWNED BY "tripType".id;


SET search_path = "travelerInfo", pg_catalog;
--
-- TOC entry 175 (class 1259 OID 16593)
-- Name: account; Type: TABLE; Schema: travelerInfo; Owner: stAdmins; Tablespace: 
--

CREATE TABLE account (
    id serial NOT NULL,
    "travelerId" integer,
    "accountTypeId" smallint,
    "firstName" character varying(50),
    "lastName" character varying(50),
    nick character varying(50),
    locale character varying(50),
    start timestamp without time zone,
    "end" timestamp without time zone,
    "statusId" integer
);


ALTER TABLE account OWNER TO "stAdmins";

--
-- TOC entry 176 (class 1259 OID 16596)
-- Name: account_id_seq; Type: SEQUENCE; Schema: travelerInfo; Owner: stAdmins
--

--CREATE SEQUENCE "account_id_seq"
--    START WITH 1
--    INCREMENT BY 1
--    NO MINVALUE
--    NO MAXVALUE
--    CACHE 1;


ALTER TABLE "account_id_seq" OWNER TO "stAdmins";

ALTER SEQUENCE "account_id_seq" OWNED BY account.id;

--
-- TOC entry 189 (class 1259 OID 16629)
-- Name: contact; Type: TABLE; Schema: travelerInfo; Owner: stAdmins; Tablespace: 
--

CREATE TABLE contact (
    id serial NOT NULL,
    "travelerId" integer,
    "socialNetworkId" smallint,
    "socialNetworkUserId" character(50),
    "statusId" integer
);


ALTER TABLE contact OWNER TO "stAdmins";

--
-- TOC entry 190 (class 1259 OID 16632)
-- Name: contact_id_seq; Type: SEQUENCE; Schema: travelerInfo; Owner: stAdmins
--

--CREATE SEQUENCE contact_id_seq
--    START WITH 1
--    INCREMENT BY 1
--    NO MINVALUE
--    NO MAXVALUE
--    CACHE 1;


ALTER TABLE contact_id_seq OWNER TO "stAdmins";

--
-- TOC entry 2247 (class 0 OID 0)
-- Dependencies: 190
-- Name: contac_id_seq; Type: SEQUENCE OWNED BY; Schema: travelerInfo; Owner: stAdmins
--

ALTER SEQUENCE contact_id_seq OWNED BY contact.id;

--
-- TOC entry 191 (class 1259 OID 16634)
-- Name: device; Type: TABLE; Schema: travelerInfo; Owner: stAdmins; Tablespace: 
--

CREATE TABLE device (
    id serial NOT NULL,
    "travelerId" integer, 
    nick character varying(10),
    "uniqueIdentifier" character varying(50),
    "deviceTypeId" smallint,
    "registrationDate" timestamp with time zone,
    "lastUpdate" timestamp without time zone,
    "statusId" integer
);


ALTER TABLE device OWNER TO "stAdmins";

--
-- TOC entry 192 (class 1259 OID 16637)
-- Name: device_id_seq; Type: SEQUENCE; Schema: travelerInfo; Owner: stAdmins
--

--CREATE SEQUENCE device_id_seq
--    START WITH 1
--    INCREMENT BY 1
--    NO MINVALUE
--    NO MAXVALUE
--    CACHE 1;


ALTER TABLE device_id_seq OWNER TO "stAdmins";

--
-- TOC entry 2248 (class 0 OID 0)
-- Dependencies: 192
-- Name: device_id_seq; Type: SEQUENCE OWNED BY; Schema: travelerInfo; Owner: stAdmins
--

ALTER SEQUENCE device_id_seq OWNED BY device.id;


--
-- TOC entry 193 (class 1259 OID 16639)
-- Name: traveler; Type: TABLE; Schema: travelerInfo; Owner: stAdmins; Tablespace: 
--

CREATE TABLE traveler (
    id serial NOT NULL,
    email character varying(50),
    pwd character varying(100)
);


ALTER TABLE traveler OWNER TO "stAdmins";

--
-- TOC entry 194 (class 1259 OID 16642)
-- Name: traveler_id_seq; Type: SEQUENCE; Schema: travelerInfo; Owner: stAdmins
--

--CREATE SEQUENCE traveler_id_seq
--   START WITH 1
--    INCREMENT BY 1
--    NO MINVALUE
--    NO MAXVALUE
--    CACHE 1;


ALTER TABLE traveler_id_seq OWNER TO "stAdmins";

--
-- TOC entry 2249 (class 0 OID 0)
-- Dependencies: 194
-- Name: traveler_id_seq; Type: SEQUENCE OWNED BY; Schema: travelerInfo; Owner: stAdmins
--

ALTER SEQUENCE traveler_id_seq OWNED BY traveler.id;


SET search_path = "tripInfo", pg_catalog;

--
-- TOC entry 195 (class 1259 OID 16644)
-- Name: event; Type: TABLE; Schema: tripInfo; Owner: stAdmins; Tablespace: 
--

CREATE TABLE event (
    id bigserial NOT NULL,
    "routeId" bigint,
    "eventTypeId" smallint,
    message character varying(140),
    image character varying(100),
    "statusId" integer
);


ALTER TABLE event OWNER TO "stAdmins";

--
-- TOC entry 196 (class 1259 OID 16647)
-- Name: route; Type: TABLE; Schema: tripInfo; Owner: stAdmins; Tablespace: 
--

CREATE TABLE route (
    id bigserial NOT NULL,
    "tripId" bigint,
    "deviceId" integer,
    "dateOnServer" timestamp with time zone,
    "dateOnDevice" timestamp with time zone,
    "deviceIp" inet,
    "position" point,
    "statusId" integer
);


ALTER TABLE route OWNER TO "stAdmins";

--
-- TOC entry 197 (class 1259 OID 16653)
-- Name: trip; Type: TABLE; Schema: tripInfo; Owner: stAdmins; Tablespace: 
--

CREATE TABLE trip (
    id bigserial NOT NULL,
    "travelerId" integer,
    "deviceId" integer,
    "tripTypeId" smallint,
    "serverStart" timestamp with time zone,
    "serverEnd" timestamp with time zone,
    "deviceStart" timestamp with time zone,
    "deviceEnd" timestamp with time zone,
    "deviceIpStart" inet,
    "deviceIpEnd" inet,
    "statusId" integer
);


ALTER TABLE trip OWNER TO "stAdmins";

--
-- TOC entry 198 (class 1259 OID 16659)
-- Name: trip_id_seq; Type: SEQUENCE; Schema: tripInfo; Owner: stAdmins
--

--CREATE SEQUENCE trip_id_seq
--    START WITH 1
--    INCREMENT BY 1
--    NO MINVALUE
--    NO MAXVALUE
--    CACHE 1;


ALTER TABLE trip_id_seq OWNER TO "stAdmins";

--
-- TOC entry 2250 (class 0 OID 0)
-- Dependencies: 198
-- Name: trip_id_seq; Type: SEQUENCE OWNED BY; Schema: tripInfo; Owner: stAdmins
--

ALTER SEQUENCE trip_id_seq OWNED BY trip.id;


SET search_path = configuration, pg_catalog;

--
-- TOC entry 2040 (class 2604 OID 16662)
-- Name: id; Type: DEFAULT; Schema: configuration; Owner: stAdmins
--

ALTER TABLE ONLY "accountType" ALTER COLUMN id SET DEFAULT nextval('"accountType_id_seq"'::regclass);

--
-- TOC entry 2040 (class 2604 OID 16662)
-- Name: id; Type: DEFAULT; Schema: configuration; Owner: stAdmins
--

ALTER TABLE ONLY "deviceType" ALTER COLUMN id SET DEFAULT nextval('"deviceType_id_seq"'::regclass);


--
-- TOC entry 2041 (class 2604 OID 16663)
-- Name: id; Type: DEFAULT; Schema: configuration; Owner: stAdmins
--

ALTER TABLE ONLY "eventType" ALTER COLUMN id SET DEFAULT nextval('"eventType_id_seq"'::regclass);


--
-- TOC entry 2042 (class 2604 OID 16664)
-- Name: id; Type: DEFAULT; Schema: configuration; Owner: stAdmins
--

ALTER TABLE ONLY "socialNetwork" ALTER COLUMN id SET DEFAULT nextval('"socialNetwork_id_seq"'::regclass);


--
-- TOC entry 2043 (class 2604 OID 16665)
-- Name: id; Type: DEFAULT; Schema: configuration; Owner: stAdmins
--

ALTER TABLE ONLY status ALTER COLUMN id SET DEFAULT nextval('status_id_seq'::regclass);


--
-- TOC entry 2049 (class 2604 OID 24590)
-- Name: id; Type: DEFAULT; Schema: configuration; Owner: stAdmins
--

ALTER TABLE ONLY "table" ALTER COLUMN id SET DEFAULT nextval('table_id_seq'::regclass);


--
-- TOC entry 2044 (class 2604 OID 16666)
-- Name: id; Type: DEFAULT; Schema: configuration; Owner: stAdmins
--

ALTER TABLE ONLY "tripType" ALTER COLUMN id SET DEFAULT nextval('"tripType_id_seq"'::regclass);


SET search_path = "travelerInfo", pg_catalog;

--
-- TOC entry 2038 (class 2604 OID 16661)
-- Name: id; Type: DEFAULT; Schema: travelerInfo; Owner: stAdmins
--

ALTER TABLE ONLY account ALTER COLUMN id SET DEFAULT nextval('account_id_seq'::regclass);



--
-- TOC entry 2045 (class 2604 OID 16667)
-- Name: id; Type: DEFAULT; Schema: travelerInfo; Owner: stAdmins
--

ALTER TABLE ONLY contact ALTER COLUMN id SET DEFAULT nextval('contact_id_seq'::regclass);


--
-- TOC entry 2046 (class 2604 OID 16668)
-- Name: id; Type: DEFAULT; Schema: travelerInfo; Owner: stAdmins
--

ALTER TABLE ONLY device ALTER COLUMN id SET DEFAULT nextval('device_id_seq'::regclass);


--
-- TOC entry 2047 (class 2604 OID 16669)
-- Name: id; Type: DEFAULT; Schema: travelerInfo; Owner: stAdmins
--

ALTER TABLE ONLY traveler ALTER COLUMN id SET DEFAULT nextval('traveler_id_seq'::regclass);


SET search_path = "tripInfo", pg_catalog;

--
-- TOC entry 2048 (class 2604 OID 16670)
-- Name: id; Type: DEFAULT; Schema: tripInfo; Owner: stAdmins
--

ALTER TABLE ONLY event ALTER COLUMN id SET DEFAULT nextval('event_id_seq'::regclass);

--
-- TOC entry 2048 (class 2604 OID 16670)
-- Name: id; Type: DEFAULT; Schema: tripInfo; Owner: stAdmins
--

ALTER TABLE ONLY route ALTER COLUMN id SET DEFAULT nextval('route_id_seq'::regclass);

--
-- TOC entry 2048 (class 2604 OID 16670)
-- Name: id; Type: DEFAULT; Schema: tripInfo; Owner: stAdmins
--

ALTER TABLE ONLY trip ALTER COLUMN id SET DEFAULT nextval('trip_id_seq'::regclass);


SET search_path = configuration, pg_catalog;

--
-- TOC entry 2204 (class 0 OID 16593)
-- Dependencies: 175
-- Data for Name: account; Type: TABLE DATA; Schema: configuration; Owner: stAdmins
--

--COPY account (id, "travelerId", "accountTypeId", "firstName", "lastName", nick, locale, start, "end", "statusId") FROM stdin;
--\.


--
-- TOC entry 2206 (class 0 OID 16598)
-- Dependencies: 177
-- Data for Name: accountType; Type: TABLE DATA; Schema: configuration; Owner: stAdmins
--

--COPY "accountType" (id, description, "hasValidityPeriod", "from", "to", "order", image, enabled) FROM stdin;
--1 standard    \N  \N  \N  1   \N  \N
--\.


--
-- TOC entry 2251 (class 0 OID 0)
-- Dependencies: 176
-- Name: accountType_id_seq; Type: SEQUENCE SET; Schema: configuration; Owner: stAdmins
--

SELECT pg_catalog.setval('"accountType_id_seq"', 1, true);




--
-- TOC entry 2208 (class 0 OID 16604)
-- Dependencies: 179
-- Data for Name: deviceType; Type: TABLE DATA; Schema: configuration; Owner: stAdmins
--

--COPY "deviceType" (id, description, image) FROM stdin;
--\.


--
-- TOC entry 2253 (class 0 OID 0)
-- Dependencies: 180
-- Name: deviceType_id_seq; Type: SEQUENCE SET; Schema: configuration; Owner: stAdmins
--

SELECT pg_catalog.setval('"deviceType_id_seq"', 1, false);


--
-- TOC entry 2210 (class 0 OID 16609)
-- Dependencies: 181
-- Data for Name: eventType; Type: TABLE DATA; Schema: configuration; Owner: stAdmins
--

--COPY "eventType" (id, description, image) FROM stdin;
--\.


--
-- TOC entry 2254 (class 0 OID 0)
-- Dependencies: 182
-- Name: eventType_id_seq; Type: SEQUENCE SET; Schema: configuration; Owner: stAdmins
--

SELECT pg_catalog.setval('"eventType_id_seq"', 1, false);


--
-- TOC entry 2212 (class 0 OID 16614)
-- Dependencies: 183
-- Data for Name: socialNetwork; Type: TABLE DATA; Schema: configuration; Owner: stAdmins
--

--COPY "socialNetwork" (id, name, "userIdFormat", "statusId") FROM stdin;
--1 Facebook                                            ##@##                                                                                                   1
--\.


--
-- TOC entry 2255 (class 0 OID 0)
-- Dependencies: 184
-- Name: socialNetwork_id_seq; Type: SEQUENCE SET; Schema: configuration; Owner: stAdmins
--

SELECT pg_catalog.setval('"socialNetwork_id_seq"', 1, true);


--
-- TOC entry 2214 (class 0 OID 16619)
-- Dependencies: 185
-- Data for Name: status; Type: TABLE DATA; Schema: configuration; Owner: stAdmins
--

--COPY status (id, "tableName", description, "order", enabled, "tableId") FROM stdin;
--\.


--
-- TOC entry 2256 (class 0 OID 0)
-- Dependencies: 186
-- Name: status_id_seq; Type: SEQUENCE SET; Schema: configuration; Owner: stAdmins
--

SELECT pg_catalog.setval('status_id_seq', 1, true);


--
-- TOC entry 2229 (class 0 OID 24587)
-- Dependencies: 200
-- Data for Name: table; Type: TABLE DATA; Schema: configuration; Owner: stAdmins
--

--COPY "table" (id, "tableName") FROM stdin;
--\.


--
-- TOC entry 2257 (class 0 OID 0)
-- Dependencies: 199
-- Name: table_id_seq; Type: SEQUENCE SET; Schema: configuration; Owner: stAdmins
--

SELECT pg_catalog.setval('table_id_seq', 1, false);


--
-- TOC entry 2216 (class 0 OID 16624)
-- Dependencies: 187
-- Data for Name: tripType; Type: TABLE DATA; Schema: configuration; Owner: stAdmins
--

--COPY "tripType" (id, description, image, "timeToNextPosition", "statusId") FROM stdin;
--\.


--
-- TOC entry 2258 (class 0 OID 0)
-- Dependencies: 188
-- Name: tripType_id_seq; Type: SEQUENCE SET; Schema: configuration; Owner: stAdmins
--

SELECT pg_catalog.setval('"tripType_id_seq"', 1, false);


SET search_path = "travelerInfo", pg_catalog;

--
-- TOC entry 2252 (class 0 OID 0)
-- Dependencies: 178
-- Name: account_id_seq; Type: SEQUENCE SET; Schema: travelerInfo; Owner: stAdmins
--

SELECT pg_catalog.setval('account_id_seq', 1, false);

--
-- TOC entry 2259 (class 0 OID 0)
-- Dependencies: 190
-- Name: contac_id_seq; Type: SEQUENCE SET; Schema: travelerInfo; Owner: stAdmins
--

SELECT pg_catalog.setval('contact_id_seq', 1, false);


--
-- TOC entry 2218 (class 0 OID 16629)
-- Dependencies: 189
-- Data for Name: contact; Type: TABLE DATA; Schema: travelerInfo; Owner: stAdmins
--

--COPY contact (id, "travelerId", "socialNetworkId", "socialNetworkUserId", "statusId") FROM stdin;
--\.


--
-- TOC entry 2220 (class 0 OID 16634)
-- Dependencies: 191
-- Data for Name: device; Type: TABLE DATA; Schema: travelerInfo; Owner: stAdmins
--

--COPY device (id, nick, "uniqueIdentifier", "deviceTypeId", "registrationDate", "lastUpdate", "statusId") FROM stdin;
--\.


--
-- TOC entry 2260 (class 0 OID 0)
-- Dependencies: 192
-- Name: device_id_seq; Type: SEQUENCE SET; Schema: travelerInfo; Owner: stAdmins
--

SELECT pg_catalog.setval('device_id_seq', 1, false);


--
-- TOC entry 2222 (class 0 OID 16639)
-- Dependencies: 193
-- Data for Name: traveler; Type: TABLE DATA; Schema: travelerInfo; Owner: stAdmins
--

--COPY traveler (id, email, pwd) FROM stdin;
--\.


--
-- TOC entry 2261 (class 0 OID 0)
-- Dependencies: 194
-- Name: traveler_id_seq; Type: SEQUENCE SET; Schema: travelerInfo; Owner: stAdmins
--

SELECT pg_catalog.setval('traveler_id_seq', 1, false);


SET search_path = "tripInfo", pg_catalog;

--
-- TOC entry 2224 (class 0 OID 16644)
-- Dependencies: 195
-- Data for Name: event; Type: TABLE DATA; Schema: tripInfo; Owner: stAdmins
--

--COPY event (id, "routeId", "eventTypeId", message, image, "statusId") FROM stdin;
--\.


--
-- TOC entry 2225 (class 0 OID 16647)
-- Dependencies: 196
-- Data for Name: route; Type: TABLE DATA; Schema: tripInfo; Owner: stAdmins
--

--COPY route (id, "tripId", "deviceId", "dateOnServer", "dateOnDevice", "deviceIp", "position") FROM stdin;
--\.


--
-- TOC entry 2226 (class 0 OID 16653)
-- Dependencies: 197
-- Data for Name: trip; Type: TABLE DATA; Schema: tripInfo; Owner: stAdmins
--

--COPY trip (id, "travelerId", "deviceId", "tripTypeId", "serverStart", "serverEnd", "deviceStart", "deviceEnd", "deviceIpStart", "deviceIpEnd", "statusId") FROM stdin;
--\.


--
-- TOC entry 2262 (class 0 OID 0)
-- Dependencies: 198
-- Name: trip_id_seq; Type: SEQUENCE SET; Schema: tripInfo; Owner: stAdmins
--
SELECT pg_catalog.setval('event_id_seq', 1, false);
SELECT pg_catalog.setval('route_id_seq', 1, false);

SELECT pg_catalog.setval('trip_id_seq', 1, false);


SET search_path = configuration, pg_catalog;

--
-- TOC entry 2053 (class 2606 OID 16672)
-- Name: pk_accountType; Type: CONSTRAINT; Schema: configuration; Owner: stAdmins; Tablespace: 
--

ALTER TABLE ONLY "accountType"
    ADD CONSTRAINT "pk_accountType" PRIMARY KEY (id);




--
-- TOC entry 2055 (class 2606 OID 16676)
-- Name: pk_deviceType; Type: CONSTRAINT; Schema: configuration; Owner: stAdmins; Tablespace: 
--

ALTER TABLE ONLY "deviceType"
    ADD CONSTRAINT "pk_deviceType" PRIMARY KEY (id);


--
-- TOC entry 2057 (class 2606 OID 16678)
-- Name: pk_eventType; Type: CONSTRAINT; Schema: configuration; Owner: stAdmins; Tablespace: 
--

ALTER TABLE ONLY "eventType"
    ADD CONSTRAINT "pk_eventType" PRIMARY KEY (id);


--
-- TOC entry 2059 (class 2606 OID 16680)
-- Name: pk_socialNetwork; Type: CONSTRAINT; Schema: configuration; Owner: stAdmins; Tablespace: 
--

ALTER TABLE ONLY "socialNetwork"
    ADD CONSTRAINT "pk_socialNetwork" PRIMARY KEY (id);


--
-- TOC entry 2061 (class 2606 OID 16682)
-- Name: pk_status; Type: CONSTRAINT; Schema: configuration; Owner: stAdmins; Tablespace: 
--

ALTER TABLE ONLY status
    ADD CONSTRAINT pk_status PRIMARY KEY (id);


--
-- TOC entry 2077 (class 2606 OID 24592)
-- Name: pk_table; Type: CONSTRAINT; Schema: configuration; Owner: stAdmins; Tablespace: 
--

ALTER TABLE ONLY "table"
    ADD CONSTRAINT pk_table PRIMARY KEY (id);


--
-- TOC entry 2063 (class 2606 OID 16684)
-- Name: pk_tripType; Type: CONSTRAINT; Schema: configuration; Owner: stAdmins; Tablespace: 
--

ALTER TABLE ONLY "tripType"
    ADD CONSTRAINT "pk_tripType" PRIMARY KEY (id);


SET search_path = "travelerInfo", pg_catalog;

--
-- TOC entry 2051 (class 2606 OID 16674)
-- Name: pk_conf; Type: CONSTRAINT; Schema: travelerInfo; Owner: stAdmins; Tablespace: 
--

ALTER TABLE ONLY account
    ADD CONSTRAINT pk_account PRIMARY KEY (id);

--
-- TOC entry 2065 (class 2606 OID 16686)
-- Name: pk_contact; Type: CONSTRAINT; Schema: travelerInfo; Owner: stAdmins; Tablespace: 
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT pk_contact PRIMARY KEY (id);


--
-- TOC entry 2067 (class 2606 OID 16688)
-- Name: pk_device; Type: CONSTRAINT; Schema: travelerInfo; Owner: stAdmins; Tablespace: 
--

ALTER TABLE ONLY device
    ADD CONSTRAINT pk_device PRIMARY KEY (id);


--
-- TOC entry 2069 (class 2606 OID 16690)
-- Name: pk_traveler; Type: CONSTRAINT; Schema: travelerInfo; Owner: stAdmins; Tablespace: 
--

ALTER TABLE ONLY traveler
    ADD CONSTRAINT pk_traveler PRIMARY KEY (id);


SET search_path = "tripInfo", pg_catalog;

--
-- TOC entry 2071 (class 2606 OID 16692)
-- Name: pk_event; Type: CONSTRAINT; Schema: tripInfo; Owner: stAdmins; Tablespace: 
--

ALTER TABLE ONLY event
    ADD CONSTRAINT pk_event PRIMARY KEY (id);


--
-- TOC entry 2073 (class 2606 OID 16694)
-- Name: pk_route; Type: CONSTRAINT; Schema: tripInfo; Owner: stAdmins; Tablespace: 
--

ALTER TABLE ONLY route
    ADD CONSTRAINT pk_route PRIMARY KEY (id);


--
-- TOC entry 2075 (class 2606 OID 16696)
-- Name: pk_trip; Type: CONSTRAINT; Schema: tripInfo; Owner: stAdmins; Tablespace: 
--

ALTER TABLE ONLY trip
    ADD CONSTRAINT pk_trip PRIMARY KEY (id);


SET search_path = configuration, pg_catalog;


--
-- TOC entry 2081 (class 2606 OID 24610)
-- Name: fk_status_table; Type: FK CONSTRAINT; Schema: configuration; Owner: stAdmins
--

ALTER TABLE ONLY status
    ADD CONSTRAINT fk_status_table FOREIGN KEY ("tableId") REFERENCES "table"(id);


SET search_path = "travelerInfo", pg_catalog;


--
-- TOC entry 2078 (class 2606 OID 16697)
-- Name: fk_account_accountType; Type: FK CONSTRAINT; Schema: travelerInfo; Owner: stAdmins
--

ALTER TABLE ONLY account
    ADD CONSTRAINT "fk_account_accountType" FOREIGN KEY ("accountTypeId") REFERENCES configuration."accountType"(id);


--
-- TOC entry 2079 (class 2606 OID 16702)
-- Name: fk_account_status; Type: FK CONSTRAINT; Schema: travelerInfo; Owner: stAdmins
--

ALTER TABLE ONLY account
    ADD CONSTRAINT fk_account_status FOREIGN KEY ("statusId") REFERENCES configuration.status(id);


--
-- TOC entry 2080 (class 2606 OID 16707)
-- Name: fk_account_traveler; Type: FK CONSTRAINT; Schema: travelerInfo; Owner: stAdmins
--

ALTER TABLE ONLY account
    ADD CONSTRAINT fk_account_traveler FOREIGN KEY ("travelerId") REFERENCES "travelerInfo".traveler(id);


--
-- TOC entry 2080 (class 2606 OID 16707)
-- Name: fk_contact_traveler; Type: FK CONSTRAINT; Schema: travelerInfo; Owner: stAdmins
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT fk_contact_traveler FOREIGN KEY ("travelerId") REFERENCES "travelerInfo".traveler(id);

--
-- TOC entry 2080 (class 2606 OID 16707)
-- Name: fk_contact_socialNetwork; Type: FK CONSTRAINT; Schema: travelerInfo; Owner: stAdmins
--
ALTER TABLE ONLY contact
    ADD CONSTRAINT "fk_contact_socialNetwork" FOREIGN KEY ("socialNetworkId") REFERENCES configuration."socialNetwork"(id);
--
-- TOC entry 2079 (class 2606 OID 16702)
-- Name: fk_contact_status; Type: FK CONSTRAINT; Schema: travelerInfo; Owner: stAdmins
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT fk_contact_status FOREIGN KEY ("statusId") REFERENCES configuration.status(id);

--
-- TOC entry 2084 (class 2606 OID 16722)
-- Name: fk_device_traveler; Type: FK CONSTRAINT; Schema: travelerInfo; Owner: stAdmins
--

ALTER TABLE ONLY device
    ADD CONSTRAINT "fk_device_traveler" FOREIGN KEY ("travelerId") REFERENCES "travelerInfo"."traveler"(id);

--
-- TOC entry 2084 (class 2606 OID 16722)
-- Name: fk_device_deviceType; Type: FK CONSTRAINT; Schema: travelerInfo; Owner: stAdmins
--

ALTER TABLE ONLY device
    ADD CONSTRAINT "fk_device_deviceType" FOREIGN KEY ("deviceTypeId") REFERENCES configuration."deviceType"(id);


--
-- TOC entry 2085 (class 2606 OID 16727)
-- Name: fk_device_status; Type: FK CONSTRAINT; Schema: travelerInfo; Owner: stAdmins
--

ALTER TABLE ONLY device
    ADD CONSTRAINT fk_device_status FOREIGN KEY ("statusId") REFERENCES configuration.status(id);


SET search_path = "tripInfo", pg_catalog;

--
-- TOC entry 2086 (class 2606 OID 16732)
-- Name: fk_event_eventType; Type: FK CONSTRAINT; Schema: tripInfo; Owner: stAdmins
--

ALTER TABLE ONLY event
    ADD CONSTRAINT "fk_event_eventType" FOREIGN KEY ("eventTypeId") REFERENCES configuration."eventType"(id);


--
-- TOC entry 2087 (class 2606 OID 16737)
-- Name: fk_event_route; Type: FK CONSTRAINT; Schema: tripInfo; Owner: stAdmins
--

ALTER TABLE ONLY event
    ADD CONSTRAINT fk_event_route FOREIGN KEY ("routeId") REFERENCES route(id);

--
-- TOC entry 2085 (class 2606 OID 16727)
-- Name: fk_event_status; Type: FK CONSTRAINT; Schema: travelerInfo; Owner: stAdmins
--

ALTER TABLE ONLY event
    ADD CONSTRAINT fk_event_status FOREIGN KEY ("statusId") REFERENCES configuration.status(id);



--
-- TOC entry 2089 (class 2606 OID 16747)
-- Name: fk_route_device; Type: FK CONSTRAINT; Schema: tripInfo; Owner: stAdmins
--

ALTER TABLE ONLY route
    ADD CONSTRAINT fk_route_device FOREIGN KEY ("deviceId") REFERENCES "travelerInfo".device(id);


--
-- TOC entry 2090 (class 2606 OID 16752)
-- Name: fk_route_trip; Type: FK CONSTRAINT; Schema: tripInfo; Owner: stAdmins
--

ALTER TABLE ONLY route
    ADD CONSTRAINT fk_route_trip FOREIGN KEY ("tripId") REFERENCES trip(id);

--
-- TOC entry 2085 (class 2606 OID 16727)
-- Name: fk_route_status; Type: FK CONSTRAINT; Schema: travelerInfo; Owner: stAdmins
--

ALTER TABLE ONLY route
    ADD CONSTRAINT fk_route_status FOREIGN KEY ("statusId") REFERENCES configuration.status(id);

--
-- TOC entry 2091 (class 2606 OID 16757)
-- Name: fk_trip_device; Type: FK CONSTRAINT; Schema: tripInfo; Owner: stAdmins
--

ALTER TABLE ONLY trip
    ADD CONSTRAINT fk_trip_device FOREIGN KEY ("deviceId") REFERENCES "travelerInfo".device(id);


--
-- TOC entry 2092 (class 2606 OID 16762)
-- Name: fk_trip_status; Type: FK CONSTRAINT; Schema: tripInfo; Owner: stAdmins
--

ALTER TABLE ONLY trip
    ADD CONSTRAINT fk_trip_status FOREIGN KEY ("statusId") REFERENCES configuration.status(id);


--
-- TOC entry 2093 (class 2606 OID 16767)
-- Name: fk_trip_traveler; Type: FK CONSTRAINT; Schema: tripInfo; Owner: stAdmins
--

ALTER TABLE ONLY trip
    ADD CONSTRAINT fk_trip_traveler FOREIGN KEY ("travelerId") REFERENCES "travelerInfo".traveler(id);


--
-- TOC entry 2094 (class 2606 OID 16772)
-- Name: fk_trip_tripType; Type: FK CONSTRAINT; Schema: tripInfo; Owner: stAdmins
--

ALTER TABLE ONLY trip
    ADD CONSTRAINT "fk_trip_tripType" FOREIGN KEY ("tripTypeId") REFERENCES configuration."tripType"(id);


--
-- TOC entry 2235 (class 0 OID 0)
-- Dependencies: 7
-- Name: configuration; Type: ACL; Schema: -; Owner: stAdmins
--

REVOKE ALL ON SCHEMA configuration FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA configuration FROM "stAdmins";
GRANT ALL ON SCHEMA configuration TO "stAdmins";


--
-- TOC entry 2237 (class 0 OID 0)
-- Dependencies: 8
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- TOC entry 2238 (class 0 OID 0)
-- Dependencies: 9
-- Name: tripInfo; Type: ACL; Schema: -; Owner: stAdmins
--

REVOKE ALL ON SCHEMA "tripInfo" FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA "tripInfo" FROM "stAdmins";
GRANT ALL ON SCHEMA "tripInfo" TO "stAdmins";


-- Completed on 2015-10-27 16:22:59 ECT

--
-- PostgreSQL database dump complete
--

