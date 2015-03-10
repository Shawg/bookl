CREATE TABLE "schema_migrations" ("version" varchar NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE TABLE "user_accounts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar, "password" varchar, "isAdmin?" boolean, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO schema_migrations (version) VALUES ('20150305212052');

