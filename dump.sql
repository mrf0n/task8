--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.24
-- Dumped by pg_dump version 9.6.24

-- Started on 2023-01-18 17:35:16

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12387)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2416 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 190 (class 1259 OID 16817)
-- Name: sequence69cf974b2046498ab0b3483dcf9046fa; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sequence69cf974b2046498ab0b3483dcf9046fa
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sequence69cf974b2046498ab0b3483dcf9046fa OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 191 (class 1259 OID 16819)
-- Name: Order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Order" (
    primarykey uuid NOT NULL,
    status character varying(10),
    shipmentdate timestamp(3) without time zone,
    paymentdate timestamp(3) without time zone,
    number integer DEFAULT nextval('public.sequence69cf974b2046498ab0b3483dcf9046fa'::regclass) NOT NULL,
    createdate timestamp(3) without time zone,
    manager uuid
);


ALTER TABLE public."Order" OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16929)
-- Name: applicationlog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.applicationlog (
    primarykey uuid NOT NULL,
    category character varying(64),
    eventid integer,
    priority integer,
    severity character varying(32),
    title character varying(256),
    "timestamp" timestamp(3) without time zone,
    machinename character varying(32),
    appdomainname character varying(512),
    processid character varying(256),
    processname character varying(512),
    threadname character varying(512),
    win32threadid character varying(128),
    message character varying(2500),
    formattedmessage text
);


ALTER TABLE public.applicationlog OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 16825)
-- Name: sequencef0f25673e7d548f6833de48f18d788fd; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sequencef0f25673e7d548f6833de48f18d788fd
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sequencef0f25673e7d548f6833de48f18d788fd OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 16827)
-- Name: document; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.document (
    primarykey uuid NOT NULL,
    number integer DEFAULT nextval('public.sequencef0f25673e7d548f6833de48f18d788fd'::regclass) NOT NULL,
    createdate timestamp(3) without time zone
);


ALTER TABLE public.document OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 16838)
-- Name: sequencef6b2c9e7807246e3b17ae8ad7988d9cb; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sequencef6b2c9e7807246e3b17ae8ad7988d9cb
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sequencef6b2c9e7807246e3b17ae8ad7988d9cb OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16840)
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    primarykey uuid NOT NULL,
    number integer DEFAULT nextval('public.sequencef6b2c9e7807246e3b17ae8ad7988d9cb'::regclass) NOT NULL,
    lastname character varying(255),
    firstname character varying(255),
    middlename character varying(255),
    phonenumber character varying(255),
    email character varying(255),
    "position" character varying(9)
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 16806)
-- Name: sequence80c8e2d600704ac0a9e80d540319099f; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sequence80c8e2d600704ac0a9e80d540319099f
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sequence80c8e2d600704ac0a9e80d540319099f OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 16808)
-- Name: invoice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invoice (
    primarykey uuid NOT NULL,
    status character varying(16),
    shipmentdatetime timestamp(3) without time zone,
    totalsum double precision,
    totalweight double precision,
    note character varying(255),
    customername character varying(255),
    number integer DEFAULT nextval('public.sequence80c8e2d600704ac0a9e80d540319099f'::regclass) NOT NULL,
    createdate timestamp(3) without time zone,
    responsibleperson uuid,
    order_m0 uuid
);


ALTER TABLE public.invoice OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 16793)
-- Name: invoiceitem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invoiceitem (
    primarykey uuid NOT NULL,
    amount integer,
    weight double precision,
    price double precision,
    totalsum double precision,
    product_m0 uuid,
    invoice_m0 uuid NOT NULL
);


ALTER TABLE public.invoiceitem OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 16833)
-- Name: orderitem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orderitem (
    primarykey uuid NOT NULL,
    amount integer,
    pricewtaxes double precision,
    totalsum double precision,
    product_m0 uuid,
    order_m0 uuid NOT NULL
);


ALTER TABLE public.orderitem OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16854)
-- Name: sequence0d4df6d99e1a41c4a1ae260693cd44c7; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sequence0d4df6d99e1a41c4a1ae260693cd44c7
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sequence0d4df6d99e1a41c4a1ae260693cd44c7 OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16856)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    primarykey uuid NOT NULL,
    productcode integer DEFAULT nextval('public.sequence0d4df6d99e1a41c4a1ae260693cd44c7'::regclass) NOT NULL,
    name character varying(255),
    measure character varying(255),
    description character varying(255),
    price double precision,
    weight double precision
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 16798)
-- Name: sequence626d1d020bfc44b48d0695eae2a0964f; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sequence626d1d020bfc44b48d0695eae2a0964f
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sequence626d1d020bfc44b48d0695eae2a0964f OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16961)
-- Name: session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.session (
    primarykey uuid NOT NULL,
    userkey uuid,
    startedat timestamp(3) without time zone,
    lastaccess timestamp(3) without time zone,
    closed boolean
);


ALTER TABLE public.session OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 16800)
-- Name: storehouse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.storehouse (
    primarykey uuid NOT NULL,
    number integer DEFAULT nextval('public.sequence626d1d020bfc44b48d0695eae2a0964f'::regclass) NOT NULL,
    address character varying(255),
    storekeeper uuid
);


ALTER TABLE public.storehouse OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16849)
-- Name: storeproduct; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.storeproduct (
    primarykey uuid NOT NULL,
    amount integer,
    product_m0 uuid,
    storehouse_m0 uuid NOT NULL
);


ALTER TABLE public.storeproduct OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16990)
-- Name: stormac; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stormac (
    primarykey uuid NOT NULL,
    typeaccess character varying(7),
    filter_m0 uuid,
    permition_m0 uuid NOT NULL,
    createtime timestamp(3) without time zone,
    creator character varying(255),
    edittime timestamp(3) without time zone,
    editor character varying(255)
);


ALTER TABLE public.stormac OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16881)
-- Name: stormadvlimit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stormadvlimit (
    primarykey uuid NOT NULL,
    "User" character varying(255),
    published boolean,
    module character varying(255),
    name character varying(255),
    value text,
    hotkeydata integer
);


ALTER TABLE public.stormadvlimit OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16937)
-- Name: stormag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stormag (
    primarykey uuid NOT NULL,
    name character varying(80) NOT NULL,
    login character varying(50),
    pwd character varying(50),
    isuser boolean NOT NULL,
    isgroup boolean NOT NULL,
    isrole boolean NOT NULL,
    connstring character varying(255),
    enabled boolean,
    email character varying(80),
    comment character varying,
    createtime timestamp(3) without time zone,
    creator character varying(255),
    edittime timestamp(3) without time zone,
    editor character varying(255)
);


ALTER TABLE public.stormag OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16982)
-- Name: stormf; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stormf (
    primarykey uuid NOT NULL,
    filtertext text,
    name character varying(255),
    filtertypenview character varying(255),
    subject_m0 uuid,
    createtime timestamp(3) without time zone,
    creator character varying(255),
    edittime timestamp(3) without time zone,
    editor character varying(255)
);


ALTER TABLE public.stormf OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16905)
-- Name: stormfilterdetail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stormfilterdetail (
    primarykey uuid NOT NULL,
    caption character varying(255) NOT NULL,
    dataobjectview character varying(255) NOT NULL,
    connectmasterprop character varying(255) NOT NULL,
    ownerconnectprop character varying(255),
    filtersetting_m0 uuid NOT NULL
);


ALTER TABLE public.stormfilterdetail OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16913)
-- Name: stormfilterlookup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stormfilterlookup (
    primarykey uuid NOT NULL,
    dataobjecttype character varying(255) NOT NULL,
    container character varying(255),
    containertag character varying(255),
    fieldstoview character varying(255),
    filtersetting_m0 uuid NOT NULL
);


ALTER TABLE public.stormfilterlookup OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16889)
-- Name: stormfiltersetting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stormfiltersetting (
    primarykey uuid NOT NULL,
    name character varying(255) NOT NULL,
    dataobjectview character varying(255) NOT NULL
);


ALTER TABLE public.stormfiltersetting OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16953)
-- Name: stormi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stormi (
    primarykey uuid NOT NULL,
    user_m0 uuid NOT NULL,
    agent_m0 uuid NOT NULL,
    createtime timestamp(3) without time zone,
    creator character varying(255),
    edittime timestamp(3) without time zone,
    editor character varying(255)
);


ALTER TABLE public.stormi OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 17006)
-- Name: stormla; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stormla (
    primarykey uuid NOT NULL,
    view_m0 uuid NOT NULL,
    attribute_m0 uuid NOT NULL,
    createtime timestamp(3) without time zone,
    creator character varying(255),
    edittime timestamp(3) without time zone,
    editor character varying(255)
);


ALTER TABLE public.stormla OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16945)
-- Name: stormlg; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stormlg (
    primarykey uuid NOT NULL,
    group_m0 uuid NOT NULL,
    user_m0 uuid NOT NULL,
    createtime timestamp(3) without time zone,
    creator character varying(255),
    edittime timestamp(3) without time zone,
    editor character varying(255)
);


ALTER TABLE public.stormlg OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16998)
-- Name: stormlo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stormlo (
    primarykey uuid NOT NULL,
    class_m0 uuid NOT NULL,
    operation_m0 uuid NOT NULL,
    createtime timestamp(3) without time zone,
    creator character varying(255),
    edittime timestamp(3) without time zone,
    editor character varying(255)
);


ALTER TABLE public.stormlo OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17022)
-- Name: stormlr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stormlr (
    primarykey uuid NOT NULL,
    startdate timestamp(3) without time zone,
    enddate timestamp(3) without time zone,
    agent_m0 uuid NOT NULL,
    role_m0 uuid NOT NULL,
    createtime timestamp(3) without time zone,
    creator character varying(255),
    edittime timestamp(3) without time zone,
    editor character varying(255)
);


ALTER TABLE public.stormlr OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17014)
-- Name: stormlv; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stormlv (
    primarykey uuid NOT NULL,
    class_m0 uuid NOT NULL,
    view_m0 uuid NOT NULL,
    createtime timestamp(3) without time zone,
    creator character varying(255),
    edittime timestamp(3) without time zone,
    editor character varying(255)
);


ALTER TABLE public.stormlv OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16865)
-- Name: stormnetlockdata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stormnetlockdata (
    lockkey character varying(300) NOT NULL,
    username character varying(300) NOT NULL,
    lockdate timestamp(3) without time zone
);


ALTER TABLE public.stormnetlockdata OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16974)
-- Name: stormp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stormp (
    primarykey uuid NOT NULL,
    subject_m0 uuid NOT NULL,
    agent_m0 uuid NOT NULL,
    createtime timestamp(3) without time zone,
    creator character varying(255),
    edittime timestamp(3) without time zone,
    editor character varying(255)
);


ALTER TABLE public.stormp OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16966)
-- Name: storms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.storms (
    primarykey uuid NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(100),
    isattribute boolean NOT NULL,
    isoperation boolean NOT NULL,
    isview boolean NOT NULL,
    isclass boolean NOT NULL,
    sharedoper boolean,
    createtime timestamp(3) without time zone,
    creator character varying(255),
    edittime timestamp(3) without time zone,
    editor character varying(255),
    comment character varying
);


ALTER TABLE public.storms OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16873)
-- Name: stormsettings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stormsettings (
    primarykey uuid NOT NULL,
    module character varying(1000),
    name character varying(255),
    value text,
    "User" character varying(255)
);


ALTER TABLE public.stormsettings OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16897)
-- Name: stormwebsearch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stormwebsearch (
    primarykey uuid NOT NULL,
    name character varying(255) NOT NULL,
    "Order" integer NOT NULL,
    presentview character varying(255) NOT NULL,
    detailedview character varying(255) NOT NULL,
    filtersetting_m0 uuid NOT NULL
);


ALTER TABLE public.stormwebsearch OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16921)
-- Name: usersetting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usersetting (
    primarykey uuid NOT NULL,
    appname character varying(256),
    username character varying(512),
    userguid uuid,
    modulename character varying(1024),
    moduleguid uuid,
    settname character varying(256),
    settguid uuid,
    settlastaccesstime timestamp(3) without time zone,
    strval character varying(256),
    txtval text,
    intval integer,
    boolval boolean,
    guidval uuid,
    decimalval numeric(20,10),
    datetimeval timestamp(3) without time zone
);


ALTER TABLE public.usersetting OWNER TO postgres;

--
-- TOC entry 2379 (class 0 OID 16819)
-- Dependencies: 191
-- Data for Name: Order; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Order" (primarykey, status, shipmentdate, paymentdate, number, createdate, manager) VALUES ('291080d9-9523-46c5-99bb-dd68cfbb67d8', 'Новый', NULL, NULL, 13, '2022-12-13 14:15:56.179', '8d797aa6-d502-41ec-b1a4-962de9e6f39e');
INSERT INTO public."Order" (primarykey, status, shipmentdate, paymentdate, number, createdate, manager) VALUES ('dacd4c91-89c8-4de4-9976-ff4ff4e4f298', 'Новый', NULL, NULL, 14, '2023-01-18 15:18:00.173', 'c05ef60f-4078-41d0-b59c-ba907a864032');
INSERT INTO public."Order" (primarykey, status, shipmentdate, paymentdate, number, createdate, manager) VALUES ('1aab0ae6-895e-47b7-b222-94a4d519b6f8', 'Новый', NULL, NULL, 15, '2023-01-18 15:34:28.804', '1d8142d4-ae32-4622-b6ff-71f4cc5a8fe2');


