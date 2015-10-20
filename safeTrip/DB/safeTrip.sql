--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-09-09 13:45:22 ECT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 7 (class 2615 OID 16424)
-- Name: configuration; Type: SCHEMA; Schema: -; Owner: "stAdmins"
--

CREATE SCHEMA configuration;


ALTER SCHEMA configuration OWNER TO "stAdmins";

--
-- TOC entry 9 (class 2615 OID 16435)
-- Name: travelerInfo; Type: SCHEMA; Schema: -; Owner: "stAdmins"
--

CREATE SCHEMA "travelerInfo";


ALTER SCHEMA "travelerInfo" OWNER TO "stAdmins";

--
-- TOC entry 8 (class 2615 OID 16425)
-- Name: tripInfo; Type: SCHEMA; Schema: -; Owner: "stAdmins"
--

CREATE SCHEMA "tripInfo";


ALTER SCHEMA "tripInfo" OWNER TO "stAdmins";

--
-- TOC entry 197 (class 3079 OID 11829)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2167 (class 0 OID 0)
-- Dependencies: 197
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = configuration, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 179 (class 1259 OID 16612)
-- Name: account; Type: TABLE; Schema: configuration; Owner: "stAdmins"; Tablespace: 
--

CREATE TABLE account (
    id integer NOT NULL,
    "travelerId" integer,
    "accountTypeId" integer,
    "firstName" character varying(50),
    "lastName" character varying(50),
    nick character varying(50),
    locale character varying(50),
    start timestamp without time zone,
    "end" timestamp without time zone,
    "statusId" integer
);


ALTER TABLE configuration.account OWNER TO "stAdmins";

--
-- TOC entry 173 (class 1259 OID 16505)
-- Name: accountType_id_seq; Type: SEQUENCE; Schema: configuration; Owner: postgres
--

CREATE SEQUENCE "accountType_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE configuration."accountType_id_seq" OWNER TO "stAdmins";

--
-- TOC entry 182 (class 1259 OID 16658)
-- Name: accountType; Type: TABLE; Schema: configuration; Owner: "stAdmins"; Tablespace: 
--

CREATE TABLE "accountType" (
    id integer DEFAULT nextval('"accountType_id_seq"'::regclass) NOT NULL,
    description character varying(50),
    "hasValidityPeriod" boolean,
    "from" timestamp without time zone,
    "to" timestamp without time zone,
    "order" smallint,
    image character varying(50),
    enabled boolean
);


ALTER TABLE configuration."accountType" OWNER TO "stAdmins";

--
-- TOC entry 178 (class 1259 OID 16610)
-- Name: account_id_seq; Type: SEQUENCE; Schema: configuration; Owner: "stAdmins"
--

CREATE SEQUENCE account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE configuration.account_id_seq OWNER TO "stAdmins";

--
-- TOC entry 2168 (class 0 OID 0)
-- Dependencies: 178
-- Name: account_id_seq; Type: SEQUENCE OWNED BY; Schema: configuration; Owner: "stAdmins"
--

ALTER SEQUENCE account_id_seq OWNED BY account.id;


--
-- TOC entry 181 (class 1259 OID 16652)
-- Name: deviceType; Type: TABLE; Schema: configuration; Owner: "stAdmins"; Tablespace: 
--

CREATE TABLE "deviceType" (
    id smallint NOT NULL,
    description character varying(20),
    image character varying(50)
);


ALTER TABLE configuration."deviceType" OWNER TO "stAdmins";

--
-- TOC entry 180 (class 1259 OID 16650)
-- Name: deviceType_id_seq; Type: SEQUENCE; Schema: configuration; Owner: "stAdmins"
--

CREATE SEQUENCE "deviceType_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE configuration."deviceType_id_seq" OWNER TO "stAdmins";

--
-- TOC entry 2169 (class 0 OID 0)
-- Dependencies: 180
-- Name: deviceType_id_seq; Type: SEQUENCE OWNED BY; Schema: configuration; Owner: "stAdmins"
--

ALTER SEQUENCE "deviceType_id_seq" OWNED BY "deviceType".id;


--
-- TOC entry 184 (class 1259 OID 16795)
-- Name: eventType; Type: TABLE; Schema: configuration; Owner: "stAdmins"; Tablespace: 
--

CREATE TABLE "eventType" (
    id smallint NOT NULL,
    description character varying(140),
    image character varying(100)
);


ALTER TABLE configuration."eventType" OWNER TO "stAdmins";

