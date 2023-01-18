--liquibase formatted sql
--changeset flexberry-designer:2022-12-12-19-45-diff-sql
DO $$ declare ConstrName varchar(50); declare altertablecmd varchar(200); BEGIN
SELECT tc.constraint_name FROM information_schema.table_constraints AS tc JOIN information_schema.key_column_usage AS kcu ON tc.constraint_name = kcu.constraint_name JOIN information_schema.constraint_column_usage AS ccu ON ccu.constraint_name = tc.constraint_name WHERE constraint_type = 'FOREIGN KEY' AND tc.table_name='invoice' and kcu.column_name='responsibleperson' into ConstrName;
IF ConstrName!=''  THEN
	altertablecmd ='alter table "invoice" drop constraint "' || ConstrName || '"';
	raise notice '%', altertablecmd;
	EXECUTE altertablecmd;
ELSE
	raise notice 'No such constraint.';
END IF; END; $$;
DO $$ declare ConstrName varchar(50); declare altertablecmd varchar(200); BEGIN
SELECT tc.constraint_name FROM information_schema.table_constraints AS tc JOIN information_schema.key_column_usage AS kcu ON tc.constraint_name = kcu.constraint_name JOIN information_schema.constraint_column_usage AS ccu ON ccu.constraint_name = tc.constraint_name WHERE constraint_type = 'FOREIGN KEY' AND tc.table_name='invoice' and kcu.column_name='order_m0' into ConstrName;
IF ConstrName!=''  THEN
	altertablecmd ='alter table "invoice" drop constraint "' || ConstrName || '"';
	raise notice '%', altertablecmd;
	EXECUTE altertablecmd;
ELSE
	raise notice 'No such constraint.';
END IF; END; $$;
DO $$ declare ConstrName varchar(50); declare altertablecmd varchar(200); BEGIN
SELECT tc.constraint_name FROM information_schema.table_constraints AS tc JOIN information_schema.key_column_usage AS kcu ON tc.constraint_name = kcu.constraint_name JOIN information_schema.constraint_column_usage AS ccu ON ccu.constraint_name = tc.constraint_name WHERE constraint_type = 'FOREIGN KEY' AND tc.table_name='invoiceitem' and kcu.column_name='product_m0' into ConstrName;
IF ConstrName!=''  THEN
	altertablecmd ='alter table "invoiceitem" drop constraint "' || ConstrName || '"';
	raise notice '%', altertablecmd;
	EXECUTE altertablecmd;
ELSE
	raise notice 'No such constraint.';
END IF; END; $$;
DO $$ declare ConstrName varchar(50); declare altertablecmd varchar(200); BEGIN
SELECT tc.constraint_name FROM information_schema.table_constraints AS tc JOIN information_schema.key_column_usage AS kcu ON tc.constraint_name = kcu.constraint_name JOIN information_schema.constraint_column_usage AS ccu ON ccu.constraint_name = tc.constraint_name WHERE constraint_type = 'FOREIGN KEY' AND tc.table_name='invoiceitem' and kcu.column_name='invoice_m0' into ConstrName;
IF ConstrName!=''  THEN
	altertablecmd ='alter table "invoiceitem" drop constraint "' || ConstrName || '"';
	raise notice '%', altertablecmd;
	EXECUTE altertablecmd;
ELSE
	raise notice 'No such constraint.';
END IF; END; $$;
DO $$ declare ConstrName varchar(50); declare altertablecmd varchar(200); BEGIN
SELECT tc.constraint_name FROM information_schema.table_constraints AS tc JOIN information_schema.key_column_usage AS kcu ON tc.constraint_name = kcu.constraint_name JOIN information_schema.constraint_column_usage AS ccu ON ccu.constraint_name = tc.constraint_name WHERE constraint_type = 'FOREIGN KEY' AND tc.table_name='orderitem' and kcu.column_name='product_m0' into ConstrName;
IF ConstrName!=''  THEN
	altertablecmd ='alter table "orderitem" drop constraint "' || ConstrName || '"';
	raise notice '%', altertablecmd;
	EXECUTE altertablecmd;
