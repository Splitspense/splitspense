PRAGMA foreign_keys = ON;
BEGIN TRANSACTION;
DROP TABLE IF EXISTS people_details;
DROP TABLE IF EXISTS transaction_contributions;
DROP TABLE IF EXISTS transaction_tags;
DROP TABLE IF EXISTS transactions_details;
DROP TABLE IF EXISTS transaction_sets;
CREATE TABLE "transaction_sets" (
  `id`          INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  `name_string` TEXT    NOT NULL UNIQUE,
  `metadata`    TEXT,
  `is_deleted`  INTEGER NOT NULL DEFAULT 0,
  `created_at`  INTEGER NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at`  INTEGER NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE "people_details" (
  `id`           INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  `username`     TEXT    NOT NULL UNIQUE,
  `phone_number` TEXT UNIQUE,
  `email_id`     TEXT,
  `metadata`     TEXT,
  `is_deleted`   INTEGER NOT NULL DEFAULT 0,
  `created_at`   INTEGER NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at`   INTEGER NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE "transactions_details" (
  `id`                  INTEGER   NOT NULL PRIMARY KEY AUTOINCREMENT,
  `transaction_sets_id` INTEGER   NOT NULL,
  `description`         TEXT,
  `metadata`            TEXT,
  `transaction_time`    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted`          INTEGER   NOT NULL DEFAULT 0,
  `created_at`          INTEGER   NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at`          INTEGER   NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`transaction_sets_id`) REFERENCES `transaction_sets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE "transaction_tags" (
  `id`                      INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  `name_string`             TEXT    NOT NULL,
  `transactions_details_id` INTEGER NOT NULL,
  `is_deleted`              INTEGER NOT NULL DEFAULT 0,
  `updated_at`              INTEGER NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`transactions_details_id`) REFERENCES `transactions_details` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE "transaction_contributions" (
  `id`                      INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  `transactions_details_id` INTEGER NOT NULL,
  `people_details_id`       INTEGER NOT NULL,
  `contribution`            REAL    NOT NULL DEFAULT 0,
  `is_consumer`             INTEGER NOT NULL DEFAULT 0,
  `is_deleted`              INTEGER NOT NULL DEFAULT 0,
  `created_at`              INTEGER NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at`              INTEGER NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`transactions_details_id`) REFERENCES `transactions_details` (`id`) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (`people_details_id`) REFERENCES `people_details` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE INDEX `transactions_details_transaction_sets_id_index` ON `transactions_details` (`transaction_sets_id`);
CREATE UNIQUE INDEX `transaction_tags_unique_tag_index` ON `transaction_tags` (`name_string`, `transactions_details_id`);
CREATE UNIQUE INDEX `transaction_contributions_people_transaction_details_unique` ON "transaction_contributions" (`transactions_details_id`, `people_details_id`);
CREATE TRIGGER transaction_sets_updated_at_trigger AFTER
UPDATE
ON transaction_sets BEGIN
  UPDATE transaction_sets
  SET updated_at = DATETIME('now')
  WHERE id = NEW.id;
END;
CREATE TRIGGER people_details_updated_at_trigger AFTER
UPDATE
ON people_details BEGIN
  UPDATE people_details
  SET updated_at = DATETIME('now')
  WHERE id = NEW.id;
END;
CREATE TRIGGER transaction_tags_updated_at_trigger AFTER
UPDATE
ON transaction_tags BEGIN
  UPDATE transaction_tags
  SET updated_at = DATETIME('now')
  WHERE id = NEW.id;
END;
COMMIT;