--
-- TOC entry 183 (class 1259 OID 16793)
-- Name: eventType_id_seq; Type: SEQUENCE; Schema: configuration; Owner: "stAdmins"
--

CREATE SEQUENCE "eventType_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE configuration."eventType_id_seq" OWNER TO "stAdmins";

--
-- TOC entry 2170 (class 0 OID 0)
-- Dependencies: 183
-- Name: eventType_id_seq; Type: SEQUENCE OWNED BY; Schema: configuration; Owner: "stAdmins"
--

ALTER SEQUENCE "eventType_id_seq" OWNED BY "eventType".id;


--
-- TOC entry 196 (class 1259 OID 17007)
-- Name: socialNetwork; Type: TABLE; Schema: configuration; Owner: "stAdmins"; Tablespace: 
--

CREATE TABLE "socialNetwork" (
    id smallint NOT NULL,
    name character(50),
    "userIdFormat" character(100),
    "statusId" integer
);


ALTER TABLE configuration."socialNetwork" OWNER TO "stAdmins";

--
-- TOC entry 195 (class 1259 OID 17005)
-- Name: socialNetwork_id_seq; Type: SEQUENCE; Schema: configuration; Owner: "stAdmins"
--

CREATE SEQUENCE "socialNetwork_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE configuration."socialNetwork_id_seq" OWNER TO "stAdmins";

--
-- TOC entry 2171 (class 0 OID 0)
-- Dependencies: 195
-- Name: socialNetwork_id_seq; Type: SEQUENCE OWNED BY; Schema: configuration; Owner: "stAdmins"
--

ALTER SEQUENCE "socialNetwork_id_seq" OWNED BY "socialNetwork".id;


--
-- TOC entry 174 (class 1259 OID 16525)
-- Name: status; Type: TABLE; Schema: configuration; Owner: "stAdmins"; Tablespace: 
--

CREATE TABLE status (
    id integer NOT NULL,
    "tableName" character varying(50),
    description character varying(50),
    "order" smallint,
    enabled boolean
);


ALTER TABLE configuration.status OWNER TO "stAdmins";

--
-- TOC entry 175 (class 1259 OID 16528)
-- Name: status_id_seq; Type: SEQUENCE; Schema: configuration; Owner: "stAdmins"
--

CREATE SEQUENCE status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE configuration.status_id_seq OWNER TO "stAdmins";

--
-- TOC entry 2172 (class 0 OID 0)
-- Dependencies: 175
-- Name: status_id_seq; Type: SEQUENCE OWNED BY; Schema: configuration; Owner: "stAdmins"
--

ALTER SEQUENCE status_id_seq OWNED BY status.id;


--
-- TOC entry 186 (class 1259 OID 16820)
-- Name: tripType; Type: TABLE; Schema: configuration; Owner: "stAdmins"; Tablespace: 
--

CREATE TABLE "tripType" (
    id smallint NOT NULL,
    description character varying(20),
    image character varying(100),
    "timeToNextPosition" integer,
    "statusId" integer
);


ALTER TABLE configuration."tripType" OWNER TO "stAdmins";

--
-- TOC entry 185 (class 1259 OID 16818)
-- Name: tripType_id_seq; Type: SEQUENCE; Schema: configuration; Owner: "stAdmins"
--

CREATE SEQUENCE "tripType_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE configuration."tripType_id_seq" OWNER TO "stAdmins";

--
-- TOC entry 2173 (class 0 OID 0)
-- Dependencies: 185
-- Name: tripType_id_seq; Type: SEQUENCE OWNED BY; Schema: configuration; Owner: "stAdmins"
--

ALTER SEQUENCE "tripType_id_seq" OWNED BY "tripType".id;


SET search_path = "travelerInfo", pg_catalog;

--
-- TOC entry 194 (class 1259 OID 16997)
-- Name: contact; Type: TABLE; Schema: travelerInfo; Owner: "stAdmins"; Tablespace: 
--

CREATE TABLE contact (
    id integer NOT NULL,
    "travelerId" integer,
    "socialNetworkId" integer,
    "socialNetworkUserId" character(50),
    "statusId" integer
);


ALTER TABLE "travelerInfo".contact OWNER TO "stAdmins";

--
-- TOC entry 193 (class 1259 OID 16995)
-- Name: contac_id_seq; Type: SEQUENCE; Schema: travelerInfo; Owner: "stAdmins"
--

