INSERT INTO account (`username`, `email`, `password`)
    VALUES ('test guy', 'test@test.com', 'test'), ('matbot', 'm@g.com', 'matbot'), ('team28', 'team@osu.edu', 'ueat');

INSERT INTO restaurant (`name`, `email`, `password`, `street1`, `city`, `state`, `zip`)
VALUES ('pizzapizza', 'pizza@pizza.com', 'pizza', 'p street', 'new york', 'new york', '11111'),
        ('Salad House', 'leaf@lettuce.org', 'romaine', 'butter ave', 'bibb', 'california', '11111');

/*INSERT INTO reservation ()
VALUES ();*/

INSERT INTO menu_item (`name`, `price`, `imageURL`, `restaurant_id`)
VALUES ('pepperoni','5.00','/images/easy-pepperoni-pizza-lead-4.jpg', 1),
       ('nicoise', '15.95', '/images/20150909-nicoise-salad-vicky-wasik-9-1500x1125.jpg', 2),
       ('Chicken Tenders', '10.00', NULL, 1);

INSERT INTO review (`account_id`, `restaurant_id`, `rating`, `review`)
VALUES ('2','1','4','It\'s definitely pizza.'),
       ('3','2','3','The salad was full too green.');

/*INSERT INTO reservation_item ()
VALUES ();*/