--
-- TOC entry 2396 (class 0 OID 16929)
-- Dependencies: 208
-- Data for Name: applicationlog; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('114483bb-b52a-0e51-0c3c-2f216785602b', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-05 21:19:10.652', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '25', NULL, 'Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5', 'ICSSoft.STORMNET.Business.ExecutingQueryException: Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5 ---> Npgsql.PostgresException: 42601: ошибка синтаксиса (примерное положение: "=")
   в Npgsql.NpgsqlConnector.<DoReadMessage>d__155.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadExpecting>d__161`1.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlDataReader.<NextResult>d__32.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlDataReader.NextResult()
   в Npgsql.NpgsqlCommand.<Execute>d__71.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.<ExecuteDbDataReader>d__92.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   в ICSSoft.ST');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('c88cbb8d-6aea-2332-98ec-bdbfface2b46', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-05 21:19:27.51', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '27', NULL, 'Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5', 'ICSSoft.STORMNET.Business.ExecutingQueryException: Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5 ---> Npgsql.PostgresException: 42601: ошибка синтаксиса (примерное положение: "=")
   в Npgsql.NpgsqlConnector.<DoReadMessage>d__155.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadExpecting>d__161`1.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlDataReader.<NextResult>d__32.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlDataReader.NextResult()
   в Npgsql.NpgsqlCommand.<Execute>d__71.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.<ExecuteDbDataReader>d__92.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   в ICSSoft.ST');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('7d3090c5-6460-9f09-9a1f-dbfd9b24fe37', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-05 21:19:43.835', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '25', NULL, 'Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5', 'ICSSoft.STORMNET.Business.ExecutingQueryException: Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5 ---> Npgsql.PostgresException: 42601: ошибка синтаксиса (примерное положение: "=")
   в Npgsql.NpgsqlConnector.<DoReadMessage>d__155.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadExpecting>d__161`1.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlDataReader.<NextResult>d__32.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlDataReader.NextResult()
   в Npgsql.NpgsqlCommand.<Execute>d__71.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.<ExecuteDbDataReader>d__92.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   в ICSSoft.ST');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('a209f8aa-39ba-d82d-8677-dd072f7a0f3b', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-05 21:19:55.868', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '23', NULL, 'Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5', 'ICSSoft.STORMNET.Business.ExecutingQueryException: Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5 ---> Npgsql.PostgresException: 42601: ошибка синтаксиса (примерное положение: "=")
   в Npgsql.NpgsqlConnector.<DoReadMessage>d__155.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadExpecting>d__161`1.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlDataReader.<NextResult>d__32.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlDataReader.NextResult()
   в Npgsql.NpgsqlCommand.<Execute>d__71.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.<ExecuteDbDataReader>d__92.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   в ICSSoft.ST');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('add09039-e24f-1bbc-743c-3f1cd32ef83b', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-05 21:19:57.914', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '22', NULL, 'Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5', 'ICSSoft.STORMNET.Business.ExecutingQueryException: Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5 ---> Npgsql.PostgresException: 42601: ошибка синтаксиса (примерное положение: "=")
   в Npgsql.NpgsqlConnector.<DoReadMessage>d__155.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadExpecting>d__161`1.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlDataReader.<NextResult>d__32.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlDataReader.NextResult()
   в Npgsql.NpgsqlCommand.<Execute>d__71.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.<ExecuteDbDataReader>d__92.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   в ICSSoft.ST');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('5e951ac2-d0fb-2c87-b31a-1bc5527d9892', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-05 21:24:03.812', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '11', NULL, 'Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5', 'ICSSoft.STORMNET.Business.ExecutingQueryException: Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5 ---> Npgsql.PostgresException: 42601: ошибка синтаксиса (примерное положение: "=")
   в Npgsql.NpgsqlConnector.<DoReadMessage>d__155.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadExpecting>d__161`1.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlDataReader.<NextResult>d__32.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlDataReader.NextResult()
   в Npgsql.NpgsqlCommand.<Execute>d__71.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.<ExecuteDbDataReader>d__92.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   в ICSSoft.ST');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('7aa1090a-ff55-3f60-a1bf-3c5da80bca34', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-05 21:25:01.755', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '22', NULL, 'Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5', 'ICSSoft.STORMNET.Business.ExecutingQueryException: Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5 ---> Npgsql.PostgresException: 42601: ошибка синтаксиса (примерное положение: "=")
   в Npgsql.NpgsqlConnector.<DoReadMessage>d__155.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadExpecting>d__161`1.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlDataReader.<NextResult>d__32.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlDataReader.NextResult()
   в Npgsql.NpgsqlCommand.<Execute>d__71.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.<ExecuteDbDataReader>d__92.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   в ICSSoft.ST');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('3087db4f-1c85-3133-96d2-e9813d12f306', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-05 21:33:00.174', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '8', NULL, 'Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5', 'ICSSoft.STORMNET.Business.ExecutingQueryException: Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5 ---> Npgsql.PostgresException: 42601: ошибка синтаксиса (примерное положение: "=")
   в Npgsql.NpgsqlConnector.<DoReadMessage>d__155.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadExpecting>d__161`1.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlDataReader.<NextResult>d__32.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlDataReader.NextResult()
   в Npgsql.NpgsqlCommand.<Execute>d__71.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.<ExecuteDbDataReader>d__92.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   в ICSSoft.ST');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('d0d00213-785a-ef15-280d-61fe86b12682', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-05 21:33:20.166', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '9', NULL, 'Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5', 'ICSSoft.STORMNET.Business.ExecutingQueryException: Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5 ---> Npgsql.PostgresException: 42601: ошибка синтаксиса (примерное положение: "=")
   в Npgsql.NpgsqlConnector.<DoReadMessage>d__155.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadExpecting>d__161`1.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlDataReader.<NextResult>d__32.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlDataReader.NextResult()
   в Npgsql.NpgsqlCommand.<Execute>d__71.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.<ExecuteDbDataReader>d__92.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   в ICSSoft.ST');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('789648dc-6874-92ef-4c90-c7008c811df2', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-05 21:35:56.351', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '11', NULL, 'Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5', 'ICSSoft.STORMNET.Business.ExecutingQueryException: Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5 ---> Npgsql.PostgresException: 42601: ошибка синтаксиса (примерное положение: "=")
   в Npgsql.NpgsqlConnector.<DoReadMessage>d__155.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadExpecting>d__161`1.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlDataReader.<NextResult>d__32.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlDataReader.NextResult()
   в Npgsql.NpgsqlCommand.<Execute>d__71.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.<ExecuteDbDataReader>d__92.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   в ICSSoft.ST');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('448a5061-b0d9-27e7-f841-a33141ef9006', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-05 21:35:59.206', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '9', NULL, 'Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5', 'ICSSoft.STORMNET.Business.ExecutingQueryException: Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5 ---> Npgsql.PostgresException: 42601: ошибка синтаксиса (примерное положение: "=")
   в Npgsql.NpgsqlConnector.<DoReadMessage>d__155.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadExpecting>d__161`1.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlDataReader.<NextResult>d__32.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlDataReader.NextResult()
   в Npgsql.NpgsqlCommand.<Execute>d__71.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.<ExecuteDbDataReader>d__92.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   в ICSSoft.ST');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('18b564af-1061-411e-29d7-07f7274795ca', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-05 22:15:49.185', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '9', NULL, 'Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5', 'ICSSoft.STORMNET.Business.ExecutingQueryException: Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5 ---> Npgsql.PostgresException: 42601: ошибка синтаксиса (примерное положение: "=")
   в Npgsql.NpgsqlConnector.<DoReadMessage>d__155.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadExpecting>d__161`1.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlDataReader.<NextResult>d__32.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlDataReader.NextResult()
   в Npgsql.NpgsqlCommand.<Execute>d__71.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.<ExecuteDbDataReader>d__92.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   в ICSSoft.ST');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('45377bd8-d4e3-73b9-4ec0-793e38ee1b9c', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-05 22:17:17.402', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '15', NULL, 'Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5', 'ICSSoft.STORMNET.Business.ExecutingQueryException: Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5 ---> Npgsql.PostgresException: 42601: ошибка синтаксиса (примерное положение: "=")
   в Npgsql.NpgsqlConnector.<DoReadMessage>d__155.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadExpecting>d__161`1.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlDataReader.<NextResult>d__32.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlDataReader.NextResult()
   в Npgsql.NpgsqlCommand.<Execute>d__71.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.<ExecuteDbDataReader>d__92.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   в ICSSoft.ST');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('d3cd08e2-c720-8233-fb33-304215ba4cd4', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-05 22:17:21.654', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '10', NULL, 'Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5', 'ICSSoft.STORMNET.Business.ExecutingQueryException: Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5 ---> Npgsql.PostgresException: 42601: ошибка синтаксиса (примерное положение: "=")
   в Npgsql.NpgsqlConnector.<DoReadMessage>d__155.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadExpecting>d__161`1.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlDataReader.<NextResult>d__32.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlDataReader.NextResult()
   в Npgsql.NpgsqlCommand.<Execute>d__71.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.<ExecuteDbDataReader>d__92.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   в ICSSoft.ST');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('9fc4c0b5-dc61-4187-98e2-1c4af71c7a45', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-05 22:17:30.235', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '9', NULL, 'Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5', 'ICSSoft.STORMNET.Business.ExecutingQueryException: Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5 ---> Npgsql.PostgresException: 42601: ошибка синтаксиса (примерное положение: "=")
   в Npgsql.NpgsqlConnector.<DoReadMessage>d__155.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadExpecting>d__161`1.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlDataReader.<NextResult>d__32.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlDataReader.NextResult()
   в Npgsql.NpgsqlCommand.<Execute>d__71.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.<ExecuteDbDataReader>d__92.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   в ICSSoft.ST');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('9aaa2da7-46b1-14ec-c156-f712cc93e80b', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-05 22:18:04.423', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '7', NULL, 'Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.FirstName",
"Manager.LastName",
"Manager.MiddleName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.FirstName",
"Manager.LastName",
"Manager.MiddleName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.FirstName as "Manager.FirstName",
OrderManager0.LastName as "Manager.LastName",
OrderManager0.MiddleName as "Manager.MiddleName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY
WHERE ( STORMMainObjectKey = ''{ce7dcd07-a81d-45e4-8286-fb7f239c4c8c}'')', 'ICSSoft.STORMNET.Business.ExecutingQueryException: Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.FirstName",
"Manager.LastName",
"Manager.MiddleName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.FirstName",
"Manager.LastName",
"Manager.MiddleName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.FirstName as "Manager.FirstName",
OrderManager0.LastName as "Manager.LastName",
OrderManager0.MiddleName as "Manager.MiddleName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY
WHERE ( STORMMainObjectKey = ''{ce7dcd07-a81d-45e4-8286-fb7f239c4c8c}'') ---> Npgsql.PostgresException: 42601: ошибка синтаксиса (примерное положение: "=")
   в Npgsql.NpgsqlConnector.<DoReadMessage>d__155.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadExpecting>d__161`1.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlDataReader.<NextResult>d__32.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlDataReader.NextResult()
   в Npgsql.NpgsqlCommand.<Execute>d__71.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.<ExecuteDbDataReader>d__92.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   в ICSSoft.STORMNET.Business.SQLDataService.ReadFirst(String query, Object& sta');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('5ccf31f5-bfbc-fc26-b233-838ab66e6bed', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-05 22:18:12.988', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '10', NULL, 'Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.FirstName",
"Manager.LastName",
"Manager.MiddleName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.FirstName",
"Manager.LastName",
"Manager.MiddleName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.FirstName as "Manager.FirstName",
OrderManager0.LastName as "Manager.LastName",
OrderManager0.MiddleName as "Manager.MiddleName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY
WHERE ( STORMMainObjectKey = ''{ce7dcd07-a81d-45e4-8286-fb7f239c4c8c}'')', 'ICSSoft.STORMNET.Business.ExecutingQueryException: Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.FirstName",
"Manager.LastName",
"Manager.MiddleName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.FirstName",
"Manager.LastName",
"Manager.MiddleName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.FirstName as "Manager.FirstName",
OrderManager0.LastName as "Manager.LastName",
OrderManager0.MiddleName as "Manager.MiddleName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY
WHERE ( STORMMainObjectKey = ''{ce7dcd07-a81d-45e4-8286-fb7f239c4c8c}'') ---> Npgsql.PostgresException: 42601: ошибка синтаксиса (примерное положение: "=")
   в Npgsql.NpgsqlConnector.<DoReadMessage>d__155.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadExpecting>d__161`1.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlDataReader.<NextResult>d__32.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlDataReader.NextResult()
   в Npgsql.NpgsqlCommand.<Execute>d__71.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.<ExecuteDbDataReader>d__92.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   в ICSSoft.STORMNET.Business.SQLDataService.ReadFirst(String query, Object& sta');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('3c5b31c2-b566-5fa0-de6e-dd8a6eb7329b', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-05 22:18:17.102', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '15', NULL, 'Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5', 'ICSSoft.STORMNET.Business.ExecutingQueryException: Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5 ---> Npgsql.PostgresException: 42601: ошибка синтаксиса (примерное положение: "=")
   в Npgsql.NpgsqlConnector.<DoReadMessage>d__155.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadExpecting>d__161`1.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlDataReader.<NextResult>d__32.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlDataReader.NextResult()
   в Npgsql.NpgsqlCommand.<Execute>d__71.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.<ExecuteDbDataReader>d__92.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   в ICSSoft.ST');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('a0ee2373-addc-71cc-d981-8f758eb4099f', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-05 22:18:17.905', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '9', NULL, 'Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.FirstName",
"Manager.LastName",
"Manager.MiddleName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.FirstName",
"Manager.LastName",
"Manager.MiddleName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.FirstName as "Manager.FirstName",
OrderManager0.LastName as "Manager.LastName",
OrderManager0.MiddleName as "Manager.MiddleName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY
WHERE ( STORMMainObjectKey = ''{08fbb421-59aa-4c7d-a008-52ddd0ded2d2}'')', 'ICSSoft.STORMNET.Business.ExecutingQueryException: Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.FirstName",
"Manager.LastName",
"Manager.MiddleName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.FirstName",
"Manager.LastName",
"Manager.MiddleName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.FirstName as "Manager.FirstName",
OrderManager0.LastName as "Manager.LastName",
OrderManager0.MiddleName as "Manager.MiddleName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY
WHERE ( STORMMainObjectKey = ''{08fbb421-59aa-4c7d-a008-52ddd0ded2d2}'') ---> Npgsql.PostgresException: 42601: ошибка синтаксиса (примерное положение: "=")
   в Npgsql.NpgsqlConnector.<DoReadMessage>d__155.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadExpecting>d__161`1.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlDataReader.<NextResult>d__32.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlDataReader.NextResult()
   в Npgsql.NpgsqlCommand.<Execute>d__71.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.<ExecuteDbDataReader>d__92.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   в ICSSoft.STORMNET.Business.SQLDataService.ReadFirst(String query, Object& sta');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('32178d0a-86c2-f979-0d6c-f13054867c7e', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-05 22:18:24.149', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '5', NULL, 'Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5', 'ICSSoft.STORMNET.Business.ExecutingQueryException: Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5 ---> Npgsql.PostgresException: 42601: ошибка синтаксиса (примерное положение: "=")
   в Npgsql.NpgsqlConnector.<DoReadMessage>d__155.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadExpecting>d__161`1.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlDataReader.<NextResult>d__32.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlDataReader.NextResult()
   в Npgsql.NpgsqlCommand.<Execute>d__71.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.<ExecuteDbDataReader>d__92.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   в ICSSoft.ST');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('a7c0da5a-fcee-41de-833e-da2bef256e08', 'ERROR', 0, 1, NULL, NULL, '2022-12-06 11:37:50.813', 'localhost', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 Edg/107.0.1418.62', 'http://localhost:4200/i-i-s-shop-order-e/new', 'EMBER-FLEXBERRY', 'ember-app', NULL, 'Builder is not defined', '{"name":"ReferenceError","message":"Builder is not defined","fileName":null,"lineNumber":null,"columnNumber":null,"stack":"ReferenceError: Builder is not defined\n    at Class.validate (http://localhost:4200/assets/ember-app.js:7828:21)\n    at http://localhost:4200/assets/vendor.js:157818:26\n    at http://localhost:4200/assets/vendor.js:157901:17\n    at Array.map (<anonymous>)\n    at generateValidationResultsFor (http://localhost:4200/assets/vendor.js:157878:23)\n    at Class.<anonymous> (http://localhost:4200/assets/vendor.js:157817:31)\n    at Class.<anonymous> (http://localhost:4200/assets/vendor.js:157204:19)\n    at ComputedPropertyPrototype.get (http://localhost:4200/assets/vendor.js:43859:28)\n    at get (http://localhost:4200/assets/vendor.js:43229:27)\n    at _getPath (http://localhost:4200/assets/vendor.js:43253:13)"}');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('3b23d97f-a7e1-9e6e-f782-e6783810367f', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-06 18:41:40.033', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '11', NULL, 'Не удалось загрузить файл или сборку "Shop.BusinessServers" либо одну из их зависимостей. Не удается найти указанный файл.', 'System.IO.FileNotFoundException: Не удалось загрузить файл или сборку "Shop.BusinessServers" либо одну из их зависимостей. Не удается найти указанный файл.
Имя файла: ''Shop.BusinessServers''
   в System.RuntimeTypeHandle.GetTypeByName(String name, Boolean throwOnError, Boolean ignoreCase, Boolean reflectionOnly, StackCrawlMarkHandle stackMark, IntPtr pPrivHostBinder, Boolean loadTypeFromPartialName, ObjectHandleOnStack type)
   в System.RuntimeTypeHandle.GetTypeByName(String name, Boolean throwOnError, Boolean ignoreCase, Boolean reflectionOnly, StackCrawlMark& stackMark, IntPtr pPrivHostBinder, Boolean loadTypeFromPartialName)
   в System.Type.GetType(String typeName, Boolean throwOnError, Boolean ignoreCase)
   в ICSSoft.STORMNET.Business.BusinessServerAttribute..ctor(String businessServerType, DataServiceObjectEvents serverEvents)
   в System.Reflection.CustomAttribute._CreateCaObject(RuntimeModule pModule, IRuntimeMethodInfo pCtor, Byte** ppBlob, Byte* pEndBlob, Int32* pcNamedArgs)
   в System.Reflection.CustomAttribute.CreateCaObject(RuntimeModule module, IRuntimeMethodInfo ctor, IntPtr& blob, IntPtr blobEnd, Int32& namedArgs)
   в System.Reflection.CustomAttribute.GetCustomAttributes(RuntimeModule decoratedModule, Int32 decoratedMetadataToken, Int32 pcaCount, RuntimeType attributeFilterType, Boolean mustBeInheritable, IList derivedAttributes, Boolean isDecoratedTargetSecurityTransparent)
   в System.Reflection.CustomAttribute.GetCustomAttributes(RuntimeType type, RuntimeType caType, Boolean inherit)
   в System.Attribute.GetCustomAttributes(MemberInfo element, Type type, Boolean inherit)
   в System.Reflection.CustomAttributeExtensions.GetCustomAttributes[T](MemberInfo element, Boolean inherit)
   в ICSSoft.STORMNET.Business.BusinessServerProvider.GetBusinessServerAttributes(Type type, DataServiceObjectEvents dsevent)
   в ICSSoft.STORMNET.Business.BusinessServerProvider.GetBusinessServerAttributesWithInherit(Type dataObjectType, DataServiceObjectEvents dsevent)
   в System.Collections.Concurrent.ConcurrentDictionary`2.GetOrAdd(TKey key, Func`2 valueFactory)
   в ICSSoft.STORMNET.Business.BusinessServerProvider.GetBusinessServer(Type dataObjectType, DataServiceObjectEvents dsevent, IDataService ds)
   в ICSSoft.STORMNET.Business.SQLDataService.GenerateQueriesForUpdateObjects(StringCollection deleteQueries, StringCollection deleteTables, StringCollection updateQueries, StringCollection updateFirstQueries, StringCollection updateLastQueries, StringCollection updateTables, StringCollection insertQueries, StringCollection insertTables, SortedList tableOperations, StringCollection queryOrder, Boolean checkLoadedProps, ArrayList processingObjects, DataObjectCache dataObjectCache, List`1 auditObjects, DbTransactionWrapper dbTransactionWrapper, DataObject[] dobjects)
   в ICSSoft.STORMNET.Business.SQLDataService.UpdateObjectsByExtConn(DataObject[]& objects, DataObjectCache dataObjectCache, Boolean alwaysThrowException, DbTransactionWrapper dbTransactionWrapper)
   в ICSSoft.STORMNET.Business.SQLDataService.UpdateObjects(DataObject[]& objects, DataObjectCache DataObjectCache, Boolean AlwaysThrowException)
   в NewPlatform.Flexberry.ORM.ODataService.Batch.DataObjectODataBatchHandler.UpdateObjects(IDataService dataService, List`1 dataObjectsToUpdate)
   в NewPlatform.Flexberry.ORM.ODataService.Batch.DataObjectODataBatchHandler.<ExecuteChangeSet>d__11.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()
   в NewPlatform.Flexberry.ORM.ODataService.Batch.DataObjectODataBatchHandler.<ExecuteRequestMessagesAsync>d__10.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionS');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('940c9053-cfad-4b8e-bda8-fd3502dd3151', 'ERROR', 0, 1, NULL, NULL, '2022-12-06 13:41:40.228', 'localhost', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 Edg/107.0.1418.62', 'http://localhost:4200/i-i-s-shop-order-e/new', 'EMBER-FLEXBERRY', 'ember-app', NULL, '[object Object]', '{"name":null,"message":null,"fileName":null,"lineNumber":null,"columnNumber":null,"stack":null}');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('2e477b0e-cfbe-3b9a-6906-168aab255d71', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-06 18:41:54.61', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '11', NULL, 'Не удалось загрузить файл или сборку "Shop.BusinessServers" либо одну из их зависимостей. Не удается найти указанный файл.', 'System.IO.FileNotFoundException: Не удалось загрузить файл или сборку "Shop.BusinessServers" либо одну из их зависимостей. Не удается найти указанный файл.
Имя файла: ''Shop.BusinessServers''
   в System.RuntimeTypeHandle.GetTypeByName(String name, Boolean throwOnError, Boolean ignoreCase, Boolean reflectionOnly, StackCrawlMarkHandle stackMark, IntPtr pPrivHostBinder, Boolean loadTypeFromPartialName, ObjectHandleOnStack type)
   в System.RuntimeTypeHandle.GetTypeByName(String name, Boolean throwOnError, Boolean ignoreCase, Boolean reflectionOnly, StackCrawlMark& stackMark, IntPtr pPrivHostBinder, Boolean loadTypeFromPartialName)
   в System.Type.GetType(String typeName, Boolean throwOnError, Boolean ignoreCase)
   в ICSSoft.STORMNET.Business.BusinessServerAttribute..ctor(String businessServerType, DataServiceObjectEvents serverEvents)
   в System.Reflection.CustomAttribute._CreateCaObject(RuntimeModule pModule, IRuntimeMethodInfo pCtor, Byte** ppBlob, Byte* pEndBlob, Int32* pcNamedArgs)
   в System.Reflection.CustomAttribute.CreateCaObject(RuntimeModule module, IRuntimeMethodInfo ctor, IntPtr& blob, IntPtr blobEnd, Int32& namedArgs)
   в System.Reflection.CustomAttribute.GetCustomAttributes(RuntimeModule decoratedModule, Int32 decoratedMetadataToken, Int32 pcaCount, RuntimeType attributeFilterType, Boolean mustBeInheritable, IList derivedAttributes, Boolean isDecoratedTargetSecurityTransparent)
   в System.Reflection.CustomAttribute.GetCustomAttributes(RuntimeType type, RuntimeType caType, Boolean inherit)
   в System.Attribute.GetCustomAttributes(MemberInfo element, Type type, Boolean inherit)
   в System.Reflection.CustomAttributeExtensions.GetCustomAttributes[T](MemberInfo element, Boolean inherit)
   в ICSSoft.STORMNET.Business.BusinessServerProvider.GetBusinessServerAttributes(Type type, DataServiceObjectEvents dsevent)
   в ICSSoft.STORMNET.Business.BusinessServerProvider.GetBusinessServerAttributesWithInherit(Type dataObjectType, DataServiceObjectEvents dsevent)
   в System.Collections.Concurrent.ConcurrentDictionary`2.GetOrAdd(TKey key, Func`2 valueFactory)
   в ICSSoft.STORMNET.Business.BusinessServerProvider.GetBusinessServer(Type dataObjectType, DataServiceObjectEvents dsevent, IDataService ds)
   в ICSSoft.STORMNET.Business.SQLDataService.GenerateQueriesForUpdateObjects(StringCollection deleteQueries, StringCollection deleteTables, StringCollection updateQueries, StringCollection updateFirstQueries, StringCollection updateLastQueries, StringCollection updateTables, StringCollection insertQueries, StringCollection insertTables, SortedList tableOperations, StringCollection queryOrder, Boolean checkLoadedProps, ArrayList processingObjects, DataObjectCache dataObjectCache, List`1 auditObjects, DbTransactionWrapper dbTransactionWrapper, DataObject[] dobjects)
   в ICSSoft.STORMNET.Business.SQLDataService.UpdateObjectsByExtConn(DataObject[]& objects, DataObjectCache dataObjectCache, Boolean alwaysThrowException, DbTransactionWrapper dbTransactionWrapper)
   в ICSSoft.STORMNET.Business.SQLDataService.UpdateObjects(DataObject[]& objects, DataObjectCache DataObjectCache, Boolean AlwaysThrowException)
   в NewPlatform.Flexberry.ORM.ODataService.Batch.DataObjectODataBatchHandler.UpdateObjects(IDataService dataService, List`1 dataObjectsToUpdate)
   в NewPlatform.Flexberry.ORM.ODataService.Batch.DataObjectODataBatchHandler.<ExecuteChangeSet>d__11.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()
   в NewPlatform.Flexberry.ORM.ODataService.Batch.DataObjectODataBatchHandler.<ExecuteRequestMessagesAsync>d__10.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionS');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('a5862667-bd4e-b808-16d7-d3e57a19dc5e', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-06 18:43:40.026', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '5', NULL, 'Не удалось загрузить файл или сборку "Shop.BusinessServers" либо одну из их зависимостей. Не удается найти указанный файл.', 'System.IO.FileNotFoundException: Не удалось загрузить файл или сборку "Shop.BusinessServers" либо одну из их зависимостей. Не удается найти указанный файл.