CREATE SEQUENCE contac_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "travelerInfo".contac_id_seq OWNER TO "stAdmins";

--
-- TOC entry 2174 (class 0 OID 0)
-- Dependencies: 193
-- Name: contac_id_seq; Type: SEQUENCE OWNED BY; Schema: travelerInfo; Owner: "stAdmins"
--

ALTER SEQUENCE contac_id_seq OWNED BY contact.id;


--
-- TOC entry 188 (class 1259 OID 16909)
-- Name: device; Type: TABLE; Schema: travelerInfo; Owner: "stAdmins"; Tablespace: 
--

CREATE TABLE device (
    id integer NOT NULL,
    nick character varying(10),
    "uniqueIdentifier" character varying(50),
    "deviceTypeId" integer,
    "registrationDate" timestamp with time zone,
    "lastUpdate" timestamp without time zone,
    "statusId" integer
);


ALTER TABLE "travelerInfo".device OWNER TO "stAdmins";

--
-- TOC entry 187 (class 1259 OID 16907)
-- Name: device_id_seq; Type: SEQUENCE; Schema: travelerInfo; Owner: "stAdmins"
--

CREATE SEQUENCE device_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "travelerInfo".device_id_seq OWNER TO "stAdmins";

--
-- TOC entry 2175 (class 0 OID 0)
-- Dependencies: 187
-- Name: device_id_seq; Type: SEQUENCE OWNED BY; Schema: travelerInfo; Owner: "stAdmins"
--

ALTER SEQUENCE device_id_seq OWNED BY device.id;


--
-- TOC entry 177 (class 1259 OID 16542)
-- Name: traveler; Type: TABLE; Schema: travelerInfo; Owner: "stAdmins"; Tablespace: 
--

CREATE TABLE traveler (
    id integer NOT NULL,
    email character varying(50),
    pwd character varying(20)
);


ALTER TABLE "travelerInfo".traveler OWNER TO "stAdmins";

--
-- TOC entry 176 (class 1259 OID 16540)
-- Name: traveler_id_seq; Type: SEQUENCE; Schema: travelerInfo; Owner: "stAdmins"
--

CREATE SEQUENCE traveler_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "travelerInfo".traveler_id_seq OWNER TO "stAdmins";

--
-- TOC entry 2176 (class 0 OID 0)
-- Dependencies: 176
-- Name: traveler_id_seq; Type: SEQUENCE OWNED BY; Schema: travelerInfo; Owner: "stAdmins"
--

ALTER SEQUENCE traveler_id_seq OWNED BY traveler.id;


SET search_path = "tripInfo", pg_catalog;

--
-- TOC entry 192 (class 1259 OID 16974)
-- Name: event; Type: TABLE; Schema: tripInfo; Owner: "stAdmins"; Tablespace: 
--

CREATE TABLE event (
    id bigint NOT NULL,
    "routeId" bigint,
    "eventTypeId" integer,
    message character varying(140),
    image character varying(100),
    "statusId" integer
);


ALTER TABLE "tripInfo".event OWNER TO "stAdmins";

--
-- TOC entry 191 (class 1259 OID 16956)
-- Name: route; Type: TABLE; Schema: tripInfo; Owner: "stAdmins"; Tablespace: 
--

CREATE TABLE route (
    id bigint NOT NULL,
    "tripId" bigint,
    "deviceId" integer,
    "dateOnServer" timestamp with time zone,
    "dateOnDevice" timestamp with time zone,
    "deviceIp" inet,
    "position" point
);


ALTER TABLE "tripInfo".route OWNER TO "stAdmins";

--
-- TOC entry 190 (class 1259 OID 16927)
-- Name: trip; Type: TABLE; Schema: tripInfo; Owner: "stAdmins"; Tablespace: 
--

CREATE TABLE trip (
    id bigint NOT NULL,
    "travelerId" integer,
    "deviceId" integer,
    "tripTypeId" integer,
    "serverStart" timestamp with time zone,
    "serverEnd" timestamp with time zone,
    "deviceStart" timestamp with time zone,
    "deviceEnd" timestamp with time zone,
    "deviceIpStart" inet,
    "deviceIpEnd" inet,
    "statusId" integer
);


ALTER TABLE "tripInfo".trip OWNER TO "stAdmins";

--
-- TOC entry 189 (class 1259 OID 16925)
-- Name: trip_id_seq; Type: SEQUENCE; Schema: tripInfo; Owner: "stAdmins"
--