ELSE
	raise notice 'No such constraint.';
END IF; END; $$;
DO $$ declare ConstrName varchar(50); declare altertablecmd varchar(200); BEGIN
SELECT tc.constraint_name FROM information_schema.table_constraints AS tc JOIN information_schema.key_column_usage AS kcu ON tc.constraint_name = kcu.constraint_name JOIN information_schema.constraint_column_usage AS ccu ON ccu.constraint_name = tc.constraint_name WHERE constraint_type = 'FOREIGN KEY' AND tc.table_name='orderitem' and kcu.column_name='order_m0' into ConstrName;
IF ConstrName!=''  THEN
	altertablecmd ='alter table "orderitem" drop constraint "' || ConstrName || '"';
	raise notice '%', altertablecmd;
	EXECUTE altertablecmd;
ELSE
	raise notice 'No such constraint.';
END IF; END; $$;
DO $$ declare ConstrName varchar(50); declare altertablecmd varchar(200); BEGIN
SELECT tc.constraint_name FROM information_schema.table_constraints AS tc JOIN information_schema.key_column_usage AS kcu ON tc.constraint_name = kcu.constraint_name JOIN information_schema.constraint_column_usage AS ccu ON ccu.constraint_name = tc.constraint_name WHERE constraint_type = 'FOREIGN KEY' AND tc.table_name='storehouse' and kcu.column_name='storekeeper' into ConstrName;
IF ConstrName!=''  THEN
	altertablecmd ='alter table "storehouse" drop constraint "' || ConstrName || '"';
	raise notice '%', altertablecmd;
	EXECUTE altertablecmd;
ELSE
	raise notice 'No such constraint.';
END IF; END; $$;
DO $$ declare ConstrName varchar(50); declare altertablecmd varchar(200); BEGIN
SELECT tc.constraint_name FROM information_schema.table_constraints AS tc JOIN information_schema.key_column_usage AS kcu ON tc.constraint_name = kcu.constraint_name JOIN information_schema.constraint_column_usage AS ccu ON ccu.constraint_name = tc.constraint_name WHERE constraint_type = 'FOREIGN KEY' AND tc.table_name='storeproduct' and kcu.column_name='product_m0' into ConstrName;
IF ConstrName!=''  THEN
	altertablecmd ='alter table "storeproduct" drop constraint "' || ConstrName || '"';
	raise notice '%', altertablecmd;
	EXECUTE altertablecmd;
ELSE
	raise notice 'No such constraint.';
END IF; END; $$;
DO $$ declare ConstrName varchar(50); declare altertablecmd varchar(200); BEGIN
SELECT tc.constraint_name FROM information_schema.table_constraints AS tc JOIN information_schema.key_column_usage AS kcu ON tc.constraint_name = kcu.constraint_name JOIN information_schema.constraint_column_usage AS ccu ON ccu.constraint_name = tc.constraint_name WHERE constraint_type = 'FOREIGN KEY' AND tc.table_name='storeproduct' and kcu.column_name='storehouse_m0' into ConstrName;
IF ConstrName!=''  THEN
	altertablecmd ='alter table "storeproduct" drop constraint "' || ConstrName || '"';
	raise notice '%', altertablecmd;
	EXECUTE altertablecmd;
ELSE
	raise notice 'No such constraint.';
END IF; END; $$;
DO $$ declare ConstrName varchar(50); declare altertablecmd varchar(200); BEGIN
SELECT tc.constraint_name FROM information_schema.table_constraints AS tc JOIN information_schema.key_column_usage AS kcu ON tc.constraint_name = kcu.constraint_name JOIN information_schema.constraint_column_usage AS ccu ON ccu.constraint_name = tc.constraint_name WHERE constraint_type = 'FOREIGN KEY' AND tc.table_name='stormac' and kcu.column_name='filter_m0' into ConstrName;
IF ConstrName!=''  THEN
	altertablecmd ='alter table "stormac" drop constraint "' || ConstrName || '"';
	raise notice '%', altertablecmd;
	EXECUTE altertablecmd;
