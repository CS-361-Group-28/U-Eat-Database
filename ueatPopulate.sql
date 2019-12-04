INSERT INTO account (`username`, `email`, `password`)
    VALUES ('test guy', 'test@test.com', 'test'), ('matbot', 'm@g.com', 'matbot'), ('team28', 'team@osu.edu', 'ueat');

INSERT INTO `restaurant` (`id`, `name`, `rating`, `email`, `password`, `street1`, `street2`, `city`, `state`, `zip`, `lat`, `lng`) VALUES
(1, 'pizzapizza', '3.0', 'pizza@pizza.com', 'pizza', 'p street', NULL, 'new york', 'new york', 11111, 40.8069, -73.8583),
(2, 'Salad House', '3.0', 'leaf@lettuce.org', 'romaine', '10th Street', NULL, 'Sacramento', 'california', 95811, 38.5712, -121.498),
(3, 'Old Ironsides', '3.0', 'oldiron@drinks.com', '1234', '1901 10th St', NULL, 'Sacramento', 'CA', 95811, 38.5704, -121.498);

INSERT INTO menu_item (`name`, `price`, `imageURL`, `restaurant_id`)
VALUES ('pepperoni','5.00','/images/easy-pepperoni-pizza-lead-4.jpg', 1),
       ('nicoise', '15.95', '/images/20150909-nicoise-salad-vicky-wasik-9-1500x1125.jpg', 2),
       ('Chicken Tenders', '10.00', NULL, 1);

INSERT INTO review (`account_id`, `restaurant_id`, `rating`, `review`)
VALUES ('2','1','4','It\'s definitely pizza.'),
       ('3','2','3','The salad was full too green.');

INSERT INTO reservation (`account_id`,`restaurant_id`,`date`,`readyTime`,`active`)
VALUES 	('1','1','2019-12-02 14:15:00','2019-12-02 14:20:02','1'),
		('2','2','2019-12-02 14:15:00','2019-12-02 14:30:00','0');

INSERT INTO reservation_item (`reservation_id`,`item_id`,`quantity`)
VALUES 	('1','1','4'),
		('1','2','1'),
		('2','3','2'),
		('2','1','3');