CREATE SEQUENCE trip_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "tripInfo".trip_id_seq OWNER TO "stAdmins";

--
-- TOC entry 2177 (class 0 OID 0)
-- Dependencies: 189
-- Name: trip_id_seq; Type: SEQUENCE OWNED BY; Schema: tripInfo; Owner: "stAdmins"
--

ALTER SEQUENCE trip_id_seq OWNED BY trip.id;


SET search_path = configuration, pg_catalog;

--
-- TOC entry 1976 (class 2604 OID 16615)
-- Name: id; Type: DEFAULT; Schema: configuration; Owner: "stAdmins"
--

ALTER TABLE ONLY account ALTER COLUMN id SET DEFAULT nextval('account_id_seq'::regclass);


--
-- TOC entry 1977 (class 2604 OID 16655)
-- Name: id; Type: DEFAULT; Schema: configuration; Owner: "stAdmins"
--

ALTER TABLE ONLY "deviceType" ALTER COLUMN id SET DEFAULT nextval('"deviceType_id_seq"'::regclass);


--
-- TOC entry 1979 (class 2604 OID 16798)
-- Name: id; Type: DEFAULT; Schema: configuration; Owner: "stAdmins"
--

ALTER TABLE ONLY "eventType" ALTER COLUMN id SET DEFAULT nextval('"eventType_id_seq"'::regclass);


--
-- TOC entry 1984 (class 2604 OID 17010)
-- Name: id; Type: DEFAULT; Schema: configuration; Owner: "stAdmins"
--

ALTER TABLE ONLY "socialNetwork" ALTER COLUMN id SET DEFAULT nextval('"socialNetwork_id_seq"'::regclass);


--
-- TOC entry 1974 (class 2604 OID 16530)
-- Name: id; Type: DEFAULT; Schema: configuration; Owner: "stAdmins"
--

ALTER TABLE ONLY status ALTER COLUMN id SET DEFAULT nextval('status_id_seq'::regclass);


--
-- TOC entry 1980 (class 2604 OID 16823)
-- Name: id; Type: DEFAULT; Schema: configuration; Owner: "stAdmins"
--

ALTER TABLE ONLY "tripType" ALTER COLUMN id SET DEFAULT nextval('"tripType_id_seq"'::regclass);


SET search_path = "travelerInfo", pg_catalog;

--
-- TOC entry 1983 (class 2604 OID 17000)
-- Name: id; Type: DEFAULT; Schema: travelerInfo; Owner: "stAdmins"
--

ALTER TABLE ONLY contact ALTER COLUMN id SET DEFAULT nextval('contac_id_seq'::regclass);


--
-- TOC entry 1981 (class 2604 OID 16912)
-- Name: id; Type: DEFAULT; Schema: travelerInfo; Owner: "stAdmins"
--

ALTER TABLE ONLY device ALTER COLUMN id SET DEFAULT nextval('device_id_seq'::regclass);


--
-- TOC entry 1975 (class 2604 OID 16545)
-- Name: id; Type: DEFAULT; Schema: travelerInfo; Owner: "stAdmins"
--

ALTER TABLE ONLY traveler ALTER COLUMN id SET DEFAULT nextval('traveler_id_seq'::regclass);


SET search_path = "tripInfo", pg_catalog;

--
-- TOC entry 1982 (class 2604 OID 16930)
-- Name: id; Type: DEFAULT; Schema: tripInfo; Owner: "stAdmins"
--

ALTER TABLE ONLY trip ALTER COLUMN id SET DEFAULT nextval('trip_id_seq'::regclass);


SET search_path = configuration, pg_catalog;

--
-- TOC entry 2140 (class 0 OID 16612)
-- Dependencies: 179
-- Data for Name: account; Type: TABLE DATA; Schema: configuration; Owner: "stAdmins"
--

COPY account (id, "travelerId", "accountTypeId", "firstName", "lastName", nick, locale, start, "end", "statusId") FROM stdin;
\.


--
-- TOC entry 2143 (class 0 OID 16658)
-- Dependencies: 182
-- Data for Name: accountType; Type: TABLE DATA; Schema: configuration; Owner: "stAdmins"
--

COPY "accountType" (id, description, "hasValidityPeriod", "from", "to", "order", image, enabled) FROM stdin;
\.


--
-- TOC entry 2178 (class 0 OID 0)
-- Dependencies: 173
-- Name: accountType_id_seq; Type: SEQUENCE SET; Schema: configuration; Owner: postgres
--

