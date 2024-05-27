/*
 Navicat Premium Data Transfer

 Source Server         : MYSQL
 Source Server Type    : MySQL
 Source Server Version : 80033
 Source Host           : localhost:3306
 Source Schema         : message_board

 Target Server Type    : MySQL
 Target Server Version : 80033
 File Encoding         : 65001

 Date: 27/05/2024 13:46:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for messages
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages`  (
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `writer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `time` datetime NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of messages
-- ----------------------------
INSERT INTO `messages` VALUES ('你好', 'abc', '2206172262@qq.com', '2024-05-15 10:13:46', 'hello world', 42);
INSERT INTO `messages` VALUES ('sadgas', 'abc', 'dsga', '2024-05-22 09:14:19', 'gasddf', 49);
INSERT INTO `messages` VALUES ('将进酒', '李白', 'libai@gmail.com', '2024-05-22 09:17:26', '君不见，黄河之水天上来，奔流到海不复回。\n　　君不见，高堂明镜悲白发，朝如青丝暮成雪！\n　　人生得意须尽欢，莫使金樽空对月。\n　　天生我材必有用，千金散尽还复来。\n　　烹羊宰牛且为乐，会须一饮三百杯。\n　　岑夫子，丹丘生，将进酒，杯莫停。\n　　与君歌一曲，请君为我倾耳听。\n　　钟鼓馔玉不足贵，但愿长醉不复醒。\n　　古来圣贤皆寂寞，惟有饮者留其名。\n　　陈王昔时宴平乐，斗酒十千恣欢谑。\n　　主人何为言少钱，径须沽取对君酌。\n　　五花马、千金裘，呼儿将出换美酒，与尔同销万古愁！', 50);
INSERT INTO `messages` VALUES ('登高', '杜甫', 'dufu@163.com', '2024-05-22 09:19:06', '风急天高猿啸哀，渚清沙白鸟飞回。\n无边落木萧萧下，不尽长江滚滚来。\n万里悲秋常作客，百年多病独登台。\n艰难苦恨繁霜鬓，潦倒新停浊酒杯。', 52);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `scope` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('abc', '123', 0);
INSERT INTO `users` VALUES ('abca', '12dsa', 0);
INSERT INTO `users` VALUES ('分为', 'fsa', 0);
INSERT INTO `users` VALUES ('大撒fA', 'DAS', 0);
INSERT INTO `users` VALUES ('李白', '123456', 0);
INSERT INTO `users` VALUES ('杜甫', '123456', 0);
INSERT INTO `users` VALUES ('的撒旦发', 'addas', 0);

SET FOREIGN_KEY_CHECKS = 1;