ELSE
	raise notice 'No such constraint.';
END IF; END; $$;
DO $$ declare ConstrName varchar(50); declare altertablecmd varchar(200); BEGIN
SELECT tc.constraint_name FROM information_schema.table_constraints AS tc JOIN information_schema.key_column_usage AS kcu ON tc.constraint_name = kcu.constraint_name JOIN information_schema.constraint_column_usage AS ccu ON ccu.constraint_name = tc.constraint_name WHERE constraint_type = 'FOREIGN KEY' AND tc.table_name='stormac' and kcu.column_name='permition_m0' into ConstrName;
IF ConstrName!=''  THEN
	altertablecmd ='alter table "stormac" drop constraint "' || ConstrName || '"';
	raise notice '%', altertablecmd;
	EXECUTE altertablecmd;
ELSE
	raise notice 'No such constraint.';
END IF; END; $$;
DO $$ declare ConstrName varchar(50); declare altertablecmd varchar(200); BEGIN
SELECT tc.constraint_name FROM information_schema.table_constraints AS tc JOIN information_schema.key_column_usage AS kcu ON tc.constraint_name = kcu.constraint_name JOIN information_schema.constraint_column_usage AS ccu ON ccu.constraint_name = tc.constraint_name WHERE constraint_type = 'FOREIGN KEY' AND tc.table_name='stormf' and kcu.column_name='subject_m0' into ConstrName;
IF ConstrName!=''  THEN
	altertablecmd ='alter table "stormf" drop constraint "' || ConstrName || '"';
	raise notice '%', altertablecmd;
	EXECUTE altertablecmd;
ELSE
	raise notice 'No such constraint.';
END IF; END; $$;
DO $$ declare ConstrName varchar(50); declare altertablecmd varchar(200); BEGIN
SELECT tc.constraint_name FROM information_schema.table_constraints AS tc JOIN information_schema.key_column_usage AS kcu ON tc.constraint_name = kcu.constraint_name JOIN information_schema.constraint_column_usage AS ccu ON ccu.constraint_name = tc.constraint_name WHERE constraint_type = 'FOREIGN KEY' AND tc.table_name='stormfilterdetail' and kcu.column_name='filtersetting_m0' into ConstrName;
IF ConstrName!=''  THEN
	altertablecmd ='alter table "stormfilterdetail" drop constraint "' || ConstrName || '"';
	raise notice '%', altertablecmd;
	EXECUTE altertablecmd;
ELSE
	raise notice 'No such constraint.';
END IF; END; $$;
DO $$ declare ConstrName varchar(50); declare altertablecmd varchar(200); BEGIN
SELECT tc.constraint_name FROM information_schema.table_constraints AS tc JOIN information_schema.key_column_usage AS kcu ON tc.constraint_name = kcu.constraint_name JOIN information_schema.constraint_column_usage AS ccu ON ccu.constraint_name = tc.constraint_name WHERE constraint_type = 'FOREIGN KEY' AND tc.table_name='stormfilterlookup' and kcu.column_name='filtersetting_m0' into ConstrName;
IF ConstrName!=''  THEN
	altertablecmd ='alter table "stormfilterlookup" drop constraint "' || ConstrName || '"';
	raise notice '%', altertablecmd;
	EXECUTE altertablecmd;
ELSE
	raise notice 'No such constraint.';
END IF; END; $$;
DO $$ declare ConstrName varchar(50); declare altertablecmd varchar(200); BEGIN
SELECT tc.constraint_name FROM information_schema.table_constraints AS tc JOIN information_schema.key_column_usage AS kcu ON tc.constraint_name = kcu.constraint_name JOIN information_schema.constraint_column_usage AS ccu ON ccu.constraint_name = tc.constraint_name WHERE constraint_type = 'FOREIGN KEY' AND tc.table_name='stormi' and kcu.column_name='user_m0' into ConstrName;
IF ConstrName!=''  THEN
	altertablecmd ='alter table "stormi" drop constraint "' || ConstrName || '"';
	raise notice '%', altertablecmd;
	EXECUTE altertablecmd;