SELECT pg_catalog.setval('"accountType_id_seq"', 1, false);


--
-- TOC entry 2179 (class 0 OID 0)
-- Dependencies: 178
-- Name: account_id_seq; Type: SEQUENCE SET; Schema: configuration; Owner: "stAdmins"
--

SELECT pg_catalog.setval('account_id_seq', 1, false);


--
-- TOC entry 2142 (class 0 OID 16652)
-- Dependencies: 181
-- Data for Name: deviceType; Type: TABLE DATA; Schema: configuration; Owner: "stAdmins"
--

COPY "deviceType" (id, description, image) FROM stdin;
\.


--
-- TOC entry 2180 (class 0 OID 0)
-- Dependencies: 180
-- Name: deviceType_id_seq; Type: SEQUENCE SET; Schema: configuration; Owner: "stAdmins"
--

SELECT pg_catalog.setval('"deviceType_id_seq"', 1, false);


--
-- TOC entry 2145 (class 0 OID 16795)
-- Dependencies: 184
-- Data for Name: eventType; Type: TABLE DATA; Schema: configuration; Owner: "stAdmins"
--

COPY "eventType" (id, description, image) FROM stdin;
\.


--
-- TOC entry 2181 (class 0 OID 0)
-- Dependencies: 183
-- Name: eventType_id_seq; Type: SEQUENCE SET; Schema: configuration; Owner: "stAdmins"
--

SELECT pg_catalog.setval('"eventType_id_seq"', 1, false);


--
-- TOC entry 2157 (class 0 OID 17007)
-- Dependencies: 196
-- Data for Name: socialNetwork; Type: TABLE DATA; Schema: configuration; Owner: "stAdmins"
--

COPY "socialNetwork" (id, name, "userIdFormat", "statusId") FROM stdin;
\.


--
-- TOC entry 2182 (class 0 OID 0)
-- Dependencies: 195
-- Name: socialNetwork_id_seq; Type: SEQUENCE SET; Schema: configuration; Owner: "stAdmins"
--

SELECT pg_catalog.setval('"socialNetwork_id_seq"', 1, false);


--
-- TOC entry 2135 (class 0 OID 16525)
-- Dependencies: 174
-- Data for Name: status; Type: TABLE DATA; Schema: configuration; Owner: "stAdmins"
--

COPY status (id, "tableName", description, "order", enabled) FROM stdin;
\.


--
-- TOC entry 2183 (class 0 OID 0)
-- Dependencies: 175
-- Name: status_id_seq; Type: SEQUENCE SET; Schema: configuration; Owner: "stAdmins"
--

SELECT pg_catalog.setval('status_id_seq', 1, false);


--
-- TOC entry 2147 (class 0 OID 16820)
-- Dependencies: 186
-- Data for Name: tripType; Type: TABLE DATA; Schema: configuration; Owner: "stAdmins"
--

COPY "tripType" (id, description, image, "timeToNextPosition", "statusId") FROM stdin;
\.


--
-- TOC entry 2184 (class 0 OID 0)
-- Dependencies: 185
-- Name: tripType_id_seq; Type: SEQUENCE SET; Schema: configuration; Owner: "stAdmins"
--

SELECT pg_catalog.setval('"tripType_id_seq"', 1, false);


SET search_path = "travelerInfo", pg_catalog;

--
-- TOC entry 2185 (class 0 OID 0)
-- Dependencies: 193
-- Name: contac_id_seq; Type: SEQUENCE SET; Schema: travelerInfo; Owner: "stAdmins"
--

SELECT pg_catalog.setval('contac_id_seq', 1, false);


--
-- TOC entry 2155 (class 0 OID 16997)
-- Dependencies: 194
-- Data for Name: contact; Type: TABLE DATA; Schema: travelerInfo; Owner: "stAdmins"
--

COPY contact (id, "travelerId", "socialNetworkId", "socialNetworkUserId", "statusId") FROM stdin;
\.


--
-- TOC entry 2149 (class 0 OID 16909)
-- Dependencies: 188
-- Data for Name: device; Type: TABLE DATA; Schema: travelerInfo; Owner: "stAdmins"
--

COPY device (id, nick, "uniqueIdentifier", "deviceTypeId", "registrationDate", "lastUpdate", "statusId") FROM stdin;
\.


--
-- TOC entry 2186 (class 0 OID 0)
-- Dependencies: 187
-- Name: device_id_seq; Type: SEQUENCE SET; Schema: travelerInfo; Owner: "stAdmins"
--

