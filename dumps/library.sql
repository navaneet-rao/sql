CREATE TABLE `book` (
  `book_id` int NOT NULL,
  `title` varchar(20) DEFAULT NULL,
  `pub_year` varchar(20) DEFAULT NULL,
  `publisher_Name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  KEY `publisher_Name` (`publisher_Name`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`publisher_Name`) REFERENCES `publisher` (`name`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `book_authors` (
  `author_name` varchar(20) NOT NULL,
  `book_id` int NOT NULL,
  PRIMARY KEY (`book_id`,`author_name`),
  CONSTRAINT `book_authors_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `book_copies` (
  `no_of_copies` int DEFAULT NULL,
  `book_id` int NOT NULL,
  `program_id` int NOT NULL,
  PRIMARY KEY (`book_id`,`program_id`),
  KEY `program_id` (`program_id`),
  CONSTRAINT `book_copies_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE CASCADE,
  CONSTRAINT `book_copies_ibfk_2` FOREIGN KEY (`program_id`) REFERENCES `libary_program` (`program_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `book_lending` (
  `date_out` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `book_id` int NOT NULL,
  `program_id` int NOT NULL,
  `card_no` int NOT NULL,
  PRIMARY KEY (`book_id`,`program_id`,`card_no`),
  KEY `program_id` (`program_id`),
  KEY `card_no` (`card_no`),
  CONSTRAINT `book_lending_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE CASCADE,
  CONSTRAINT `book_lending_ibfk_2` FOREIGN KEY (`program_id`) REFERENCES `libary_program` (`program_id`) ON DELETE CASCADE,
  CONSTRAINT `book_lending_ibfk_3` FOREIGN KEY (`card_no`) REFERENCES `card` (`card_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `card` (
  `card_no` int NOT NULL,
  PRIMARY KEY (`card_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `libary_program` (
  `program_id` int NOT NULL,
  `program_name` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`program_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `publisher` (
  `name` varchar(20) NOT NULL,
  `phone` int DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
