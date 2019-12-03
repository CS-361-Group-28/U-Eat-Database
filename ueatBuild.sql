SET foreign_key_checks=0;

DROP TABLE IF EXISTS account;
DROP TABLE IF EXISTS reservation;
DROP TABLE IF EXISTS restaurant;
DROP TABLE IF EXISTS menu_item;
DROP TABLE IF EXISTS review;
DROP TABLE IF EXISTS reservation_item;

CREATE TABLE IF NOT EXISTS account (
    id int(11) NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(320) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created DATETIME NOT NULL DEFAULT current_timestamp(),
    modified DATETIME NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS reservation (
    id INT(11) NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    account_id INT(11) NOT NULL,
    FOREIGN KEY (account_id) REFERENCES account (id) ON DELETE CASCADE,
    restaurant_id INT(11) NOT NULL,
    FOREIGN KEY (restaurant_id) REFERENCES restaurant (id) ON DELETE CASCADE,
    date DATETIME DEFAULT current_timestamp(),
    readyTime DATETIME DEFAULT NULL,
    active BOOLEAN NOT NULL DEFAULT TRUE
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS restaurant (
    id INT(11) NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(128) NOT NULL,
    rating DECIMAL(2,1) DEFAULT 3,
    email VARCHAR(320) NOT NULL,
    password VARCHAR(128) NOT NULL,
    street1 VARCHAR(128) NOT NULL,
    street2 VARCHAR(128) DEFAULT NULL,
    city VARCHAR(128) NOT NULL,
    state VARCHAR(128) NOT NULL,
    zip INT(5) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS menu_item (
    id INT(11) NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(128) NOT NULL,
    price DECIMAL(5,2) NOT NULL,
    imageURL VARCHAR(2000) DEFAULT NULL,
    restaurant_id INT(11) DEFAULT NULL,
    FOREIGN KEY (restaurant_id) REFERENCES restaurant (id) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS review (
    id INT(11) NOT NULL UNIQUE AUTO_INCREMENT,
    account_id INT(11) NOT NULL,
    FOREIGN KEY (account_id) REFERENCES account (id) ON DELETE NO ACTION,
    restaurant_id INT(11) NOT NULL,
    FOREIGN KEY (restaurant_id) REFERENCES restaurant (id) ON DELETE CASCADE,
    rating INT(1) NOT NULL,
    review LONGTEXT NOT NULL,
    PRIMARY KEY (account_id, restaurant_id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS reservation_item (
    reservation_id INT(11) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES reservation (id) ON DELETE CASCADE,
    item_id INT(11) NOT NULL,
    FOREIGN KEY (item_id) REFERENCES item (id) ON DELETE RESTRICT,
    quantity INT(3) NOT NULL DEFAULT 1,
    PRIMARY KEY (order_id, item_id)
) ENGINE=InnoDB;

SET foreign_key_checks=1;
