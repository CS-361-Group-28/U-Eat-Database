set foreign_key_checks=0;

drop table if exists account;
drop table if exists accounts;
drop table if exists reservation;
drop table if exists restaurant;
drop table if exists item;
drop table if exists review;
drop table if exists order_item;

CREATE TABLE IF NOT EXISTS account (
    id int(11) NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    username varchar(100) NOT NULL,
    email varchar(320) NOT NULL UNIQUE,
    password varchar(255) NOT NULL,
    created datetime NOT NULL DEFAULT current_timestamp(),
    modified datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS reservation (
    id int(11) NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    account_id int(11) NOT NULL,
    foreign key (account_id) references account (id) on delete cascade,
    restaurant_id int(11) NOT NULL,
    foreign key (restaurant_id) references restaurant (id) on delete cascade,
    date datetime DEFAULT current_timestamp(),
    readyTime datetime DEFAULT NULL,
    active boolean NOT NULL DEFAULT TRUE
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS restaurant (
    id int(11) NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    name varchar(128) NOT NULL,
    rating decimal(2,1) DEFAULT 3,
    email varchar(320) NOT NULL,
    password varchar(128) NOT NULL,
    street1 varchar(128) NOT NULL,
    street2 varchar(128) DEFAULT NULL,
    city varchar(128) NOT NULL,
    state varchar(128) NOT NULL,
    zip int(5) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS item (
    id int(11) NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    name varchar(128) NOT NULL,
    price decimal(5,2) NOT NULL,
    imageURL varchar(2000) DEFAULT NULL,
    restaurant_id int(11) DEFAULT NULL,
    foreign key (restaurant_id) references restaurant (id) on delete cascade
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS review (
    id int(11) NOT NULL UNIQUE AUTO_INCREMENT,
    account_id int(11) NOT NULL,
    foreign key (account_id) references account (id) on delete no action,
    restaurant_id int(11) NOT NULL,
    foreign key (restaurant_id) references restaurant (id) on delete cascade,
    rating int(1) NOT NULL,
    review longtext NOT NULL,
    primary key (account_id, restaurant_id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS reservation_item (
    order_id int(11) NOT NULL,
    foreign key (order_id) references reservation (id) on delete cascade,
    item_id int(11) NOT NULL,
    foreign key (item_id) references item (id) on delete restrict ,
    quantity int(3) NOT NULL DEFAULT 1,
    primary key  (order_id, item_id)
) ENGINE=InnoDB;

set foreign_key_checks=1;