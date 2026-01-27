SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `user`, `item`, `message`, `review`, `orders`;

CREATE TABLE `user` (
  `user_id` INT AUTO_INCREMENT PRIMARY KEY,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL
);

CREATE TABLE `item` (
  `item_id` INT AUTO_INCREMENT PRIMARY KEY,
  `seller_id` INT,
  `name` VARCHAR(100),
  `description` TEXT,
  `category` VARCHAR(50),
  `price` DECIMAL(10,2),
  `image_url` VARCHAR(255),
  `status` VARCHAR(20),
  FOREIGN KEY (`seller_id`) REFERENCES `user`(`user_id`)
);

CREATE TABLE `message` (
  `message_id` INT AUTO_INCREMENT PRIMARY KEY,
  `from_user` INT,
  `to_user` INT,
  `content` TEXT,
  `message_time` DATETIME,
  FOREIGN KEY (`from_user`) REFERENCES `user`(`user_id`),
  FOREIGN KEY (`to_user`) REFERENCES `user`(`user_id`)
);

CREATE TABLE `review` (
  `review_id` INT AUTO_INCREMENT PRIMARY KEY,
  `from_user` INT,
  `to_user` INT,
  `rating` INT,
  `comment` TEXT,
  `review_time` DATETIME,
  FOREIGN KEY (`from_user`) REFERENCES `user`(`user_id`),
  FOREIGN KEY (`to_user`) REFERENCES `user`(`user_id`)
);

CREATE TABLE `orders` (
  `order_id` INT AUTO_INCREMENT PRIMARY KEY,
  `buyer_id` INT,
  `item_id` INT,
  `status` VARCHAR(20),
  `order_time` DATETIME,
  FOREIGN KEY (`buyer_id`) REFERENCES `user`(`user_id`),
  FOREIGN KEY (`item_id`) REFERENCES `item`(`item_id`)
);

INSERT INTO user (user_id, email, password) VALUES 
(1, 'alice@example.com', 'alice123'),
(2, 'bob@example.com', 'bob123'),
(3, 'charlie@example.com', 'charlie123');

INSERT INTO item (item_id, seller_id, name, description, category, price, image_url, status) VALUES 
(1, 1, 'Wooden Desk', 'Sturdy wooden desk, ideal for study spaces.', 'Furniture', 328.0, 'images/desk.jpg', 'available'),
(2, 1, 'Bluetooth Headphones', 'Wireless headphones, long battery life.', 'Electronics', 468.0, 'images/headphones.jpg', 'available'),
(3, 2, 'Fiction Novel Set', 'Collection of 5 popular novels in English.', 'Books', 168.0, 'images/books.jpg', 'available'),
(4, 2, 'Uniqlo Sweater', 'Warm grey sweater, size L.', 'Clothing', 128.0, 'images/sweater.jpg', 'sold'),
(5, 1, 'Study Lamp', 'LED desk lamp, adjustable brightness.', 'Furniture', 79.0, 'images/lamp.jpg', 'available'),
(6, 2, 'Backpack', 'Durable backpack with multiple compartments.', 'Accessories', 85.0, 'images/backpack.jpg', 'available');

INSERT INTO message (message_id, from_user, to_user, content, message_time) VALUES 
(1, 1, 2, 'Hi! Is the desk still available?', '2025-05-03 14:30:00'),
(2, 2, 1, 'Yes, it is. Would you like to check it out?', '2025-05-03 14:35:00'),
(3, 3, 2, 'Interested in your books. Can you lower the price?', '2025-05-03 15:00:00');

INSERT INTO review (review_id, from_user, to_user, rating, comment, review_time) VALUES 
(1, 1, 2, 5, 'Great seller! Fast and polite.', '2025-05-03 15:30:00'),
(2, 2, 1, 4, 'Good buyer, smooth transaction.', '2025-05-03 16:00:00'),
(3, 3, 2, 3, 'Item arrived as described.', '2025-05-03 17:00:00');

INSERT INTO orders (order_id, buyer_id, item_id, status, order_time) VALUES 
(1, 3, 3, 'completed', '2025-05-03 18:00:00'),
(2, 2, 6, 'pending', '2025-05-03 19:00:00');

CREATE TABLE IF NOT EXISTS orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    item_id INT NOT NULL,
    buyer_email VARCHAR(255) NOT NULL,
    order_time DATETIME NOT NULL
);

CREATE TABLE IF NOT EXISTS ratings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    item_id INT NOT NULL,
    buyer_email VARCHAR(255) NOT NULL,
    stars INT NOT NULL,
    comment TEXT,
    rating_time DATETIME NOT NULL
);

SET FOREIGN_KEY_CHECKS = 1;