ELSE
	raise notice 'No such constraint.';
END IF; END; $$;
DO $$ declare ConstrName varchar(50); declare altertablecmd varchar(200); BEGIN
SELECT tc.constraint_name FROM information_schema.table_constraints AS tc JOIN information_schema.key_column_usage AS kcu ON tc.constraint_name = kcu.constraint_name JOIN information_schema.constraint_column_usage AS ccu ON ccu.constraint_name = tc.constraint_name WHERE constraint_type = 'FOREIGN KEY' AND tc.table_name='stormi' and kcu.column_name='agent_m0' into ConstrName;
IF ConstrName!=''  THEN
	altertablecmd ='alter table "stormi" drop constraint "' || ConstrName || '"';
	raise notice '%', altertablecmd;
	EXECUTE altertablecmd;
ELSE
	raise notice 'No such constraint.';
END IF; END; $$;
DO $$ declare ConstrName varchar(50); declare altertablecmd varchar(200); BEGIN
SELECT tc.constraint_name FROM information_schema.table_constraints AS tc JOIN information_schema.key_column_usage AS kcu ON tc.constraint_name = kcu.constraint_name JOIN information_schema.constraint_column_usage AS ccu ON ccu.constraint_name = tc.constraint_name WHERE constraint_type = 'FOREIGN KEY' AND tc.table_name='stormla' and kcu.column_name='view_m0' into ConstrName;
IF ConstrName!=''  THEN
	altertablecmd ='alter table "stormla" drop constraint "' || ConstrName || '"';
	raise notice '%', altertablecmd;
	EXECUTE altertablecmd;
ELSE
	raise notice 'No such constraint.';
END IF; END; $$;
DO $$ declare ConstrName varchar(50); declare altertablecmd varchar(200); BEGIN
SELECT tc.constraint_name FROM information_schema.table_constraints AS tc JOIN information_schema.key_column_usage AS kcu ON tc.constraint_name = kcu.constraint_name JOIN information_schema.constraint_column_usage AS ccu ON ccu.constraint_name = tc.constraint_name WHERE constraint_type = 'FOREIGN KEY' AND tc.table_name='stormla' and kcu.column_name='attribute_m0' into ConstrName;
IF ConstrName!=''  THEN
	altertablecmd ='alter table "stormla" drop constraint "' || ConstrName || '"';
	raise notice '%', altertablecmd;
	EXECUTE altertablecmd;
ELSE
	raise notice 'No such constraint.';
END IF; END; $$;
DO $$ declare ConstrName varchar(50); declare altertablecmd varchar(200); BEGIN
SELECT tc.constraint_name FROM information_schema.table_constraints AS tc JOIN information_schema.key_column_usage AS kcu ON tc.constraint_name = kcu.constraint_name JOIN information_schema.constraint_column_usage AS ccu ON ccu.constraint_name = tc.constraint_name WHERE constraint_type = 'FOREIGN KEY' AND tc.table_name='stormlg' and kcu.column_name='group_m0' into ConstrName;
IF ConstrName!=''  THEN
	altertablecmd ='alter table "stormlg" drop constraint "' || ConstrName || '"';
	raise notice '%', altertablecmd;
	EXECUTE altertablecmd;
ELSE
	raise notice 'No such constraint.';
END IF; END; $$;
DO $$ declare ConstrName varchar(50); declare altertablecmd varchar(200); BEGIN
SELECT tc.constraint_name FROM information_schema.table_constraints AS tc JOIN information_schema.key_column_usage AS kcu ON tc.constraint_name = kcu.constraint_name JOIN information_schema.constraint_column_usage AS ccu ON ccu.constraint_name = tc.constraint_name WHERE constraint_type = 'FOREIGN KEY' AND tc.table_name='stormlg' and kcu.column_name='user_m0' into ConstrName;
IF ConstrName!=''  THEN
	altertablecmd ='alter table "stormlg" drop constraint "' || ConstrName || '"';
	raise notice '%', altertablecmd;
	EXECUTE altertablecmd;