SELECT pg_catalog.setval('device_id_seq', 1, false);


--
-- TOC entry 2138 (class 0 OID 16542)
-- Dependencies: 177
-- Data for Name: traveler; Type: TABLE DATA; Schema: travelerInfo; Owner: "stAdmins"
--

COPY traveler (id, email, pwd) FROM stdin;
\.


--
-- TOC entry 2187 (class 0 OID 0)
-- Dependencies: 176
-- Name: traveler_id_seq; Type: SEQUENCE SET; Schema: travelerInfo; Owner: "stAdmins"
--

SELECT pg_catalog.setval('traveler_id_seq', 1, false);


SET search_path = "tripInfo", pg_catalog;

--
-- TOC entry 2153 (class 0 OID 16974)
-- Dependencies: 192
-- Data for Name: event; Type: TABLE DATA; Schema: tripInfo; Owner: "stAdmins"
--

COPY event (id, "routeId", "eventTypeId", message, image, "statusId") FROM stdin;
\.


--
-- TOC entry 2152 (class 0 OID 16956)
-- Dependencies: 191
-- Data for Name: route; Type: TABLE DATA; Schema: tripInfo; Owner: "stAdmins"
--

COPY route (id, "tripId", "deviceId", "dateOnServer", "dateOnDevice", "deviceIp", "position") FROM stdin;
\.


--
-- TOC entry 2151 (class 0 OID 16927)
-- Dependencies: 190
-- Data for Name: trip; Type: TABLE DATA; Schema: tripInfo; Owner: "stAdmins"
--

COPY trip (id, "travelerId", "deviceId", "tripTypeId", "serverStart", "serverEnd", "deviceStart", "deviceEnd", "deviceIpStart", "deviceIpEnd", "statusId") FROM stdin;
\.


--
-- TOC entry 2188 (class 0 OID 0)
-- Dependencies: 189
-- Name: trip_id_seq; Type: SEQUENCE SET; Schema: tripInfo; Owner: "stAdmins"
--

SELECT pg_catalog.setval('trip_id_seq', 1, false);


SET search_path = configuration, pg_catalog;

--
-- TOC entry 1994 (class 2606 OID 16663)
-- Name: pk_accountType; Type: CONSTRAINT; Schema: configuration; Owner: "stAdmins"; Tablespace: 
--

ALTER TABLE ONLY "accountType"
    ADD CONSTRAINT "pk_accountType" PRIMARY KEY (id);


--
-- TOC entry 1990 (class 2606 OID 16617)
-- Name: pk_conf; Type: CONSTRAINT; Schema: configuration; Owner: "stAdmins"; Tablespace: 
--

ALTER TABLE ONLY account
    ADD CONSTRAINT pk_conf PRIMARY KEY (id);


--
-- TOC entry 1992 (class 2606 OID 16657)
-- Name: pk_deviceType; Type: CONSTRAINT; Schema: configuration; Owner: "stAdmins"; Tablespace: 
--

ALTER TABLE ONLY "deviceType"
    ADD CONSTRAINT "pk_deviceType" PRIMARY KEY (id);


--
-- TOC entry 1996 (class 2606 OID 16800)
-- Name: pk_eventType; Type: CONSTRAINT; Schema: configuration; Owner: "stAdmins"; Tablespace: 
--

ALTER TABLE ONLY "eventType"
    ADD CONSTRAINT "pk_eventType" PRIMARY KEY (id);


--
-- TOC entry 2010 (class 2606 OID 17012)
-- Name: pk_socialNetwork; Type: CONSTRAINT; Schema: configuration; Owner: "stAdmins"; Tablespace: 
--

ALTER TABLE ONLY "socialNetwork"
    ADD CONSTRAINT "pk_socialNetwork" PRIMARY KEY (id);


--
-- TOC entry 1986 (class 2606 OID 16535)
-- Name: pk_status; Type: CONSTRAINT; Schema: configuration; Owner: "stAdmins"; Tablespace: 
--

ALTER TABLE ONLY status
    ADD CONSTRAINT pk_status PRIMARY KEY (id);


--
-- TOC entry 1998 (class 2606 OID 16825)
-- Name: pk_tripType; Type: CONSTRAINT; Schema: configuration; Owner: "stAdmins"; Tablespace: 
--

ALTER TABLE ONLY "tripType"
    ADD CONSTRAINT "pk_tripType" PRIMARY KEY (id);


