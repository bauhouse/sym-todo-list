
-- *** STRUCTURE:`tbl_fields_author` ***
DROP TABLE IF EXISTS`tbl_fields_author`;
CREATE TABLE`tbl_fields_author` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `default_to_current_user` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL,
  `author_types` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_author` ***
INSERT INTO`tbl_fields_author` (`id`, `field_id`, `allow_multiple_selection`, `default_to_current_user`, `author_types`) VALUES (2, 6, 'no', 'no', NULL);

-- *** STRUCTURE:`tbl_fields_checkbox` ***
DROP TABLE IF EXISTS`tbl_fields_checkbox`;
CREATE TABLE`tbl_fields_checkbox` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `default_state` enum('on','off') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'on',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_checkbox` ***
INSERT INTO`tbl_fields_checkbox` (`id`, `field_id`, `default_state`) VALUES (7, 3, 'off');
INSERT INTO`tbl_fields_checkbox` (`id`, `field_id`, `default_state`) VALUES (4, 7, 'off');

-- *** STRUCTURE:`tbl_fields_date` ***
DROP TABLE IF EXISTS`tbl_fields_date`;
CREATE TABLE`tbl_fields_date` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `pre_populate` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calendar` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `time` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_date` ***

-- *** STRUCTURE:`tbl_fields_input` ***
DROP TABLE IF EXISTS`tbl_fields_input`;
CREATE TABLE`tbl_fields_input` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_input` ***
INSERT INTO`tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (23, 1, NULL);
INSERT INTO`tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (22, 2, NULL);

-- *** STRUCTURE:`tbl_fields_order_entries` ***
DROP TABLE IF EXISTS`tbl_fields_order_entries`;
CREATE TABLE`tbl_fields_order_entries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `force_sort` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'no',
  `hide` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'no',
  `disable_pagination` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'yes',
  `filtered_fields` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_order_entries` ***
INSERT INTO`tbl_fields_order_entries` (`id`, `field_id`, `force_sort`, `hide`, `disable_pagination`, `filtered_fields`) VALUES (5, 4, NULL, 'yes', 'yes', NULL);
INSERT INTO`tbl_fields_order_entries` (`id`, `field_id`, `force_sort`, `hide`, `disable_pagination`, `filtered_fields`) VALUES (6, 9, NULL, 'no', NULL, NULL);

-- *** STRUCTURE:`tbl_fields_select` ***
DROP TABLE IF EXISTS`tbl_fields_select`;
CREATE TABLE`tbl_fields_select` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `static_options` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dynamic_options` int(11) unsigned DEFAULT NULL,
  `sort_options` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_select` ***

-- *** STRUCTURE:`tbl_fields_selectbox_link` ***
DROP TABLE IF EXISTS`tbl_fields_selectbox_link`;
CREATE TABLE`tbl_fields_selectbox_link` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `related_field_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `limit` int(4) unsigned NOT NULL DEFAULT 20,
  `hide_when_prepopulated` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_selectbox_link` ***
INSERT INTO`tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `related_field_id`, `limit`, `hide_when_prepopulated`) VALUES (7, 8, 'no', 1, 20, 'no');

-- *** STRUCTURE:`tbl_fields_taglist` ***
DROP TABLE IF EXISTS`tbl_fields_taglist`;
CREATE TABLE`tbl_fields_taglist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pre_populate_source` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`),
  KEY `pre_populate_source` (`pre_populate_source`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_taglist` ***

-- *** STRUCTURE:`tbl_fields_textarea` ***
DROP TABLE IF EXISTS`tbl_fields_textarea`;
CREATE TABLE`tbl_fields_textarea` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `formatter` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_textarea` ***

-- *** STRUCTURE:`tbl_fields_upload` ***
DROP TABLE IF EXISTS`tbl_fields_upload`;
CREATE TABLE`tbl_fields_upload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `destination` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_upload` ***

-- *** STRUCTURE:`tbl_entries_data_1` ***
DROP TABLE IF EXISTS`tbl_entries_data_1`;
CREATE TABLE`tbl_entries_data_1` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_1` ***
INSERT INTO`tbl_entries_data_1` (`id`, `entry_id`, `handle`, `value`) VALUES (14, 1, 'things-to-do-today', 'Things To Do Today');
INSERT INTO`tbl_entries_data_1` (`id`, `entry_id`, `handle`, `value`) VALUES (15, 5, 'things-to-learn', 'Things To Learn');
INSERT INTO`tbl_entries_data_1` (`id`, `entry_id`, `handle`, `value`) VALUES (16, 15, 'events', 'Events');