ELSE
	raise notice 'No such constraint.';
END IF; END; $$;
DO $$ declare ConstrName varchar(50); declare altertablecmd varchar(200); BEGIN
SELECT tc.constraint_name FROM information_schema.table_constraints AS tc JOIN information_schema.key_column_usage AS kcu ON tc.constraint_name = kcu.constraint_name JOIN information_schema.constraint_column_usage AS ccu ON ccu.constraint_name = tc.constraint_name WHERE constraint_type = 'FOREIGN KEY' AND tc.table_name='stormlo' and kcu.column_name='class_m0' into ConstrName;
IF ConstrName!=''  THEN
	altertablecmd ='alter table "stormlo" drop constraint "' || ConstrName || '"';
	raise notice '%', altertablecmd;
	EXECUTE altertablecmd;
ELSE
	raise notice 'No such constraint.';
END IF; END; $$;
DO $$ declare ConstrName varchar(50); declare altertablecmd varchar(200); BEGIN
SELECT tc.constraint_name FROM information_schema.table_constraints AS tc JOIN information_schema.key_column_usage AS kcu ON tc.constraint_name = kcu.constraint_name JOIN information_schema.constraint_column_usage AS ccu ON ccu.constraint_name = tc.constraint_name WHERE constraint_type = 'FOREIGN KEY' AND tc.table_name='stormlo' and kcu.column_name='operation_m0' into ConstrName;
IF ConstrName!=''  THEN
	altertablecmd ='alter table "stormlo" drop constraint "' || ConstrName || '"';
	raise notice '%', altertablecmd;
	EXECUTE altertablecmd;
ELSE
	raise notice 'No such constraint.';
END IF; END; $$;
DO $$ declare ConstrName varchar(50); declare altertablecmd varchar(200); BEGIN
SELECT tc.constraint_name FROM information_schema.table_constraints AS tc JOIN information_schema.key_column_usage AS kcu ON tc.constraint_name = kcu.constraint_name JOIN information_schema.constraint_column_usage AS ccu ON ccu.constraint_name = tc.constraint_name WHERE constraint_type = 'FOREIGN KEY' AND tc.table_name='stormlr' and kcu.column_name='agent_m0' into ConstrName;
IF ConstrName!=''  THEN
	altertablecmd ='alter table "stormlr" drop constraint "' || ConstrName || '"';
	raise notice '%', altertablecmd;
	EXECUTE altertablecmd;
ELSE
	raise notice 'No such constraint.';
END IF; END; $$;
DO $$ declare ConstrName varchar(50); declare altertablecmd varchar(200); BEGIN
SELECT tc.constraint_name FROM information_schema.table_constraints AS tc JOIN information_schema.key_column_usage AS kcu ON tc.constraint_name = kcu.constraint_name JOIN information_schema.constraint_column_usage AS ccu ON ccu.constraint_name = tc.constraint_name WHERE constraint_type = 'FOREIGN KEY' AND tc.table_name='stormlr' and kcu.column_name='role_m0' into ConstrName;
IF ConstrName!=''  THEN
	altertablecmd ='alter table "stormlr" drop constraint "' || ConstrName || '"';
	raise notice '%', altertablecmd;
	EXECUTE altertablecmd;
ELSE
	raise notice 'No such constraint.';
END IF; END; $$;
DO $$ declare ConstrName varchar(50); declare altertablecmd varchar(200); BEGIN
SELECT tc.constraint_name FROM information_schema.table_constraints AS tc JOIN information_schema.key_column_usage AS kcu ON tc.constraint_name = kcu.constraint_name JOIN information_schema.constraint_column_usage AS ccu ON ccu.constraint_name = tc.constraint_name WHERE constraint_type = 'FOREIGN KEY' AND tc.table_name='stormlv' and kcu.column_name='class_m0' into ConstrName;
IF ConstrName!=''  THEN
	altertablecmd ='alter table "stormlv" drop constraint "' || ConstrName || '"';
	raise notice '%', altertablecmd;
	EXECUTE altertablecmd;
