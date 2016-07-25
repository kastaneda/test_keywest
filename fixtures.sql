SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

INSERT INTO `bookmark` (`id`, `created_at`, `url`) VALUES
(1, '2016-07-25 05:35:53', 'https://github.com/kastaneda/kw');

INSERT INTO `comment` (`id`, `bookmark_id`, `created_at`, `ip`, `text`) VALUES
(1, 1, '2016-07-25 05:36:31', '127.0.0.1', 'OK LOL.'),
(2, 1, '2016-07-25 05:37:34', '127.0.0.1', 'Привет, мир.');