Имя файла: ''Shop.BusinessServers''
   в System.RuntimeTypeHandle.GetTypeByName(String name, Boolean throwOnError, Boolean ignoreCase, Boolean reflectionOnly, StackCrawlMarkHandle stackMark, IntPtr pPrivHostBinder, Boolean loadTypeFromPartialName, ObjectHandleOnStack type)
   в System.RuntimeTypeHandle.GetTypeByName(String name, Boolean throwOnError, Boolean ignoreCase, Boolean reflectionOnly, StackCrawlMark& stackMark, IntPtr pPrivHostBinder, Boolean loadTypeFromPartialName)
   в System.Type.GetType(String typeName, Boolean throwOnError, Boolean ignoreCase)
   в ICSSoft.STORMNET.Business.BusinessServerAttribute..ctor(String businessServerType, DataServiceObjectEvents serverEvents)
   в System.Reflection.CustomAttribute._CreateCaObject(RuntimeModule pModule, IRuntimeMethodInfo pCtor, Byte** ppBlob, Byte* pEndBlob, Int32* pcNamedArgs)
   в System.Reflection.CustomAttribute.CreateCaObject(RuntimeModule module, IRuntimeMethodInfo ctor, IntPtr& blob, IntPtr blobEnd, Int32& namedArgs)
   в System.Reflection.CustomAttribute.GetCustomAttributes(RuntimeModule decoratedModule, Int32 decoratedMetadataToken, Int32 pcaCount, RuntimeType attributeFilterType, Boolean mustBeInheritable, IList derivedAttributes, Boolean isDecoratedTargetSecurityTransparent)
   в System.Reflection.CustomAttribute.GetCustomAttributes(RuntimeType type, RuntimeType caType, Boolean inherit)
   в System.Attribute.GetCustomAttributes(MemberInfo element, Type type, Boolean inherit)
   в System.Reflection.CustomAttributeExtensions.GetCustomAttributes[T](MemberInfo element, Boolean inherit)
   в ICSSoft.STORMNET.Business.BusinessServerProvider.GetBusinessServerAttributes(Type type, DataServiceObjectEvents dsevent)
   в ICSSoft.STORMNET.Business.BusinessServerProvider.GetBusinessServerAttributesWithInherit(Type dataObjectType, DataServiceObjectEvents dsevent)
   в System.Collections.Concurrent.ConcurrentDictionary`2.GetOrAdd(TKey key, Func`2 valueFactory)
   в ICSSoft.STORMNET.Business.BusinessServerProvider.GetBusinessServer(Type dataObjectType, DataServiceObjectEvents dsevent, IDataService ds)
   в ICSSoft.STORMNET.Business.SQLDataService.GenerateQueriesForUpdateObjects(StringCollection deleteQueries, StringCollection deleteTables, StringCollection updateQueries, StringCollection updateFirstQueries, StringCollection updateLastQueries, StringCollection updateTables, StringCollection insertQueries, StringCollection insertTables, SortedList tableOperations, StringCollection queryOrder, Boolean checkLoadedProps, ArrayList processingObjects, DataObjectCache dataObjectCache, List`1 auditObjects, DbTransactionWrapper dbTransactionWrapper, DataObject[] dobjects)
   в ICSSoft.STORMNET.Business.SQLDataService.UpdateObjectsByExtConn(DataObject[]& objects, DataObjectCache dataObjectCache, Boolean alwaysThrowException, DbTransactionWrapper dbTransactionWrapper)
   в ICSSoft.STORMNET.Business.SQLDataService.UpdateObjects(DataObject[]& objects, DataObjectCache DataObjectCache, Boolean AlwaysThrowException)
   в NewPlatform.Flexberry.ORM.ODataService.Batch.DataObjectODataBatchHandler.UpdateObjects(IDataService dataService, List`1 dataObjectsToUpdate)
   в NewPlatform.Flexberry.ORM.ODataService.Batch.DataObjectODataBatchHandler.<ExecuteChangeSet>d__11.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()
   в NewPlatform.Flexberry.ORM.ODataService.Batch.DataObjectODataBatchHandler.<ExecuteRequestMessagesAsync>d__10.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionS');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('d3ce5368-8dbd-7cf9-9218-281e1d890208', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-06 18:43:55.294', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '9', NULL, 'Не удалось загрузить файл или сборку "Shop.BusinessServers" либо одну из их зависимостей. Не удается найти указанный файл.', 'System.IO.FileNotFoundException: Не удалось загрузить файл или сборку "Shop.BusinessServers" либо одну из их зависимостей. Не удается найти указанный файл.
Имя файла: ''Shop.BusinessServers''
   в System.RuntimeTypeHandle.GetTypeByName(String name, Boolean throwOnError, Boolean ignoreCase, Boolean reflectionOnly, StackCrawlMarkHandle stackMark, IntPtr pPrivHostBinder, Boolean loadTypeFromPartialName, ObjectHandleOnStack type)
   в System.RuntimeTypeHandle.GetTypeByName(String name, Boolean throwOnError, Boolean ignoreCase, Boolean reflectionOnly, StackCrawlMark& stackMark, IntPtr pPrivHostBinder, Boolean loadTypeFromPartialName)
   в System.Type.GetType(String typeName, Boolean throwOnError, Boolean ignoreCase)
   в ICSSoft.STORMNET.Business.BusinessServerAttribute..ctor(String businessServerType, DataServiceObjectEvents serverEvents)
   в System.Reflection.CustomAttribute._CreateCaObject(RuntimeModule pModule, IRuntimeMethodInfo pCtor, Byte** ppBlob, Byte* pEndBlob, Int32* pcNamedArgs)
   в System.Reflection.CustomAttribute.CreateCaObject(RuntimeModule module, IRuntimeMethodInfo ctor, IntPtr& blob, IntPtr blobEnd, Int32& namedArgs)
   в System.Reflection.CustomAttribute.GetCustomAttributes(RuntimeModule decoratedModule, Int32 decoratedMetadataToken, Int32 pcaCount, RuntimeType attributeFilterType, Boolean mustBeInheritable, IList derivedAttributes, Boolean isDecoratedTargetSecurityTransparent)
   в System.Reflection.CustomAttribute.GetCustomAttributes(RuntimeType type, RuntimeType caType, Boolean inherit)
   в System.Attribute.GetCustomAttributes(MemberInfo element, Type type, Boolean inherit)
   в System.Reflection.CustomAttributeExtensions.GetCustomAttributes[T](MemberInfo element, Boolean inherit)
   в ICSSoft.STORMNET.Business.BusinessServerProvider.GetBusinessServerAttributes(Type type, DataServiceObjectEvents dsevent)
   в ICSSoft.STORMNET.Business.BusinessServerProvider.GetBusinessServerAttributesWithInherit(Type dataObjectType, DataServiceObjectEvents dsevent)
   в System.Collections.Concurrent.ConcurrentDictionary`2.GetOrAdd(TKey key, Func`2 valueFactory)
   в ICSSoft.STORMNET.Business.BusinessServerProvider.GetBusinessServer(Type dataObjectType, DataServiceObjectEvents dsevent, IDataService ds)
   в ICSSoft.STORMNET.Business.SQLDataService.GenerateQueriesForUpdateObjects(StringCollection deleteQueries, StringCollection deleteTables, StringCollection updateQueries, StringCollection updateFirstQueries, StringCollection updateLastQueries, StringCollection updateTables, StringCollection insertQueries, StringCollection insertTables, SortedList tableOperations, StringCollection queryOrder, Boolean checkLoadedProps, ArrayList processingObjects, DataObjectCache dataObjectCache, List`1 auditObjects, DbTransactionWrapper dbTransactionWrapper, DataObject[] dobjects)
   в ICSSoft.STORMNET.Business.SQLDataService.UpdateObjectsByExtConn(DataObject[]& objects, DataObjectCache dataObjectCache, Boolean alwaysThrowException, DbTransactionWrapper dbTransactionWrapper)
   в ICSSoft.STORMNET.Business.SQLDataService.UpdateObjects(DataObject[]& objects, DataObjectCache DataObjectCache, Boolean AlwaysThrowException)
   в NewPlatform.Flexberry.ORM.ODataService.Batch.DataObjectODataBatchHandler.UpdateObjects(IDataService dataService, List`1 dataObjectsToUpdate)
   в NewPlatform.Flexberry.ORM.ODataService.Batch.DataObjectODataBatchHandler.<ExecuteChangeSet>d__11.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()
   в NewPlatform.Flexberry.ORM.ODataService.Batch.DataObjectODataBatchHandler.<ExecuteRequestMessagesAsync>d__10.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionS');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('8ec6468e-05fb-3094-16f2-68a29a8dada0', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-06 18:44:29.132', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '16', NULL, 'Не удалось загрузить файл или сборку "Shop.BusinessServers" либо одну из их зависимостей. Не удается найти указанный файл.', 'System.IO.FileNotFoundException: Не удалось загрузить файл или сборку "Shop.BusinessServers" либо одну из их зависимостей. Не удается найти указанный файл.
Имя файла: ''Shop.BusinessServers''
   в System.RuntimeTypeHandle.GetTypeByName(String name, Boolean throwOnError, Boolean ignoreCase, Boolean reflectionOnly, StackCrawlMarkHandle stackMark, IntPtr pPrivHostBinder, Boolean loadTypeFromPartialName, ObjectHandleOnStack type)
   в System.RuntimeTypeHandle.GetTypeByName(String name, Boolean throwOnError, Boolean ignoreCase, Boolean reflectionOnly, StackCrawlMark& stackMark, IntPtr pPrivHostBinder, Boolean loadTypeFromPartialName)
   в System.Type.GetType(String typeName, Boolean throwOnError, Boolean ignoreCase)
   в ICSSoft.STORMNET.Business.BusinessServerAttribute..ctor(String businessServerType, DataServiceObjectEvents serverEvents)
   в System.Reflection.CustomAttribute._CreateCaObject(RuntimeModule pModule, IRuntimeMethodInfo pCtor, Byte** ppBlob, Byte* pEndBlob, Int32* pcNamedArgs)
   в System.Reflection.CustomAttribute.CreateCaObject(RuntimeModule module, IRuntimeMethodInfo ctor, IntPtr& blob, IntPtr blobEnd, Int32& namedArgs)
   в System.Reflection.CustomAttribute.GetCustomAttributes(RuntimeModule decoratedModule, Int32 decoratedMetadataToken, Int32 pcaCount, RuntimeType attributeFilterType, Boolean mustBeInheritable, IList derivedAttributes, Boolean isDecoratedTargetSecurityTransparent)
   в System.Reflection.CustomAttribute.GetCustomAttributes(RuntimeType type, RuntimeType caType, Boolean inherit)
   в System.Attribute.GetCustomAttributes(MemberInfo element, Type type, Boolean inherit)
   в System.Reflection.CustomAttributeExtensions.GetCustomAttributes[T](MemberInfo element, Boolean inherit)
   в ICSSoft.STORMNET.Business.BusinessServerProvider.GetBusinessServerAttributes(Type type, DataServiceObjectEvents dsevent)
   в ICSSoft.STORMNET.Business.BusinessServerProvider.GetBusinessServerAttributesWithInherit(Type dataObjectType, DataServiceObjectEvents dsevent)
   в System.Collections.Concurrent.ConcurrentDictionary`2.GetOrAdd(TKey key, Func`2 valueFactory)
   в ICSSoft.STORMNET.Business.BusinessServerProvider.GetBusinessServer(Type dataObjectType, DataServiceObjectEvents dsevent, IDataService ds)
   в ICSSoft.STORMNET.Business.SQLDataService.AddDeletedViewToDeleteDictionary(View view, IDictionary`2 deleteDictionary, Object mainkey, DataObject[]& updateobjects, StringCollection DeleteTables, SortedList TableOperations, DataObjectCache DataObjectCache, DbTransactionWrapper dbTransactionWrapper)
   в ICSSoft.STORMNET.Business.SQLDataService.GenerateQueriesForUpdateObjects(StringCollection deleteQueries, StringCollection deleteTables, StringCollection updateQueries, StringCollection updateFirstQueries, StringCollection updateLastQueries, StringCollection updateTables, StringCollection insertQueries, StringCollection insertTables, SortedList tableOperations, StringCollection queryOrder, Boolean checkLoadedProps, ArrayList processingObjects, DataObjectCache dataObjectCache, List`1 auditObjects, DbTransactionWrapper dbTransactionWrapper, DataObject[] dobjects)
   в ICSSoft.STORMNET.Business.SQLDataService.UpdateObjectsByExtConn(DataObject[]& objects, DataObjectCache dataObjectCache, Boolean alwaysThrowException, DbTransactionWrapper dbTransactionWrapper)
   в ICSSoft.STORMNET.Business.SQLDataService.UpdateObjects(DataObject[]& objects, DataObjectCache DataObjectCache, Boolean AlwaysThrowException)
   в NewPlatform.Flexberry.ORM.ODataService.Controllers.DataObjectController.DeleteEntity(Object key)