-- *** STRUCTURE:`tbl_entries_data_2` ***
DROP TABLE IF EXISTS`tbl_entries_data_2`;
CREATE TABLE`tbl_entries_data_2` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=1965 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_2` ***
INSERT INTO`tbl_entries_data_2` (`id`, `entry_id`, `handle`, `value`) VALUES (1958, 2, 'test-symphony-events', 'Test Symphony Events');
INSERT INTO`tbl_entries_data_2` (`id`, `entry_id`, `handle`, `value`) VALUES (1959, 3, 'edit-multiple-entries-in-symphony', 'Edit Multiple Entries in Symphony');
INSERT INTO`tbl_entries_data_2` (`id`, `entry_id`, `handle`, `value`) VALUES (1949, 7, 'node', 'Node');
INSERT INTO`tbl_entries_data_2` (`id`, `entry_id`, `handle`, `value`) VALUES (1947, 9, 'symphony-cms', 'Symphony CMS');
INSERT INTO`tbl_entries_data_2` (`id`, `entry_id`, `handle`, `value`) VALUES (1957, 11, 'create-a-to-do-list-with-symphony', 'Create a To Do List with Symphony');
INSERT INTO`tbl_entries_data_2` (`id`, `entry_id`, `handle`, `value`) VALUES (1956, 12, 'test-symphony', 'Test Symphony');
INSERT INTO`tbl_entries_data_2` (`id`, `entry_id`, `handle`, `value`) VALUES (1955, 13, 'install-symphony', 'Install Symphony');
INSERT INTO`tbl_entries_data_2` (`id`, `entry_id`, `handle`, `value`) VALUES (1946, 10, 'php', 'PHP');
INSERT INTO`tbl_entries_data_2` (`id`, `entry_id`, `handle`, `value`) VALUES (1964, 18, 'service-design-canada-resilience-through-design', 'Service Design Canada: Resilience Through Design');
INSERT INTO`tbl_entries_data_2` (`id`, `entry_id`, `handle`, `value`) VALUES (1948, 8, 'javascript', 'JavaScript');
INSERT INTO`tbl_entries_data_2` (`id`, `entry_id`, `handle`, `value`) VALUES (1962, 16, 'designlab-webinar-design-for-resilience', 'Designlab Webinar: Design for Resilience');
INSERT INTO`tbl_entries_data_2` (`id`, `entry_id`, `handle`, `value`) VALUES (1950, 6, 'jamstack', 'JAMstack');
INSERT INTO`tbl_entries_data_2` (`id`, `entry_id`, `handle`, `value`) VALUES (1963, 17, 'the-language-of-creativity-podcast', 'The Language of Creativity Podcast');
INSERT INTO`tbl_entries_data_2` (`id`, `entry_id`, `handle`, `value`) VALUES (1952, 4, 'holochain', 'Holochain');
INSERT INTO`tbl_entries_data_2` (`id`, `entry_id`, `handle`, `value`) VALUES (1961, 19, 'the-liturgists-the-sunday-thing', 'The Liturgists: The Sunday Thing');
INSERT INTO`tbl_entries_data_2` (`id`, `entry_id`, `handle`, `value`) VALUES (1960, 20, 'fixing-the-form-templates', 'Fixing the form templates');
INSERT INTO`tbl_entries_data_2` (`id`, `entry_id`, `handle`, `value`) VALUES (1951, 21, 'rust', 'Rust');
INSERT INTO`tbl_entries_data_2` (`id`, `entry_id`, `handle`, `value`) VALUES (1953, 22, 'ux-design', 'UX Design');
INSERT INTO`tbl_entries_data_2` (`id`, `entry_id`, `handle`, `value`) VALUES (1954, 23, 'john-coltrane-s-giant-steps-on-piano', 'John Coltrane’s Giant Steps on Piano');
INSERT INTO`tbl_entries_data_2` (`id`, `entry_id`, `handle`, `value`) VALUES (1935, 24, 'jazz-piano', 'Jazz Piano');

-- *** STRUCTURE:`tbl_entries_data_3` ***
DROP TABLE IF EXISTS`tbl_entries_data_3`;
CREATE TABLE`tbl_entries_data_3` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=1965 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_3` ***
INSERT INTO`tbl_entries_data_3` (`id`, `entry_id`, `value`) VALUES (1958, 2, 'no');
INSERT INTO`tbl_entries_data_3` (`id`, `entry_id`, `value`) VALUES (1959, 3, 'no');
INSERT INTO`tbl_entries_data_3` (`id`, `entry_id`, `value`) VALUES (1952, 4, 'yes');
INSERT INTO`tbl_entries_data_3` (`id`, `entry_id`, `value`) VALUES (1950, 6, 'no');
INSERT INTO`tbl_entries_data_3` (`id`, `entry_id`, `value`) VALUES (1949, 7, 'no');
INSERT INTO`tbl_entries_data_3` (`id`, `entry_id`, `value`) VALUES (1948, 8, 'no');
INSERT INTO`tbl_entries_data_3` (`id`, `entry_id`, `value`) VALUES (1947, 9, 'yes');
INSERT INTO`tbl_entries_data_3` (`id`, `entry_id`, `value`) VALUES (1946, 10, 'yes');
INSERT INTO`tbl_entries_data_3` (`id`, `entry_id`, `value`) VALUES (1957, 11, 'no');
INSERT INTO`tbl_entries_data_3` (`id`, `entry_id`, `value`) VALUES (1956, 12, 'yes');
INSERT INTO`tbl_entries_data_3` (`id`, `entry_id`, `value`) VALUES (1955, 13, 'yes');
INSERT INTO`tbl_entries_data_3` (`id`, `entry_id`, `value`) VALUES (1962, 16, 'no');
INSERT INTO`tbl_entries_data_3` (`id`, `entry_id`, `value`) VALUES (1963, 17, 'no');
INSERT INTO`tbl_entries_data_3` (`id`, `entry_id`, `value`) VALUES (1964, 18, 'no');
INSERT INTO`tbl_entries_data_3` (`id`, `entry_id`, `value`) VALUES (1961, 19, 'no');
INSERT INTO`tbl_entries_data_3` (`id`, `entry_id`, `value`) VALUES (1960, 20, 'no');
INSERT INTO`tbl_entries_data_3` (`id`, `entry_id`, `value`) VALUES (1951, 21, 'no');
INSERT INTO`tbl_entries_data_3` (`id`, `entry_id`, `value`) VALUES (1953, 22, 'no');
INSERT INTO`tbl_entries_data_3` (`id`, `entry_id`, `value`) VALUES (1954, 23, 'no');
INSERT INTO`tbl_entries_data_3` (`id`, `entry_id`, `value`) VALUES (1935, 24, 'no');