ELSE
	raise notice 'No such constraint.';
END IF; END; $$;
DO $$ declare ConstrName varchar(50); declare altertablecmd varchar(200); BEGIN
SELECT tc.constraint_name FROM information_schema.table_constraints AS tc JOIN information_schema.key_column_usage AS kcu ON tc.constraint_name = kcu.constraint_name JOIN information_schema.constraint_column_usage AS ccu ON ccu.constraint_name = tc.constraint_name WHERE constraint_type = 'FOREIGN KEY' AND tc.table_name='stormlv' and kcu.column_name='view_m0' into ConstrName;
IF ConstrName!=''  THEN
	altertablecmd ='alter table "stormlv" drop constraint "' || ConstrName || '"';
	raise notice '%', altertablecmd;
	EXECUTE altertablecmd;
ELSE
	raise notice 'No such constraint.';
END IF; END; $$;
DO $$ declare ConstrName varchar(50); declare altertablecmd varchar(200); BEGIN
SELECT tc.constraint_name FROM information_schema.table_constraints AS tc JOIN information_schema.key_column_usage AS kcu ON tc.constraint_name = kcu.constraint_name JOIN information_schema.constraint_column_usage AS ccu ON ccu.constraint_name = tc.constraint_name WHERE constraint_type = 'FOREIGN KEY' AND tc.table_name='stormp' and kcu.column_name='subject_m0' into ConstrName;
IF ConstrName!=''  THEN
	altertablecmd ='alter table "stormp" drop constraint "' || ConstrName || '"';
	raise notice '%', altertablecmd;
	EXECUTE altertablecmd;
ELSE
	raise notice 'No such constraint.';
END IF; END; $$;
DO $$ declare ConstrName varchar(50); declare altertablecmd varchar(200); BEGIN
SELECT tc.constraint_name FROM information_schema.table_constraints AS tc JOIN information_schema.key_column_usage AS kcu ON tc.constraint_name = kcu.constraint_name JOIN information_schema.constraint_column_usage AS ccu ON ccu.constraint_name = tc.constraint_name WHERE constraint_type = 'FOREIGN KEY' AND tc.table_name='stormp' and kcu.column_name='agent_m0' into ConstrName;
IF ConstrName!=''  THEN
	altertablecmd ='alter table "stormp" drop constraint "' || ConstrName || '"';
	raise notice '%', altertablecmd;
	EXECUTE altertablecmd;
ELSE
	raise notice 'No such constraint.';
END IF; END; $$;
DO $$ declare ConstrName varchar(50); declare altertablecmd varchar(200); BEGIN
SELECT tc.constraint_name FROM information_schema.table_constraints AS tc JOIN information_schema.key_column_usage AS kcu ON tc.constraint_name = kcu.constraint_name JOIN information_schema.constraint_column_usage AS ccu ON ccu.constraint_name = tc.constraint_name WHERE constraint_type = 'FOREIGN KEY' AND tc.table_name='stormwebsearch' and kcu.column_name='filtersetting_m0' into ConstrName;
IF ConstrName!=''  THEN
	altertablecmd ='alter table "stormwebsearch" drop constraint "' || ConstrName || '"';
	raise notice '%', altertablecmd;
	EXECUTE altertablecmd;
ELSE
	raise notice 'No such constraint.';
