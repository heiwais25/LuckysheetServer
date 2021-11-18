CREATE DATABASE luckysheetdb;
\c luckysheetdb;

DROP SEQUENCE IF EXISTS "public"."luckysheet_id_seq";
CREATE SEQUENCE "public"."luckysheet_id_seq"
    INCREMENT 1
MINVALUE  1
MAXVALUE 9999999999999
START 1
CACHE 10;

DROP TABLE IF EXISTS "public"."luckysheet";
CREATE TABLE "public"."luckysheet" (
                              "id" int8 NOT NULL,
                              "block_id" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
                              "index" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
                              "list_id" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
                              "status" int2 NOT NULL,
                              "json_data" jsonb,
                              "order" int2,
                              "is_delete" int2
);
CREATE INDEX "block_id" ON "public"."luckysheet" USING btree (
    "block_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
    "list_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
    );
CREATE INDEX "index" ON "public"."luckysheet" USING btree (
    "index" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
    "list_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
    );
CREATE INDEX "is_delete" ON "public"."luckysheet" USING btree (
    "is_delete" "pg_catalog"."int2_ops" ASC NULLS LAST
    );
CREATE INDEX "list_id" ON "public"."luckysheet" USING btree (
    "list_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
    );
CREATE INDEX "order" ON "public"."luckysheet" USING btree (
    "list_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
    "order" "pg_catalog"."int2_ops" ASC NULLS LAST
    );
CREATE INDEX "status" ON "public"."luckysheet" USING btree (
    "list_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
    "status" "pg_catalog"."int2_ops" ASC NULLS LAST
    );
ALTER TABLE "public"."luckysheet" ADD CONSTRAINT "luckysheet_pkey" PRIMARY KEY ("id");

INSERT INTO "public"."luckysheet" VALUES (nextval('luckysheet_id_seq'), 'fblock', '1', '1079500#-8803#7c45f52b7d01486d88bc53cb17dcd2c3', 1, '{"row":84,"name":"Sheet1","chart":[],"color":"","index":"1","order":0,"column":60,"config":{},"status":0,"celldata":[],"ch_width":4748,"rowsplit":[],"rh_height":1790,"scrollTop":0,"scrollLeft":0,"visibledatarow":[],"visibledatacolumn":[],"jfgird_select_save":[],"jfgrid_selection_range":{}}', 0, 0);
INSERT INTO "public"."luckysheet" VALUES (nextval('luckysheet_id_seq'), 'fblock', '2', '1079500#-8803#7c45f52b7d01486d88bc53cb17dcd2c3', 0, '{"row":84,"name":"Sheet2","chart":[],"color":"","index":"2","order":1,"column":60,"config":{},"status":0,"celldata":[],"ch_width":4748,"rowsplit":[],"rh_height":1790,"scrollTop":0,"scrollLeft":0,"visibledatarow":[],"visibledatacolumn":[],"jfgird_select_save":[],"jfgrid_selection_range":{}}', 1, 0);
INSERT INTO "public"."luckysheet" VALUES (nextval('luckysheet_id_seq'), 'fblock', '3', '1079500#-8803#7c45f52b7d01486d88bc53cb17dcd2c3', 0, '{"row":84,"name":"Sheet3","chart":[],"color":"","index":"3","order":2,"column":60,"config":{},"status":0,"celldata":[],"ch_width":4748,"rowsplit":[],"rh_height":1790,"scrollTop":0,"scrollLeft":0,"visibledatarow":[],"visibledatacolumn":[],"jfgird_select_save":[],"jfgrid_selection_range":{}}', 2, 0);