SET search_path = "travelerInfo", pg_catalog;

--
-- TOC entry 2008 (class 2606 OID 17004)
-- Name: pk_contact; Type: CONSTRAINT; Schema: travelerInfo; Owner: "stAdmins"; Tablespace: 
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT pk_contact PRIMARY KEY (id);


--
-- TOC entry 2000 (class 2606 OID 16914)
-- Name: pk_device; Type: CONSTRAINT; Schema: travelerInfo; Owner: "stAdmins"; Tablespace: 
--

ALTER TABLE ONLY device
    ADD CONSTRAINT pk_device PRIMARY KEY (id);


--
-- TOC entry 1988 (class 2606 OID 16547)
-- Name: pk_traveler; Type: CONSTRAINT; Schema: travelerInfo; Owner: "stAdmins"; Tablespace: 
--

ALTER TABLE ONLY traveler
    ADD CONSTRAINT pk_traveler PRIMARY KEY (id);


SET search_path = "tripInfo", pg_catalog;

--
-- TOC entry 2006 (class 2606 OID 16978)
-- Name: pk_event; Type: CONSTRAINT; Schema: tripInfo; Owner: "stAdmins"; Tablespace: 
--

ALTER TABLE ONLY event
    ADD CONSTRAINT pk_event PRIMARY KEY (id);


--
-- TOC entry 2004 (class 2606 OID 16963)
-- Name: pk_route; Type: CONSTRAINT; Schema: tripInfo; Owner: "stAdmins"; Tablespace: 
--

ALTER TABLE ONLY route
    ADD CONSTRAINT pk_route PRIMARY KEY (id);


--
-- TOC entry 2002 (class 2606 OID 16935)
-- Name: pk_trip; Type: CONSTRAINT; Schema: tripInfo; Owner: "stAdmins"; Tablespace: 
--

ALTER TABLE ONLY trip
    ADD CONSTRAINT pk_trip PRIMARY KEY (id);


SET search_path = configuration, pg_catalog;

--
-- TOC entry 2013 (class 2606 OID 16664)
-- Name: fk_account_accountType; Type: FK CONSTRAINT; Schema: configuration; Owner: "stAdmins"
--

ALTER TABLE ONLY account
    ADD CONSTRAINT "fk_account_accountType" FOREIGN KEY ("accountTypeId") REFERENCES "accountType"(id);


--
-- TOC entry 2011 (class 2606 OID 16618)
-- Name: fk_account_status; Type: FK CONSTRAINT; Schema: configuration; Owner: "stAdmins"
--

ALTER TABLE ONLY account
    ADD CONSTRAINT fk_account_status FOREIGN KEY ("statusId") REFERENCES account(id);


--
-- TOC entry 2012 (class 2606 OID 16623)
-- Name: fk_account_traveler; Type: FK CONSTRAINT; Schema: configuration; Owner: "stAdmins"
--

ALTER TABLE ONLY account
    ADD CONSTRAINT fk_account_traveler FOREIGN KEY ("travelerId") REFERENCES "travelerInfo".traveler(id);


--
-- TOC entry 2014 (class 2606 OID 16826)
-- Name: fk_tripType_status; Type: FK CONSTRAINT; Schema: configuration; Owner: "stAdmins"
--

ALTER TABLE ONLY "tripType"
    ADD CONSTRAINT "fk_tripType_status" FOREIGN KEY ("statusId") REFERENCES status(id);


SET search_path = "travelerInfo", pg_catalog;

--
-- TOC entry 2026 (class 2606 OID 17013)
-- Name: fk_contact_socialNetwork; Type: FK CONSTRAINT; Schema: travelerInfo; Owner: "stAdmins"
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT "fk_contact_socialNetwork" FOREIGN KEY ("socialNetworkId") REFERENCES configuration."socialNetwork"(id);


--
-- TOC entry 2015 (class 2606 OID 16915)
-- Name: fk_device_deviceType; Type: FK CONSTRAINT; Schema: travelerInfo; Owner: "stAdmins"
--

ALTER TABLE ONLY device
    ADD CONSTRAINT "fk_device_deviceType" FOREIGN KEY ("deviceTypeId") REFERENCES configuration."deviceType"(id);


--
-- TOC entry 2016 (class 2606 OID 16920)
-- Name: fk_device_status; Type: FK CONSTRAINT; Schema: travelerInfo; Owner: "stAdmins"
--

