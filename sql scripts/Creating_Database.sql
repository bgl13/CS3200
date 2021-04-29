-- creating users table
DROP TABLE IF EXISTS `game_review`.`users`;
CREATE TABLE `game_review`.`users` (
 `id` INT NOT NULL AUTO_INCREMENT,
 `first_name` VARCHAR(45) NULL,
 `last_name` VARCHAR(45) NULL,
 `username` VARCHAR(45) NOT NULL,
 `password` VARCHAR(45) NOT NULL,
 `email` VARCHAR(45) NOT NULL,
 `DOB` VARCHAR(45) NULL,
 `created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
 `updated` DATETIME NULL DEFAULT CURRENT_TIMESTAMP
      ON UPDATE CURRENT_TIMESTAMP,
 PRIMARY KEY (`id`));
 
  -- creating game table
 DROP TABLE IF EXISTS `game_review`.`games`;
CREATE TABLE `game_review`.`games` (
 `id` INT NOT NULL AUTO_INCREMENT,
 `name` VARCHAR(45) NULL,
 `genre` ENUM('ACTION', 'ADVENTURE', 'RPG', 'SIMULATION', 'STRATEGY', 'SPORTS', 'MMO'),
 `created` DATETIME NULL
                  DEFAULT CURRENT_TIMESTAMP,
 `updated` DATETIME NULL
                  DEFAULT CURRENT_TIMESTAMP
                  ON UPDATE CURRENT_TIMESTAMP,
`percentLiked` INT NOT NULL,
`playerCount` INT NOT NULL,
 PRIMARY KEY (`id`));
   
 -- creating game review table
DROP TABLE IF EXISTS `game_review`.`reviews`;
CREATE TABLE `game_review`.`reviews` (
 `id` INT NOT NULL AUTO_INCREMENT,
 `user_id` INT NULL,
 `game_id` INT NULL,
 `like` BOOL,
 `title` VARCHAR(45) NOT NULL,
 `post` VARCHAR(45) NOT NULL,
 `upvotes` INT NULL,
 `created` DATETIME NULL
      DEFAULT CURRENT_TIMESTAMP,
 `updated` DATETIME NULL
      DEFAULT CURRENT_TIMESTAMP
      ON UPDATE CURRENT_TIMESTAMP,
 PRIMARY KEY (`id`),
 INDEX `reviews_2_users_idx` (`user_id` ASC),
 INDEX `reviews_2_games_idx` (`game_id` ASC),
 CONSTRAINT `reviews_2_users`
   FOREIGN KEY (`user_id`)
   REFERENCES `game_review`.`users` (`id`)
   ON DELETE CASCADE
   ON UPDATE CASCADE,
 CONSTRAINT `reviews_2_games`
   FOREIGN KEY (`game_id`)
   REFERENCES `game_review`.`games` (`id`)
   ON DELETE CASCADE
   ON UPDATE CASCADE);
   
 -- creating replies table
DROP TABLE IF EXISTS `game_review`.`replies`;
CREATE TABLE `game_review`.`replies` (
 `id` INT NOT NULL AUTO_INCREMENT,
 `reply` VARCHAR(45) NULL,
 `user_id` INT NULL,
 `review_id` INT NULL,
 `created` DATETIME NULL
      DEFAULT CURRENT_TIMESTAMP,
 `updated` DATETIME NULL
      DEFAULT CURRENT_TIMESTAMP
      ON UPDATE CURRENT_TIMESTAMP,
 PRIMARY KEY (`id`),
 INDEX `replies_2_users_idx` (`user_id` ASC),
 INDEX `replies_2_reviews_idx` (`review_id` ASC),
 CONSTRAINT `replies_2_users`
   FOREIGN KEY (`user_id`)
   REFERENCES `game_review`.`users` (`id`)
   ON DELETE CASCADE
   ON UPDATE CASCADE,
 CONSTRAINT `replies_2_posts`
   FOREIGN KEY (`review_id`)
   REFERENCES `game_review`.`reviews` (`id`)
   ON DELETE CASCADE
   ON UPDATE CASCADE);

-- alter replies add self reference   
ALTER TABLE `game_review`.`replies`
ADD COLUMN `replies_id` INT NULL AFTER `review_id`,
ADD INDEX `replies_2_replies_idx` (`replies_id` ASC);

ALTER TABLE `game_review`.`replies`
ADD CONSTRAINT `replies_2_replies`
 FOREIGN KEY (`replies_id`)
 REFERENCES `game_review`.`replies` (`id`)
 ON DELETE CASCADE
 ON UPDATE CASCADE;  
 
 
  -- creating modpack table
DROP TABLE IF EXISTS `game_review`.`mods`;
CREATE TABLE `game_review`.`mods` (
 `id` INT NOT NULL AUTO_INCREMENT,
 `name` VARCHAR(45) NULL,
 `game_id` INT NULL,
 `user_id` INT NULL,
 `upvotes` INT NULL,
 `link` VARCHAR(45) NULL,
 `created` DATETIME NULL
      DEFAULT CURRENT_TIMESTAMP,
 `updated` DATETIME NULL
      DEFAULT CURRENT_TIMESTAMP
      ON UPDATE CURRENT_TIMESTAMP,
 PRIMARY KEY (`id`),
 INDEX `mods_2_users_idx` (`user_id` ASC),
 INDEX `mods_2_games_idx` (`game_id` ASC),
 CONSTRAINT `mods_2_users`
   FOREIGN KEY (`user_id`)
   REFERENCES `game_review`.`users` (`id`)
   ON DELETE CASCADE
   ON UPDATE CASCADE,
 CONSTRAINT `mods_2_games`
   FOREIGN KEY (`game_id`)
   REFERENCES `game_review`.`games` (`id`)
   ON DELETE CASCADE
   ON UPDATE CASCADE);