Предупреждение: регистрация привязки сборок выключена.
Чтобы включить регистрацию ошибок привязки сборок, установите значение параметра реестра [HKLM\Software\Microsoft\Fusion!EnableLog] (DWORD) в 1.
Примечание. Регистрация ошибок привязки сборок может привести к некоторому снижению производительности.
Чтобы отключить эту функцию, удалите параметр реестра [HKLM\Software\Microsoft\Fusion!EnableLog].
');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('71367e51-f457-f42f-eb74-60b041669b17', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-06 18:44:36.604', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '9', NULL, 'Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5', 'ICSSoft.STORMNET.Business.ExecutingQueryException: Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5 ---> Npgsql.PostgresException: 42601: ошибка синтаксиса (примерное положение: "=")
   в Npgsql.NpgsqlConnector.<DoReadMessage>d__155.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadExpecting>d__161`1.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlDataReader.<NextResult>d__32.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlDataReader.NextResult()
   в Npgsql.NpgsqlCommand.<Execute>d__71.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.<ExecuteDbDataReader>d__92.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   в ICSSoft.ST');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('3a257a14-6dd5-3253-d5eb-e2f73cff36d3', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-06 18:44:44.516', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '11', NULL, 'Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5', 'ICSSoft.STORMNET.Business.ExecutingQueryException: Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5 ---> Npgsql.PostgresException: 42601: ошибка синтаксиса (примерное положение: "=")
   в Npgsql.NpgsqlConnector.<DoReadMessage>d__155.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadExpecting>d__161`1.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlDataReader.<NextResult>d__32.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlDataReader.NextResult()
   в Npgsql.NpgsqlCommand.<Execute>d__71.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.<ExecuteDbDataReader>d__92.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   в ICSSoft.ST');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('7caff371-4f31-2907-8602-4bfdc9ae29da', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-06 19:16:27.542', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '9', NULL, 'Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5', 'ICSSoft.STORMNET.Business.ExecutingQueryException: Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5 ---> Npgsql.PostgresException: 42601: ошибка синтаксиса (примерное положение: "=")
   в Npgsql.NpgsqlConnector.<DoReadMessage>d__155.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadExpecting>d__161`1.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlDataReader.<NextResult>d__32.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlDataReader.NextResult()
   в Npgsql.NpgsqlCommand.<Execute>d__71.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.<ExecuteDbDataReader>d__92.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   в ICSSoft.ST');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('6f7eb561-9b9e-8355-d6f7-a4333d45be42', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-06 19:17:42.057', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '13', NULL, 'Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5', 'ICSSoft.STORMNET.Business.ExecutingQueryException: Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5 ---> Npgsql.PostgresException: 42601: ошибка синтаксиса (примерное положение: "=")
   в Npgsql.NpgsqlConnector.<DoReadMessage>d__155.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadExpecting>d__161`1.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlDataReader.<NextResult>d__32.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlDataReader.NextResult()
   в Npgsql.NpgsqlCommand.<Execute>d__71.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.<ExecuteDbDataReader>d__92.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   в ICSSoft.ST');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('12c227a3-5979-6df5-5c4f-847c15ca4545', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-06 19:49:00.26', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '9', NULL, 'Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5', 'ICSSoft.STORMNET.Business.ExecutingQueryException: Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5 ---> Npgsql.PostgresException: 42601: ошибка синтаксиса (примерное положение: "=")
   в Npgsql.NpgsqlConnector.<DoReadMessage>d__155.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadExpecting>d__161`1.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlDataReader.<NextResult>d__32.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlDataReader.NextResult()
   в Npgsql.NpgsqlCommand.<Execute>d__71.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.<ExecuteDbDataReader>d__92.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   в ICSSoft.ST');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('b979b50b-1d07-5315-03e1-14a1186bc61f', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-06 19:50:09.401', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '10', NULL, 'Не удалось загрузить файл или сборку "Shop.BusinessServers" либо одну из их зависимостей. Не удается найти указанный файл.', 'System.IO.FileNotFoundException: Не удалось загрузить файл или сборку "Shop.BusinessServers" либо одну из их зависимостей. Не удается найти указанный файл.
Имя файла: ''Shop.BusinessServers''
   в System.RuntimeTypeHandle.GetTypeByName(String name, Boolean throwOnError, Boolean ignoreCase, Boolean reflectionOnly, StackCrawlMarkHandle stackMark, IntPtr pPrivHostBinder, Boolean loadTypeFromPartialName, ObjectHandleOnStack type)
   в System.RuntimeTypeHandle.GetTypeByName(String name, Boolean throwOnError, Boolean ignoreCase, Boolean reflectionOnly, StackCrawlMark& stackMark, IntPtr pPrivHostBinder, Boolean loadTypeFromPartialName)
   в System.Type.GetType(String typeName, Boolean throwOnError, Boolean ignoreCase)
   в ICSSoft.STORMNET.Business.BusinessServerAttribute..ctor(String businessServerType, DataServiceObjectEvents serverEvents)
   в System.Reflection.CustomAttribute._CreateCaObject(RuntimeModule pModule, IRuntimeMethodInfo pCtor, Byte** ppBlob, Byte* pEndBlob, Int32* pcNamedArgs)
   в System.Reflection.CustomAttribute.CreateCaObject(RuntimeModule module, IRuntimeMethodInfo ctor, IntPtr& blob, IntPtr blobEnd, Int32& namedArgs)
   в System.Reflection.CustomAttribute.GetCustomAttributes(RuntimeModule decoratedModule, Int32 decoratedMetadataToken, Int32 pcaCount, RuntimeType attributeFilterType, Boolean mustBeInheritable, IList derivedAttributes, Boolean isDecoratedTargetSecurityTransparent)
   в System.Reflection.CustomAttribute.GetCustomAttributes(RuntimeType type, RuntimeType caType, Boolean inherit)
   в System.Attribute.GetCustomAttributes(MemberInfo element, Type type, Boolean inherit)
   в System.Reflection.CustomAttributeExtensions.GetCustomAttributes[T](MemberInfo element, Boolean inherit)
   в ICSSoft.STORMNET.Business.BusinessServerProvider.GetBusinessServerAttributes(Type type, DataServiceObjectEvents dsevent)
   в ICSSoft.STORMNET.Business.BusinessServerProvider.GetBusinessServerAttributesWithInherit(Type dataObjectType, DataServiceObjectEvents dsevent)
   в System.Collections.Concurrent.ConcurrentDictionary`2.GetOrAdd(TKey key, Func`2 valueFactory)
   в ICSSoft.STORMNET.Business.BusinessServerProvider.GetBusinessServer(Type dataObjectType, DataServiceObjectEvents dsevent, IDataService ds)
   в ICSSoft.STORMNET.Business.SQLDataService.AddDeletedViewToDeleteDictionary(View view, IDictionary`2 deleteDictionary, Object mainkey, DataObject[]& updateobjects, StringCollection DeleteTables, SortedList TableOperations, DataObjectCache DataObjectCache, DbTransactionWrapper dbTransactionWrapper)
   в ICSSoft.STORMNET.Business.SQLDataService.GenerateQueriesForUpdateObjects(StringCollection deleteQueries, StringCollection deleteTables, StringCollection updateQueries, StringCollection updateFirstQueries, StringCollection updateLastQueries, StringCollection updateTables, StringCollection insertQueries, StringCollection insertTables, SortedList tableOperations, StringCollection queryOrder, Boolean checkLoadedProps, ArrayList processingObjects, DataObjectCache dataObjectCache, List`1 auditObjects, DbTransactionWrapper dbTransactionWrapper, DataObject[] dobjects)
   в ICSSoft.STORMNET.Business.SQLDataService.UpdateObjectsByExtConn(DataObject[]& objects, DataObjectCache dataObjectCache, Boolean alwaysThrowException, DbTransactionWrapper dbTransactionWrapper)
   в ICSSoft.STORMNET.Business.SQLDataService.UpdateObjects(DataObject[]& objects, DataObjectCache DataObjectCache, Boolean AlwaysThrowException)
   в NewPlatform.Flexberry.ORM.ODataService.Controllers.DataObjectController.DeleteEntity(Object key)

Предупреждение: регистрация привязки сборок выключена.
Чтобы включить регистрацию ошибок привязки сборок, установите значение параметра реестра [HKLM\Software\Microsoft\Fusion!EnableLog] (DWORD) в 1.
Примечание. Регистрация ошибок привязки сборок может привести к некоторому снижению производительности.
Чтобы отключить эту функцию, удалите параметр реестра [HKLM\Software\Microsoft\Fusion!EnableLog].
');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('855a6f5f-ebd7-01bd-6a3d-84665f241838', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-06 19:50:27.691', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '18', NULL, 'Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5', 'ICSSoft.STORMNET.Business.ExecutingQueryException: Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5 ---> Npgsql.PostgresException: 42601: ошибка синтаксиса (примерное положение: "=")
   в Npgsql.NpgsqlConnector.<DoReadMessage>d__155.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadExpecting>d__161`1.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlDataReader.<NextResult>d__32.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlDataReader.NextResult()
   в Npgsql.NpgsqlCommand.<Execute>d__71.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.<ExecuteDbDataReader>d__92.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   в ICSSoft.ST');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('a30da378-7d7d-30bc-179c-a57c89bd9f31', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-06 19:50:31.981', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '6', NULL, 'Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5', 'ICSSoft.STORMNET.Business.ExecutingQueryException: Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5 ---> Npgsql.PostgresException: 42601: ошибка синтаксиса (примерное положение: "=")
   в Npgsql.NpgsqlConnector.<DoReadMessage>d__155.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadExpecting>d__161`1.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlDataReader.<NextResult>d__32.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlDataReader.NextResult()
   в Npgsql.NpgsqlCommand.<Execute>d__71.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.<ExecuteDbDataReader>d__92.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   в ICSSoft.ST');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('7cd359d9-da03-10af-784f-1c73faf73319', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-06 20:32:27.961', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '9', NULL, 'Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5', 'ICSSoft.STORMNET.Business.ExecutingQueryException: Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5 ---> Npgsql.PostgresException: 42601: ошибка синтаксиса (примерное положение: "=")
   в Npgsql.NpgsqlConnector.<DoReadMessage>d__155.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadExpecting>d__161`1.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlDataReader.<NextResult>d__32.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlDataReader.NextResult()
   в Npgsql.NpgsqlCommand.<Execute>d__71.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.<ExecuteDbDataReader>d__92.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   в ICSSoft.ST');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('f8ac2d23-89f8-e92b-3542-564494297d22', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-06 20:32:53.61', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '9', NULL, 'Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5', 'ICSSoft.STORMNET.Business.ExecutingQueryException: Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5 ---> Npgsql.PostgresException: 42601: ошибка синтаксиса (примерное положение: "=")
   в Npgsql.NpgsqlConnector.<DoReadMessage>d__155.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadExpecting>d__161`1.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlDataReader.<NextResult>d__32.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlDataReader.NextResult()
   в Npgsql.NpgsqlCommand.<Execute>d__71.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.<ExecuteDbDataReader>d__92.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   в ICSSoft.ST');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('a4803e44-4e95-ab28-a0e4-0dc972aacd06', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-06 20:35:57.4', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '9', NULL, 'Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5', 'ICSSoft.STORMNET.Business.ExecutingQueryException: Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5 ---> Npgsql.PostgresException: 42601: ошибка синтаксиса (примерное положение: "=")
   в Npgsql.NpgsqlConnector.<DoReadMessage>d__155.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadExpecting>d__161`1.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlDataReader.<NextResult>d__32.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlDataReader.NextResult()
   в Npgsql.NpgsqlCommand.<Execute>d__71.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.<ExecuteDbDataReader>d__92.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   в ICSSoft.ST');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('adfe8ac8-a283-bffc-2df9-61b12319f691', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-06 20:36:02.45', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '11', NULL, 'Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5', 'ICSSoft.STORMNET.Business.ExecutingQueryException: Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5 ---> Npgsql.PostgresException: 42601: ошибка синтаксиса (примерное положение: "=")
   в Npgsql.NpgsqlConnector.<DoReadMessage>d__155.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadExpecting>d__161`1.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlDataReader.<NextResult>d__32.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlDataReader.NextResult()
   в Npgsql.NpgsqlCommand.<Execute>d__71.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.<ExecuteDbDataReader>d__92.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   в ICSSoft.ST');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('edc3722c-3afd-ff3a-e645-28c1c935559f', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-06 20:36:03.992', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '10', NULL, 'Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5', 'ICSSoft.STORMNET.Business.ExecutingQueryException: Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5 ---> Npgsql.PostgresException: 42601: ошибка синтаксиса (примерное положение: "=")
   в Npgsql.NpgsqlConnector.<DoReadMessage>d__155.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadExpecting>d__161`1.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlDataReader.<NextResult>d__32.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlDataReader.NextResult()
   в Npgsql.NpgsqlCommand.<Execute>d__71.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.<ExecuteDbDataReader>d__92.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   в ICSSoft.ST');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('11d85228-11a4-df53-3b8f-2930b46436ed', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-06 22:49:18.887', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '29', NULL, 'Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5', 'ICSSoft.STORMNET.Business.ExecutingQueryException: Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5 ---> Npgsql.PostgresException: 42601: ошибка синтаксиса (примерное положение: "=")
   в Npgsql.NpgsqlConnector.<DoReadMessage>d__155.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadExpecting>d__161`1.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlDataReader.<NextResult>d__32.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlDataReader.NextResult()
   в Npgsql.NpgsqlCommand.<Execute>d__71.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.<ExecuteDbDataReader>d__92.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   в ICSSoft.ST');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('4d3efa17-f545-ecc5-e45b-6e5f50f446da', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-06 22:50:47.41', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '29', NULL, 'Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5', 'ICSSoft.STORMNET.Business.ExecutingQueryException: Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5 ---> Npgsql.PostgresException: 42601: ошибка синтаксиса (примерное положение: "=")
   в Npgsql.NpgsqlConnector.<DoReadMessage>d__155.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadExpecting>d__161`1.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlDataReader.<NextResult>d__32.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlDataReader.NextResult()
   в Npgsql.NpgsqlCommand.<Execute>d__71.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.<ExecuteDbDataReader>d__92.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   в ICSSoft.ST');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('cd1b3600-11c6-4a1f-a9be-896a70637c07', 'ERROR', 0, 1, NULL, NULL, '2022-12-06 17:50:47.421', 'localhost', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 Edg/107.0.1418.62', 'http://localhost:4200/i-i-s-shop-invoice-e/new', 'EMBER-FLEXBERRY', 'ember-app', NULL, 'Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5', '{"name":"Error","message":"Error on executing:\r\nSELECT __PrimaryKey,\r\nCreateDate,\r\nManager,\r\n\"Manager.__PrimaryKey\",\r\n\"Manager.LastName\",\r\nNumber,\r\nPaymentDate,\r\nShipmentDate,\r\nStatus,\r\nTotalSum,\r\nSTORMMainObjectKey,\r\nSTORMJoinedMasterKey0,\r\nSTORMJoinedMasterKey1,\r\nSTORMJoinedMasterKey2,\r\nSTORMNETDATAOBJECTTYPE\r\nFROM (\r\nSELECT __PrimaryKey,\r\nCreateDate,\r\nManager,\r\n\"Manager.__PrimaryKey\",\r\n\"Manager.LastName\",\r\nNumber,\r\nPaymentDate,\r\nShipmentDate,\r\nStatus,\r\nTotalSum,\r\nSTORMMainObjectKey,\r\nSTORMJoinedMasterKey0,\r\nSTORMJoinedMasterKey1,\r\nSTORMJoinedMasterKey2,\r\nSTORMNETDATAOBJECTTYPE\r\nFROM (\r\nSELECT \r\n__PrimaryKey,\r\nCreateDate,\r\nManager,\r\n\"Manager.__PrimaryKey\",\r\n\"Manager.LastName\",\r\nNumber,\r\nPaymentDate,\r\nShipmentDate,\r\nStatus,\r\n(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,\r\nSTORMMainObjectKey,\r\nSTORMJoinedMasterKey0,\r\nSTORMJoinedMasterKey1,\r\nSTORMJoinedMasterKey2,\r\ncast(0 as numeric) as STORMNETDATAOBJECTTYPE\r\nFROM \r\n( SELECT \r\nOrder0.primaryKey as __PrimaryKey,\r\nOrder0.CreateDate as CreateDate,\r\nOrder0.Manager as Manager,\r\nOrder0.Manager as \"Manager.__PrimaryKey\",\r\nOrderManager0.LastName as \"Manager.LastName\",\r\nOrder0.Number as Number,\r\nOrder0.PaymentDate as PaymentDate,\r\nOrder0.ShipmentDate as ShipmentDate,\r\nOrder0.Status as Status,\r\nNULL as TotalSum,\r\nOrder0.primaryKey as STORMMainObjectKey,\r\nOrderManager0.primaryKey as STORMJoinedMasterKey0,\r\nOrder0.Manager as STORMJoinedMasterKey1,\r\nOrder0.Manager as STORMJoinedMasterKey2,\r\ncast(0 as numeric) as STORMNETDATAOBJECTTYPE\r\nFROM \r\n(\"Order\" Order0 \r\n\t LEFT JOIN  Employee OrderManager0\r\n\t ON Order0.Manager = OrderManager0.primaryKey))\"IIS.Shop.Order\"\r\n) STORMGENERATEDQUERY) rn\r\n\r\nORDER BY STORMMainObjectKey\r\n OFFSET 0 LIMIT 5","fileName":null,"lineNumber":null,"columnNumber":null,"stack":"Error: Error on executing:\r\nSELECT __PrimaryKey,\r\nCreateDate,\r\nManager,\r\n\"Manager.__PrimaryKey\",\r\n\"Manager.LastName\",\r\nNumber,\r\nPaymentDate,\r\nShipmentDate,\r\nStatus,\r\nTotalSum,\r\nSTORMMainObjectKey,\r\nSTORMJoinedMasterKey0,\r\nSTORMJoinedMasterKey1,\r\nSTORMJoinedMasterKey2,\r\nSTORMNETDATAOBJECTTYPE\r\nFROM (\r\nSELECT __PrimaryKey,\r\nCreateDate,\r\nManager,\r\n\"Manager.__PrimaryKey\",\r\n\"Manager.LastName\",\r\nNumber,\r\nPaymentDate,\r\nShipmentDate,\r\nStatus,\r\nTotalSum,\r\nSTORMMainObjectKey,\r\nSTORMJoinedMasterKey0,\r\nSTORMJoinedMasterKey1,\r\nSTORMJoinedMasterKey2,\r\nSTORMNETDATAOBJECTTYPE\r\nFROM (\r\nSELECT \r\n__PrimaryKey,\r\nCreateDate,\r\nManager,\r\n\"Manager.__PrimaryKey\",\r\n\"Manager.LastName\",\r\nNumber,\r\nPaymentDate,\r\nShipmentDate,\r\nStatus,\r\n(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,\r\nSTORMMainObjectKey,\r\nSTORMJoinedMasterKey0,\r\nSTORMJoinedMasterKey1,\r\nSTORMJoinedMasterKey2,\r\ncast(0 as numeric) as STORMNETDATAOBJECTTYPE\r\nFROM \r\n( SELECT \r\nOrder0.primaryKey as __PrimaryKey,\r\nOrder0.CreateDate as CreateDate,\r\nOrder0.Manager as Manager,\r\nOrder0.Manager as \"Manager.__PrimaryKey\",\r\nOrderManager0.LastName as \"Manager.LastName\",\r\nOrder0.Number as Number,\r\nOrder0.PaymentDate as PaymentDate,\r\nOrder0.ShipmentDate as ShipmentDate,\r\nOrder0.Status as Status,\r\nNULL as TotalSum,\r\nOrder0.primaryKey as STORMMainObjectKey,\r\nOrderManager0.primaryKey as STORMJoinedMasterKey0,\r\nOrder0.Manager as STORMJoinedMasterKey1,\r\nOrder0.Manager as STORMJoinedMasterKey2,\r\ncast(0 as numeric) as STORMNETDATAOBJECTTYPE\r\nFROM \r\n(\"Order\" Order0 \r\n\t LEFT JOIN  Employee OrderManager0\r\n\t ON Order0.Manager = OrderManager0.primaryKey))\"IIS.Shop.Order\"\r\n) STORMGENERATEDQUERY) rn\r\n\r\nORDER BY STORMMainObjectKey\r\n OFFSET 0 LIMIT 5\n    at AdapterError.EmberError (http://localhost:4200/assets/vendor.js:30811:25)\n    at new AdapterError (http://localhost:4200/assets/vendor.js:209958:15)\n    at Class.handleResponse (http://localhost:4200/assets/vendor.js:159906:16)\n    at Class.superWrapper [as handleResponse] (http://localhost:4200/assets/vendor.js:61323:22)\n    at ajaxError (http://localhost:4200/assets/vendor.js:222501:25)\n    at hash.error (http://localhost:4200/assets/vendor.js:222089:23)\n    at fire (http://localhost:4200/assets/vendor.js:9570:31)\n    at Object.fireWith [as rejectWith] (http://localhost:4200/assets/vendor.js:9700:7)\n    at done (http://localhost:4200/assets/vendor.js:15894:14)\n    at XMLHttpRequest.<anonymous> (http://localhost:4200/assets/vendor.js:16153:9)"}');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('9ad43d73-1300-d81f-4c9a-69c9ae792fe9', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-06 22:50:53.255', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '28', NULL, 'Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5', 'ICSSoft.STORMNET.Business.ExecutingQueryException: Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5 ---> Npgsql.PostgresException: 42601: ошибка синтаксиса (примерное положение: "=")
   в Npgsql.NpgsqlConnector.<DoReadMessage>d__155.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadExpecting>d__161`1.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlDataReader.<NextResult>d__32.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlDataReader.NextResult()
   в Npgsql.NpgsqlCommand.<Execute>d__71.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.<ExecuteDbDataReader>d__92.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   в ICSSoft.ST');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('30814c45-6a90-a48e-34ae-c8f1dce866cf', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-06 22:51:04.627', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '32', NULL, 'Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5', 'ICSSoft.STORMNET.Business.ExecutingQueryException: Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5 ---> Npgsql.PostgresException: 42601: ошибка синтаксиса (примерное положение: "=")
   в Npgsql.NpgsqlConnector.<DoReadMessage>d__155.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadExpecting>d__161`1.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlDataReader.<NextResult>d__32.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlDataReader.NextResult()
   в Npgsql.NpgsqlCommand.<Execute>d__71.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.<ExecuteDbDataReader>d__92.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   в ICSSoft.ST');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('a3d398be-754f-aa54-6eb0-6fd01341b3d7', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-06 22:58:32.337', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '29', NULL, 'Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5', 'ICSSoft.STORMNET.Business.ExecutingQueryException: Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5 ---> Npgsql.PostgresException: 42601: ошибка синтаксиса (примерное положение: "=")
   в Npgsql.NpgsqlConnector.<DoReadMessage>d__155.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadExpecting>d__161`1.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlDataReader.<NextResult>d__32.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlDataReader.NextResult()
   в Npgsql.NpgsqlCommand.<Execute>d__71.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.<ExecuteDbDataReader>d__92.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   в ICSSoft.ST');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('921b6b65-fe27-f3d8-d438-27f665a88b10', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-06 22:59:45.519', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '43', NULL, 'Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5', 'ICSSoft.STORMNET.Business.ExecutingQueryException: Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5 ---> Npgsql.PostgresException: 42601: ошибка синтаксиса (примерное положение: "=")
   в Npgsql.NpgsqlConnector.<DoReadMessage>d__155.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadExpecting>d__161`1.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlDataReader.<NextResult>d__32.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlDataReader.NextResult()
   в Npgsql.NpgsqlCommand.<Execute>d__71.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.<ExecuteDbDataReader>d__92.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   в ICSSoft.ST');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('eef29e2b-9d2b-4c2a-b408-0ec000771940', 'ERROR', 0, 1, NULL, NULL, '2022-12-06 17:58:32.385', 'localhost', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 Edg/107.0.1418.62', 'http://localhost:4200/i-i-s-shop-invoice-e/new', 'EMBER-FLEXBERRY', 'ember-app', NULL, 'Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5', '{"name":"Error","message":"Error on executing:\r\nSELECT __PrimaryKey,\r\nCreateDate,\r\nManager,\r\n\"Manager.__PrimaryKey\",\r\n\"Manager.LastName\",\r\nNumber,\r\nPaymentDate,\r\nShipmentDate,\r\nStatus,\r\nTotalSum,\r\nSTORMMainObjectKey,\r\nSTORMJoinedMasterKey0,\r\nSTORMJoinedMasterKey1,\r\nSTORMJoinedMasterKey2,\r\nSTORMNETDATAOBJECTTYPE\r\nFROM (\r\nSELECT __PrimaryKey,\r\nCreateDate,\r\nManager,\r\n\"Manager.__PrimaryKey\",\r\n\"Manager.LastName\",\r\nNumber,\r\nPaymentDate,\r\nShipmentDate,\r\nStatus,\r\nTotalSum,\r\nSTORMMainObjectKey,\r\nSTORMJoinedMasterKey0,\r\nSTORMJoinedMasterKey1,\r\nSTORMJoinedMasterKey2,\r\nSTORMNETDATAOBJECTTYPE\r\nFROM (\r\nSELECT \r\n__PrimaryKey,\r\nCreateDate,\r\nManager,\r\n\"Manager.__PrimaryKey\",\r\n\"Manager.LastName\",\r\nNumber,\r\nPaymentDate,\r\nShipmentDate,\r\nStatus,\r\n(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,\r\nSTORMMainObjectKey,\r\nSTORMJoinedMasterKey0,\r\nSTORMJoinedMasterKey1,\r\nSTORMJoinedMasterKey2,\r\ncast(0 as numeric) as STORMNETDATAOBJECTTYPE\r\nFROM \r\n( SELECT \r\nOrder0.primaryKey as __PrimaryKey,\r\nOrder0.CreateDate as CreateDate,\r\nOrder0.Manager as Manager,\r\nOrder0.Manager as \"Manager.__PrimaryKey\",\r\nOrderManager0.LastName as \"Manager.LastName\",\r\nOrder0.Number as Number,\r\nOrder0.PaymentDate as PaymentDate,\r\nOrder0.ShipmentDate as ShipmentDate,\r\nOrder0.Status as Status,\r\nNULL as TotalSum,\r\nOrder0.primaryKey as STORMMainObjectKey,\r\nOrderManager0.primaryKey as STORMJoinedMasterKey0,\r\nOrder0.Manager as STORMJoinedMasterKey1,\r\nOrder0.Manager as STORMJoinedMasterKey2,\r\ncast(0 as numeric) as STORMNETDATAOBJECTTYPE\r\nFROM \r\n(\"Order\" Order0 \r\n\t LEFT JOIN  Employee OrderManager0\r\n\t ON Order0.Manager = OrderManager0.primaryKey))\"IIS.Shop.Order\"\r\n) STORMGENERATEDQUERY) rn\r\n\r\nORDER BY STORMMainObjectKey\r\n OFFSET 0 LIMIT 5","fileName":null,"lineNumber":null,"columnNumber":null,"stack":"Error: Error on executing:\r\nSELECT __PrimaryKey,\r\nCreateDate,\r\nManager,\r\n\"Manager.__PrimaryKey\",\r\n\"Manager.LastName\",\r\nNumber,\r\nPaymentDate,\r\nShipmentDate,\r\nStatus,\r\nTotalSum,\r\nSTORMMainObjectKey,\r\nSTORMJoinedMasterKey0,\r\nSTORMJoinedMasterKey1,\r\nSTORMJoinedMasterKey2,\r\nSTORMNETDATAOBJECTTYPE\r\nFROM (\r\nSELECT __PrimaryKey,\r\nCreateDate,\r\nManager,\r\n\"Manager.__PrimaryKey\",\r\n\"Manager.LastName\",\r\nNumber,\r\nPaymentDate,\r\nShipmentDate,\r\nStatus,\r\nTotalSum,\r\nSTORMMainObjectKey,\r\nSTORMJoinedMasterKey0,\r\nSTORMJoinedMasterKey1,\r\nSTORMJoinedMasterKey2,\r\nSTORMNETDATAOBJECTTYPE\r\nFROM (\r\nSELECT \r\n__PrimaryKey,\r\nCreateDate,\r\nManager,\r\n\"Manager.__PrimaryKey\",\r\n\"Manager.LastName\",\r\nNumber,\r\nPaymentDate,\r\nShipmentDate,\r\nStatus,\r\n(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,\r\nSTORMMainObjectKey,\r\nSTORMJoinedMasterKey0,\r\nSTORMJoinedMasterKey1,\r\nSTORMJoinedMasterKey2,\r\ncast(0 as numeric) as STORMNETDATAOBJECTTYPE\r\nFROM \r\n( SELECT \r\nOrder0.primaryKey as __PrimaryKey,\r\nOrder0.CreateDate as CreateDate,\r\nOrder0.Manager as Manager,\r\nOrder0.Manager as \"Manager.__PrimaryKey\",\r\nOrderManager0.LastName as \"Manager.LastName\",\r\nOrder0.Number as Number,\r\nOrder0.PaymentDate as PaymentDate,\r\nOrder0.ShipmentDate as ShipmentDate,\r\nOrder0.Status as Status,\r\nNULL as TotalSum,\r\nOrder0.primaryKey as STORMMainObjectKey,\r\nOrderManager0.primaryKey as STORMJoinedMasterKey0,\r\nOrder0.Manager as STORMJoinedMasterKey1,\r\nOrder0.Manager as STORMJoinedMasterKey2,\r\ncast(0 as numeric) as STORMNETDATAOBJECTTYPE\r\nFROM \r\n(\"Order\" Order0 \r\n\t LEFT JOIN  Employee OrderManager0\r\n\t ON Order0.Manager = OrderManager0.primaryKey))\"IIS.Shop.Order\"\r\n) STORMGENERATEDQUERY) rn\r\n\r\nORDER BY STORMMainObjectKey\r\n OFFSET 0 LIMIT 5\n    at AdapterError.EmberError (http://localhost:4200/assets/vendor.js:30811:25)\n    at new AdapterError (http://localhost:4200/assets/vendor.js:209958:15)\n    at Class.handleResponse (http://localhost:4200/assets/vendor.js:159906:16)\n    at Class.superWrapper [as handleResponse] (http://localhost:4200/assets/vendor.js:61323:22)\n    at ajaxError (http://localhost:4200/assets/vendor.js:222501:25)\n    at hash.error (http://localhost:4200/assets/vendor.js:222089:23)\n    at fire (http://localhost:4200/assets/vendor.js:9570:31)\n    at Object.fireWith [as rejectWith] (http://localhost:4200/assets/vendor.js:9700:7)\n    at done (http://localhost:4200/assets/vendor.js:15894:14)\n    at XMLHttpRequest.<anonymous> (http://localhost:4200/assets/vendor.js:16153:9)"}');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('0b60d733-6f32-eb25-6156-20a291cc92ae', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-06 23:20:04.444', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '13', NULL, 'Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5', 'ICSSoft.STORMNET.Business.ExecutingQueryException: Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5 ---> Npgsql.PostgresException: 42601: ошибка синтаксиса (примерное положение: "=")
   в Npgsql.NpgsqlConnector.<DoReadMessage>d__155.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadExpecting>d__161`1.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlDataReader.<NextResult>d__32.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlDataReader.NextResult()
   в Npgsql.NpgsqlCommand.<Execute>d__71.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.<ExecuteDbDataReader>d__92.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   в ICSSoft.ST');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('d9723130-d143-0c9b-8198-675caf39b354', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-12 09:03:15.906', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '7', NULL, 'Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5', 'ICSSoft.STORMNET.Business.ExecutingQueryException: Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5 ---> Npgsql.PostgresException: 42601: ошибка синтаксиса (примерное положение: "=")
   в Npgsql.NpgsqlConnector.<DoReadMessage>d__155.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadExpecting>d__161`1.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlDataReader.<NextResult>d__32.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlDataReader.NextResult()
   в Npgsql.NpgsqlCommand.<Execute>d__71.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.<ExecuteDbDataReader>d__92.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   в ICSSoft.ST');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('f1c04798-974d-afa2-789a-09f370d8422a', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-12 19:14:56.015', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '9', NULL, 'Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5', 'ICSSoft.STORMNET.Business.ExecutingQueryException: Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5 ---> Npgsql.PostgresException: 42601: ошибка синтаксиса (примерное положение: "=")
   в Npgsql.NpgsqlConnector.<DoReadMessage>d__155.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadExpecting>d__161`1.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlDataReader.<NextResult>d__32.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlDataReader.NextResult()
   в Npgsql.NpgsqlCommand.<Execute>d__71.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.<ExecuteDbDataReader>d__92.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   в ICSSoft.ST');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('da854cb9-9762-ea58-124e-6ad2ed11d3ae', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-12 19:16:47.541', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '8', NULL, 'Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5', 'ICSSoft.STORMNET.Business.ExecutingQueryException: Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(PriceWTaxes * Amount) FROM OrderItem.Order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5 ---> Npgsql.PostgresException: 42601: ошибка синтаксиса (примерное положение: "=")
   в Npgsql.NpgsqlConnector.<DoReadMessage>d__155.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadExpecting>d__161`1.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlDataReader.<NextResult>d__32.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlDataReader.NextResult()
   в Npgsql.NpgsqlCommand.<Execute>d__71.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.<ExecuteDbDataReader>d__92.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   в ICSSoft.ST');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('72a35de5-9eb7-1e71-d8af-15aa09445745', 'ERROR', NULL, NULL, NULL, NULL, '2022-12-12 19:26:42.58', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '9', NULL, 'Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(pricewtaxes * amount) FROM orderitem.order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5', 'ICSSoft.STORMNET.Business.ExecutingQueryException: Error on executing:
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT __PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
STORMNETDATAOBJECTTYPE
FROM (
SELECT 
__PrimaryKey,
CreateDate,
Manager,
"Manager.__PrimaryKey",
"Manager.LastName",
Number,
PaymentDate,
ShipmentDate,
Status,
(SELECT SUM(pricewtaxes * amount) FROM orderitem.order_m0 = STORMMainObjectKey) as TotalSum,
STORMMainObjectKey,
STORMJoinedMasterKey0,
STORMJoinedMasterKey1,
STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
( SELECT 
Order0.primaryKey as __PrimaryKey,
Order0.CreateDate as CreateDate,
Order0.Manager as Manager,
Order0.Manager as "Manager.__PrimaryKey",
OrderManager0.LastName as "Manager.LastName",
Order0.Number as Number,
Order0.PaymentDate as PaymentDate,
Order0.ShipmentDate as ShipmentDate,
Order0.Status as Status,
NULL as TotalSum,
Order0.primaryKey as STORMMainObjectKey,
OrderManager0.primaryKey as STORMJoinedMasterKey0,
Order0.Manager as STORMJoinedMasterKey1,
Order0.Manager as STORMJoinedMasterKey2,
cast(0 as numeric) as STORMNETDATAOBJECTTYPE
FROM 
("Order" Order0 
	 LEFT JOIN  Employee OrderManager0
	 ON Order0.Manager = OrderManager0.primaryKey))"IIS.Shop.Order"
) STORMGENERATEDQUERY) rn