ALTER TABLE ONLY device
    ADD CONSTRAINT fk_device_status FOREIGN KEY ("statusId") REFERENCES configuration.status(id);


SET search_path = "tripInfo", pg_catalog;

--
-- TOC entry 2023 (class 2606 OID 16979)
-- Name: fk_event_eventType; Type: FK CONSTRAINT; Schema: tripInfo; Owner: "stAdmins"
--

ALTER TABLE ONLY event
    ADD CONSTRAINT "fk_event_eventType" FOREIGN KEY ("eventTypeId") REFERENCES configuration."eventType"(id);


--
-- TOC entry 2024 (class 2606 OID 16984)
-- Name: fk_event_route; Type: FK CONSTRAINT; Schema: tripInfo; Owner: "stAdmins"
--

ALTER TABLE ONLY event
    ADD CONSTRAINT fk_event_route FOREIGN KEY ("routeId") REFERENCES route(id);


--
-- TOC entry 2025 (class 2606 OID 16989)
-- Name: fk_event_status; Type: FK CONSTRAINT; Schema: tripInfo; Owner: "stAdmins"
--

ALTER TABLE ONLY event
    ADD CONSTRAINT fk_event_status FOREIGN KEY ("statusId") REFERENCES configuration.status(id);


--
-- TOC entry 2021 (class 2606 OID 16964)
-- Name: fk_route_device; Type: FK CONSTRAINT; Schema: tripInfo; Owner: "stAdmins"
--

ALTER TABLE ONLY route
    ADD CONSTRAINT fk_route_device FOREIGN KEY ("deviceId") REFERENCES "travelerInfo".device(id);


--
-- TOC entry 2022 (class 2606 OID 16969)
-- Name: fk_route_trip; Type: FK CONSTRAINT; Schema: tripInfo; Owner: "stAdmins"
--

ALTER TABLE ONLY route
    ADD CONSTRAINT fk_route_trip FOREIGN KEY ("tripId") REFERENCES trip(id);


--
-- TOC entry 2017 (class 2606 OID 16936)
-- Name: fk_trip_device; Type: FK CONSTRAINT; Schema: tripInfo; Owner: "stAdmins"
--

ALTER TABLE ONLY trip
    ADD CONSTRAINT fk_trip_device FOREIGN KEY ("deviceId") REFERENCES "travelerInfo".device(id);


--
-- TOC entry 2018 (class 2606 OID 16941)
-- Name: fk_trip_status; Type: FK CONSTRAINT; Schema: tripInfo; Owner: "stAdmins"
--

ALTER TABLE ONLY trip
    ADD CONSTRAINT fk_trip_status FOREIGN KEY ("statusId") REFERENCES configuration.status(id);


--
-- TOC entry 2019 (class 2606 OID 16946)
-- Name: fk_trip_traveler; Type: FK CONSTRAINT; Schema: tripInfo; Owner: "stAdmins"
--

ALTER TABLE ONLY trip
    ADD CONSTRAINT fk_trip_traveler FOREIGN KEY ("travelerId") REFERENCES "travelerInfo".traveler(id);


--
-- TOC entry 2020 (class 2606 OID 16951)
-- Name: fk_trip_tripType; Type: FK CONSTRAINT; Schema: tripInfo; Owner: "stAdmins"
--

ALTER TABLE ONLY trip
    ADD CONSTRAINT "fk_trip_tripType" FOREIGN KEY ("tripTypeId") REFERENCES configuration."tripType"(id);


--
-- TOC entry 2163 (class 0 OID 0)
-- Dependencies: 7
-- Name: configuration; Type: ACL; Schema: -; Owner: "stAdmins"
--

REVOKE ALL ON SCHEMA configuration FROM PUBLIC;
REVOKE ALL ON SCHEMA configuration FROM "stAdmins";
GRANT ALL ON SCHEMA configuration TO "stAdmins";


--
-- TOC entry 2165 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- TOC entry 2166 (class 0 OID 0)
-- Dependencies: 8
-- Name: tripInfo; Type: ACL; Schema: -; Owner: "stAdmins"
--

REVOKE ALL ON SCHEMA "tripInfo" FROM PUBLIC;
REVOKE ALL ON SCHEMA "tripInfo" FROM "stAdmins";
GRANT ALL ON SCHEMA "tripInfo" TO "stAdmins";


-- Completed on 2015-09-09 13:45:22 ECT

--
-- PostgreSQL database dump complete
--

