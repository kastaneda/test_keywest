SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE IF NOT EXISTS `bookmark` (
`id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `comment` (
`id` int(10) unsigned NOT NULL,
  `bookmark_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `ip` varchar(45) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `text` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


ALTER TABLE `bookmark`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `url` (`url`);

ALTER TABLE `comment`
 ADD PRIMARY KEY (`id`), ADD KEY `bookmark_id` (`bookmark_id`);


ALTER TABLE `bookmark`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `comment`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;

ALTER TABLE `comment`
ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`bookmark_id`) REFERENCES `bookmark` (`id`) ON DELETE CASCADE;
