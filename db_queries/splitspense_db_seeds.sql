BEGIN TRANSACTION;
INSERT INTO transaction_sets
VALUES (1, 'Example set', 'A trip to Lonavala', 0, '2017-08-30 07:47:38', '2017-08-30 07:48:00');
INSERT INTO people_details
VALUES (1, 'Sudhir', '1234567890', 'abcd@xyzc.com', 'Awesome Person', 0, '2017-08-30 07:43:04', '2017-08-30 07:46:09');
INSERT INTO people_details
VALUES (2, 'Prashant', '0987654321', 'xyzc@abcd.com', 'Good person', 0, '2017-08-30 07:43:56', '2017-08-30 07:44:45');
INSERT INTO people_details
VALUES (3, 'Mastan', '4561237890', 'njslx@ksfn.com', 'Nerd', 0, '2017-08-30 07:44:49', '2017-08-30 07:45:57');
INSERT INTO people_details
VALUES (4, 'Venky', '8521473695', NULL, NULL, 0, '2017-08-30 07:46:13', '2017-08-30 07:47:26');
INSERT INTO transactions_details
VALUES (1, 1, 'Debt', 'Sudhir to Prashant', '2017-08-13 09:48:11', 0, '2017-08-13 09:48:11', '2017-08-13 09:48:11');
INSERT INTO transactions_details
VALUES
  (2, 1, 'Toll Fare', 'Mumbai to Lonavala', '2017-08-13 08:32:00', 0, '2017-08-30 07:51:17', '2017-08-30 07:51:17');
INSERT INTO transactions_details
VALUES (3, 1, 'Breakfast', 'At Mumbai Border', '2017-08-13 09:00:00', 0, '2017-08-30 07:53:37', '2017-08-30 07:53:37');
INSERT INTO transactions_details
VALUES (4, 1, 'Toll', 'Mumbai to Lonavala', '2017-08-13 09:30:00', 0, '2017-08-30 07:56:05', '2017-08-30 07:56:05');
INSERT INTO transactions_details
VALUES (5, 1, 'Diesel', NULL, '2017-08-13 11:00:00', 0, '2017-08-30 07:57:59', '2017-08-30 07:57:59');
INSERT INTO transactions_details
VALUES (6, 1, 'Parking', 'At Bhushi Dam', '2017-08-13 12:02:00', 0, '2017-08-30 07:59:56', '2017-08-30 07:59:56');
INSERT INTO transactions_details
VALUES (7, 1, 'Pants', 'Because of rain', '2017-08-13 12:58:00', 0, '2017-08-30 08:01:51', '2017-08-30 08:01:51');
INSERT INTO transactions_details
VALUES (8, 1, 'Driver DA', NULL, '2017-08-13 13:30:00', 0, '2017-08-30 08:03:33', '2017-08-30 08:03:33');
INSERT INTO transactions_details
VALUES (9, 1, 'Lunch', NULL, '2017-08-13 13:45:00', 0, '2017-08-30 08:06:12', '2017-08-30 08:06:12');
INSERT INTO transactions_details
VALUES (10, 1, 'Parking', NULL, '2017-08-13 15:30:00', 0, '2017-08-30 08:06:53', '2017-08-30 08:06:53');
INSERT INTO transactions_details
VALUES (11, 1, 'Snacks', NULL, '2017-08-13 16:36:00', 0, '2017-08-30 08:08:36', '2017-08-30 08:08:36');
INSERT INTO transactions_details VALUES
  (12, 1, 'Toll', 'Return from Lonavala to Mumbai', '2017-08-13 18:49:00', 0, '2017-08-30 08:10:20',
   '2017-08-30 08:10:20');
INSERT INTO transactions_details
VALUES (13, 1, 'Car Rent', NULL, '2017-08-13 20:53:00', 0, '2017-08-30 08:11:56', '2017-08-30 08:11:56');
INSERT INTO transactions_details VALUES
  (14, 1, 'Chicken Biriyani', 'Maid did not have keys', 0, '2017-08-13 21:22:00', '2017-08-30 08:14:03',
   '2017-08-30 08:14:03');
