DROP SEQUENCE IF EXISTS "public"."luckysheet_id_seq";
CREATE SEQUENCE "public"."luckysheet_id_seq"
INCREMENT 1
MINVALUE  1
MAXVALUE 9999999999999
START 1
CACHE 10;

-- CreateTable
CREATE TABLE "file" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(200) NOT NULL,
    "description" TEXT NOT NULL DEFAULT E'',
    "is_delete" BOOLEAN NOT NULL DEFAULT false,
    "workspace_id" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ NOT NULL,

    CONSTRAINT "file_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "luckysheet" (
    "id" BIGINT NOT NULL DEFAULT nextval('luckysheet_id_seq'),
    "block_id" VARCHAR(200) NOT NULL,
    "row_col" VARCHAR(50),
    "index" VARCHAR(200) NOT NULL,
    "list_id" TEXT NOT NULL,
    "status" SMALLINT NOT NULL,
    "json_data" JSONB,
    "order" SMALLINT,
    "is_delete" SMALLINT,

    CONSTRAINT "luckysheet_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user" (
    "id" TEXT NOT NULL,
    "email" VARCHAR(200) NOT NULL,
    "name" VARCHAR(200) NOT NULL,
    "is_delete" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ NOT NULL,

    CONSTRAINT "user_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "workspace" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(200) NOT NULL,
    "description" TEXT NOT NULL DEFAULT E'',
    "is_delete" BOOLEAN NOT NULL DEFAULT false,
    "owner_id" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ NOT NULL,

    CONSTRAINT "workspace_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "block_id" ON "luckysheet"("block_id");

-- CreateIndex
CREATE INDEX "index" ON "luckysheet"("index");

-- CreateIndex
CREATE INDEX "is_delete" ON "luckysheet"("is_delete");

-- CreateIndex
CREATE INDEX "order" ON "luckysheet"("order");

-- CreateIndex
CREATE INDEX "status" ON "luckysheet"("status");

-- CreateIndex
CREATE UNIQUE INDEX "unique_email" ON "user"("email");

-- AddForeignKey
ALTER TABLE "file" ADD CONSTRAINT "file_workspace_id_fkey" FOREIGN KEY ("workspace_id") REFERENCES "workspace"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "luckysheet" ADD CONSTRAINT "luckysheet_list_id_fkey" FOREIGN KEY ("list_id") REFERENCES "file"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "workspace" ADD CONSTRAINT "workspace_owner_id_fkey" FOREIGN KEY ("owner_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;
