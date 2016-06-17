/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50629
Source Host           : localhost:3306
Source Database       : jcms

Target Server Type    : MYSQL
Target Server Version : 50629
File Encoding         : 65001

Date: 2016-06-07 09:31:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for wp_commentmeta
-- ----------------------------
DROP TABLE IF EXISTS `wp_commentmeta`;
CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of wp_commentmeta
-- ----------------------------

-- ----------------------------
-- Table structure for wp_comments
-- ----------------------------
DROP TABLE IF EXISTS `wp_comments`;
CREATE TABLE `wp_comments` (
  `comment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment_post_id` bigint(20) DEFAULT NULL,
  `comment_author` tinytext COLLATE utf8_unicode_ci,
  `comment_author_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment_author_url` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment_author_ip` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment_date` datetime DEFAULT NULL,
  `comment_date_gmt` datetime DEFAULT NULL,
  `comment_content` text COLLATE utf8_unicode_ci,
  `comment_karma` int(11) DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8_unicode_ci DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment_parent` bigint(20) DEFAULT '0',
  `user_id` bigint(20) DEFAULT '0',
  PRIMARY KEY (`comment_id`),
  KEY `comment_post_ID` (`comment_post_id`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_approved_date_gmt` (`comment_date_gmt`,`comment_approved`),
  KEY `comment_author_email` (`comment_author_email`),
  KEY `comment_date_gmt` (`comment_date_gmt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of wp_comments
-- ----------------------------

-- ----------------------------
-- Table structure for wp_links
-- ----------------------------
DROP TABLE IF EXISTS `wp_links`;
CREATE TABLE `wp_links` (
  `link_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link_target` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link_visible` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `link_owner` bigint(20) DEFAULT '1',
  `link_rating` int(11) DEFAULT '0',
  `link_updated` datetime DEFAULT NULL,
  `link_rel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link_notes` mediumtext COLLATE utf8_unicode_ci,
  `link_rss` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='比如：网站下方的友情链接，可以直接链接到其他网站，或者合作网站等等';

-- ----------------------------
-- Records of wp_links
-- ----------------------------

-- ----------------------------
-- Table structure for wp_options
-- ----------------------------
DROP TABLE IF EXISTS `wp_options`;
CREATE TABLE `wp_options` (
  `option_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option_value` longtext COLLATE utf8_unicode_ci,
  `autoload` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of wp_options
-- ----------------------------

-- ----------------------------
-- Table structure for wp_postmeta
-- ----------------------------
DROP TABLE IF EXISTS `wp_postmeta`;
CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) DEFAULT NULL,
  `meta_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of wp_postmeta
-- ----------------------------

-- ----------------------------
-- Table structure for wp_posts
-- ----------------------------
DROP TABLE IF EXISTS `wp_posts`;
CREATE TABLE `wp_posts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) DEFAULT '0',
  `post_date` datetime DEFAULT NULL,
  `post_date_gmt` datetime DEFAULT NULL,
  `post_content` longtext COLLATE utf8_unicode_ci,
  `post_title` text COLLATE utf8_unicode_ci,
  `post_excerpt` text COLLATE utf8_unicode_ci,
  `post_status` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'publish',
  `ping_status` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'open',
  `post_password` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `post_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `to_ping` text COLLATE utf8_unicode_ci,
  `pinged` text COLLATE utf8_unicode_ci,
  `post_modified` datetime DEFAULT NULL,
  `post_modified_gmt` datetime DEFAULT NULL,
  `post_content_filtered` longtext COLLATE utf8_unicode_ci,
  `post_parent` bigint(20) DEFAULT '0',
  `guid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menu_order` int(11) DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `post_mime_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment_status` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'open',
  `comment_count` bigint(20) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `post_name` (`post_name`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of wp_posts
-- ----------------------------

-- ----------------------------
-- Table structure for wp_termmeta
-- ----------------------------
DROP TABLE IF EXISTS `wp_termmeta`;
CREATE TABLE `wp_termmeta` (
  `id` bigint(20) DEFAULT NULL,
  `term_id` bigint(20) DEFAULT NULL,
  `meta_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of wp_termmeta
-- ----------------------------

-- ----------------------------
-- Table structure for wp_terms
-- ----------------------------
DROP TABLE IF EXISTS `wp_terms`;
CREATE TABLE `wp_terms` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '缩写',
  `tem_group` bigint(20) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `slug` (`slug`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='记录分类，链接分类，标签的一些简要信息，包括名称，缩写。';

-- ----------------------------
-- Records of wp_terms
-- ----------------------------

-- ----------------------------
-- Table structure for wp_term_relationships
-- ----------------------------
DROP TABLE IF EXISTS `wp_term_relationships`;
CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) NOT NULL DEFAULT '0',
  `term_order` int(11) DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of wp_term_relationships
-- ----------------------------

-- ----------------------------
-- Table structure for wp_term_taxonomy
-- ----------------------------
DROP TABLE IF EXISTS `wp_term_taxonomy`;
CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) DEFAULT NULL,
  `taxonomy` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `parent` bigint(20) DEFAULT NULL,
  `count` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of wp_term_taxonomy
-- ----------------------------

-- ----------------------------
-- Table structure for wp_usermeta
-- ----------------------------
DROP TABLE IF EXISTS `wp_usermeta`;
CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of wp_usermeta
-- ----------------------------

-- ----------------------------
-- Table structure for wp_users
-- ----------------------------
DROP TABLE IF EXISTS `wp_users`;
CREATE TABLE `wp_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_pass` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_nicename` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_registered` datetime DEFAULT NULL,
  `user_activation_key` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_status` int(11) DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of wp_users
-- ----------------------------
INSERT INTO `wp_users` VALUES ('1', 'admin', '123', 'Peter', 'fdfd@qq.com', '2016-06-06 16:32:52', '1', '0', 'Peter Wang');
INSERT INTO `wp_users` VALUES ('2', 'author', '111', 'Stven', '23432@fdsf.com', '2016-06-02 16:33:55', '2', '0', '大作家');
