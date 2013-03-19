CREATE TABLE "authors" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "first_name" varchar(255), "last_name" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "authors_books" ("author_id" integer NOT NULL, "book_id" integer NOT NULL);
CREATE TABLE "books" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar(255) NOT NULL, "publisher_id" integer NOT NULL, "published_at" datetime, "isbn" varchar(13), "blurb" text, "page_count" integer, "price" float, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "publishers" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255) NOT NULL, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20111123183741');

INSERT INTO schema_migrations (version) VALUES ('20111130181029');

INSERT INTO schema_migrations (version) VALUES ('20111201003355');