ORDER BY STORMMainObjectKey
 OFFSET 0 LIMIT 5 ---> Npgsql.PostgresException: 42601: ошибка синтаксиса (примерное положение: "=")
   в Npgsql.NpgsqlConnector.<DoReadMessage>d__155.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlConnector.<ReadMessage>d__154.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlConnector.<ReadExpecting>d__161`1.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в Npgsql.NpgsqlDataReader.<NextResult>d__32.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlDataReader.NextResult()
   в Npgsql.NpgsqlCommand.<Execute>d__71.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.<ExecuteDbDataReader>d__92.MoveNext()
--- Конец трассировка стека из предыдущего расположения, где возникло исключение ---
   в System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
   в System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   в Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   в ICSSoft.ST');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('7eab9b95-0d62-4a3c-9c12-e321df65c936', 'ERROR', 0, 1, NULL, NULL, '2022-12-13 09:10:09.759', 'localhost', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.46', 'http://localhost:4200/i-i-s-shop-invoice-e/new', 'EMBER-FLEXBERRY', 'ember-app', NULL, 'priceWTaxes is not defined', '{"name":"ReferenceError","message":"priceWTaxes is not defined","fileName":null,"lineNumber":null,"columnNumber":null,"stack":"ReferenceError: priceWTaxes is not defined\n    at http://localhost:4200/assets/ember-app.js:5668:22\n    at Class.<anonymous> (http://localhost:4200/assets/vendor.js:54569:13)\n    at _emberMetal.Mixin.create._Mixin$create.forEach (http://localhost:4200/assets/vendor.js:54460:16)\n    at _emberMetal.Mixin.create._Mixin$create.reduce (http://localhost:4200/assets/vendor.js:54568:10)\n    at Class.<anonymous> (http://localhost:4200/assets/ember-app.js:5661:38)\n    at ComputedPropertyPrototype.get (http://localhost:4200/assets/vendor.js:43859:28)\n    at get (http://localhost:4200/assets/vendor.js:43229:27)\n    at NestedPropertyReference.compute (http://localhost:4200/assets/vendor.js:32475:44)\n    at NestedPropertyReference.value (http://localhost:4200/assets/vendor.js:32302:53)\n    at CapturedNamedArguments.value (http://localhost:4200/assets/vendor.js:25101:43)"}');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('a75d8f85-e1a9-4198-8856-924f9b13db80', 'ERROR', 0, 1, NULL, NULL, '2022-12-13 09:36:52.188', 'localhost', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.46', 'http://localhost:4200/i-i-s-shop-invoice-e/new', 'EMBER-FLEXBERRY', 'ember-app', NULL, 'Вес (кг) должно быть числом', '{"name":null,"message":"Вес (кг) должно быть числом","fileName":null,"lineNumber":null,"columnNumber":null,"stack":null}');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('8d5039bb-82dc-41dd-84c0-dafaa0e44278', 'ERROR', 0, 1, NULL, NULL, '2022-12-13 09:42:00.767', 'localhost', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.46', 'http://localhost:4200/i-i-s-shop-invoice-e/new', 'EMBER-FLEXBERRY', 'ember-app', NULL, 'computed is not defined', '{"name":"ReferenceError","message":"computed is not defined","fileName":null,"lineNumber":null,"columnNumber":null,"stack":"ReferenceError: computed is not defined\n    at Module.callback (http://localhost:4200/assets/ember-app.js:5623:21)\n    at Module.exports (http://localhost:4200/assets/vendor.js:111:32)\n    at requireModule (http://localhost:4200/assets/vendor.js:32:18)\n    at Class._extractDefaultExport (http://localhost:4200/assets/vendor.js:205406:20)\n    at Class.resolveOther (http://localhost:4200/assets/vendor.js:205108:32)\n    at Class.superWrapper [as resolveOther] (http://localhost:4200/assets/vendor.js:61323:22)\n    at Class.resolve (http://localhost:4200/assets/vendor.js:30253:35)\n    at Class.resolve (http://localhost:4200/assets/vendor.js:195847:19)\n    at Class.superWrapper [as resolve] (http://localhost:4200/assets/vendor.js:61323:22)\n    at _resolve (http://localhost:4200/assets/vendor.js:28229:36)"}');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('c7e42e40-7fd8-47da-a938-fcbadbad984c', 'ERROR', 0, 1, NULL, NULL, '2022-12-13 09:44:11.588', 'localhost', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.46', 'http://localhost:4200/i-i-s-shop-invoice-e/new', 'EMBER-FLEXBERRY', 'ember-app', NULL, 'computed is not defined', '{"name":"ReferenceError","message":"computed is not defined","fileName":null,"lineNumber":null,"columnNumber":null,"stack":"ReferenceError: computed is not defined\n    at Module.callback (http://localhost:4200/assets/ember-app.js:5631:21)\n    at Module.exports (http://localhost:4200/assets/vendor.js:111:32)\n    at requireModule (http://localhost:4200/assets/vendor.js:32:18)\n    at Class._extractDefaultExport (http://localhost:4200/assets/vendor.js:205406:20)\n    at Class.resolveOther (http://localhost:4200/assets/vendor.js:205108:32)\n    at Class.superWrapper [as resolveOther] (http://localhost:4200/assets/vendor.js:61323:22)\n    at Class.resolve (http://localhost:4200/assets/vendor.js:30253:35)\n    at Class.resolve (http://localhost:4200/assets/vendor.js:195847:19)\n    at Class.superWrapper [as resolve] (http://localhost:4200/assets/vendor.js:61323:22)\n    at _resolve (http://localhost:4200/assets/vendor.js:28229:36)"}');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('7f4f8b1c-e1f4-4b91-85d0-ace3bcaad0a0', 'ERROR', 0, 1, NULL, NULL, '2022-12-13 09:45:49.318', 'localhost', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.46', 'http://localhost:4200/i-i-s-shop-invoice-e/new', 'EMBER-FLEXBERRY', 'ember-app', NULL, 'computed is not defined', '{"name":"ReferenceError","message":"computed is not defined","fileName":null,"lineNumber":null,"columnNumber":null,"stack":"ReferenceError: computed is not defined\n    at Module.callback (http://localhost:4200/assets/ember-app.js:5634:21)\n    at Module.exports (http://localhost:4200/assets/vendor.js:111:32)\n    at requireModule (http://localhost:4200/assets/vendor.js:32:18)\n    at Class._extractDefaultExport (http://localhost:4200/assets/vendor.js:205406:20)\n    at Class.resolveOther (http://localhost:4200/assets/vendor.js:205108:32)\n    at Class.superWrapper [as resolveOther] (http://localhost:4200/assets/vendor.js:61323:22)\n    at Class.resolve (http://localhost:4200/assets/vendor.js:30253:35)\n    at Class.resolve (http://localhost:4200/assets/vendor.js:195847:19)\n    at Class.superWrapper [as resolve] (http://localhost:4200/assets/vendor.js:61323:22)\n    at _resolve (http://localhost:4200/assets/vendor.js:28229:36)"}');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('204de3e4-57ff-4629-8966-7338167d1325', 'ERROR', 0, 1, NULL, NULL, '2022-12-13 09:46:14.93', 'localhost', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.46', 'http://localhost:4200/i-i-s-shop-invoice-e/new', 'EMBER-FLEXBERRY', 'ember-app', NULL, 'computed is not defined', '{"name":"ReferenceError","message":"computed is not defined","fileName":null,"lineNumber":null,"columnNumber":null,"stack":"ReferenceError: computed is not defined\n    at Module.callback (http://localhost:4200/assets/ember-app.js:5634:21)\n    at Module.exports (http://localhost:4200/assets/vendor.js:111:32)\n    at requireModule (http://localhost:4200/assets/vendor.js:32:18)\n    at Class._extractDefaultExport (http://localhost:4200/assets/vendor.js:205406:20)\n    at Class.resolveOther (http://localhost:4200/assets/vendor.js:205108:32)\n    at Class.superWrapper [as resolveOther] (http://localhost:4200/assets/vendor.js:61323:22)\n    at Class.resolve (http://localhost:4200/assets/vendor.js:30253:35)\n    at Class.resolve (http://localhost:4200/assets/vendor.js:195847:19)\n    at Class.superWrapper [as resolve] (http://localhost:4200/assets/vendor.js:61323:22)\n    at _resolve (http://localhost:4200/assets/vendor.js:28229:36)"}');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('3d343786-5b5d-4d3f-977e-f339c25e68db', 'ERROR', 0, 1, NULL, NULL, '2022-12-13 09:46:16.15', 'localhost', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.46', 'http://localhost:4200/i-i-s-shop-invoice-e/new', 'EMBER-FLEXBERRY', 'ember-app', NULL, 'Error while processing route: index computed is not defined ReferenceError: computed is not defined
    at Module.callback (http://localhost:4200/assets/ember-app.js:5634:21)
    at Module.exports (http://localhost:4200/assets/vendor.js:111:32)
    at requireModule (http://localhost:4200/assets/vendor.js:32:18)
    at Class._extractDefaultExport (http://localhost:4200/assets/vendor.js:205406:20)
    at Class.resolveOther (http://localhost:4200/assets/vendor.js:205108:32)
    at Class.superWrapper [as resolveOther] (http://localhost:4200/assets/vendor.js:61323:22)
    at Class.resolve (http://localhost:4200/assets/vendor.js:30253:35)
    at Class.resolve (http://localhost:4200/assets/vendor.js:195847:19)
    at Class.superWrapper [as resolve] (http://localhost:4200/assets/vendor.js:61323:22)
    at _resolve (http://localhost:4200/assets/vendor.js:28229:36)', NULL);
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('98aacb4d-370b-4005-96d8-453121957d4b', 'ERROR', 0, 1, NULL, NULL, '2022-12-13 09:46:31.216', 'localhost', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.46', 'http://localhost:4200/i-i-s-shop-invoice-e/new', 'EMBER-FLEXBERRY', 'ember-app', NULL, 'computed is not defined', '{"name":"ReferenceError","message":"computed is not defined","fileName":null,"lineNumber":null,"columnNumber":null,"stack":"ReferenceError: computed is not defined\n    at Module.callback (http://localhost:4200/assets/ember-app.js:5634:21)\n    at Module.exports (http://localhost:4200/assets/vendor.js:111:32)\n    at requireModule (http://localhost:4200/assets/vendor.js:32:18)\n    at Class._extractDefaultExport (http://localhost:4200/assets/vendor.js:205406:20)\n    at Class.resolveOther (http://localhost:4200/assets/vendor.js:205108:32)\n    at Class.superWrapper [as resolveOther] (http://localhost:4200/assets/vendor.js:61323:22)\n    at Class.resolve (http://localhost:4200/assets/vendor.js:30253:35)\n    at Class.resolve (http://localhost:4200/assets/vendor.js:195847:19)\n    at Class.superWrapper [as resolve] (http://localhost:4200/assets/vendor.js:61323:22)\n    at _resolve (http://localhost:4200/assets/vendor.js:28229:36)"}');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('dee45d3d-68ae-4585-93d1-1a011251ac67', 'ERROR', 0, 1, NULL, NULL, '2022-12-13 11:53:00.657', 'localhost', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.46', 'http://localhost:4200/i-i-s-shop-invoice-e/722186b0-ca85-4b84-90dd-5eeda21cbd3d', 'EMBER-FLEXBERRY', 'ember-app', NULL, 'Cannot read properties of undefined (reading ''reduce'')', '{"name":"TypeError","message":"Cannot read properties of undefined (reading ''reduce'')","fileName":null,"lineNumber":null,"columnNumber":null,"stack":"TypeError: Cannot read properties of undefined (reading ''reduce'')\n    at Class.<anonymous> (http://localhost:4200/assets/ember-app.js:5685:35)\n    at ComputedPropertyPrototype.get (http://localhost:4200/assets/vendor.js:43859:28)\n    at get (http://localhost:4200/assets/vendor.js:43229:27)\n    at NestedPropertyReference.compute (http://localhost:4200/assets/vendor.js:32475:44)\n    at NestedPropertyReference.value (http://localhost:4200/assets/vendor.js:32302:53)\n    at CapturedNamedArguments.value (http://localhost:4200/assets/vendor.js:25101:43)\n    at processComponentArgs (http://localhost:4200/assets/vendor.js:36096:31)\n    at CurlyComponentManager.create (http://localhost:4200/assets/vendor.js:36271:25)\n    at Object.evaluate (http://localhost:4200/assets/vendor.js:21848:29)\n    at AppendOpcodes.evaluate (http://localhost:4200/assets/vendor.js:20742:27)"}');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('9cd2f544-f84d-48f0-9328-024bffde51dd', 'ERROR', 0, 1, NULL, NULL, '2022-12-13 11:53:05.524', 'localhost', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.46', 'http://localhost:4200/i-i-s-shop-invoice-e/722186b0-ca85-4b84-90dd-5eeda21cbd3d', 'EMBER-FLEXBERRY', 'ember-app', NULL, 'Cannot read properties of undefined (reading ''reduce'')', '{"name":"TypeError","message":"Cannot read properties of undefined (reading ''reduce'')","fileName":null,"lineNumber":null,"columnNumber":null,"stack":"TypeError: Cannot read properties of undefined (reading ''reduce'')\n    at Class.<anonymous> (http://localhost:4200/assets/ember-app.js:5685:35)\n    at ComputedPropertyPrototype.get (http://localhost:4200/assets/vendor.js:43859:28)\n    at get (http://localhost:4200/assets/vendor.js:43229:27)\n    at NestedPropertyReference.compute (http://localhost:4200/assets/vendor.js:32475:44)\n    at NestedPropertyReference.value (http://localhost:4200/assets/vendor.js:32302:53)\n    at CapturedNamedArguments.value (http://localhost:4200/assets/vendor.js:25101:43)\n    at processComponentArgs (http://localhost:4200/assets/vendor.js:36096:31)\n    at CurlyComponentManager.create (http://localhost:4200/assets/vendor.js:36271:25)\n    at Object.evaluate (http://localhost:4200/assets/vendor.js:21848:29)\n    at AppendOpcodes.evaluate (http://localhost:4200/assets/vendor.js:20742:27)"}');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('fc331117-88cc-4c02-9992-5fc398e98450', 'ERROR', 0, 1, NULL, NULL, '2022-12-13 11:53:33.169', 'localhost', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.46', 'http://localhost:4200/i-i-s-shop-invoice-e/722186b0-ca85-4b84-90dd-5eeda21cbd3d', 'EMBER-FLEXBERRY', 'ember-app', NULL, 'Cannot read properties of undefined (reading ''reduce'')', '{"name":"TypeError","message":"Cannot read properties of undefined (reading ''reduce'')","fileName":null,"lineNumber":null,"columnNumber":null,"stack":"TypeError: Cannot read properties of undefined (reading ''reduce'')\n    at Class.<anonymous> (http://localhost:4200/assets/ember-app.js:5685:35)\n    at ComputedPropertyPrototype.get (http://localhost:4200/assets/vendor.js:43859:28)\n    at get (http://localhost:4200/assets/vendor.js:43229:27)\n    at NestedPropertyReference.compute (http://localhost:4200/assets/vendor.js:32475:44)\n    at NestedPropertyReference.value (http://localhost:4200/assets/vendor.js:32302:53)\n    at CapturedNamedArguments.value (http://localhost:4200/assets/vendor.js:25101:43)\n    at processComponentArgs (http://localhost:4200/assets/vendor.js:36096:31)\n    at CurlyComponentManager.create (http://localhost:4200/assets/vendor.js:36271:25)\n    at Object.evaluate (http://localhost:4200/assets/vendor.js:21848:29)\n    at AppendOpcodes.evaluate (http://localhost:4200/assets/vendor.js:20742:27)"}');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('f2cad75f-f223-4a6b-9c5b-3bfcdae241af', 'ERROR', 0, 1, NULL, NULL, '2022-12-26 18:20:49.26', 'localhost', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54', 'http://localhost:4200/i-i-s-shop-order-l', 'EMBER-FLEXBERRY', 'ember-app', NULL, 'SimplePredicate is not defined', '{"name":"ReferenceError","message":"SimplePredicate is not defined","fileName":null,"lineNumber":null,"columnNumber":null,"stack":"ReferenceError: SimplePredicate is not defined\n    at Class.init (http://localhost:4200/assets/ember-app.js:1105:45)\n    at Class.superWrapper [as init] (http://localhost:4200/assets/vendor.js:61323:22)\n    at new Class (http://localhost:4200/assets/vendor.js:56576:29)\n    at _ClassMixinProps.create (http://localhost:4200/assets/vendor.js:56730:14)\n    at FactoryManager.create (http://localhost:4200/assets/vendor.js:27775:33)\n    at instantiateFactory (http://localhost:4200/assets/vendor.js:27620:57)\n    at _lookup (http://localhost:4200/assets/vendor.js:27578:12)\n    at Container.lookup (http://localhost:4200/assets/vendor.js:27423:14)\n    at Class.lookup (http://localhost:4200/assets/vendor.js:55047:33)\n    at Class.<anonymous> (http://localhost:4200/assets/vendor.js:48171:30)"}');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('91914b56-9d27-44ba-b417-0837de033dbf', 'ERROR', 0, 1, NULL, NULL, '2022-12-26 18:23:27.661', 'localhost', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54', 'http://localhost:4200/i-i-s-shop-order-l', 'EMBER-FLEXBERRY', 'ember-app', NULL, 'SimplePredicate is not defined', '{"name":"ReferenceError","message":"SimplePredicate is not defined","fileName":null,"lineNumber":null,"columnNumber":null,"stack":"ReferenceError: SimplePredicate is not defined\n    at Class.init (http://localhost:4200/assets/ember-app.js:1105:45)\n    at Class.superWrapper [as init] (http://localhost:4200/assets/vendor.js:61323:22)\n    at new Class (http://localhost:4200/assets/vendor.js:56576:29)\n    at _ClassMixinProps.create (http://localhost:4200/assets/vendor.js:56730:14)\n    at FactoryManager.create (http://localhost:4200/assets/vendor.js:27775:33)\n    at instantiateFactory (http://localhost:4200/assets/vendor.js:27620:57)\n    at _lookup (http://localhost:4200/assets/vendor.js:27578:12)\n    at Container.lookup (http://localhost:4200/assets/vendor.js:27423:14)\n    at Class.lookup (http://localhost:4200/assets/vendor.js:55047:33)\n    at Class.<anonymous> (http://localhost:4200/assets/vendor.js:48171:30)"}');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('f06ab2ec-4b41-46aa-9af3-405d86026b02', 'ERROR', 0, 1, NULL, NULL, '2022-12-26 18:29:30.133', 'localhost', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54', 'http://localhost:4200/i-i-s-shop-order-l', 'EMBER-FLEXBERRY', 'ember-app', NULL, 'SimplePredicate is not defined', '{"name":"ReferenceError","message":"SimplePredicate is not defined","fileName":null,"lineNumber":null,"columnNumber":null,"stack":"ReferenceError: SimplePredicate is not defined\n    at Class.init (http://localhost:4200/assets/ember-app.js:1105:45)\n    at Class.superWrapper [as init] (http://localhost:4200/assets/vendor.js:61323:22)\n    at new Class (http://localhost:4200/assets/vendor.js:56576:29)\n    at _ClassMixinProps.create (http://localhost:4200/assets/vendor.js:56730:14)\n    at FactoryManager.create (http://localhost:4200/assets/vendor.js:27775:33)\n    at instantiateFactory (http://localhost:4200/assets/vendor.js:27620:57)\n    at _lookup (http://localhost:4200/assets/vendor.js:27578:12)\n    at Container.lookup (http://localhost:4200/assets/vendor.js:27423:14)\n    at Class.lookup (http://localhost:4200/assets/vendor.js:55047:33)\n    at Class.<anonymous> (http://localhost:4200/assets/vendor.js:48171:30)"}');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('01d29fec-efe0-44a1-bbfa-1dc3c148f6a2', 'ERROR', 0, 1, NULL, NULL, '2022-12-26 18:34:08.206', 'localhost', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54', 'http://localhost:4200/i-i-s-shop-order-l', 'EMBER-FLEXBERRY', 'ember-app', NULL, 'Could not find module `ember-flexberry-data` imported from `ember-app/controllers/i-i-s-shop-order-e`', '{"name":"Error","message":"Could not find module `ember-flexberry-data` imported from `ember-app/controllers/i-i-s-shop-order-e`","fileName":null,"lineNumber":null,"columnNumber":null,"stack":"Error: Could not find module `ember-flexberry-data` imported from `ember-app/controllers/i-i-s-shop-order-e`\n    at missingModule (http://localhost:4200/assets/vendor.js:252:11)\n    at findModule (http://localhost:4200/assets/vendor.js:263:7)\n    at Module.findDeps (http://localhost:4200/assets/vendor.js:173:24)\n    at findModule (http://localhost:4200/assets/vendor.js:267:11)\n    at requireModule (http://localhost:4200/assets/vendor.js:29:15)\n    at Class._extractDefaultExport (http://localhost:4200/assets/vendor.js:205406:20)\n    at Class.resolveOther (http://localhost:4200/assets/vendor.js:205108:32)\n    at Class.superWrapper [as resolveOther] (http://localhost:4200/assets/vendor.js:61323:22)\n    at Class.resolveController (http://localhost:4200/assets/vendor.js:30343:19)\n    at Class.resolve (http://localhost:4200/assets/vendor.js:30250:43)"}');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('441688f2-5288-4f7c-a943-af5fc1bdf742', 'ERROR', 0, 1, NULL, NULL, '2023-01-06 18:10:28.132', 'localhost', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54', 'http://localhost:4200/i-i-s-shop-order-e/new', 'EMBER-FLEXBERRY', 'ember-app', NULL, 'record is not defined', '{"name":"ReferenceError","message":"record is not defined","fileName":null,"lineNumber":null,"columnNumber":null,"stack":"ReferenceError: record is not defined\n    at Class._setLookupPredicate (http://localhost:4200/assets/ember-app.js:1126:42)\n    at sendEvent (http://localhost:4200/assets/vendor.js:40036:14)\n    at Class.trigger (http://localhost:4200/assets/vendor.js:55214:33)\n    at Class.lookupDialogOnHiddenTrigger (http://localhost:4200/assets/vendor.js:198625:12)\n    at http://localhost:4200/assets/vendor.js:181348:39\n    at Backburner._run (http://localhost:4200/assets/vendor.js:27199:35)\n    at Backburner.run (http://localhost:4200/assets/vendor.js:26917:25)\n    at Object.run (http://localhost:4200/assets/vendor.js:40198:29)\n    at HTMLDivElement.onHidden (http://localhost:4200/assets/vendor.js:181340:17)\n    at HTMLDivElement.onComplete (http://localhost:4200/assets/vendor.js:135746:39)"}');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('4a64e3e2-60cb-4001-972e-db3af30e7d21', 'ERROR', 0, 1, NULL, NULL, '2022-12-26 18:42:16.399', 'localhost', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54', 'http://localhost:4200/i-i-s-shop-order-l', 'EMBER-FLEXBERRY', 'ember-app', NULL, 'Could not find module `ember-flexberry-data/query/simplepredicate ` imported from `ember-app/controllers/i-i-s-shop-order-e`', '{"name":"Error","message":"Could not find module `ember-flexberry-data/query/simplepredicate ` imported from `ember-app/controllers/i-i-s-shop-order-e`","fileName":null,"lineNumber":null,"columnNumber":null,"stack":"Error: Could not find module `ember-flexberry-data/query/simplepredicate ` imported from `ember-app/controllers/i-i-s-shop-order-e`\n    at missingModule (http://localhost:4200/assets/vendor.js:252:11)\n    at findModule (http://localhost:4200/assets/vendor.js:263:7)\n    at Module.findDeps (http://localhost:4200/assets/vendor.js:173:24)\n    at findModule (http://localhost:4200/assets/vendor.js:267:11)\n    at requireModule (http://localhost:4200/assets/vendor.js:29:15)\n    at Class._extractDefaultExport (http://localhost:4200/assets/vendor.js:205406:20)\n    at Class.resolveOther (http://localhost:4200/assets/vendor.js:205108:32)\n    at Class.superWrapper [as resolveOther] (http://localhost:4200/assets/vendor.js:61323:22)\n    at Class.resolveController (http://localhost:4200/assets/vendor.js:30343:19)\n    at Class.resolve (http://localhost:4200/assets/vendor.js:30250:43)"}');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('fba4efd9-070f-4804-8878-141d439b6983', 'ERROR', 0, 1, NULL, NULL, '2022-12-26 18:42:49.364', 'localhost', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54', 'http://localhost:4200/i-i-s-shop-order-l', 'EMBER-FLEXBERRY', 'ember-app', NULL, 'Store is not specified', '{"name":"Error","message":"Store is not specified","fileName":null,"lineNumber":null,"columnNumber":null,"stack":"Error: Store is not specified\n    at new Builder (http://localhost:4200/assets/vendor.js:162843:15)\n    at Class.init (http://localhost:4200/assets/ember-app.js:1105:41)\n    at Class.superWrapper [as init] (http://localhost:4200/assets/vendor.js:61323:22)\n    at new Class (http://localhost:4200/assets/vendor.js:56576:29)\n    at _ClassMixinProps.create (http://localhost:4200/assets/vendor.js:56730:14)\n    at FactoryManager.create (http://localhost:4200/assets/vendor.js:27775:33)\n    at instantiateFactory (http://localhost:4200/assets/vendor.js:27620:57)\n    at _lookup (http://localhost:4200/assets/vendor.js:27578:12)\n    at Container.lookup (http://localhost:4200/assets/vendor.js:27423:14)\n    at Class.lookup (http://localhost:4200/assets/vendor.js:55047:33)"}');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('164a1f9b-c69b-4489-8961-b61333c66ec2', 'ERROR', 0, 1, NULL, NULL, '2022-12-26 18:47:46.796', 'localhost', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54', 'http://localhost:4200/i-i-s-shop-order-l', 'EMBER-FLEXBERRY', 'ember-app', NULL, '_predicate.default is not a constructor', '{"name":"TypeError","message":"_predicate.default is not a constructor","fileName":null,"lineNumber":null,"columnNumber":null,"stack":"TypeError: _predicate.default is not a constructor\n    at Class.init (http://localhost:4200/assets/ember-app.js:1105:41)\n    at Class.superWrapper [as init] (http://localhost:4200/assets/vendor.js:61323:22)\n    at new Class (http://localhost:4200/assets/vendor.js:56576:29)\n    at _ClassMixinProps.create (http://localhost:4200/assets/vendor.js:56730:14)\n    at FactoryManager.create (http://localhost:4200/assets/vendor.js:27775:33)\n    at instantiateFactory (http://localhost:4200/assets/vendor.js:27620:57)\n    at _lookup (http://localhost:4200/assets/vendor.js:27578:12)\n    at Container.lookup (http://localhost:4200/assets/vendor.js:27423:14)\n    at Class.lookup (http://localhost:4200/assets/vendor.js:55047:33)\n    at Class.<anonymous> (http://localhost:4200/assets/vendor.js:48171:30)"}');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('149ffc4e-becf-433d-9a6c-658a1eb27518', 'ERROR', 0, 1, NULL, NULL, '2022-12-26 18:48:10.995', 'localhost', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54', 'http://localhost:4200/i-i-s-shop-storehouse-l', 'EMBER-FLEXBERRY', 'ember-app', NULL, 'Could not find module `ember-flexberry-data/query/predicate ` imported from `ember-app/controllers/i-i-s-shop-storehouse-e`', '{"name":"Error","message":"Could not find module `ember-flexberry-data/query/predicate ` imported from `ember-app/controllers/i-i-s-shop-storehouse-e`","fileName":null,"lineNumber":null,"columnNumber":null,"stack":"Error: Could not find module `ember-flexberry-data/query/predicate ` imported from `ember-app/controllers/i-i-s-shop-storehouse-e`\n    at missingModule (http://localhost:4200/assets/vendor.js:252:11)\n    at findModule (http://localhost:4200/assets/vendor.js:263:7)\n    at Module.findDeps (http://localhost:4200/assets/vendor.js:173:24)\n    at findModule (http://localhost:4200/assets/vendor.js:267:11)\n    at requireModule (http://localhost:4200/assets/vendor.js:29:15)\n    at Class._extractDefaultExport (http://localhost:4200/assets/vendor.js:205406:20)\n    at Class.resolveOther (http://localhost:4200/assets/vendor.js:205108:32)\n    at Class.superWrapper [as resolveOther] (http://localhost:4200/assets/vendor.js:61323:22)\n    at Class.resolveController (http://localhost:4200/assets/vendor.js:30343:19)\n    at Class.resolve (http://localhost:4200/assets/vendor.js:30250:43)"}');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('bcd143ab-ea9c-4fc4-bf77-105daa095934', 'ERROR', 0, 1, NULL, NULL, '2022-12-26 18:49:14.623', 'localhost', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54', 'http://localhost:4200/i-i-s-shop-storehouse-l', 'EMBER-FLEXBERRY', 'ember-app', NULL, '_predicate.default is not a constructor', '{"name":"TypeError","message":"_predicate.default is not a constructor","fileName":null,"lineNumber":null,"columnNumber":null,"stack":"TypeError: _predicate.default is not a constructor\n    at Class.init (http://localhost:4200/assets/ember-app.js:1216:45)\n    at Class.superWrapper [as init] (http://localhost:4200/assets/vendor.js:61323:22)\n    at new Class (http://localhost:4200/assets/vendor.js:56576:29)\n    at _ClassMixinProps.create (http://localhost:4200/assets/vendor.js:56730:14)\n    at FactoryManager.create (http://localhost:4200/assets/vendor.js:27775:33)\n    at instantiateFactory (http://localhost:4200/assets/vendor.js:27620:57)\n    at _lookup (http://localhost:4200/assets/vendor.js:27578:12)\n    at Container.lookup (http://localhost:4200/assets/vendor.js:27423:14)\n    at Class.lookup (http://localhost:4200/assets/vendor.js:55047:33)\n    at Class.<anonymous> (http://localhost:4200/assets/vendor.js:48171:30)"}');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('bc78bdcd-3950-4358-92ed-8e94c264bb87', 'ERROR', 0, 1, NULL, NULL, '2023-01-06 17:59:46.664', 'localhost', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54', 'http://localhost:4200/i-i-s-shop-order-l', 'EMBER-FLEXBERRY', 'ember-app', NULL, 'inject is not defined', '{"name":"ReferenceError","message":"inject is not defined","fileName":null,"lineNumber":null,"columnNumber":null,"stack":"ReferenceError: inject is not defined\n    at Module.callback (http://localhost:4200/assets/ember-app.js:1100:26)\n    at Module.exports (http://localhost:4200/assets/vendor.js:111:32)\n    at requireModule (http://localhost:4200/assets/vendor.js:32:18)\n    at Class._extractDefaultExport (http://localhost:4200/assets/vendor.js:205406:20)\n    at Class.resolveOther (http://localhost:4200/assets/vendor.js:205108:32)\n    at Class.superWrapper [as resolveOther] (http://localhost:4200/assets/vendor.js:61323:22)\n    at Class.resolveController (http://localhost:4200/assets/vendor.js:30343:19)\n    at Class.resolve (http://localhost:4200/assets/vendor.js:30250:43)\n    at Class.resolve (http://localhost:4200/assets/vendor.js:195847:19)\n    at Class.superWrapper [as resolve] (http://localhost:4200/assets/vendor.js:61323:22)"}');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('c3462d1c-ee0d-44ce-9714-7766b559cbef', 'ERROR', 0, 1, NULL, NULL, '2023-01-06 18:28:58.554', 'localhost', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54', 'http://localhost:4200/i-i-s-shop-order-e/new', 'EMBER-FLEXBERRY', 'ember-app', NULL, 'record is not defined', '{"name":"ReferenceError","message":"record is not defined","fileName":null,"lineNumber":null,"columnNumber":null,"stack":"ReferenceError: record is not defined\n    at Class._setLookupPredicate (http://localhost:4200/assets/ember-app.js:1126:42)\n    at sendEvent (http://localhost:4200/assets/vendor.js:40036:14)\n    at Class.trigger (http://localhost:4200/assets/vendor.js:55214:33)\n    at Class.lookupDialogOnHiddenTrigger (http://localhost:4200/assets/vendor.js:198625:12)\n    at http://localhost:4200/assets/vendor.js:181348:39\n    at Backburner._run (http://localhost:4200/assets/vendor.js:27199:35)\n    at Backburner.run (http://localhost:4200/assets/vendor.js:26917:25)\n    at Object.run (http://localhost:4200/assets/vendor.js:40198:29)\n    at HTMLDivElement.onHidden (http://localhost:4200/assets/vendor.js:181340:17)\n    at HTMLDivElement.onComplete (http://localhost:4200/assets/vendor.js:135746:39)"}');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('df4f913d-35a8-f9d3-bb85-4ce620442cac', 'ERROR', NULL, NULL, NULL, NULL, '2023-01-18 10:33:24.196', NULL, NULL, NULL, 'ICSSoft.STORMNET.LogService', '66', NULL, 'Адресат вызова создал исключение.', 'System.Reflection.TargetInvocationException: Адресат вызова создал исключение. ---> Microsoft.OData.ODataException: No function signature for the function with name ''contains'' matches the specified arguments. The function signatures considered are: contains(Edm.String Nullable=true, Edm.String Nullable=true).
   в Microsoft.OData.UriParser.FunctionCallBinder.MatchSignatureToUriFunction(String functionCallToken, SingleValueNode[] argumentNodes, IList`1 nameSignatures)
   в Microsoft.OData.UriParser.FunctionCallBinder.BindAsUriFunction(FunctionCallToken functionCallToken, List`1 argumentNodes)
   в Microsoft.OData.UriParser.FunctionCallBinder.BindFunctionCall(FunctionCallToken functionCallToken)
   в Microsoft.OData.UriParser.MetadataBinder.Bind(QueryToken token)
   в Microsoft.OData.UriParser.FilterBinder.BindFilter(QueryToken filter)
   в Microsoft.OData.UriParser.ODataQueryOptionParser.ParseFilter()
   в Microsoft.AspNet.OData.Query.FilterQueryOption.get_FilterClause()
   в NewPlatform.Flexberry.ORM.ODataService.Controllers.DataObjectController.FilterApplyTo(FilterQueryOption filter, IQueryable query)
   в NewPlatform.Flexberry.ORM.ODataService.Controllers.DataObjectController.ToExpression[TElement](ODataQueryOptions queryOpt)
   --- Конец трассировки внутреннего стека исключений ---
   в System.RuntimeMethodHandle.InvokeMethod(Object target, Object[] arguments, Signature sig, Boolean constructor)
   в System.Reflection.RuntimeMethodInfo.UnsafeInvokeInternal(Object obj, Object[] parameters, Object[] arguments)
   в System.Reflection.RuntimeMethodInfo.Invoke(Object obj, BindingFlags invokeAttr, Binder binder, Object[] parameters, CultureInfo culture)
   в System.Reflection.MethodBase.Invoke(Object obj, Object[] parameters)
   в NewPlatform.Flexberry.ORM.ODataService.Controllers.DataObjectController.GetExpression(Type type, ODataQueryOptions queryOptions)
   в NewPlatform.Flexberry.ORM.ODataService.Controllers.DataObjectController.CreateLcs()
   в NewPlatform.Flexberry.ORM.ODataService.Controllers.DataObjectController.ExecuteExpression()
   в NewPlatform.Flexberry.ORM.ODataService.Controllers.DataObjectController.Get()');
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('be476550-6db0-4eef-9ab4-e43098b9f48a', 'ERROR', 0, 1, NULL, NULL, '2023-01-18 10:14:09.583', 'localhost', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54', 'http://localhost:4200/i-i-s-shop-invoice-e/0656c520-1ee0-419b-bcb5-97ae367a3cc6', 'EMBER-FLEXBERRY', 'ember-app', NULL, 'Error while processing route: i-i-s-shop-invoice-e Could not find module `ember-flexberry-data/utils/filter-operator` imported from `ember-app/controllers/i-i-s-shop-invoice-e` Error: Could not find module `ember-flexberry-data/utils/filter-operator` imported from `ember-app/controllers/i-i-s-shop-invoice-e`
    at missingModule (http://localhost:4200/assets/vendor.js:252:11)
    at findModule (http://localhost:4200/assets/vendor.js:263:7)
    at Module.findDeps (http://localhost:4200/assets/vendor.js:173:24)
    at findModule (http://localhost:4200/assets/vendor.js:267:11)
    at requireModule (http://localhost:4200/assets/vendor.js:29:15)
    at Class._extractDefaultExport (http://localhost:4200/assets/vendor.js:205406:20)
    at Class.resolveOther (http://localhost:4200/assets/vendor.js:205108:32)
    at Class.superWrapper [as resolveOther] (http://localhost:4200/assets/vendor.js:61323:22)
    at Class.resolveController (http://localhost:4200/assets/vendor.js:30343:19)
    at Class.resolve (http://localhost:4200/assets/vendor.js:30250:43)', NULL);
INSERT INTO public.applicationlog (primarykey, category, eventid, priority, severity, title, "timestamp", machinename, appdomainname, processid, processname, threadname, win32threadid, message, formattedmessage) VALUES ('59121b40-afe9-40e8-bee5-73b8c580e4a5', 'ERROR', 0, 1, NULL, NULL, '2023-01-18 10:14:10.812', 'localhost', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54', 'http://localhost:4200/i-i-s-shop-invoice-e/0656c520-1ee0-419b-bcb5-97ae367a3cc6', 'EMBER-FLEXBERRY', 'ember-app', NULL, 'Could not find module `ember-flexberry-data/utils/filter-operator` imported from `ember-app/controllers/i-i-s-shop-invoice-e`', '{"name":"Error","message":"Could not find module `ember-flexberry-data/utils/filter-operator` imported from `ember-app/controllers/i-i-s-shop-invoice-e`","fileName":null,"lineNumber":null,"columnNumber":null,"stack":"Error: Could not find module `ember-flexberry-data/utils/filter-operator` imported from `ember-app/controllers/i-i-s-shop-invoice-e`\n    at missingModule (http://localhost:4200/assets/vendor.js:252:11)\n    at findModule (http://localhost:4200/assets/vendor.js:263:7)\n    at Module.findDeps (http://localhost:4200/assets/vendor.js:173:24)\n    at findModule (http://localhost:4200/assets/vendor.js:267:11)\n    at requireModule (http://localhost:4200/assets/vendor.js:29:15)\n    at Class._extractDefaultExport (http://localhost:4200/assets/vendor.js:205406:20)\n    at Class.resolveOther (http://localhost:4200/assets/vendor.js:205108:32)\n    at Class.superWrapper [as resolveOther] (http://localhost:4200/assets/vendor.js:61323:22)\n    at Class.resolveController (http://localhost:4200/assets/vendor.js:30343:19)\n    at Class.resolve (http://localhost:4200/assets/vendor.js:30250:43)"}');


--
-- TOC entry 2381 (class 0 OID 16827)
-- Dependencies: 193
-- Data for Name: document; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2384 (class 0 OID 16840)
-- Dependencies: 196
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.employee (primarykey, number, lastname, firstname, middlename, phonenumber, email, "position") VALUES ('cbbaed13-9d2f-45ce-b02b-bb2b60371c6f', 1, 'Иванов', 'Иван', 'Иванович', '200-00-01', 'ivanovii@shop.ru', 'Кладовщик');
INSERT INTO public.employee (primarykey, number, lastname, firstname, middlename, phonenumber, email, "position") VALUES ('f9dc2e70-318b-46c7-a806-5bbdfa83eeda', 2, 'Петров', 'Пётр', 'Петрович', '200-00-02', 'petrovpp@shop.ru', 'Кладовщик');
INSERT INTO public.employee (primarykey, number, lastname, firstname, middlename, phonenumber, email, "position") VALUES ('c05ef60f-4078-41d0-b59c-ba907a864032', 3, 'Александрова', 'Александра', 'Александровна', '200-00-03', 'aleksandrovaaa@shop.ru', 'Менеджер');
INSERT INTO public.employee (primarykey, number, lastname, firstname, middlename, phonenumber, email, "position") VALUES ('8d797aa6-d502-41ec-b1a4-962de9e6f39e', 4, 'Евгеньева', 'Евгения', 'Евгеньевна', '200-00-04', 'evgenyevaee@shop.ru', 'Менеджер');
INSERT INTO public.employee (primarykey, number, lastname, firstname, middlename, phonenumber, email, "position") VALUES ('1d8142d4-ae32-4622-b6ff-71f4cc5a8fe2', 5, 'Сидоров', 'Сидор', 'Сидорович', '200-00-05', 'sidorovss@shop.ru', 'Менеджер');


--
-- TOC entry 2377 (class 0 OID 16808)
-- Dependencies: 189
-- Data for Name: invoice; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.invoice (primarykey, status, shipmentdatetime, totalsum, totalweight, note, customername, number, createdate, responsibleperson, order_m0) VALUES ('0656c520-1ee0-419b-bcb5-97ae367a3cc6', 'Новая', NULL, 0, 0, NULL, NULL, 2, '2022-12-13 17:05:03.151', NULL, '291080d9-9523-46c5-99bb-dd68cfbb67d8');
INSERT INTO public.invoice (primarykey, status, shipmentdatetime, totalsum, totalweight, note, customername, number, createdate, responsibleperson, order_m0) VALUES ('372db034-9b08-414d-8acb-6e5f17e6ba74', 'Новая', NULL, 0, 0, NULL, NULL, 3, '2023-01-18 15:18:47.569', NULL, 'dacd4c91-89c8-4de4-9976-ff4ff4e4f298');


--
-- TOC entry 2373 (class 0 OID 16793)
-- Dependencies: 185
-- Data for Name: invoiceitem; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.invoiceitem (primarykey, amount, weight, price, totalsum, product_m0, invoice_m0) VALUES ('66065581-5cc4-4607-b9a5-99d166d1e30d', 1, 3.2999999999999998, 9889, 0, '0b6f48ee-5560-4a2c-b1e9-c0233bb7aea9', '0656c520-1ee0-419b-bcb5-97ae367a3cc6');
INSERT INTO public.invoiceitem (primarykey, amount, weight, price, totalsum, product_m0, invoice_m0) VALUES ('d2663c42-d74b-4fb9-973d-21859cf9f125', 3, 15.300000000000001, 24189, 0, '8dc94b7a-ee90-49ce-92ba-2203c230fd1e', '0656c520-1ee0-419b-bcb5-97ae367a3cc6');
INSERT INTO public.invoiceitem (primarykey, amount, weight, price, totalsum, product_m0, invoice_m0) VALUES ('5f657358-3346-4867-b3ea-9124206031d0', 1, 12, 52789, 0, 'e3d99636-a445-4c49-a790-5c3c16e76137', '372db034-9b08-414d-8acb-6e5f17e6ba74');


--
-- TOC entry 2382 (class 0 OID 16833)
-- Dependencies: 194
-- Data for Name: orderitem; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orderitem (primarykey, amount, pricewtaxes, totalsum, product_m0, order_m0) VALUES ('99804299-6116-4a30-8de8-374eb4ef3c38', 3, 24189, NULL, '8dc94b7a-ee90-49ce-92ba-2203c230fd1e', '291080d9-9523-46c5-99bb-dd68cfbb67d8');
INSERT INTO public.orderitem (primarykey, amount, pricewtaxes, totalsum, product_m0, order_m0) VALUES ('64f96787-90a2-4310-9891-6e095fa64404', 1, 9889, NULL, '0b6f48ee-5560-4a2c-b1e9-c0233bb7aea9', '291080d9-9523-46c5-99bb-dd68cfbb67d8');
INSERT INTO public.orderitem (primarykey, amount, pricewtaxes, totalsum, product_m0, order_m0) VALUES ('80159398-cc65-492b-8830-70d04a8a1b2f', 1, 52789, NULL, 'e3d99636-a445-4c49-a790-5c3c16e76137', 'dacd4c91-89c8-4de4-9976-ff4ff4e4f298');
INSERT INTO public.orderitem (primarykey, amount, pricewtaxes, totalsum, product_m0, order_m0) VALUES ('cf702d14-f6cb-459b-959a-b4d24806de5c', 1, 24189, NULL, '8dc94b7a-ee90-49ce-92ba-2203c230fd1e', '1aab0ae6-895e-47b7-b222-94a4d519b6f8');


--
-- TOC entry 2387 (class 0 OID 16856)
-- Dependencies: 199
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product (primarykey, productcode, name, measure, description, price, weight) VALUES ('0b6f48ee-5560-4a2c-b1e9-c0233bb7aea9', 1, 'Монитор Samsung C24F390FHI', 'шт.', 'Диагональ экрана 23.5”(59 см)', 8990, 3.2999999999999998);
INSERT INTO public.product (primarykey, productcode, name, measure, description, price, weight) VALUES ('8dc94b7a-ee90-49ce-92ba-2203c230fd1e', 2, 'Монитор игровой MSI Optix MAG241CP', 'шт.', 'Диагональ экрана 24”(60.9 см)', 21990, 5.0999999999999996);
INSERT INTO public.product (primarykey, productcode, name, measure, description, price, weight) VALUES ('b7260d72-a62b-48e7-8499-2cf512898fb0', 3, 'Системный блок Acer Aspire XC-330 DT.BD2ER.001', 'шт.', 'Процессор AMD A4 9120e 1.5 ГГц', 19990, 5.5);
INSERT INTO public.product (primarykey, productcode, name, measure, description, price, weight) VALUES ('e3d99636-a445-4c49-a790-5c3c16e76137', 4, 'Системный блок игровой Lenovo Legion T530-28ICB MT (90JL00M4RS)', 'шт.', 'Процессор Intel Core i3 8100 3.6 ГГц', 47990, 12);


--
-- TOC entry 2417 (class 0 OID 0)
-- Dependencies: 198
-- Name: sequence0d4df6d99e1a41c4a1ae260693cd44c7; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sequence0d4df6d99e1a41c4a1ae260693cd44c7', 4, true);


--
-- TOC entry 2418 (class 0 OID 0)
-- Dependencies: 186
-- Name: sequence626d1d020bfc44b48d0695eae2a0964f; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sequence626d1d020bfc44b48d0695eae2a0964f', 3, true);


--
-- TOC entry 2419 (class 0 OID 0)
-- Dependencies: 190
-- Name: sequence69cf974b2046498ab0b3483dcf9046fa; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sequence69cf974b2046498ab0b3483dcf9046fa', 15, true);


--
-- TOC entry 2420 (class 0 OID 0)
-- Dependencies: 188
-- Name: sequence80c8e2d600704ac0a9e80d540319099f; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sequence80c8e2d600704ac0a9e80d540319099f', 3, true);


--
-- TOC entry 2421 (class 0 OID 0)
-- Dependencies: 192
-- Name: sequencef0f25673e7d548f6833de48f18d788fd; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sequencef0f25673e7d548f6833de48f18d788fd', 1, false);


--
-- TOC entry 2422 (class 0 OID 0)
-- Dependencies: 195
-- Name: sequencef6b2c9e7807246e3b17ae8ad7988d9cb; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sequencef6b2c9e7807246e3b17ae8ad7988d9cb', 6, true);


--
-- TOC entry 2400 (class 0 OID 16961)
-- Dependencies: 212
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2375 (class 0 OID 16800)
-- Dependencies: 187
-- Data for Name: storehouse; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.storehouse (primarykey, number, address, storekeeper) VALUES ('590b1932-a54e-446d-bfe7-cbb54670467f', 1, 'ул. Ленина, д. 1, коп. а', 'f9dc2e70-318b-46c7-a806-5bbdfa83eeda');
INSERT INTO public.storehouse (primarykey, number, address, storekeeper) VALUES ('7686afa0-195c-4a36-8645-5ace0bef01a4', 2, 'ул. Ленина, д. 1, коп. б', 'cbbaed13-9d2f-45ce-b02b-bb2b60371c6f');


--
-- TOC entry 2385 (class 0 OID 16849)
-- Dependencies: 197
-- Data for Name: storeproduct; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.storeproduct (primarykey, amount, product_m0, storehouse_m0) VALUES ('955df719-8673-4524-aba4-1a38914ded9d', 4, '0b6f48ee-5560-4a2c-b1e9-c0233bb7aea9', '590b1932-a54e-446d-bfe7-cbb54670467f');
INSERT INTO public.storeproduct (primarykey, amount, product_m0, storehouse_m0) VALUES ('4b9a71de-f5a9-431d-be62-df6d155cd8ce', 1, '8dc94b7a-ee90-49ce-92ba-2203c230fd1e', '590b1932-a54e-446d-bfe7-cbb54670467f');
INSERT INTO public.storeproduct (primarykey, amount, product_m0, storehouse_m0) VALUES ('9cca36ff-1b84-4725-8905-5787171d7acb', 1, '0b6f48ee-5560-4a2c-b1e9-c0233bb7aea9', '7686afa0-195c-4a36-8645-5ace0bef01a4');
INSERT INTO public.storeproduct (primarykey, amount, product_m0, storehouse_m0) VALUES ('5e5103f6-f79f-4e3c-9001-cd6ea0a5eb38', 2, '8dc94b7a-ee90-49ce-92ba-2203c230fd1e', '7686afa0-195c-4a36-8645-5ace0bef01a4');


--
-- TOC entry 2404 (class 0 OID 16990)
-- Dependencies: 216
-- Data for Name: stormac; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2390 (class 0 OID 16881)
-- Dependencies: 202
-- Data for Name: stormadvlimit; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2397 (class 0 OID 16937)
-- Dependencies: 209
-- Data for Name: stormag; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2403 (class 0 OID 16982)
-- Dependencies: 215
-- Data for Name: stormf; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2393 (class 0 OID 16905)
-- Dependencies: 205
-- Data for Name: stormfilterdetail; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2394 (class 0 OID 16913)
-- Dependencies: 206
-- Data for Name: stormfilterlookup; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2391 (class 0 OID 16889)
-- Dependencies: 203
-- Data for Name: stormfiltersetting; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2399 (class 0 OID 16953)
-- Dependencies: 211
-- Data for Name: stormi; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2406 (class 0 OID 17006)
-- Dependencies: 218
-- Data for Name: stormla; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2398 (class 0 OID 16945)
-- Dependencies: 210
-- Data for Name: stormlg; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2405 (class 0 OID 16998)
-- Dependencies: 217
-- Data for Name: stormlo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2408 (class 0 OID 17022)
-- Dependencies: 220
-- Data for Name: stormlr; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2407 (class 0 OID 17014)
-- Dependencies: 219
-- Data for Name: stormlv; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2388 (class 0 OID 16865)
-- Dependencies: 200
-- Data for Name: stormnetlockdata; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.stormnetlockdata (lockkey, username, lockdate) VALUES ('ce7dcd07-a81d-45e4-8286-fb7f239c4c8c', 'userName', '2022-12-05 17:18:04.369');
INSERT INTO public.stormnetlockdata (lockkey, username, lockdate) VALUES ('08fbb421-59aa-4c7d-a008-52ddd0ded2d2', 'userName', '2022-12-05 17:18:17.856');


--
-- TOC entry 2402 (class 0 OID 16974)
-- Dependencies: 214
-- Data for Name: stormp; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2401 (class 0 OID 16966)
-- Dependencies: 213
-- Data for Name: storms; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2389 (class 0 OID 16873)
-- Dependencies: 201
-- Data for Name: stormsettings; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2392 (class 0 OID 16897)
-- Dependencies: 204
-- Data for Name: stormwebsearch; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2395 (class 0 OID 16921)
-- Dependencies: 207
-- Data for Name: usersetting; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usersetting (primarykey, appname, username, userguid, modulename, moduleguid, settname, settguid, settlastaccesstime, strval, txtval, intval, boolval, guidval, decimalval, datetimeval) VALUES ('7600f554-1f82-48c2-975d-509f72b8f64d', 'i-i-s-shop-invoice-e@ember-app', 'userName', NULL, 'orderLookup', NULL, 'DEFAULT', NULL, '2022-12-13 14:22:08.913', NULL, '{"sorting":[{"propName":"createDate","direction":"desc"}]}', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usersetting (primarykey, appname, username, userguid, modulename, moduleguid, settname, settguid, settlastaccesstime, strval, txtval, intval, boolval, guidval, decimalval, datetimeval) VALUES ('7cb74d99-aa5b-4b87-a3c5-84c92dd9ffc7', 'i-i-s-shop-invoice-e@ember-app', 'userName', NULL, 'invoiceItemGroupEdit', NULL, 'DEFAULT', NULL, '2022-12-13 14:48:24.017', NULL, '{"columnWidths":[{"propName":"product","width":193},{"propName":"amount","width":193},{"propName":"weight","width":193},{"propName":"price","width":151},{"propName":"totalSum","width":235}],"sorting":[]}', NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 2168 (class 2606 OID 16824)
-- Name: Order Order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_pkey" PRIMARY KEY (primarykey);


--
-- TOC entry 2201 (class 2606 OID 16936)
-- Name: applicationlog applicationlog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicationlog
    ADD CONSTRAINT applicationlog_pkey PRIMARY KEY (primarykey);


--
-- TOC entry 2171 (class 2606 OID 16832)
-- Name: document document_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.document
    ADD CONSTRAINT document_pkey PRIMARY KEY (primarykey);


--
-- TOC entry 2177 (class 2606 OID 16848)
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (primarykey);


--
-- TOC entry 2166 (class 2606 OID 16816)
-- Name: invoice invoice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT invoice_pkey PRIMARY KEY (primarykey);


--
-- TOC entry 2159 (class 2606 OID 16797)
-- Name: invoiceitem invoiceitem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoiceitem
    ADD CONSTRAINT invoiceitem_pkey PRIMARY KEY (primarykey);


--
-- TOC entry 2175 (class 2606 OID 16837)
-- Name: orderitem orderitem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderitem
    ADD CONSTRAINT orderitem_pkey PRIMARY KEY (primarykey);


--
-- TOC entry 2183 (class 2606 OID 16864)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (primarykey);


--
-- TOC entry 2209 (class 2606 OID 16965)
-- Name: session session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_pkey PRIMARY KEY (primarykey);


--
-- TOC entry 2162 (class 2606 OID 16805)
-- Name: storehouse storehouse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storehouse
    ADD CONSTRAINT storehouse_pkey PRIMARY KEY (primarykey);


--
-- TOC entry 2181 (class 2606 OID 16853)
-- Name: storeproduct storeproduct_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storeproduct
    ADD CONSTRAINT storeproduct_pkey PRIMARY KEY (primarykey);


--
-- TOC entry 2217 (class 2606 OID 16997)
-- Name: stormac stormac_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stormac
    ADD CONSTRAINT stormac_pkey PRIMARY KEY (primarykey);


--
-- TOC entry 2189 (class 2606 OID 16888)
-- Name: stormadvlimit stormadvlimit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stormadvlimit
    ADD CONSTRAINT stormadvlimit_pkey PRIMARY KEY (primarykey);


--
-- TOC entry 2203 (class 2606 OID 16944)
-- Name: stormag stormag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stormag
    ADD CONSTRAINT stormag_pkey PRIMARY KEY (primarykey);


--
-- TOC entry 2215 (class 2606 OID 16989)
-- Name: stormf stormf_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stormf
    ADD CONSTRAINT stormf_pkey PRIMARY KEY (primarykey);


--
-- TOC entry 2195 (class 2606 OID 16912)
-- Name: stormfilterdetail stormfilterdetail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stormfilterdetail
    ADD CONSTRAINT stormfilterdetail_pkey PRIMARY KEY (primarykey);


--
-- TOC entry 2197 (class 2606 OID 16920)
-- Name: stormfilterlookup stormfilterlookup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stormfilterlookup
    ADD CONSTRAINT stormfilterlookup_pkey PRIMARY KEY (primarykey);


--
-- TOC entry 2191 (class 2606 OID 16896)
-- Name: stormfiltersetting stormfiltersetting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stormfiltersetting
    ADD CONSTRAINT stormfiltersetting_pkey PRIMARY KEY (primarykey);


--
-- TOC entry 2207 (class 2606 OID 16960)
-- Name: stormi stormi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stormi
    ADD CONSTRAINT stormi_pkey PRIMARY KEY (primarykey);


--
-- TOC entry 2221 (class 2606 OID 17013)
-- Name: stormla stormla_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stormla
    ADD CONSTRAINT stormla_pkey PRIMARY KEY (primarykey);


--
-- TOC entry 2205 (class 2606 OID 16952)
-- Name: stormlg stormlg_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stormlg
    ADD CONSTRAINT stormlg_pkey PRIMARY KEY (primarykey);


--
-- TOC entry 2219 (class 2606 OID 17005)
-- Name: stormlo stormlo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stormlo
    ADD CONSTRAINT stormlo_pkey PRIMARY KEY (primarykey);


--
-- TOC entry 2225 (class 2606 OID 17029)
-- Name: stormlr stormlr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stormlr
    ADD CONSTRAINT stormlr_pkey PRIMARY KEY (primarykey);


--
-- TOC entry 2223 (class 2606 OID 17021)
-- Name: stormlv stormlv_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stormlv
    ADD CONSTRAINT stormlv_pkey PRIMARY KEY (primarykey);


--
-- TOC entry 2185 (class 2606 OID 16872)
-- Name: stormnetlockdata stormnetlockdata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stormnetlockdata
    ADD CONSTRAINT stormnetlockdata_pkey PRIMARY KEY (lockkey);


--
-- TOC entry 2213 (class 2606 OID 16981)
-- Name: stormp stormp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stormp
    ADD CONSTRAINT stormp_pkey PRIMARY KEY (primarykey);


--
-- TOC entry 2211 (class 2606 OID 16973)
-- Name: storms storms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storms
    ADD CONSTRAINT storms_pkey PRIMARY KEY (primarykey);


--
-- TOC entry 2187 (class 2606 OID 16880)
-- Name: stormsettings stormsettings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stormsettings
    ADD CONSTRAINT stormsettings_pkey PRIMARY KEY (primarykey);


--
-- TOC entry 2193 (class 2606 OID 16904)
-- Name: stormwebsearch stormwebsearch_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stormwebsearch
    ADD CONSTRAINT stormwebsearch_pkey PRIMARY KEY (primarykey);


--
-- TOC entry 2199 (class 2606 OID 16928)
-- Name: usersetting usersetting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usersetting
    ADD CONSTRAINT usersetting_pkey PRIMARY KEY (primarykey);


--
-- TOC entry 2172 (class 1259 OID 17071)
-- Name: index18fea1ee9a731e52489114855ff118548798e10c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index18fea1ee9a731e52489114855ff118548798e10c ON public.orderitem USING btree (product_m0);


--
-- TOC entry 2160 (class 1259 OID 17047)
-- Name: index3fec2776d5ef30395527addab7520af46ec41e82; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index3fec2776d5ef30395527addab7520af46ec41e82 ON public.storehouse USING btree (storekeeper);


--
-- TOC entry 2156 (class 1259 OID 17035)
-- Name: index6b13f8e141474c8fa2be524d580728c36cb4adce; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index6b13f8e141474c8fa2be524d580728c36cb4adce ON public.invoiceitem USING btree (product_m0);


--
-- TOC entry 2178 (class 1259 OID 17083)
-- Name: index81df1790d937ae4e083b80d9132881c97aecad6f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index81df1790d937ae4e083b80d9132881c97aecad6f ON public.storeproduct USING btree (product_m0);


--
-- TOC entry 2169 (class 1259 OID 17065)
-- Name: index84e406358bd1f0a5cb12051beb83bc57d2ec2a19; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index84e406358bd1f0a5cb12051beb83bc57d2ec2a19 ON public."Order" USING btree (manager);


--
-- TOC entry 2157 (class 1259 OID 17041)
-- Name: index956de1376853dbd72c90b4fc77b34a1065a7b353; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index956de1376853dbd72c90b4fc77b34a1065a7b353 ON public.invoiceitem USING btree (invoice_m0);


--
-- TOC entry 2163 (class 1259 OID 17053)
-- Name: index978ca0ba8dc59b68af9f965bebf309d60d1e8bfb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index978ca0ba8dc59b68af9f965bebf309d60d1e8bfb ON public.invoice USING btree (responsibleperson);


--
-- TOC entry 2179 (class 1259 OID 17089)
-- Name: indexdca45c3915edd46590c360503f2fc14b4218cb35; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX indexdca45c3915edd46590c360503f2fc14b4218cb35 ON public.storeproduct USING btree (storehouse_m0);


--
-- TOC entry 2164 (class 1259 OID 17059)
-- Name: indexef621d158f537998a10cc64f9edd24b3f8e864c3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX indexef621d158f537998a10cc64f9edd24b3f8e864c3 ON public.invoice USING btree (order_m0);


--
-- TOC entry 2173 (class 1259 OID 17077)
-- Name: indexff800bd0bec1ed8a9fe70239b2d0fc6ef9f2bc4c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX indexff800bd0bec1ed8a9fe70239b2d0fc6ef9f2bc4c ON public.orderitem USING btree (order_m0);


--
-- TOC entry 2239 (class 2606 OID 17105)
-- Name: stormlg fk0554cb8148cfecf6ba0d42d8b1269901f77fa748; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stormlg
    ADD CONSTRAINT fk0554cb8148cfecf6ba0d42d8b1269901f77fa748 FOREIGN KEY (group_m0) REFERENCES public.stormag(primarykey);


--
-- TOC entry 2251 (class 2606 OID 17165)
-- Name: stormla fk16b0d36273b324b35898b6b11eb090983b449688; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stormla
    ADD CONSTRAINT fk16b0d36273b324b35898b6b11eb090983b449688 FOREIGN KEY (attribute_m0) REFERENCES public.storms(primarykey);


--
-- TOC entry 2232 (class 2606 OID 17066)
-- Name: orderitem fk18fea1ee9a731e52489114855ff118548798e10c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderitem
    ADD CONSTRAINT fk18fea1ee9a731e52489114855ff118548798e10c FOREIGN KEY (product_m0) REFERENCES public.product(primarykey);


--
-- TOC entry 2244 (class 2606 OID 17130)
-- Name: stormp fk2fa0276ae135e1c346466071b40d67011253aecb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stormp
    ADD CONSTRAINT fk2fa0276ae135e1c346466071b40d67011253aecb FOREIGN KEY (agent_m0) REFERENCES public.stormag(primarykey);


--
-- TOC entry 2248 (class 2606 OID 17150)
-- Name: stormlo fk3bedf404d004e5734ca9c80d535aedfd3947fb2c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stormlo
    ADD CONSTRAINT fk3bedf404d004e5734ca9c80d535aedfd3947fb2c FOREIGN KEY (class_m0) REFERENCES public.storms(primarykey);


--
-- TOC entry 2228 (class 2606 OID 17042)
-- Name: storehouse fk3fec2776d5ef30395527addab7520af46ec41e82; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storehouse
    ADD CONSTRAINT fk3fec2776d5ef30395527addab7520af46ec41e82 FOREIGN KEY (storekeeper) REFERENCES public.employee(primarykey);


--
-- TOC entry 2255 (class 2606 OID 17185)
-- Name: stormlr fk4163784b9de4ee0586021571ce325cde7a0f43d5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stormlr
    ADD CONSTRAINT fk4163784b9de4ee0586021571ce325cde7a0f43d5 FOREIGN KEY (role_m0) REFERENCES public.stormag(primarykey);


--
-- TOC entry 2240 (class 2606 OID 17110)
-- Name: stormlg fk6137b36428111ba40a80c2518b058b05f394fcc4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stormlg
    ADD CONSTRAINT fk6137b36428111ba40a80c2518b058b05f394fcc4 FOREIGN KEY (user_m0) REFERENCES public.stormag(primarykey);


--
-- TOC entry 2241 (class 2606 OID 17115)
-- Name: stormi fk6304b9ae4b671a0f2bc48e8a8c009f6b104b0a1f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stormi
    ADD CONSTRAINT fk6304b9ae4b671a0f2bc48e8a8c009f6b104b0a1f FOREIGN KEY (user_m0) REFERENCES public.stormag(primarykey);


--
-- TOC entry 2226 (class 2606 OID 17030)
-- Name: invoiceitem fk6b13f8e141474c8fa2be524d580728c36cb4adce; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoiceitem
    ADD CONSTRAINT fk6b13f8e141474c8fa2be524d580728c36cb4adce FOREIGN KEY (product_m0) REFERENCES public.product(primarykey);


--
-- TOC entry 2254 (class 2606 OID 17180)
-- Name: stormlr fk6f0987fa958699163a4f770515a20fef10112daf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stormlr
    ADD CONSTRAINT fk6f0987fa958699163a4f770515a20fef10112daf FOREIGN KEY (agent_m0) REFERENCES public.stormag(primarykey);


--
-- TOC entry 2246 (class 2606 OID 17140)
-- Name: stormac fk72f14c02316962cfa39feadbeb7fda74e32b3ad4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stormac
    ADD CONSTRAINT fk72f14c02316962cfa39feadbeb7fda74e32b3ad4 FOREIGN KEY (filter_m0) REFERENCES public.stormf(primarykey);


--
-- TOC entry 2252 (class 2606 OID 17170)
-- Name: stormlv fk801ad2f08f7bd2537f104c0461258e71f27beae7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stormlv
    ADD CONSTRAINT fk801ad2f08f7bd2537f104c0461258e71f27beae7 FOREIGN KEY (class_m0) REFERENCES public.storms(primarykey);


--
-- TOC entry 2234 (class 2606 OID 17078)
-- Name: storeproduct fk81df1790d937ae4e083b80d9132881c97aecad6f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storeproduct
    ADD CONSTRAINT fk81df1790d937ae4e083b80d9132881c97aecad6f FOREIGN KEY (product_m0) REFERENCES public.product(primarykey);


--
-- TOC entry 2253 (class 2606 OID 17175)
-- Name: stormlv fk84bf6ca16fb91164020cd4757e944302030f8900; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stormlv
    ADD CONSTRAINT fk84bf6ca16fb91164020cd4757e944302030f8900 FOREIGN KEY (view_m0) REFERENCES public.storms(primarykey);


--
-- TOC entry 2231 (class 2606 OID 17060)
-- Name: Order fk84e406358bd1f0a5cb12051beb83bc57d2ec2a19; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT fk84e406358bd1f0a5cb12051beb83bc57d2ec2a19 FOREIGN KEY (manager) REFERENCES public.employee(primarykey);


--
-- TOC entry 2245 (class 2606 OID 17135)
-- Name: stormf fk8588a045b77cc453e5ba32bd9c73026d2eb50173; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stormf
    ADD CONSTRAINT fk8588a045b77cc453e5ba32bd9c73026d2eb50173 FOREIGN KEY (subject_m0) REFERENCES public.storms(primarykey);


--
-- TOC entry 2237 (class 2606 OID 17095)
-- Name: stormfilterdetail fk921d16269835017e2a0d0e29ad6fb175454a70d0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stormfilterdetail
    ADD CONSTRAINT fk921d16269835017e2a0d0e29ad6fb175454a70d0 FOREIGN KEY (filtersetting_m0) REFERENCES public.stormfiltersetting(primarykey);


--
-- TOC entry 2227 (class 2606 OID 17036)
-- Name: invoiceitem fk956de1376853dbd72c90b4fc77b34a1065a7b353; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoiceitem
    ADD CONSTRAINT fk956de1376853dbd72c90b4fc77b34a1065a7b353 FOREIGN KEY (invoice_m0) REFERENCES public.invoice(primarykey);


--
-- TOC entry 2229 (class 2606 OID 17048)
-- Name: invoice fk978ca0ba8dc59b68af9f965bebf309d60d1e8bfb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT fk978ca0ba8dc59b68af9f965bebf309d60d1e8bfb FOREIGN KEY (responsibleperson) REFERENCES public.employee(primarykey);


--
-- TOC entry 2250 (class 2606 OID 17160)
-- Name: stormla fk99d27bab62c089fb367af03f6a7e3afc67018b0f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stormla
    ADD CONSTRAINT fk99d27bab62c089fb367af03f6a7e3afc67018b0f FOREIGN KEY (view_m0) REFERENCES public.storms(primarykey);


--
-- TOC entry 2247 (class 2606 OID 17145)
-- Name: stormac fkad82bd448a0a478a6b51e03e672bf99c3428e9ca; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stormac
    ADD CONSTRAINT fkad82bd448a0a478a6b51e03e672bf99c3428e9ca FOREIGN KEY (permition_m0) REFERENCES public.stormp(primarykey);


--
-- TOC entry 2236 (class 2606 OID 17090)
-- Name: stormwebsearch fkc4378e39870eb056aec84088683297a01d2a6200; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stormwebsearch
    ADD CONSTRAINT fkc4378e39870eb056aec84088683297a01d2a6200 FOREIGN KEY (filtersetting_m0) REFERENCES public.stormfiltersetting(primarykey);


--
-- TOC entry 2243 (class 2606 OID 17125)
-- Name: stormp fkc9465f31b8224cb06215f90ff473d316ae00c2c6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stormp
    ADD CONSTRAINT fkc9465f31b8224cb06215f90ff473d316ae00c2c6 FOREIGN KEY (subject_m0) REFERENCES public.storms(primarykey);


--
-- TOC entry 2238 (class 2606 OID 17100)
-- Name: stormfilterlookup fkce38ef0db3f01a53acaa49fed8853fb941ad47ba; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stormfilterlookup
    ADD CONSTRAINT fkce38ef0db3f01a53acaa49fed8853fb941ad47ba FOREIGN KEY (filtersetting_m0) REFERENCES public.stormfiltersetting(primarykey);


--
-- TOC entry 2235 (class 2606 OID 17084)
-- Name: storeproduct fkdca45c3915edd46590c360503f2fc14b4218cb35; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storeproduct
    ADD CONSTRAINT fkdca45c3915edd46590c360503f2fc14b4218cb35 FOREIGN KEY (storehouse_m0) REFERENCES public.storehouse(primarykey);


--
-- TOC entry 2249 (class 2606 OID 17155)
-- Name: stormlo fkeb33fda347a7b511eba60885438cfc64701476ff; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stormlo
    ADD CONSTRAINT fkeb33fda347a7b511eba60885438cfc64701476ff FOREIGN KEY (operation_m0) REFERENCES public.storms(primarykey);


--
-- TOC entry 2230 (class 2606 OID 17054)
-- Name: invoice fkef621d158f537998a10cc64f9edd24b3f8e864c3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT fkef621d158f537998a10cc64f9edd24b3f8e864c3 FOREIGN KEY (order_m0) REFERENCES public."Order"(primarykey);


--
-- TOC entry 2242 (class 2606 OID 17120)
-- Name: stormi fkfb8becc42a4a75678c726529b1095111a8f262e9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stormi
    ADD CONSTRAINT fkfb8becc42a4a75678c726529b1095111a8f262e9 FOREIGN KEY (agent_m0) REFERENCES public.stormag(primarykey);


--
-- TOC entry 2233 (class 2606 OID 17072)
-- Name: orderitem fkff800bd0bec1ed8a9fe70239b2d0fc6ef9f2bc4c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderitem
    ADD CONSTRAINT fkff800bd0bec1ed8a9fe70239b2d0fc6ef9f2bc4c FOREIGN KEY (order_m0) REFERENCES public."Order"(primarykey);


-- Completed on 2023-01-18 17:35:17

--
-- PostgreSQL database dump complete
--