INSERT INTO transactions_details
VALUES (15, 1, 'Veg Biriyani', NULL, '2017-08-13 21:33:00', 0, '2017-08-30 08:16:15', '2017-08-30 08:16:15');
INSERT INTO transaction_tags VALUES (1, 'debt', 1, 0, '2017-08-30 08:17:38');
INSERT INTO transaction_tags VALUES (2, 'travel', 2, 0, '2017-08-30 08:17:53');
INSERT INTO transaction_tags VALUES (3, 'food', 3, 0, '2017-08-30 08:18:30');
INSERT INTO transaction_tags VALUES (4, 'travel', 4, 0, '2017-08-30 08:18:47');
INSERT INTO transaction_tags VALUES (5, 'travel', 5, 0, '2017-08-30 08:19:00');
INSERT INTO transaction_tags VALUES (6, 'travel', 6, 0, '2017-08-30 08:19:09');
INSERT INTO transaction_tags VALUES (7, 'clothes', 7, 0, '2017-08-30 08:19:27');
INSERT INTO transaction_tags VALUES (8, 'travel', 8, 0, '2017-08-30 08:19:36');
INSERT INTO transaction_tags VALUES (9, 'food', 9, 0, '2017-08-30 08:19:45');
INSERT INTO transaction_tags VALUES (10, 'travel', 10, 0, '2017-08-30 08:19:56');
INSERT INTO transaction_tags VALUES (11, 'food', 11, 0, '2017-08-30 08:20:06');
INSERT INTO transaction_tags VALUES (12, 'travel', 12, 0, '2017-08-30 08:20:19');
INSERT INTO transaction_tags VALUES (13, 'travel', 13, 0, '2017-08-30 08:20:30');
INSERT INTO transaction_tags VALUES (14, 'debt', 14, 0, '2017-08-30 08:20:49');
INSERT INTO transaction_tags VALUES (15, 'food', 14, 0, '2017-08-30 08:21:05');
INSERT INTO transaction_tags VALUES (16, 'personal', 15, 0, '2017-08-30 08:21:16');
INSERT INTO transaction_tags VALUES (17, 'food', 15, 0, '2017-08-30 08:21:24');
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (1, 1, 1, 500.0, 0, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (2, 1, 2, 0.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (3, 2, 4, 35.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (4, 2, 1, 0.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (5, 2, 2, 0.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (6, 2, 3, 0.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (7, 3, 1, 172.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (8, 3, 2, 165.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (9, 3, 3, 0.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (10, 3, 4, 0.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (11, 4, 1, 138.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (12, 4, 2, 0.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (13, 4, 3, 0.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (14, 4, 4, 0.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (15, 5, 1, 1500.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (16, 5, 2, 0.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (17, 5, 3, 0.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (18, 5, 4, 0.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (19, 6, 1, 100.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (20, 6, 2, 0.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (21, 6, 3, 0.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (22, 6, 4, 0.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (23, 7, 2, 0.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (24, 7, 4, 250.0, 0, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (25, 8, 4, 300.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (26, 8, 1, 0.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (27, 8, 2, 0.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (28, 8, 3, 0.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (29, 9, 4, 550.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (30, 9, 1, 0.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (31, 9, 2, 0.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (32, 9, 3, 0.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (33, 10, 4, 50.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (34, 10, 1, 0.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (35, 10, 2, 0.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (36, 10, 3, 0.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (37, 11, 4, 150.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (38, 11, 1, 0.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (39, 11, 2, 0.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (40, 11, 3, 0.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (41, 12, 1, 173.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (42, 12, 2, 0.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (43, 12, 3, 0.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (44, 12, 4, 0.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (45, 13, 2, 2000.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (46, 13, 1, 0.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (47, 13, 3, 0.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (48, 13, 4, 0.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (49, 14, 1, 200.0, 0, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (50, 14, 2, 0.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (51, 14, 4, 0.0, 1, 0);
INSERT INTO transaction_contributions (id, transactions_details_id, people_details_id, contribution, is_consumer, is_deleted)
VALUES (52, 15, 1, 150.0, 1, 0);
COMMIT;