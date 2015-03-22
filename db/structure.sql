CREATE TABLE "schema_migrations" ("version" varchar NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE TABLE "user_accounts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar, "isAdmin?" boolean, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "password_digest" varchar);
INSERT INTO schema_migrations (version) VALUES ('20150305212052');

INSERT INTO schema_migrations (version) VALUES ('20150314051955');

INSERT INTO schema_migrations (version) VALUES ('20150314052806');

INSERT INTO schema_migrations (version) VALUES ('20150314053709');