END IF; END; $$;
ALTER TABLE applicationlog DROP CONSTRAINT applicationlog_pkey; 
ALTER TABLE document DROP CONSTRAINT document_pkey; 
ALTER TABLE employee DROP CONSTRAINT employee_pkey; 
DROP INDEX indexef621d158f537998a10cc64f9edd24b3f8e864c3; DROP INDEX index978ca0ba8dc59b68af9f965bebf309d60d1e8bfb; ALTER TABLE invoice DROP CONSTRAINT invoice_pkey; 
DROP INDEX index956de1376853dbd72c90b4fc77b34a1065a7b353; DROP INDEX index6b13f8e141474c8fa2be524d580728c36cb4adce; ALTER TABLE invoiceitem DROP CONSTRAINT invoiceitem_pkey; 
DROP INDEX indexff800bd0bec1ed8a9fe70239b2d0fc6ef9f2bc4c; DROP INDEX index18fea1ee9a731e52489114855ff118548798e10c; ALTER TABLE orderitem DROP CONSTRAINT orderitem_pkey; 
ALTER TABLE product DROP CONSTRAINT product_pkey; 
ALTER TABLE session DROP CONSTRAINT session_pkey; 
DROP INDEX index3fec2776d5ef30395527addab7520af46ec41e82; ALTER TABLE storehouse DROP CONSTRAINT storehouse_pkey; 
DROP INDEX indexdca45c3915edd46590c360503f2fc14b4218cb35; DROP INDEX index81df1790d937ae4e083b80d9132881c97aecad6f; ALTER TABLE storeproduct DROP CONSTRAINT storeproduct_pkey; 
ALTER TABLE stormac DROP CONSTRAINT stormac_pkey; 
ALTER TABLE stormadvlimit DROP CONSTRAINT stormadvlimit_pkey; 
ALTER TABLE stormag DROP CONSTRAINT stormag_pkey; 
ALTER TABLE stormf DROP CONSTRAINT stormf_pkey; 
ALTER TABLE stormfilterdetail DROP CONSTRAINT stormfilterdetail_pkey; 
ALTER TABLE stormfilterlookup DROP CONSTRAINT stormfilterlookup_pkey; 
ALTER TABLE stormfiltersetting DROP CONSTRAINT stormfiltersetting_pkey; 
ALTER TABLE stormi DROP CONSTRAINT stormi_pkey; 
ALTER TABLE stormla DROP CONSTRAINT stormla_pkey; 
ALTER TABLE stormlg DROP CONSTRAINT stormlg_pkey; 
ALTER TABLE stormlo DROP CONSTRAINT stormlo_pkey; 
ALTER TABLE stormlr DROP CONSTRAINT stormlr_pkey; 
ALTER TABLE stormlv DROP CONSTRAINT stormlv_pkey; 
ALTER TABLE stormnetlockdata DROP CONSTRAINT stormnetlockdata_pkey; 
ALTER TABLE stormp DROP CONSTRAINT stormp_pkey; 
ALTER TABLE storms DROP CONSTRAINT storms_pkey; 
ALTER TABLE stormsettings DROP CONSTRAINT stormsettings_pkey; 
ALTER TABLE stormwebsearch DROP CONSTRAINT stormwebsearch_pkey; 
ALTER TABLE usersetting DROP CONSTRAINT usersetting_pkey; 
DROP TABLE applicationlog;
DROP TABLE document;
DROP TABLE employee;
DROP TABLE invoice;
DROP TABLE invoiceitem;
DROP TABLE orderitem;
DROP TABLE product;
DROP TABLE session;
DROP TABLE storehouse;
DROP TABLE storeproduct;
DROP TABLE stormac;
DROP TABLE stormadvlimit;
DROP TABLE stormag;
DROP TABLE stormf;
DROP TABLE stormfilterdetail;
DROP TABLE stormfilterlookup;
DROP TABLE stormfiltersetting;
DROP TABLE stormi;
DROP TABLE stormla;
DROP TABLE stormlg;
DROP TABLE stormlo;
DROP TABLE stormlr;
DROP TABLE stormlv;
DROP TABLE stormnetlockdata;
DROP TABLE stormp;
DROP TABLE storms;
DROP TABLE stormsettings;
DROP TABLE stormwebsearch;
DROP TABLE usersetting;