-- *** STRUCTURE:`tbl_entries_data_4` ***
DROP TABLE IF EXISTS`tbl_entries_data_4`;
CREATE TABLE`tbl_entries_data_4` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=1965 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_4` ***
INSERT INTO`tbl_entries_data_4` (`id`, `entry_id`, `value`) VALUES (1958, 2, 4);
INSERT INTO`tbl_entries_data_4` (`id`, `entry_id`, `value`) VALUES (1959, 3, 5);
INSERT INTO`tbl_entries_data_4` (`id`, `entry_id`, `value`) VALUES (1952, 4, 13);
INSERT INTO`tbl_entries_data_4` (`id`, `entry_id`, `value`) VALUES (1950, 6, 11);
INSERT INTO`tbl_entries_data_4` (`id`, `entry_id`, `value`) VALUES (1949, 7, 10);
INSERT INTO`tbl_entries_data_4` (`id`, `entry_id`, `value`) VALUES (1948, 8, 9);
INSERT INTO`tbl_entries_data_4` (`id`, `entry_id`, `value`) VALUES (1947, 9, 8);
INSERT INTO`tbl_entries_data_4` (`id`, `entry_id`, `value`) VALUES (1946, 10, 7);
INSERT INTO`tbl_entries_data_4` (`id`, `entry_id`, `value`) VALUES (1957, 11, 3);
INSERT INTO`tbl_entries_data_4` (`id`, `entry_id`, `value`) VALUES (1956, 12, 2);
INSERT INTO`tbl_entries_data_4` (`id`, `entry_id`, `value`) VALUES (1955, 13, 1);
INSERT INTO`tbl_entries_data_4` (`id`, `entry_id`, `value`) VALUES (1962, 16, 18);
INSERT INTO`tbl_entries_data_4` (`id`, `entry_id`, `value`) VALUES (1963, 17, 19);
INSERT INTO`tbl_entries_data_4` (`id`, `entry_id`, `value`) VALUES (1964, 18, 20);
INSERT INTO`tbl_entries_data_4` (`id`, `entry_id`, `value`) VALUES (1961, 19, 17);
INSERT INTO`tbl_entries_data_4` (`id`, `entry_id`, `value`) VALUES (1960, 20, 6);
INSERT INTO`tbl_entries_data_4` (`id`, `entry_id`, `value`) VALUES (1951, 21, 12);
INSERT INTO`tbl_entries_data_4` (`id`, `entry_id`, `value`) VALUES (1953, 22, 14);
INSERT INTO`tbl_entries_data_4` (`id`, `entry_id`, `value`) VALUES (1954, 23, 15);
INSERT INTO`tbl_entries_data_4` (`id`, `entry_id`, `value`) VALUES (1935, 24, 16);

-- *** STRUCTURE:`tbl_entries_data_6` ***
DROP TABLE IF EXISTS`tbl_entries_data_6`;
CREATE TABLE`tbl_entries_data_6` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `author_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `author` (`entry_id`,`author_id`),
  KEY `author_id` (`author_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_6` ***
INSERT INTO`tbl_entries_data_6` (`id`, `entry_id`, `author_id`) VALUES (3, 14, 1);

-- *** STRUCTURE:`tbl_entries_data_7` ***
DROP TABLE IF EXISTS`tbl_entries_data_7`;
CREATE TABLE`tbl_entries_data_7` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_7` ***
INSERT INTO`tbl_entries_data_7` (`id`, `entry_id`, `value`) VALUES (3, 14, 'yes');

-- *** STRUCTURE:`tbl_entries_data_8` ***
DROP TABLE IF EXISTS`tbl_entries_data_8`;
CREATE TABLE`tbl_entries_data_8` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1078 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_8` ***
INSERT INTO`tbl_entries_data_8` (`id`, `entry_id`, `relation_id`) VALUES (1071, 2, 1);
INSERT INTO`tbl_entries_data_8` (`id`, `entry_id`, `relation_id`) VALUES (1072, 3, 1);
INSERT INTO`tbl_entries_data_8` (`id`, `entry_id`, `relation_id`) VALUES (1070, 11, 1);
INSERT INTO`tbl_entries_data_8` (`id`, `entry_id`, `relation_id`) VALUES (1069, 12, 1);
INSERT INTO`tbl_entries_data_8` (`id`, `entry_id`, `relation_id`) VALUES (1068, 13, 1);
INSERT INTO`tbl_entries_data_8` (`id`, `entry_id`, `relation_id`) VALUES (1065, 4, 5);
INSERT INTO`tbl_entries_data_8` (`id`, `entry_id`, `relation_id`) VALUES (1063, 6, 5);
INSERT INTO`tbl_entries_data_8` (`id`, `entry_id`, `relation_id`) VALUES (1062, 7, 5);
INSERT INTO`tbl_entries_data_8` (`id`, `entry_id`, `relation_id`) VALUES (1061, 8, 5);
INSERT INTO`tbl_entries_data_8` (`id`, `entry_id`, `relation_id`) VALUES (1060, 9, 5);
INSERT INTO`tbl_entries_data_8` (`id`, `entry_id`, `relation_id`) VALUES (1059, 10, 5);
INSERT INTO`tbl_entries_data_8` (`id`, `entry_id`, `relation_id`) VALUES (1075, 16, 15);
INSERT INTO`tbl_entries_data_8` (`id`, `entry_id`, `relation_id`) VALUES (1076, 17, 15);
INSERT INTO`tbl_entries_data_8` (`id`, `entry_id`, `relation_id`) VALUES (1077, 18, 15);
INSERT INTO`tbl_entries_data_8` (`id`, `entry_id`, `relation_id`) VALUES (1074, 19, 15);
INSERT INTO`tbl_entries_data_8` (`id`, `entry_id`, `relation_id`) VALUES (1073, 20, 1);
INSERT INTO`tbl_entries_data_8` (`id`, `entry_id`, `relation_id`) VALUES (1064, 21, 5);
INSERT INTO`tbl_entries_data_8` (`id`, `entry_id`, `relation_id`) VALUES (1066, 22, 5);
INSERT INTO`tbl_entries_data_8` (`id`, `entry_id`, `relation_id`) VALUES (1067, 23, 5);
INSERT INTO`tbl_entries_data_8` (`id`, `entry_id`, `relation_id`) VALUES (1048, 24, 5);

-- *** STRUCTURE:`tbl_entries_data_9` ***
DROP TABLE IF EXISTS`tbl_entries_data_9`;
CREATE TABLE`tbl_entries_data_9` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- *** DATA:`tbl_entries_data_9` ***
INSERT INTO`tbl_entries_data_9` (`id`, `entry_id`, `value`) VALUES (1, 5, 2);
INSERT INTO`tbl_entries_data_9` (`id`, `entry_id`, `value`) VALUES (2, 1, 1);
INSERT INTO`tbl_entries_data_9` (`id`, `entry_id`, `value`) VALUES (3, 15, 3);

-- *** DATA:`tbl_entries` ***
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `modification_author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (1, 1, 1, 1, '2010-03-20 13:20:45', '2010-03-20 20:20:45', '2020-04-18 20:00:55', '2020-04-19 03:00:55');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `modification_author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (2, 2, 1, 1, '2010-03-20 13:30:55', '2010-03-20 20:30:55', '2020-04-19 10:47:30', '2020-04-19 17:47:30');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `modification_author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (3, 2, 1, 1, '2010-03-20 13:43:06', '2010-03-20 20:43:06', '2020-04-19 10:47:30', '2020-04-19 17:47:30');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `modification_author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (4, 2, 1, 1, '2010-03-20 14:04:14', '2010-03-20 21:04:14', '2020-04-19 10:47:30', '2020-04-19 17:47:30');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `modification_author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (5, 1, 1, 1, '2010-03-20 14:04:44', '2010-03-20 21:04:44', '2020-04-18 20:01:18', '2020-04-19 03:01:18');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `modification_author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (6, 2, 1, 1, '2010-03-20 14:05:00', '2010-03-20 21:05:00', '2020-04-19 10:47:30', '2020-04-19 17:47:30');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `modification_author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (7, 2, 1, 1, '2010-03-20 14:05:36', '2010-03-20 21:05:36', '2020-04-19 10:47:30', '2020-04-19 17:47:30');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `modification_author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (8, 2, 1, 1, '2010-03-20 14:06:08', '2010-03-20 21:06:08', '2020-04-19 10:47:30', '2020-04-19 17:47:30');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `modification_author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (9, 2, 1, 1, '2010-03-20 14:06:44', '2010-03-20 21:06:44', '2020-04-19 10:47:30', '2020-04-19 17:47:30');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `modification_author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (10, 2, 1, 1, '2010-03-20 14:08:42', '2010-03-20 21:08:42', '2020-04-19 10:47:30', '2020-04-19 17:47:30');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `modification_author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (11, 2, 1, 1, '2010-03-20 14:11:22', '2010-03-20 21:11:22', '2020-04-19 10:47:30', '2020-04-19 17:47:30');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `modification_author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (12, 2, 1, 1, '2010-03-20 14:12:05', '2010-03-20 21:12:05', '2020-04-19 10:47:30', '2020-04-19 17:47:30');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `modification_author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (13, 2, 1, 1, '2010-03-20 14:12:41', '2010-03-20 21:12:41', '2020-04-19 10:47:30', '2020-04-19 17:47:30');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `modification_author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (14, 3, 1, 1, '2010-03-21 09:21:18', '2010-03-21 16:21:18', '2010-03-21 09:21:18', '2010-03-21 16:21:18');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `modification_author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (15, 1, 1, 1, '2020-04-19 07:25:34', '2020-04-19 14:25:34', '2020-04-19 07:25:34', '2020-04-19 14:25:34');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `modification_author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (16, 2, 1, 1, '2020-04-19 07:26:17', '2020-04-19 14:26:17', '2020-04-19 10:47:30', '2020-04-19 17:47:30');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `modification_author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (17, 2, 1, 1, '2020-04-19 07:41:01', '2020-04-19 14:41:01', '2020-04-19 10:47:30', '2020-04-19 17:47:30');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `modification_author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (18, 2, 1, 1, '2020-04-19 08:39:22', '2020-04-19 15:39:22', '2020-04-19 10:47:30', '2020-04-19 17:47:30');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `modification_author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (19, 2, 1, 1, '2020-04-19 09:39:45', '2020-04-19 16:39:45', '2020-04-19 10:47:30', '2020-04-19 17:47:30');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `modification_author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (20, 2, 1, 1, '2020-04-19 09:43:28', '2020-04-19 16:43:28', '2020-04-19 10:47:30', '2020-04-19 17:47:30');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `modification_author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (21, 2, 1, 1, '2020-04-19 10:07:46', '2020-04-19 17:07:46', '2020-04-19 10:47:30', '2020-04-19 17:47:30');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `modification_author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (22, 2, 1, 1, '2020-04-19 10:11:41', '2020-04-19 17:11:41', '2020-04-19 10:47:30', '2020-04-19 17:47:30');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `modification_author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (23, 2, 1, 1, '2020-04-19 10:42:20', '2020-04-19 17:42:20', '2020-04-19 10:47:30', '2020-04-19 17:47:30');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `modification_author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (24, 2, 1, 1, '2020-04-19 10:43:13', '2020-04-19 17:43:13', '2020-04-19 10:43:13', '2020-04-19 17:43:13');

-- *** DATA:`tbl_extensions` ***
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (1, 'debugdevkit', 'enabled', '1.3.4');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (12, 'export_ensemble', 'enabled', '2.2.1');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (3, 'selectbox_link_field', 'enabled', '2.0.2');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (4, 'jit_image_manipulation', 'enabled', 1.47);
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (5, 'maintenance_mode', 'enabled', '1.9.4');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (6, 'profiledevkit', 'enabled', '1.5.2');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (14, 'markdown', 'enabled', 1.21);
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (16, 'subsectionmanager', 'disabled', '1.0.1');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (11, 'order_entries', 'enabled', '2.3.9');

-- *** DATA:`tbl_extensions_delegates` ***
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (35, 1, '/frontend/', 'ManipulateDevKitNavigation', 'manipulateDevKitNavigation');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (34, 1, '/frontend/', 'FrontendDevKitResolve', 'frontendDevKitResolve');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (47, 11, '/backend/', 'AdminPagePreGenerate', 'adjustTable');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (37, 4, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (43, 5, '/blueprints/pages/', 'AppendPageContent', '__appendType');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (42, 5, '/backend/', 'AppendPageAlert', '__appendAlert');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (41, 5, '/system/preferences/', 'CustomActions', '__toggleMaintenanceMode');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (40, 5, '/system/preferences/', 'Save', '__SavePreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (39, 5, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (51, 6, '/frontend/', 'ManipulateDevKitNavigation', 'manipulateDevKitNavigation');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (50, 6, '/frontend/', 'FrontendDevKitResolve', 'frontendDevKitResolve');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (33, 16, '/backend/', 'AppendPageAlert', '__upgradeMediathek');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (32, 16, '/publish/', 'Delete', '__deleteSortOrder');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (31, 16, '/publish/edit/', 'EntryPostEdit', '__saveSortOrder');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (30, 16, '/publish/new/', 'EntryPostNew', '__saveSortOrder');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (46, 11, '/backend/', 'InitialiseAdminPageHead', 'prepareIndex');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (36, 12, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (29, 16, '/administration/', 'AdminPagePreGenerate', '__appendAssets');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (38, 4, '/system/preferences/', 'Save', '__SavePreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (44, 5, '/frontend/', 'FrontendPrePageResolve', '__checkForMaintenanceMode');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (45, 5, '/frontend/', 'FrontendParamsResolve', '__addParam');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (48, 11, '/backend/', 'AdminPagePostGenerate', 'resetPagination');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (49, 11, '/frontend/', 'DataSourcePreExecute', 'saveFilterContext');

-- *** DATA:`tbl_fields` ***
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (1, 'Name', 'name', 'input', 1, 'yes', 0, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (2, 'To Do', 'to-do', 'input', 2, 'yes', 0, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (3, 'Done', 'done', 'checkbox', 2, 'no', 1, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (4, 'Order', 'order', 'order_entries', 2, 'no', 2, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (6, 'User', 'user', 'author', 3, 'no', 0, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (7, 'Show System Navigation', 'show', 'checkbox', 3, 'no', 1, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (8, 'List', 'list', 'selectbox_link', 2, 'yes', 3, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (9, 'Order', 'order', 'order_entries', 1, 'no', 1, 'sidebar', 'yes');

-- *** DATA:`tbl_pages` ***
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (1, NULL, 'Lists', 'lists', NULL, 'action/list/item', 'items,lists,navigation,preferences', 'save_items', 1);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (2, NULL, 'Basic', 'basic', NULL, NULL, 'lists', 'save_item,save_items', 2);

-- *** DATA:`tbl_pages_types` ***
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (17, 1, 'index');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (9, 2, 'hidden');

-- *** DATA:`tbl_sections` ***
INSERT INTO`tbl_sections` (`id`, `name`, `handle`, `sortorder`, `hidden`, `navigation_group`, `filter`, `author_id`, `modification_author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (1, 'Lists', 'lists', 1, 'no', 'To Do', 'yes', 1, 1, '2020-04-18 12:53:11', '2020-04-18 19:53:11', '2020-04-19 09:53:52', '2020-04-19 16:53:52');
INSERT INTO`tbl_sections` (`id`, `name`, `handle`, `sortorder`, `hidden`, `navigation_group`, `filter`, `author_id`, `modification_author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (2, 'Items', 'items', 2, 'no', 'To Do', 'yes', 1, 1, '2020-04-18 12:53:11', '2020-04-18 19:53:11', '2020-04-19 08:36:30', '2020-04-19 15:36:30');
INSERT INTO`tbl_sections` (`id`, `name`, `handle`, `sortorder`, `hidden`, `navigation_group`, `filter`, `author_id`, `modification_author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (3, 'Preferences', 'preferences', 3, 'no', 'User', 'yes', 1, 1, '2020-04-18 12:53:11', '2020-04-18 19:53:11', '2020-04-18 12:53:11', '2020-04-18 19:53:11');

-- *** DATA:`tbl_sections_association` ***
INSERT INTO`tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`, `interface`, `editor`) VALUES (7, 1, 1, 2, 8, 'no', NULL, NULL);
