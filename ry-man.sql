/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : ry-man

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 17/04/2025 09:46:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'sys_user', '用户信息表', NULL, NULL, 'SysUser', 'crud', 'element-ui', 'com.ruoyi.onusers', 'onusers', 'onusers', '往期学院', 'zs', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2025-03-11 09:46:56', '', '2025-04-02 16:05:22', NULL);
INSERT INTO `gen_table` VALUES (3, 'homework', '发布作业', NULL, NULL, 'Homework', 'crud', 'element-ui', 'com.ruoyi.homework', 'homework', 'homework', '发布作业', 'ruoyi', '0', '/', '{\"parentMenuId\":2044}', 'admin', '2025-03-15 16:11:31', '', '2025-03-15 17:24:43', NULL);
INSERT INTO `gen_table` VALUES (4, 'student_homework', '学生提交页面', NULL, NULL, 'stuhom', 'crud', 'element-ui', 'com.ruoyi.stuhom', 'stuhom', 'stuhom', '提交作业', 'zs', '0', '/', '{\"parentMenuId\":2044}', 'admin', '2025-03-18 11:17:04', '', '2025-03-18 14:32:42', NULL);
INSERT INTO `gen_table` VALUES (5, 'resume', '简历管理', NULL, NULL, 'Resume', 'crud', 'element-ui', 'com.ruoyi.Resume', 'Resume', 'Resume', '简历管理', 'ruoyi', '0', '/', '{\"parentMenuId\":2072}', 'admin', '2025-03-31 18:55:24', '', '2025-03-31 19:01:05', NULL);
INSERT INTO `gen_table` VALUES (6, 'resume_work', '简历投递', NULL, NULL, 'ResumeWork', 'crud', 'element-ui', 'com.ruoyi.ResumeWork', 'ResumeWork', 'work', '简历投递', 'ruoyi', '0', '/', '{\"parentMenuId\":2072}', 'user2​', '2025-04-08 11:36:22', '', '2025-04-08 11:38:06', '简历投递');
INSERT INTO `gen_table` VALUES (7, 'sys_event_number', '行事历期数表', NULL, NULL, 'SysEventNumber', 'crud', 'element-ui', 'com.ruoyi.activity', 'activity', 'number', '行事历期数', 'greedy', '0', '/', '{\"parentMenuId\":2042}', 'admin', '2025-04-15 09:57:39', '', '2025-04-15 14:34:59', NULL);
INSERT INTO `gen_table` VALUES (8, 'sys_event', '行事历表', NULL, NULL, 'SysEvent', 'crud', 'element-ui', 'com.ruoyi.activity', 'activity', 'event', '行事历', 'greedy', '0', '/', '{\"parentMenuId\":2042}', 'admin', '2025-04-15 10:36:58', '', '2025-04-15 14:34:47', NULL);
INSERT INTO `gen_table` VALUES (9, 'sys_event_color', '行事历部门颜色表', NULL, NULL, 'SysEventColor', 'crud', 'element-ui', 'com.ruoyi.activity', 'activity', 'color', '行事历部门颜色', 'greedy', '0', '/', '{\"parentMenuId\":2042}', 'admin', '2025-04-15 14:27:38', '', '2025-04-15 14:29:27', NULL);
INSERT INTO `gen_table` VALUES (10, 'sys_event_time', '行事历周数时间表', NULL, NULL, 'SysEventTime', 'crud', 'element-ui', 'com.ruoyi.activity', 'activity', 'time', '行事历周数时间', 'greedy', '0', '/', '{\"parentMenuId\":2042}', 'admin', '2025-04-15 14:27:38', '', '2025-04-15 14:28:56', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(20) NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'user_id', '用户ID', 'bigint', 'Long', 'userId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-03-11 09:46:56', '', '2025-04-02 16:05:22');
INSERT INTO `gen_table_column` VALUES (2, 1, 'dept_id', '部门ID', 'bigint', 'Long', 'deptId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-03-11 09:46:56', '', '2025-04-02 16:05:22');
INSERT INTO `gen_table_column` VALUES (3, 1, 'user_name', '用户账号', 'varchar(30)', 'String', 'userName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2025-03-11 09:46:56', '', '2025-04-02 16:05:22');
INSERT INTO `gen_table_column` VALUES (4, 1, 'nick_name', '用户昵称', 'varchar(30)', 'String', 'nickName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2025-03-11 09:46:56', '', '2025-04-02 16:05:22');
INSERT INTO `gen_table_column` VALUES (5, 1, 'user_type', '用户类型（00系统用户）', 'varchar(2)', 'String', 'userType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 5, 'admin', '2025-03-11 09:46:56', '', '2025-04-02 16:05:22');
INSERT INTO `gen_table_column` VALUES (6, 1, 'email', '用户邮箱', 'varchar(50)', 'String', 'email', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-03-11 09:46:56', '', '2025-04-02 16:05:22');
INSERT INTO `gen_table_column` VALUES (7, 1, 'phonenumber', '手机号码', 'varchar(11)', 'String', 'phonenumber', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2025-03-11 09:46:56', '', '2025-04-02 16:05:22');
INSERT INTO `gen_table_column` VALUES (8, 1, 'sex', '用户性别（0男 1女 2未知）', 'char(1)', 'String', 'sex', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'sys_user_sex', 8, 'admin', '2025-03-11 09:46:56', '', '2025-04-02 16:05:22');
INSERT INTO `gen_table_column` VALUES (9, 1, 'avatar', '地址', 'varchar(100)', 'String', 'avatar', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2025-03-11 09:46:56', '', '2025-04-02 16:05:22');
INSERT INTO `gen_table_column` VALUES (10, 1, 'password', '密码', 'varchar(100)', 'String', 'password', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2025-03-11 09:46:56', '', '2025-04-02 16:05:22');
INSERT INTO `gen_table_column` VALUES (11, 1, 'status', '帐号状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 11, 'admin', '2025-03-11 09:46:56', '', '2025-04-02 16:05:22');
INSERT INTO `gen_table_column` VALUES (12, 1, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2025-03-11 09:46:56', '', '2025-04-02 16:05:22');
INSERT INTO `gen_table_column` VALUES (13, 1, 'login_ip', '最后登录IP', 'varchar(128)', 'String', 'loginIp', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2025-03-11 09:46:56', '', '2025-04-02 16:05:22');
INSERT INTO `gen_table_column` VALUES (14, 1, 'login_date', '最后登录时间', 'datetime', 'Date', 'loginDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 14, 'admin', '2025-03-11 09:46:56', '', '2025-04-02 16:05:22');
INSERT INTO `gen_table_column` VALUES (15, 1, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2025-03-11 09:46:56', '', '2025-04-02 16:05:22');
INSERT INTO `gen_table_column` VALUES (16, 1, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 16, 'admin', '2025-03-11 09:46:56', '', '2025-04-02 16:05:22');
INSERT INTO `gen_table_column` VALUES (17, 1, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 17, 'admin', '2025-03-11 09:46:56', '', '2025-04-02 16:05:22');
INSERT INTO `gen_table_column` VALUES (18, 1, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 18, 'admin', '2025-03-11 09:46:56', '', '2025-04-02 16:05:22');
INSERT INTO `gen_table_column` VALUES (19, 1, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 19, 'admin', '2025-03-11 09:46:56', '', '2025-04-02 16:05:22');
INSERT INTO `gen_table_column` VALUES (31, 3, 'id', 'ID', 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-03-15 16:11:31', '', '2025-03-15 17:24:43');
INSERT INTO `gen_table_column` VALUES (32, 3, 'title', '作业标题', 'varchar(255)', 'String', 'title', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-03-15 16:11:31', '', '2025-03-15 17:24:43');
INSERT INTO `gen_table_column` VALUES (33, 3, 'content', '作业内容', 'text', 'String', 'content', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'fileUpload', '', 3, 'admin', '2025-03-15 16:11:31', '', '2025-03-15 17:24:43');
INSERT INTO `gen_table_column` VALUES (34, 3, 'due_date', '截止日期', 'datetime', 'Date', 'dueDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2025-03-15 16:11:31', '', '2025-03-15 17:24:43');
INSERT INTO `gen_table_column` VALUES (35, 3, 'teacher_id', '发布教师ID', 'int', 'Long', 'teacherId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-03-15 16:11:31', '', '2025-03-15 17:24:43');
INSERT INTO `gen_table_column` VALUES (36, 3, 'create_time', '创建时间，默认当前时间', 'timestamp', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2025-03-15 16:11:31', '', '2025-03-15 17:24:43');
INSERT INTO `gen_table_column` VALUES (37, 3, 'update_time', '更新时间，默认当前时间，且更新时自动更新时间', 'timestamp', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2025-03-15 16:11:31', '', '2025-03-15 17:24:43');
INSERT INTO `gen_table_column` VALUES (38, 3, 'remark', '备注1', 'varchar(255)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'input', '', 8, 'admin', '2025-03-15 16:11:31', '', '2025-03-15 17:24:43');
INSERT INTO `gen_table_column` VALUES (39, 3, 'remark1', '备注2', 'varchar(255)', 'String', 'remark1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2025-03-15 16:11:31', '', '2025-03-15 17:24:43');
INSERT INTO `gen_table_column` VALUES (40, 3, 'remark2', '备注3', 'varchar(255)', 'String', 'remark2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2025-03-15 16:11:31', '', '2025-03-15 17:24:43');
INSERT INTO `gen_table_column` VALUES (41, 4, 'id', 'ID', 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-03-18 11:17:04', '', '2025-03-18 14:32:42');
INSERT INTO `gen_table_column` VALUES (42, 4, 'homework_id', '作业ID', 'int', 'Long', 'homeworkId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-03-18 11:17:04', '', '2025-03-18 14:32:42');
INSERT INTO `gen_table_column` VALUES (43, 4, 'student_id', '学生ID', 'int', 'Long', 'studentId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-03-18 11:17:04', '', '2025-03-18 14:32:42');
INSERT INTO `gen_table_column` VALUES (44, 4, 'submission', '提交内容', 'text', 'String', 'submission', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'fileUpload', '', 4, 'admin', '2025-03-18 11:17:04', '', '2025-03-18 14:32:42');
INSERT INTO `gen_table_column` VALUES (45, 4, 'submission_time', '提交时间', 'datetime', 'Date', 'submissionTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2025-03-18 11:17:04', '', '2025-03-18 14:32:42');
INSERT INTO `gen_table_column` VALUES (46, 4, 'graded', '批改情况，默认未批改', 'tinyint(1)', 'Integer', 'graded', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-03-18 11:17:04', '', '2025-03-18 14:32:42');
INSERT INTO `gen_table_column` VALUES (47, 4, 'score', '得分，支持最多5位数字，其中2位小数', 'decimal(5,2)', 'BigDecimal', 'score', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2025-03-18 11:17:04', '', '2025-03-18 14:32:42');
INSERT INTO `gen_table_column` VALUES (48, 4, 'grade_time', '批改时间', 'datetime', 'Date', 'gradeTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2025-03-18 11:17:05', '', '2025-03-18 14:32:42');
INSERT INTO `gen_table_column` VALUES (49, 4, 'remark', '备注1', 'varchar(255)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'input', '', 9, 'admin', '2025-03-18 11:17:05', '', '2025-03-18 14:32:42');
INSERT INTO `gen_table_column` VALUES (50, 4, 'remark1', '备注2', 'varchar(255)', 'String', 'remark1', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2025-03-18 11:17:05', '', '2025-03-18 14:32:42');
INSERT INTO `gen_table_column` VALUES (51, 4, 'remark2', '备注3', 'varchar(255)', 'String', 'remark2', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2025-03-18 11:17:05', '', '2025-03-18 14:32:42');
INSERT INTO `gen_table_column` VALUES (52, 4, 'department', '部门id', 'char(255)', 'String', 'department', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2025-03-18 11:17:05', '', '2025-03-18 14:32:42');
INSERT INTO `gen_table_column` VALUES (53, 4, 'time_limit', '学期', 'datetime', 'Date', 'timeLimit', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 13, 'admin', '2025-03-18 11:17:05', '', '2025-03-18 14:32:42');
INSERT INTO `gen_table_column` VALUES (54, 5, 'id', '简历id', 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-03-31 18:55:24', '', '2025-03-31 19:01:05');
INSERT INTO `gen_table_column` VALUES (55, 5, 'stu_id', '学生id', 'int', 'Long', 'stuId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-03-31 18:55:24', '', '2025-03-31 19:01:05');
INSERT INTO `gen_table_column` VALUES (56, 5, 'notes', '简历', 'varchar(255)', 'String', 'notes', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-03-31 18:55:24', '', '2025-03-31 19:01:05');
INSERT INTO `gen_table_column` VALUES (57, 5, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'input', '', 4, 'admin', '2025-03-31 18:55:24', '', '2025-03-31 19:01:05');
INSERT INTO `gen_table_column` VALUES (58, 5, 'resume_summary', '简历简介(这里作为求职类型)', 'varchar(255)', 'String', 'resumeSummary', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-03-31 18:55:24', '', '2025-03-31 19:01:05');
INSERT INTO `gen_table_column` VALUES (59, 5, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2025-03-31 18:55:24', '', '2025-03-31 19:01:05');
INSERT INTO `gen_table_column` VALUES (60, 5, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2025-03-31 18:55:24', '', '2025-03-31 19:01:05');
INSERT INTO `gen_table_column` VALUES (61, 5, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2025-03-31 18:55:24', '', '2025-03-31 19:01:05');
INSERT INTO `gen_table_column` VALUES (62, 5, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2025-03-31 18:55:24', '', '2025-03-31 19:01:05');
INSERT INTO `gen_table_column` VALUES (63, 5, 'dept_id', '部门id', 'int', 'Long', 'deptId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2025-03-31 18:55:24', '', '2025-03-31 19:01:05');
INSERT INTO `gen_table_column` VALUES (64, 5, 'stu_dept_id', '学生所属部门id', 'int', 'Long', 'stuDeptId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2025-03-31 18:55:24', '', '2025-03-31 19:01:05');
INSERT INTO `gen_table_column` VALUES (65, 1, 'semester', '学期', 'varchar(255)', 'String', 'semester', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'semester', 20, '', '2025-03-31 19:04:43', '', '2025-04-02 16:05:22');
INSERT INTO `gen_table_column` VALUES (66, 1, 'qufen', '老师是1学生是0', 'char(20)', 'String', 'qufen', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 21, '', '2025-03-31 19:04:43', '', '2025-04-02 16:05:22');
INSERT INTO `gen_table_column` VALUES (67, 6, 'id', 'id', 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'user2​', '2025-04-08 11:36:22', '', '2025-04-08 11:38:06');
INSERT INTO `gen_table_column` VALUES (68, 6, 'homework_name', '公司名称', 'varchar(255)', 'String', 'homeworkName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'user2​', '2025-04-08 11:36:22', '', '2025-04-08 11:38:06');
INSERT INTO `gen_table_column` VALUES (69, 6, 'homework_static', '简历状态', 'varchar(255)', 'String', 'homeworkStatic', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'user2​', '2025-04-08 11:36:22', '', '2025-04-08 11:38:06');
INSERT INTO `gen_table_column` VALUES (70, 6, 'work_post', '工作岗位', 'varchar(255)', 'String', 'workPost', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'user2​', '2025-04-08 11:36:22', '', '2025-04-08 11:38:06');
INSERT INTO `gen_table_column` VALUES (71, 6, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'input', '', 5, 'user2​', '2025-04-08 11:36:22', '', '2025-04-08 11:38:06');
INSERT INTO `gen_table_column` VALUES (72, 6, 'remark1', '备注1', 'varchar(255)', 'String', 'remark1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'user2​', '2025-04-08 11:36:22', '', '2025-04-08 11:38:06');
INSERT INTO `gen_table_column` VALUES (73, 6, 'remark2', '备注2', 'varchar(255)', 'String', 'remark2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'user2​', '2025-04-08 11:36:22', '', '2025-04-08 11:38:06');
INSERT INTO `gen_table_column` VALUES (74, 7, 'number_id', '期数id', 'int(11)', 'Long', 'numberId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-04-15 09:57:39', '', '2025-04-15 14:34:59');
INSERT INTO `gen_table_column` VALUES (75, 7, 'number', '期数名称', 'varchar(255)', 'String', 'number', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-04-15 09:57:39', '', '2025-04-15 14:34:59');
INSERT INTO `gen_table_column` VALUES (76, 7, 'user_id', '创建人id', 'int(11)', 'Long', 'userId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-04-15 09:57:39', '', '2025-04-15 14:34:59');
INSERT INTO `gen_table_column` VALUES (77, 7, 'creat_time', '创建时间', 'datetime', 'Date', 'creatTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2025-04-15 09:57:39', '', '2025-04-15 14:34:59');
INSERT INTO `gen_table_column` VALUES (78, 7, 'number_describe', '期数描述', 'varchar(255)', 'String', 'numberDescribe', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 3, '', '2025-04-15 10:25:55', '', '2025-04-15 14:34:59');
INSERT INTO `gen_table_column` VALUES (79, 8, 'event_id', '', 'bigint(20)', 'Long', 'eventId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-04-15 10:36:58', '', '2025-04-15 14:34:47');
INSERT INTO `gen_table_column` VALUES (80, 8, 'number_id', '期数表id', 'int(11)', 'Long', 'numberId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-04-15 10:36:58', '', '2025-04-15 14:34:47');
INSERT INTO `gen_table_column` VALUES (81, 8, 'event_date', '事件日期', 'varchar(255)', 'String', 'eventDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-04-15 10:36:58', '', '2025-04-15 14:34:47');
INSERT INTO `gen_table_column` VALUES (82, 8, 'slotId', '时间段标识', 'bigint(20)', 'Long', 'slotId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-04-15 10:36:58', '', '2025-04-15 14:34:47');
INSERT INTO `gen_table_column` VALUES (83, 8, 'event_text', '事件内容', 'varchar(255)', 'String', 'eventText', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-04-15 10:36:58', '', '2025-04-15 14:34:47');
INSERT INTO `gen_table_column` VALUES (84, 8, 'event_color', '事件颜色标记', 'varchar(255)', 'String', 'eventColor', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2025-04-15 10:36:58', '', '2025-04-15 14:34:47');
INSERT INTO `gen_table_column` VALUES (85, 8, 'event_timestamp', '事件创建时间戳', 'bigint(20)', 'Long', 'eventTimestamp', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2025-04-15 10:36:58', '', '2025-04-15 14:34:47');
INSERT INTO `gen_table_column` VALUES (86, 8, 'room_reserve_a', '预留_a', 'varchar(255)', 'String', 'roomReserveA', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2025-04-15 10:36:58', '', '2025-04-15 14:34:47');
INSERT INTO `gen_table_column` VALUES (87, 8, 'room_reserve_b', '预留_b', 'varchar(255)', 'String', 'roomReserveB', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2025-04-15 10:36:58', '', '2025-04-15 14:34:47');
INSERT INTO `gen_table_column` VALUES (88, 7, 'number_weeks', '总周数', 'int(11)', 'Long', 'numberWeeks', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, '', '2025-04-15 11:21:33', '', '2025-04-15 14:34:59');
INSERT INTO `gen_table_column` VALUES (89, 7, 'number_time', '开学日期(必须是周一)', 'datetime', 'Date', 'numberTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 5, '', '2025-04-15 11:21:33', '', '2025-04-15 14:34:59');
INSERT INTO `gen_table_column` VALUES (90, 8, 'event_weeks', '周数', 'int(11)', 'Long', 'eventWeeks', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, '', '2025-04-15 11:21:37', '', '2025-04-15 14:34:47');
INSERT INTO `gen_table_column` VALUES (91, 9, 'color_id', NULL, 'int(11)', 'Long', 'colorId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-04-15 14:27:38', '', '2025-04-15 14:29:27');
INSERT INTO `gen_table_column` VALUES (92, 9, 'number_id', '期数id', 'int(11)', 'Long', 'numberId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-04-15 14:27:38', '', '2025-04-15 14:29:27');
INSERT INTO `gen_table_column` VALUES (93, 9, 'department_name', '部门名称', 'varchar(255)', 'String', 'departmentName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2025-04-15 14:27:38', '', '2025-04-15 14:29:27');
INSERT INTO `gen_table_column` VALUES (94, 9, 'department_color', '部门颜色', 'varchar(255)', 'String', 'departmentColor', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-04-15 14:27:38', '', '2025-04-15 14:29:27');
INSERT INTO `gen_table_column` VALUES (95, 9, 'user_id', '用户id', 'int(11)', 'Long', 'userId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-04-15 14:27:38', '', '2025-04-15 14:29:27');
INSERT INTO `gen_table_column` VALUES (96, 9, 'creat_time', '创建时间', 'datetime', 'Date', 'creatTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2025-04-15 14:27:38', '', '2025-04-15 14:29:27');
INSERT INTO `gen_table_column` VALUES (97, 10, 'time_id', NULL, 'int(11)', 'Long', 'timeId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-04-15 14:27:39', '', '2025-04-15 14:28:56');
INSERT INTO `gen_table_column` VALUES (98, 10, 'number_id', '期数', 'int(11)', 'Long', 'numberId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-04-15 14:27:39', '', '2025-04-15 14:28:56');
INSERT INTO `gen_table_column` VALUES (99, 10, 'monday_date', '周一日期', 'datetime', 'Date', 'mondayDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 3, 'admin', '2025-04-15 14:27:39', '', '2025-04-15 14:28:56');
INSERT INTO `gen_table_column` VALUES (100, 10, 'sunday_date', '周天日期', 'datetime', 'Date', 'sundayDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2025-04-15 14:27:39', '', '2025-04-15 14:28:56');
INSERT INTO `gen_table_column` VALUES (101, 10, 'event_weeks', '周数', 'int(11)', 'Long', 'eventWeeks', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-04-15 14:27:39', '', '2025-04-15 14:28:56');
INSERT INTO `gen_table_column` VALUES (102, 10, 'user_id', '创建人', 'int(11)', 'Long', 'userId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-04-15 14:27:39', '', '2025-04-15 14:28:56');
INSERT INTO `gen_table_column` VALUES (103, 10, 'creat_time', '创建时间', 'datetime', 'Date', 'creatTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2025-04-15 14:27:39', '', '2025-04-15 14:28:56');

-- ----------------------------
-- Table structure for homework
-- ----------------------------
DROP TABLE IF EXISTS `homework`;
CREATE TABLE `homework`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '作业标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '作业内容',
  `due_date` datetime NULL DEFAULT NULL COMMENT '截止日期',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '发布教师ID',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，默认当前时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间，默认当前时间，且更新时自动更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注1',
  `remark1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注2',
  `remark2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注3',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '作业表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of homework
-- ----------------------------
INSERT INTO `homework` VALUES (1, '测试', '/profile/upload/2025/03/17/五组翟帅_20250317103121A001.docx', '2025-03-22 00:00:00', 1, '2025-03-17 10:31:31', '2025-03-17 10:31:30', NULL, NULL, NULL);
INSERT INTO `homework` VALUES (2, 'text', '/profile/upload/2025/03/18/五组石玉秀_20250318102433A001.docx', '2025-03-18 00:00:00', 1, '2025-03-18 10:26:08', '2025-03-18 10:26:07', NULL, NULL, NULL);
INSERT INTO `homework` VALUES (3, 'text', '/profile/upload/2025/03/18/五组石玉秀_20250318102433A001.docx', '2025-03-18 00:00:00', 1, '2025-03-18 10:32:21', '2025-03-18 10:32:21', NULL, NULL, NULL);
INSERT INTO `homework` VALUES (4, 'text', '/profile/upload/2025/03/18/五组石玉秀_20250318102433A001.docx', '2025-03-18 00:00:00', 1, '2025-03-18 10:36:01', '2025-03-18 10:36:00', NULL, NULL, NULL);
INSERT INTO `homework` VALUES (5, '测试2', '/profile/upload/2025/03/18/周总结模板(1)_20250318112613A001.docx', '2025-03-18 00:00:00', 1, '2025-03-18 11:26:18', '2025-03-18 11:26:18', '103', NULL, NULL);
INSERT INTO `homework` VALUES (6, '测试1', '/profile/upload/2025/04/01/清新唯美浪漫桃花樱花PPT模板(www.52ppt.com)_20250401192614A001.pptx', '2025-04-01 00:00:00', 123, '2025-04-01 19:26:18', '2025-04-01 19:26:18', '106', NULL, NULL);
INSERT INTO `homework` VALUES (7, '123', '/profile/upload/2025/04/10/翟帅 _20250410202304A001.pdf', '2025-04-10 00:00:00', 123, '2025-04-10 20:23:05', '2025-04-10 20:23:05', '106', NULL, NULL);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日历信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(20) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(20) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '已触发的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂停的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(20) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(20) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(20) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(20) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(20) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(20) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(20) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(20) NOT NULL COMMENT '开始时间',
  `end_time` bigint(20) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(6) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for resume
-- ----------------------------
DROP TABLE IF EXISTS `resume`;
CREATE TABLE `resume`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '简历id',
  `stu_id` int(11) NOT NULL COMMENT '学生id',
  `notes` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '简历',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `resume_summary` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '简历简介(这里作为求职类型)',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `dept_id` int(11) NULL DEFAULT NULL COMMENT '部门id',
  `stu_dept_id` int(11) NULL DEFAULT NULL COMMENT '学生所属部门id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '简历表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of resume
-- ----------------------------
INSERT INTO `resume` VALUES (8, 1, '/profile/upload/2025/03/31/五组_翟帅_20250331162432A001.docx', '123', '2', '', '2025-03-31 16:26:53', '', NULL, 101, 103);
INSERT INTO `resume` VALUES (9, 123, '/profile/upload/2025/03/31/翟帅 _20250331165056A001.pdf', '123', '0', '', '2025-03-31 16:51:00', '', NULL, 101, 106);
INSERT INTO `resume` VALUES (10, 124, '/profile/upload/2025/04/01/翟帅 _20250401114017A001.pdf', '123', '0', '', '2025-04-01 11:40:23', '', NULL, 106, 200);
INSERT INTO `resume` VALUES (11, 125, '/profile/upload/2025/04/01/翟帅 _20250401141456A002.pdf', '123', '0', '', '2025-04-01 14:14:59', '', NULL, 106, 201);
INSERT INTO `resume` VALUES (12, 124, '/profile/upload/2025/04/09/知识库_20250409104247A001.docx', '1123', '1', '', '2025-04-09 10:42:52', '', NULL, 106, 200);

-- ----------------------------
-- Table structure for resume_work
-- ----------------------------
DROP TABLE IF EXISTS `resume_work`;
CREATE TABLE `resume_work`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `homework_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公司名称',
  `homework_static` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '简历状态',
  `work_post` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工作岗位',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `remark1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注1',
  `remark2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注2',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '公司投递表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of resume_work
-- ----------------------------
INSERT INTO `resume_work` VALUES (2, '测试', '测试', '测试', '123', '200', NULL);

-- ----------------------------
-- Table structure for soft
-- ----------------------------
DROP TABLE IF EXISTS `soft`;
CREATE TABLE `soft`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `period` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '期数',
  `owing_dept` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '负责部门',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型',
  `sdata` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '日期',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '状态',
  `assigned_dept` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '分配到的',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `test1` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `tset2` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `test3` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '创建时间',
  `so_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '软约名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '软约管理表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of soft
-- ----------------------------

-- ----------------------------
-- Table structure for student_homework
-- ----------------------------
DROP TABLE IF EXISTS `student_homework`;
CREATE TABLE `student_homework`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `homework_id` int(11) NULL DEFAULT NULL COMMENT '作业ID',
  `student_id` int(11) NULL DEFAULT NULL COMMENT '学生ID',
  `submission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '提交内容',
  `submission_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '提交时间',
  `graded` tinyint(1) NULL DEFAULT 0 COMMENT '批改情况，默认未批改',
  `score` decimal(5, 2) NULL DEFAULT NULL COMMENT '得分，支持最多5位数字，其中2位小数',
  `grade_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '批改时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注1',
  `remark1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注2',
  `remark2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注3',
  `department` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '部门id',
  `time_limit` datetime NULL DEFAULT NULL COMMENT '学期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '学生作业表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of student_homework
-- ----------------------------
INSERT INTO `student_homework` VALUES (7, 1, 1, '/profile/upload/2025/03/19/五组翟帅_20250319111720A003.docx', '2025-03-19 11:25:15', 0, NULL, '2025-03-19 11:25:15', NULL, NULL, NULL, '103', NULL);
INSERT INTO `student_homework` VALUES (8, NULL, 1, '/profile/upload/2025/03/19/五组翟帅_20250319111813A004.docx', NULL, 0, NULL, NULL, NULL, NULL, NULL, '103', NULL);
INSERT INTO `student_homework` VALUES (9, 6, 124, '/profile/upload/2025/04/01/知识库_20250401192721A002.docx', '2025-04-01 19:27:27', 0, NULL, NULL, '测试1', NULL, NULL, '106', NULL);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2025-03-10 17:54:48', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2025-03-10 17:54:48', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2025-03-10 17:54:48', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'false', 'Y', 'admin', '2025-03-10 17:54:48', 'admin', '2025-04-16 09:16:36', '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2025-03-10 17:54:48', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2025-03-10 17:54:48', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 209 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '泰山科技学院', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-03-10 17:54:47', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '双体精英产业学院', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-03-10 17:54:47', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '项目一部', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-03-10 17:54:47', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '项目二部', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-03-10 17:54:47', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '项目三部', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-03-10 17:54:47', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '项目四部', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-03-10 17:54:47', '', NULL);
INSERT INTO `sys_dept` VALUES (200, 106, '0,100,101,106', '一组', 1, '李茂龙', NULL, NULL, '0', '0', 'admin', '2025-03-10 19:13:05', '', NULL);
INSERT INTO `sys_dept` VALUES (201, 106, '0,100,101,106', '二组', 2, '周国鲁', NULL, NULL, '0', '0', 'admin', '2025-03-10 19:13:25', '', NULL);
INSERT INTO `sys_dept` VALUES (202, 106, '0,100,101,106', '三组', 3, '李隆裕', NULL, NULL, '0', '0', 'admin', '2025-03-10 19:13:46', '', NULL);
INSERT INTO `sys_dept` VALUES (203, 106, '0,100,101,106', '四组', 4, '伦冠达', NULL, NULL, '0', '0', 'admin', '2025-03-10 19:14:28', '', NULL);
INSERT INTO `sys_dept` VALUES (204, 106, '0,100,101,106', '五组', 5, '李书合', NULL, NULL, '0', '0', 'admin', '2025-03-10 19:14:51', '', NULL);
INSERT INTO `sys_dept` VALUES (205, 106, '0,100,101,106', '六祖', 6, '刘曼', NULL, NULL, '0', '0', 'admin', '2025-03-10 19:15:12', '', NULL);
INSERT INTO `sys_dept` VALUES (206, 106, '0,100,101,106', '七组', 7, '周家斌', NULL, NULL, '0', '0', 'admin', '2025-03-10 19:15:38', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(11) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 115 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2025-03-10 17:54:48', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-03-10 17:54:48', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-03-10 17:54:48', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2025-03-10 17:54:48', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2025-03-10 17:54:48', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2025-03-10 17:54:48', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2025-03-10 17:54:48', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2025-03-10 17:54:48', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2025-03-10 17:54:48', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2025-03-10 17:54:48', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2025-03-10 17:54:48', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2025-03-10 17:54:48', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2025-03-10 17:54:48', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2025-03-10 17:54:48', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2025-03-10 17:54:48', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2025-03-10 17:54:48', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2025-03-10 17:54:48', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-03-10 17:54:48', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-03-10 17:54:48', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-03-10 17:54:48', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-03-10 17:54:48', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2025-03-10 17:54:48', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-03-10 17:54:48', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-03-10 17:54:48', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-03-10 17:54:48', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-03-10 17:54:48', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-03-10 17:54:48', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2025-03-10 17:54:48', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2025-03-10 17:54:48', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 0, '事假', '1', 'sys_leave_type', NULL, 'default', 'N', '0', 'admin', '2025-03-11 17:17:39', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 1, '病假', '2', 'sys_leave_type', NULL, 'default', 'N', '0', 'admin', '2025-03-11 17:17:55', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (102, 3, '丧假', '3', 'sys_leave_type', NULL, 'default', 'N', '0', 'admin', '2025-03-11 17:18:10', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 0, '未审核', '0', 'sys_leave_approval', NULL, 'danger', 'N', '0', 'admin', '2025-03-11 17:37:01', 'admin', '2025-03-11 17:37:24', NULL);
INSERT INTO `sys_dict_data` VALUES (104, 1, '已通过', '1', 'sys_leave_approval', NULL, 'success', 'N', '0', 'admin', '2025-03-11 17:37:18', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (105, 0, '四小时以内', '1', 'sys_leave_time', NULL, 'info', 'N', '0', 'admin', '2025-03-11 17:39:04', 'admin', '2025-03-11 17:39:26', NULL);
INSERT INTO `sys_dict_data` VALUES (106, 1, '四到八小时', '2', 'sys_leave_time', NULL, 'warning', 'N', '0', 'admin', '2025-03-11 17:39:50', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (107, 1, '第一期', '0', 'semester', NULL, 'default', 'N', '0', 'admin', '2025-04-02 15:50:44', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (108, 1, '第二期', '1', 'semester', NULL, 'default', 'N', '0', 'admin', '2025-04-02 15:55:12', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (109, 2, '第三期', '2', 'semester', NULL, 'default', 'N', '0', 'admin', '2025-04-02 15:55:19', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (110, 3, '第四期', '3', 'semester', NULL, 'default', 'N', '0', 'admin', '2025-04-02 15:55:32', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (111, 4, '第五期', '4', 'semester', NULL, 'default', 'N', '0', 'admin', '2025-04-02 15:56:26', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (112, 5, '第六期', '5', 'semester', NULL, 'default', 'N', '0', 'admin', '2025-04-02 15:56:35', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (113, 6, '第七期', '6', 'semester', NULL, 'default', 'N', '0', 'admin', '2025-04-02 15:57:59', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (114, 7, '第八期', '7', 'semester', NULL, 'default', 'N', '0', 'admin', '2025-04-02 15:58:24', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (115, 2, '八小时以上', '3', 'sys_leave_time', NULL, 'danger', 'N', '0', 'admin', '2025-04-17 09:37:48', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2025-03-10 17:54:48', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2025-03-10 17:54:48', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2025-03-10 17:54:48', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2025-03-10 17:54:48', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2025-03-10 17:54:48', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2025-03-10 17:54:48', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2025-03-10 17:54:48', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2025-03-10 17:54:48', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2025-03-10 17:54:48', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2025-03-10 17:54:48', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '学期', 'semester', '0', 'admin', '2025-04-02 15:49:11', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (101, '请假类型', 'sys_leave_type', '0', 'admin', '2025-04-17 09:35:57', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (102, '审核状态', 'sys_leave_approval', '0', 'admin', '2025-04-17 09:36:31', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (103, '请假时间类型', 'sys_leave_time', '0', 'admin', '2025-04-17 09:36:58', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_event
-- ----------------------------
DROP TABLE IF EXISTS `sys_event`;
CREATE TABLE `sys_event`  (
  `event_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `number_id` int(11) NULL DEFAULT NULL COMMENT '期数表id',
  `event_weeks` int(11) NULL DEFAULT NULL COMMENT '周数',
  `event_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '事件日期',
  `slotId` bigint(20) NULL DEFAULT NULL COMMENT '时间段标识',
  `event_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '事件内容',
  `event_color` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '事件颜色标记',
  `event_timestamp` bigint(20) NULL DEFAULT NULL COMMENT '事件创建时间戳',
  `room_reserve_a` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '预留_a',
  `room_reserve_b` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '预留_b',
  PRIMARY KEY (`event_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '行事历表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_event
-- ----------------------------
INSERT INTO `sys_event` VALUES (34, 12, 8, '2025-04-16', 1, '测试', '#409EFF', 1744783812110, NULL, NULL);
INSERT INTO `sys_event` VALUES (35, 12, 9, '2025-04-26', 1, '测试', '#409EFF', 1744783819571, NULL, NULL);
INSERT INTO `sys_event` VALUES (36, 12, 10, '2025-05-03', 1, '测试', '#1CD9B3', 1744783829372, NULL, NULL);

-- ----------------------------
-- Table structure for sys_event_color
-- ----------------------------
DROP TABLE IF EXISTS `sys_event_color`;
CREATE TABLE `sys_event_color`  (
  `color_id` int(11) NOT NULL AUTO_INCREMENT,
  `number_id` int(11) NULL DEFAULT NULL COMMENT '期数id',
  `department_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '部门名称',
  `department_color` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '部门颜色',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `creat_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`color_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '行事历部门颜色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_event_color
-- ----------------------------
INSERT INTO `sys_event_color` VALUES (2, NULL, '云程四部', '#80EB06', 1, '2025-04-15 15:48:47');

-- ----------------------------
-- Table structure for sys_event_number
-- ----------------------------
DROP TABLE IF EXISTS `sys_event_number`;
CREATE TABLE `sys_event_number`  (
  `number_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '期数id',
  `number` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '期数名称',
  `number_describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '期数描述',
  `number_weeks` int(11) NULL DEFAULT NULL COMMENT '总周数',
  `number_time` datetime NULL DEFAULT NULL COMMENT '开学日期(必须是周一)',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '创建人id',
  `creat_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`number_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '行事历期数表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_event_number
-- ----------------------------
INSERT INTO `sys_event_number` VALUES (12, '第九期', '相亲相爱一家人', 16, '2025-02-24 00:00:00', 1, '2025-04-15 20:26:16');

-- ----------------------------
-- Table structure for sys_event_time
-- ----------------------------
DROP TABLE IF EXISTS `sys_event_time`;
CREATE TABLE `sys_event_time`  (
  `time_id` int(11) NOT NULL AUTO_INCREMENT,
  `number_id` int(11) NULL DEFAULT NULL COMMENT '期数id',
  `monday_date` datetime NULL DEFAULT NULL COMMENT '周一日期',
  `sunday_date` datetime NULL DEFAULT NULL COMMENT '周天日期',
  `event_weeks` int(11) NULL DEFAULT NULL COMMENT '周数',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '创建人id',
  `creat_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`time_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '行事历周数时间表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_event_time
-- ----------------------------
INSERT INTO `sys_event_time` VALUES (19, 12, '2025-02-24 00:00:00', '2025-03-02 00:00:00', 1, 1, '2025-04-15 20:26:16');
INSERT INTO `sys_event_time` VALUES (20, 12, '2025-03-03 00:00:00', '2025-03-09 00:00:00', 2, 1, '2025-04-15 20:26:16');
INSERT INTO `sys_event_time` VALUES (21, 12, '2025-03-10 00:00:00', '2025-03-16 00:00:00', 3, 1, '2025-04-15 20:26:16');
INSERT INTO `sys_event_time` VALUES (22, 12, '2025-03-17 00:00:00', '2025-03-23 00:00:00', 4, 1, '2025-04-15 20:26:16');
INSERT INTO `sys_event_time` VALUES (23, 12, '2025-03-24 00:00:00', '2025-03-30 00:00:00', 5, 1, '2025-04-15 20:26:16');
INSERT INTO `sys_event_time` VALUES (24, 12, '2025-03-31 00:00:00', '2025-04-06 00:00:00', 6, 1, '2025-04-15 20:26:16');
INSERT INTO `sys_event_time` VALUES (25, 12, '2025-04-07 00:00:00', '2025-04-13 00:00:00', 7, 1, '2025-04-15 20:26:16');
INSERT INTO `sys_event_time` VALUES (26, 12, '2025-04-14 00:00:00', '2025-04-20 00:00:00', 8, 1, '2025-04-15 20:26:16');
INSERT INTO `sys_event_time` VALUES (27, 12, '2025-04-21 00:00:00', '2025-04-27 00:00:00', 9, 1, '2025-04-15 20:26:16');
INSERT INTO `sys_event_time` VALUES (28, 12, '2025-04-28 00:00:00', '2025-05-04 00:00:00', 10, 1, '2025-04-15 20:26:16');
INSERT INTO `sys_event_time` VALUES (29, 12, '2025-05-05 00:00:00', '2025-05-11 00:00:00', 11, 1, '2025-04-15 20:26:16');
INSERT INTO `sys_event_time` VALUES (30, 12, '2025-05-12 00:00:00', '2025-05-18 00:00:00', 12, 1, '2025-04-15 20:26:16');
INSERT INTO `sys_event_time` VALUES (31, 12, '2025-05-19 00:00:00', '2025-05-25 00:00:00', 13, 1, '2025-04-15 20:26:16');
INSERT INTO `sys_event_time` VALUES (32, 12, '2025-05-26 00:00:00', '2025-06-01 00:00:00', 14, 1, '2025-04-15 20:26:16');
INSERT INTO `sys_event_time` VALUES (33, 12, '2025-06-02 00:00:00', '2025-06-08 00:00:00', 15, 1, '2025-04-15 20:26:16');
INSERT INTO `sys_event_time` VALUES (34, 12, '2025-06-09 00:00:00', '2025-06-15 00:00:00', 16, 1, '2025-04-15 20:26:16');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2025-03-10 17:54:48', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2025-03-10 17:54:48', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2025-03-10 17:54:48', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_leave
-- ----------------------------
DROP TABLE IF EXISTS `sys_leave`;
CREATE TABLE `sys_leave`  (
  `leave_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '请假编码',
  `leave_type` int(11) NULL DEFAULT NULL COMMENT '请假类型',
  `approval_status` int(11) NULL DEFAULT NULL COMMENT '审批状态',
  `time_type` int(11) NULL DEFAULT NULL COMMENT '时间类型',
  `first_time` datetime NULL DEFAULT NULL COMMENT '初始时间',
  `last_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `leave_reason` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '请假原因',
  `leave_form` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '请假表照片',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `dept_id` int(11) NULL DEFAULT NULL COMMENT '部门id',
  `leave_reserve_a` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '预留_A',
  `leave_reserve_b` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '预留_B',
  PRIMARY KEY (`leave_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '请假信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_leave
-- ----------------------------
INSERT INTO `sys_leave` VALUES (2, 1, 0, 1, '2025-03-11 18:00:00', '2025-03-11 22:00:00', '<p>123456</p>', '/profile/upload/2025/03/11/微信图片_20250311171520_20250311212009A001.jpg', 1, 103, NULL, NULL);
INSERT INTO `sys_leave` VALUES (3, 1, 0, 1, '2025-04-16 00:00:00', '2025-04-17 00:00:00', '1111', '/profile/upload/2025/04/15/图片1_20250415160744A001.png', 1, 103, '若依', '双体精英产业学院-项目一部');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 306 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-03-10 18:17:47');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-03-10 18:17:51');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-03-10 18:18:04');
INSERT INTO `sys_logininfor` VALUES (103, '顾思安', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-03-10 18:18:06');
INSERT INTO `sys_logininfor` VALUES (104, '顾思安', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-03-10 18:18:11');
INSERT INTO `sys_logininfor` VALUES (105, 'ruoyi', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-03-10 18:18:17');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-10 18:18:38');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-11 09:19:33');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-11 10:46:27');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-11 13:52:53');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-11 14:45:54');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-11 16:56:41');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-03-11 19:26:02');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-11 19:26:06');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-12 09:23:33');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-12 10:25:07');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-12 13:59:57');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-12 14:34:04');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-12 15:52:06');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-15 15:50:57');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-15 16:51:06');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-15 17:24:28');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-03-16 00:09:58');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-03-16 00:10:03');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-16 00:10:07');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码已失效', '2025-03-17 09:42:47');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-17 09:42:54');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-17 10:25:56');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-17 11:23:32');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-17 12:23:59');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-17 13:11:06');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-18 10:06:53');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-18 14:25:30');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-18 15:01:24');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-18 17:37:10');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-19 09:29:02');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-19 10:12:26');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-19 11:20:02');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-31 11:19:11');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-31 13:43:24');
INSERT INTO `sys_logininfor` VALUES (140, '爱新觉罗.大帝', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-03-31 17:32:25');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-03-31 17:32:32');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-31 17:32:35');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-31 18:48:20');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-31 19:45:33');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-01 09:15:54');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-01 10:21:47');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-01 11:24:28');
INSERT INTO `sys_logininfor` VALUES (148, 'user3​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-01 11:24:35');
INSERT INTO `sys_logininfor` VALUES (149, 'user3​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-01 11:30:11');
INSERT INTO `sys_logininfor` VALUES (150, 'user3​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-01 11:30:15');
INSERT INTO `sys_logininfor` VALUES (151, 'user3​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-01 11:30:23');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-01 11:30:27');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-01 11:31:29');
INSERT INTO `sys_logininfor` VALUES (154, 'user3​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-01 11:31:34');
INSERT INTO `sys_logininfor` VALUES (155, 'user3​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-01 11:34:27');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-04-01 11:34:38');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-04-01 11:34:42');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-04-01 11:34:48');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-04-01 11:34:57');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-01 11:35:02');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-01 11:35:44');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-01 11:36:01');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-01 11:37:43');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-01 11:37:50');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-01 11:38:05');
INSERT INTO `sys_logininfor` VALUES (166, 'user3​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-01 11:38:09');
INSERT INTO `sys_logininfor` VALUES (167, 'user3​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-01 11:38:33');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-01 11:38:39');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-01 11:39:37');
INSERT INTO `sys_logininfor` VALUES (170, 'user3​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-01 11:39:59');
INSERT INTO `sys_logininfor` VALUES (171, 'user3​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-01 11:41:09');
INSERT INTO `sys_logininfor` VALUES (172, 'user4​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-01 11:41:15');
INSERT INTO `sys_logininfor` VALUES (173, 'user4​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-01 14:12:03');
INSERT INTO `sys_logininfor` VALUES (174, 'user4​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-01 14:12:08');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-01 14:12:13');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-01 14:14:22');
INSERT INTO `sys_logininfor` VALUES (177, 'user3​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-01 14:14:29');
INSERT INTO `sys_logininfor` VALUES (178, 'user3​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-01 14:14:39');
INSERT INTO `sys_logininfor` VALUES (179, 'user4', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-01 14:14:45');
INSERT INTO `sys_logininfor` VALUES (180, 'user4​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-01 14:15:02');
INSERT INTO `sys_logininfor` VALUES (181, 'user4', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-01 14:15:06');
INSERT INTO `sys_logininfor` VALUES (182, 'user4​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-01 14:15:23');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-01 14:15:29');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-01 14:15:41');
INSERT INTO `sys_logininfor` VALUES (185, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-01 14:15:52');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-01 15:20:15');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-01 15:26:26');
INSERT INTO `sys_logininfor` VALUES (188, 'user3​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-01 15:26:33');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-01 16:00:14');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-01 16:11:47');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-01 16:11:54');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-01 16:12:12');
INSERT INTO `sys_logininfor` VALUES (193, 'user3​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-01 16:12:21');
INSERT INTO `sys_logininfor` VALUES (194, 'user3​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-01 16:12:31');
INSERT INTO `sys_logininfor` VALUES (195, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-01 16:12:36');
INSERT INTO `sys_logininfor` VALUES (196, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-01 19:00:45');
INSERT INTO `sys_logininfor` VALUES (197, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-01 19:07:58');
INSERT INTO `sys_logininfor` VALUES (198, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-01 19:08:10');
INSERT INTO `sys_logininfor` VALUES (199, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-01 19:12:29');
INSERT INTO `sys_logininfor` VALUES (200, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-01 19:12:33');
INSERT INTO `sys_logininfor` VALUES (201, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-01 19:23:13');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-04-01 19:23:21');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-01 19:23:26');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-01 19:25:40');
INSERT INTO `sys_logininfor` VALUES (205, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-01 19:25:45');
INSERT INTO `sys_logininfor` VALUES (206, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-01 19:26:51');
INSERT INTO `sys_logininfor` VALUES (207, 'user3​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-01 19:26:56');
INSERT INTO `sys_logininfor` VALUES (208, 'user3​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-01 20:33:20');
INSERT INTO `sys_logininfor` VALUES (209, 'user3​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-01 20:44:43');
INSERT INTO `sys_logininfor` VALUES (210, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-01 20:44:48');
INSERT INTO `sys_logininfor` VALUES (211, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-01 21:33:36');
INSERT INTO `sys_logininfor` VALUES (212, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-02 10:36:00');
INSERT INTO `sys_logininfor` VALUES (213, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-02 14:19:31');
INSERT INTO `sys_logininfor` VALUES (214, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-02 15:17:30');
INSERT INTO `sys_logininfor` VALUES (215, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码已失效', '2025-04-02 15:39:15');
INSERT INTO `sys_logininfor` VALUES (216, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-02 15:39:20');
INSERT INTO `sys_logininfor` VALUES (217, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-02 15:44:13');
INSERT INTO `sys_logininfor` VALUES (218, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-02 15:44:20');
INSERT INTO `sys_logininfor` VALUES (219, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-04-02 17:34:00');
INSERT INTO `sys_logininfor` VALUES (220, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-02 17:34:04');
INSERT INTO `sys_logininfor` VALUES (221, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-03 10:38:08');
INSERT INTO `sys_logininfor` VALUES (222, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-03 11:23:30');
INSERT INTO `sys_logininfor` VALUES (223, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-03 11:33:47');
INSERT INTO `sys_logininfor` VALUES (224, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-03 11:33:54');
INSERT INTO `sys_logininfor` VALUES (225, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-03 11:36:40');
INSERT INTO `sys_logininfor` VALUES (226, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-04-03 14:03:05');
INSERT INTO `sys_logininfor` VALUES (227, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码已失效', '2025-04-03 14:42:32');
INSERT INTO `sys_logininfor` VALUES (228, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-04 13:41:42');
INSERT INTO `sys_logininfor` VALUES (229, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-04 14:35:31');
INSERT INTO `sys_logininfor` VALUES (230, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-08 11:15:06');
INSERT INTO `sys_logininfor` VALUES (231, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-08 11:15:24');
INSERT INTO `sys_logininfor` VALUES (232, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-08 11:15:29');
INSERT INTO `sys_logininfor` VALUES (233, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-08 14:40:24');
INSERT INTO `sys_logininfor` VALUES (234, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-08 14:48:38');
INSERT INTO `sys_logininfor` VALUES (235, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-08 14:48:47');
INSERT INTO `sys_logininfor` VALUES (236, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-08 14:48:55');
INSERT INTO `sys_logininfor` VALUES (237, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-09 09:57:51');
INSERT INTO `sys_logininfor` VALUES (238, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-09 10:22:58');
INSERT INTO `sys_logininfor` VALUES (239, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-09 10:23:02');
INSERT INTO `sys_logininfor` VALUES (240, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-09 10:23:11');
INSERT INTO `sys_logininfor` VALUES (241, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-09 10:23:17');
INSERT INTO `sys_logininfor` VALUES (242, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-09 10:39:51');
INSERT INTO `sys_logininfor` VALUES (243, 'user3​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-09 10:39:56');
INSERT INTO `sys_logininfor` VALUES (244, 'user3​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-09 10:40:29');
INSERT INTO `sys_logininfor` VALUES (245, 'user3​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-09 10:40:33');
INSERT INTO `sys_logininfor` VALUES (246, 'user3​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-09 10:40:54');
INSERT INTO `sys_logininfor` VALUES (247, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-04-09 10:41:03');
INSERT INTO `sys_logininfor` VALUES (248, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-09 10:41:07');
INSERT INTO `sys_logininfor` VALUES (249, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-09 10:42:31');
INSERT INTO `sys_logininfor` VALUES (250, 'user3​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-09 10:42:35');
INSERT INTO `sys_logininfor` VALUES (251, 'user3​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-09 11:18:44');
INSERT INTO `sys_logininfor` VALUES (252, 'user3​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-09 11:19:55');
INSERT INTO `sys_logininfor` VALUES (253, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-09 11:20:08');
INSERT INTO `sys_logininfor` VALUES (254, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-09 11:20:25');
INSERT INTO `sys_logininfor` VALUES (255, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-09 11:20:30');
INSERT INTO `sys_logininfor` VALUES (256, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-09 11:21:33');
INSERT INTO `sys_logininfor` VALUES (257, 'user3​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-09 11:21:40');
INSERT INTO `sys_logininfor` VALUES (258, 'user3​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-09 11:23:26');
INSERT INTO `sys_logininfor` VALUES (259, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-04-09 11:23:34');
INSERT INTO `sys_logininfor` VALUES (260, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-09 11:23:38');
INSERT INTO `sys_logininfor` VALUES (261, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-09 11:26:15');
INSERT INTO `sys_logininfor` VALUES (262, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-09 11:26:19');
INSERT INTO `sys_logininfor` VALUES (263, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-04-09 13:54:37');
INSERT INTO `sys_logininfor` VALUES (264, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-09 13:54:40');
INSERT INTO `sys_logininfor` VALUES (265, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-09 14:37:11');
INSERT INTO `sys_logininfor` VALUES (266, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-09 17:41:33');
INSERT INTO `sys_logininfor` VALUES (267, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-09 20:29:55');
INSERT INTO `sys_logininfor` VALUES (268, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-09 20:42:29');
INSERT INTO `sys_logininfor` VALUES (269, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-10 20:16:19');
INSERT INTO `sys_logininfor` VALUES (270, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-10 20:36:13');
INSERT INTO `sys_logininfor` VALUES (271, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-10 20:36:30');
INSERT INTO `sys_logininfor` VALUES (272, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-10 20:39:08');
INSERT INTO `sys_logininfor` VALUES (273, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-10 20:39:17');
INSERT INTO `sys_logininfor` VALUES (274, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-11 16:38:58');
INSERT INTO `sys_logininfor` VALUES (275, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码已失效', '2025-04-13 22:03:44');
INSERT INTO `sys_logininfor` VALUES (276, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-13 22:03:48');
INSERT INTO `sys_logininfor` VALUES (277, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-13 22:20:53');
INSERT INTO `sys_logininfor` VALUES (278, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-13 23:21:38');
INSERT INTO `sys_logininfor` VALUES (279, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-14 10:04:51');
INSERT INTO `sys_logininfor` VALUES (280, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-14 10:34:07');
INSERT INTO `sys_logininfor` VALUES (281, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-14 15:26:29');
INSERT INTO `sys_logininfor` VALUES (282, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-14 15:28:47');
INSERT INTO `sys_logininfor` VALUES (283, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-14 15:31:43');
INSERT INTO `sys_logininfor` VALUES (284, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-14 16:12:19');
INSERT INTO `sys_logininfor` VALUES (285, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-14 19:39:20');
INSERT INTO `sys_logininfor` VALUES (286, 'user2​', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-14 20:20:09');
INSERT INTO `sys_logininfor` VALUES (287, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-15 09:25:41');
INSERT INTO `sys_logininfor` VALUES (288, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-15 09:57:05');
INSERT INTO `sys_logininfor` VALUES (289, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-15 13:43:21');
INSERT INTO `sys_logininfor` VALUES (290, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码已失效', '2025-04-15 14:25:39');
INSERT INTO `sys_logininfor` VALUES (291, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-15 14:25:43');
INSERT INTO `sys_logininfor` VALUES (292, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-15 14:48:07');
INSERT INTO `sys_logininfor` VALUES (293, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-15 15:17:01');
INSERT INTO `sys_logininfor` VALUES (294, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-15 15:46:24');
INSERT INTO `sys_logininfor` VALUES (295, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-04-15 16:49:34');
INSERT INTO `sys_logininfor` VALUES (296, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-15 16:49:41');
INSERT INTO `sys_logininfor` VALUES (297, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-15 19:22:04');
INSERT INTO `sys_logininfor` VALUES (298, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-15 20:01:36');
INSERT INTO `sys_logininfor` VALUES (299, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-04-16 09:16:04');
INSERT INTO `sys_logininfor` VALUES (300, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-16 09:16:09');
INSERT INTO `sys_logininfor` VALUES (301, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-16 09:16:44');
INSERT INTO `sys_logininfor` VALUES (302, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-16 09:16:47');
INSERT INTO `sys_logininfor` VALUES (303, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-16 13:49:00');
INSERT INTO `sys_logininfor` VALUES (304, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-16 15:36:19');
INSERT INTO `sys_logininfor` VALUES (305, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-17 09:28:36');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int(11) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(11) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2111 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2025-03-10 17:54:47', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2025-03-10 17:54:47', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2025-03-10 17:54:47', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '学生管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2025-03-10 17:54:47', 'admin', '2025-03-10 19:17:18', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2025-03-10 17:54:47', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2025-03-10 17:54:47', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '项目部管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2025-03-10 17:54:47', 'admin', '2025-03-10 19:18:25', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2025-03-10 17:54:47', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2025-03-10 17:54:47', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2025-03-10 17:54:47', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2025-03-10 17:54:47', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2025-03-10 17:54:47', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2025-03-10 17:54:47', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2025-03-10 17:54:47', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2025-03-10 17:54:47', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2025-03-10 17:54:47', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2025-03-10 17:54:47', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2025-03-10 17:54:47', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2025-03-10 17:54:47', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2025-03-10 17:54:47', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2025-03-10 17:54:47', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2025-03-10 17:54:47', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2025-03-10 17:54:47', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '往期学员管理', 0, 9, 'onuser', NULL, NULL, '', 1, 0, 'M', '0', '0', '', 'example', 'admin', '2025-03-11 09:34:56', 'user2​', '2025-04-02 15:40:20', '');
INSERT INTO `sys_menu` VALUES (2013, '往期学员', 2000, 1, 'onusers', 'onusers/onusers/index', NULL, '', 1, 0, 'C', '0', '0', 'onusers:onusers:list', '#', 'admin', '2025-03-11 11:15:41', 'user2​', '2025-04-02 15:40:13', '往期学院菜单');
INSERT INTO `sys_menu` VALUES (2014, '往期学院查询', 2013, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'onusers:onusers:query', '#', 'admin', '2025-03-11 11:15:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '往期学院新增', 2013, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'onusers:onusers:add', '#', 'admin', '2025-03-11 11:15:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '往期学院修改', 2013, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'onusers:onusers:edit', '#', 'admin', '2025-03-11 11:15:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '往期学院删除', 2013, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'onusers:onusers:remove', '#', 'admin', '2025-03-11 11:15:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '往期学院导出', 2013, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'onusers:onusers:export', '#', 'admin', '2025-03-11 11:15:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '教室管理', 2097, 1, 'room', 'leave/room/index', NULL, '', 1, 0, 'C', '0', '0', 'leave:room:list', 'example', 'admin', '2025-03-12 20:45:25', 'admin', '2025-04-15 10:17:21', '教室管理菜单');
INSERT INTO `sys_menu` VALUES (2020, '教室管理查询', 2019, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'leave:room:query', '#', 'admin', '2025-03-12 20:45:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '教室管理新增', 2019, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'leave:room:add', '#', 'admin', '2025-03-12 20:45:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '教室管理修改', 2019, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'leave:room:edit', '#', 'admin', '2025-03-12 20:45:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '教室管理删除', 2019, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'leave:room:remove', '#', 'admin', '2025-03-12 20:45:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '教室管理导出', 2019, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'leave:room:export', '#', 'admin', '2025-03-12 20:45:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '请假管理', 2097, 0, 'details', 'leave/details/index', NULL, '', 1, 0, 'C', '0', '0', 'leave:details:list', 'button', 'admin', '2025-03-12 21:04:10', 'admin', '2025-04-15 10:17:13', '请假管理菜单');
INSERT INTO `sys_menu` VALUES (2032, '请假管理查询', 2031, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'leave:details:query', '#', 'admin', '2025-03-12 21:04:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '请假管理新增', 2031, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'leave:details:add', '#', 'admin', '2025-03-12 21:04:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '请假管理修改', 2031, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'leave:details:edit', '#', 'admin', '2025-03-12 21:04:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '请假管理删除', 2031, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'leave:details:remove', '#', 'admin', '2025-03-12 21:04:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '请假管理导出', 2031, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'leave:details:export', '#', 'admin', '2025-03-12 21:04:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, '教室座位', 2097, 7, 'seat', 'leave/seat/seat', NULL, '', 1, 0, 'C', '1', '0', 'leave:room:list', 'email', 'admin', '2025-03-12 21:08:37', 'admin', '2025-04-15 10:25:40', '');
INSERT INTO `sys_menu` VALUES (2039, '刷新', 2037, 0, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'leave:room:query', '#', 'admin', '2025-03-13 19:34:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '审核', 2037, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'leave:room:query', '#', 'admin', '2025-03-13 19:34:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2041, '行事历', 2042, 1, 'calendar', 'activity/calendar/index', NULL, '', 1, 0, 'C', '0', '0', 'activity:event:listCalendar', 'list', 'admin', '2025-03-14 18:35:27', 'admin', '2025-04-15 14:49:39', '');
INSERT INTO `sys_menu` VALUES (2042, '行事历管理', 0, 10, 'event', '', NULL, '', 1, 0, 'M', '0', '0', '', 'date', 'admin', '2025-03-15 17:13:24', 'admin', '2025-04-15 10:20:23', '行事历菜单');
INSERT INTO `sys_menu` VALUES (2044, '作业管理', 0, 10, 'homework', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'button', 'admin', '2025-03-15 16:12:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2045, '发布作业', 2044, 1, 'homework', 'homework/homework/index', NULL, '', 1, 0, 'C', '0', '0', 'homework:homework:list', '#', 'admin', '2025-03-15 16:51:54', '', NULL, '发布作业菜单');
INSERT INTO `sys_menu` VALUES (2046, '发布作业查询', 2045, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'homework:homework:query', '#', 'admin', '2025-03-15 16:51:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2047, '发布作业新增', 2045, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'homework:homework:add', '#', 'admin', '2025-03-15 16:51:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2048, '发布作业修改', 2045, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'homework:homework:edit', '#', 'admin', '2025-03-15 16:51:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2049, '发布作业删除', 2045, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'homework:homework:remove', '#', 'admin', '2025-03-15 16:51:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2050, '发布作业导出', 2045, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'homework:homework:export', '#', 'admin', '2025-03-15 16:51:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2051, '提交作业', 2044, 1, 'stuhom', 'stuhom/stuhom/index', NULL, '', 1, 0, 'C', '0', '0', 'stuhom:stuhom:list', '#', 'admin', '2025-03-18 11:35:59', '', NULL, '提交作业菜单');
INSERT INTO `sys_menu` VALUES (2052, '提交作业查询', 2051, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'stuhom:stuhom:query', '#', 'admin', '2025-03-18 11:35:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2053, '提交作业新增', 2051, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'stuhom:stuhom:add', '#', 'admin', '2025-03-18 11:35:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2054, '提交作业修改', 2051, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'stuhom:stuhom:edit', '#', 'admin', '2025-03-18 11:35:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2055, '提交作业删除', 2051, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'stuhom:stuhom:remove', '#', 'admin', '2025-03-18 11:35:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2056, '提交作业导出', 2051, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'stuhom:stuhom:export', '#', 'admin', '2025-03-18 11:35:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2072, '简历管理', 0, 15, 'Resume', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'excel', 'admin', '2025-03-31 18:59:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2073, '简历管理', 2072, 1, 'Resume', 'Resume/Resume/index', NULL, '', 1, 0, 'C', '0', '0', 'Resume:Resume:list', '#', 'admin', '2025-03-31 19:01:54', '', NULL, '简历管理菜单');
INSERT INTO `sys_menu` VALUES (2074, '简历管理查询', 2073, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'Resume:Resume:query', '#', 'admin', '2025-03-31 19:01:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2075, '简历管理新增', 2073, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'Resume:Resume:add', '#', 'admin', '2025-03-31 19:01:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2076, '简历管理修改', 2073, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'Resume:Resume:edit', '#', 'admin', '2025-03-31 19:01:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2077, '简历管理删除', 2073, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'Resume:Resume:remove', '#', 'admin', '2025-03-31 19:01:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2078, '简历管理导出', 2073, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'Resume:Resume:export', '#', 'admin', '2025-03-31 19:01:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2085, '简历投递', 2072, 1, 'work', 'ResumeWork/work/index', NULL, '', 1, 0, 'C', '1', '0', 'ResumeWork:work:list', '#', 'admin', '2025-04-08 14:43:22', 'user2​', '2025-04-09 14:00:27', '简历投递菜单');
INSERT INTO `sys_menu` VALUES (2086, '简历投递查询', 2085, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ResumeWork:work:query', '#', 'admin', '2025-04-08 14:43:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2087, '简历投递新增', 2085, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ResumeWork:work:add', '#', 'admin', '2025-04-08 14:43:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2088, '简历投递修改', 2085, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ResumeWork:work:edit', '#', 'admin', '2025-04-08 14:43:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2089, '简历投递删除', 2085, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ResumeWork:work:remove', '#', 'admin', '2025-04-08 14:43:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2090, '简历投递导出', 2085, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ResumeWork:work:export', '#', 'admin', '2025-04-08 14:43:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2091, '行事历期数', 2042, 0, 'number', 'activity/number/index', NULL, '', 1, 0, 'C', '0', '0', 'activity:number:list', 'druid', 'admin', '2025-04-15 10:08:50', 'admin', '2025-04-15 14:49:05', '行事历期数菜单');
INSERT INTO `sys_menu` VALUES (2092, '行事历期数查询', 2091, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'activity:number:query', '#', 'admin', '2025-04-15 10:08:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2093, '行事历期数新增', 2091, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'activity:number:add', '#', 'admin', '2025-04-15 10:08:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2094, '行事历期数修改', 2091, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'activity:number:edit', '#', 'admin', '2025-04-15 10:08:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2095, '行事历期数删除', 2091, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'activity:number:remove', '#', 'admin', '2025-04-15 10:08:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2096, '行事历期数导出', 2091, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'activity:number:export', '#', 'admin', '2025-04-15 10:08:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2097, '考勤管理', 0, 4, 'leave', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'cascader', 'admin', '2025-04-15 10:16:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2098, '行事历周数', 2042, 2, 'time', 'activity/time/index', NULL, '', 1, 0, 'C', '1', '0', 'activity:time:list', 'date', 'admin', '2025-04-15 14:33:27', 'admin', '2025-04-16 14:11:19', '行事历周数时间菜单');
INSERT INTO `sys_menu` VALUES (2099, '行事历周数时间查询', 2098, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'activity:time:query', '#', 'admin', '2025-04-15 14:33:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2100, '行事历周数时间新增', 2098, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'activity:time:add', '#', 'admin', '2025-04-15 14:33:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2101, '行事历周数时间修改', 2098, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'activity:time:edit', '#', 'admin', '2025-04-15 14:33:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2102, '行事历周数时间删除', 2098, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'activity:time:remove', '#', 'admin', '2025-04-15 14:33:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2103, '行事历周数时间导出', 2098, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'activity:time:export', '#', 'admin', '2025-04-15 14:33:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2104, '行事历颜色', 2042, 3, 'color', 'activity/color/index', NULL, '', 1, 0, 'C', '1', '0', 'activity:color:list', 'color', 'admin', '2025-04-15 14:33:38', 'admin', '2025-04-16 14:11:24', '行事历部门颜色菜单');
INSERT INTO `sys_menu` VALUES (2105, '行事历部门颜色查询', 2104, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'activity:color:query', '#', 'admin', '2025-04-15 14:33:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2106, '行事历部门颜色新增', 2104, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'activity:color:add', '#', 'admin', '2025-04-15 14:33:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2107, '行事历部门颜色修改', 2104, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'activity:color:edit', '#', 'admin', '2025-04-15 14:33:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2108, '行事历部门颜色删除', 2104, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'activity:color:remove', '#', 'admin', '2025-04-15 14:33:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2109, '行事历部门颜色导出', 2104, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'activity:color:export', '#', 'admin', '2025-04-15 14:33:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2110, '行事历查看', 2042, 4, 'calendarView', 'activity/calendar/indexView', NULL, '', 1, 0, 'C', '1', '0', 'activity:event:listCalendar', 'date', 'admin', '2025-04-16 13:58:04', 'admin', '2025-04-16 14:11:28', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2025-03-10 17:54:48', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2025-03-10 17:54:48', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(11) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(11) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(11) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 494 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-03-10 17:54:47\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2025-03-10 17:54:47\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"薛老师\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-10 18:22:49', 35);
INSERT INTO `sys_oper_log` VALUES (101, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":103,\"email\":\"1801253796@qq.com\",\"nickName\":\"张三\",\"params\":{},\"phonenumber\":\"13153172427\",\"postIds\":[],\"roleIds\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"张三\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-10 18:40:55', 97);
INSERT INTO `sys_oper_log` VALUES (102, '岗位管理', 1, 'com.ruoyi.web.controller.system.SysPostController.add()', 'POST', 1, 'admin', '研发部门', '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"flag\":false,\"params\":{},\"postCode\":\"TechnicalTeacher\",\"postId\":5,\"postName\":\"技术老师\",\"postSort\":5,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-10 18:43:11', 11);
INSERT INTO `sys_oper_log` VALUES (103, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-03-10 17:54:47\",\"flag\":false,\"params\":{},\"postCode\":\"WorkplaceTeacher\",\"postId\":1,\"postName\":\"职场老师\",\"postSort\":1,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-10 18:43:55', 8);
INSERT INTO `sys_oper_log` VALUES (104, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-03-10 17:54:47\",\"flag\":false,\"params\":{},\"postCode\":\"PinxuanSupervisor\",\"postId\":2,\"postName\":\"品轩主管\",\"postSort\":2,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-10 18:44:49', 15);
INSERT INTO `sys_oper_log` VALUES (105, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-03-10 17:54:47\",\"flag\":false,\"params\":{},\"postCode\":\"Treasurer\",\"postId\":3,\"postName\":\"财务主管\",\"postSort\":3,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-10 18:46:16', 10);
INSERT INTO `sys_oper_log` VALUES (106, '岗位管理', 1, 'com.ruoyi.web.controller.system.SysPostController.add()', 'POST', 1, 'admin', '研发部门', '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"flag\":false,\"params\":{},\"postCode\":\"TechnicalSupervisor\",\"postId\":6,\"postName\":\"技术主管\",\"postSort\":6,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-10 18:47:19', 12);
INSERT INTO `sys_oper_log` VALUES (107, '岗位管理', 1, 'com.ruoyi.web.controller.system.SysPostController.add()', 'POST', 1, 'admin', '研发部门', '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"flag\":false,\"params\":{},\"postCode\":\"HeadofPersonnel\",\"postId\":7,\"postName\":\"人事主管\",\"postSort\":7,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-10 18:48:52', 12);
INSERT INTO `sys_oper_log` VALUES (108, '岗位管理', 1, 'com.ruoyi.web.controller.system.SysPostController.add()', 'POST', 1, 'admin', '研发部门', '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"flag\":false,\"params\":{},\"postCode\":\"HeadofAdministration\",\"postId\":8,\"postName\":\"行政主管\",\"postSort\":8,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-10 18:49:23', 7);
INSERT INTO `sys_oper_log` VALUES (109, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', '研发部门', '/system/user/authRole', '127.0.0.1', '内网IP', '{\"roleIds\":\"2\",\"userId\":\"100\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-10 18:51:28', 4);
INSERT INTO `sys_oper_log` VALUES (110, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', '研发部门', '/system/user/authRole', '127.0.0.1', '内网IP', '{\"roleIds\":\"2\",\"userId\":\"100\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-10 18:52:00', 12);
INSERT INTO `sys_oper_log` VALUES (111, '岗位管理', 1, 'com.ruoyi.web.controller.system.SysPostController.add()', 'POST', 1, 'admin', '研发部门', '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"flag\":false,\"params\":{},\"postCode\":\"Leader\",\"postId\":9,\"postName\":\"组长\",\"postSort\":9,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-10 18:54:38', 8);
INSERT INTO `sys_oper_log` VALUES (112, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-03-10 18:40:55\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"项目一部\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"email\":\"1801253796@qq.com\",\"loginIp\":\"\",\"nickName\":\"张三\",\"params\":{},\"phonenumber\":\"13153172427\",\"postIds\":[4],\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"张三\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-10 19:00:02', 11);
INSERT INTO `sys_oper_log` VALUES (113, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4],\"params\":{},\"roleId\":100,\"roleKey\":\"terman\",\"roleName\":\"老师管理\",\"roleSort\":3,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-10 19:00:48', 13);
INSERT INTO `sys_oper_log` VALUES (114, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4],\"params\":{},\"roleId\":101,\"roleKey\":\"stuman\",\"roleName\":\"学生管理\",\"roleSort\":4,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-10 19:06:45', 14);
INSERT INTO `sys_oper_log` VALUES (115, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101,106\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"一组\",\"leader\":\"李茂龙\",\"orderNum\":1,\"params\":{},\"parentId\":106,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-10 19:13:05', 16);
INSERT INTO `sys_oper_log` VALUES (116, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101,106\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"二组\",\"leader\":\"周国鲁\",\"orderNum\":2,\"params\":{},\"parentId\":106,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-10 19:13:25', 10);
INSERT INTO `sys_oper_log` VALUES (117, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101,106\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"三组\",\"leader\":\"李隆裕\",\"orderNum\":3,\"params\":{},\"parentId\":106,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-10 19:13:46', 7);
INSERT INTO `sys_oper_log` VALUES (118, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"children\":[],\"deptName\":\"三组\",\"leader\":\"伦冠达\",\"orderNum\":4,\"params\":{},\"parentId\":106,\"status\":\"0\"}', '{\"msg\":\"新增部门\'三组\'失败，部门名称已存在\",\"code\":500}', 0, NULL, '2025-03-10 19:14:13', 3);
INSERT INTO `sys_oper_log` VALUES (119, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101,106\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"四组\",\"leader\":\"伦冠达\",\"orderNum\":4,\"params\":{},\"parentId\":106,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-10 19:14:28', 11);
INSERT INTO `sys_oper_log` VALUES (120, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101,106\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"五组\",\"leader\":\"李书合\",\"orderNum\":5,\"params\":{},\"parentId\":106,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-10 19:14:51', 11);
INSERT INTO `sys_oper_log` VALUES (121, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101,106\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"六祖\",\"leader\":\"刘曼\",\"orderNum\":6,\"params\":{},\"parentId\":106,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-10 19:15:12', 5);
INSERT INTO `sys_oper_log` VALUES (122, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101,106\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"七组\",\"leader\":\"周家斌\",\"orderNum\":7,\"params\":{},\"parentId\":106,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-10 19:15:38', 9);
INSERT INTO `sys_oper_log` VALUES (123, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2025-03-10 17:54:47\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":100,\"menuName\":\"学生管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"user\",\"perms\":\"system:user:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-10 19:17:18', 10);
INSERT INTO `sys_oper_log` VALUES (124, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dept/index\",\"createTime\":\"2025-03-10 17:54:47\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":103,\"menuName\":\"项目部管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":1,\"path\":\"dept\",\"perms\":\"system:dept:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-10 19:18:25', 8);
INSERT INTO `sys_oper_log` VALUES (125, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"deptId\":204,\"email\":\"1801253796@qq.com\",\"nickName\":\"zs\",\"params\":{},\"phonenumber\":\"13153172427\",\"postIds\":[4],\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userName\":\"张三\"}', '{\"msg\":\"新增用户\'张三\'失败，登录账号已存在\",\"code\":500}', 0, NULL, '2025-03-10 19:19:33', 3);
INSERT INTO `sys_oper_log` VALUES (126, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"deptId\":204,\"email\":\"1801253796@qq.com\",\"nickName\":\"zs\",\"params\":{},\"phonenumber\":\"13153172427\",\"postIds\":[4],\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userName\":\"顾思安\"}', '{\"msg\":\"新增用户\'顾思安\'失败，手机号码已存在\",\"code\":500}', 0, NULL, '2025-03-10 19:19:44', 6);
INSERT INTO `sys_oper_log` VALUES (127, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"deptId\":204,\"email\":\"1801253796@qq.com\",\"nickName\":\"zs\",\"params\":{},\"phonenumber\":\"19963224915\",\"postIds\":[4],\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userName\":\"顾思安\"}', '{\"msg\":\"新增用户\'顾思安\'失败，邮箱账号已存在\",\"code\":500}', 0, NULL, '2025-03-10 19:20:02', 3);
INSERT INTO `sys_oper_log` VALUES (128, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"deptId\":204,\"email\":\"1801253796@qq.com\",\"nickName\":\"zs\",\"params\":{},\"phonenumber\":\"19963224915\",\"postIds\":[4],\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userName\":\"刘文昂\"}', '{\"msg\":\"新增用户\'刘文昂\'失败，邮箱账号已存在\",\"code\":500}', 0, NULL, '2025-03-10 19:20:13', 7);
INSERT INTO `sys_oper_log` VALUES (129, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":204,\"email\":\"1791693198@qq.com\",\"nickName\":\"zs\",\"params\":{},\"phonenumber\":\"19963224915\",\"postIds\":[4],\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userId\":101,\"userName\":\"刘文昂\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-10 19:20:29', 87);
INSERT INTO `sys_oper_log` VALUES (130, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"往期\",\"orderNum\":2,\"params\":{},\"parentId\":100,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-10 19:35:06', 6);
INSERT INTO `sys_oper_log` VALUES (131, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,207\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"第七期\",\"orderNum\":1,\"params\":{},\"parentId\":207,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-10 19:35:28', 9);
INSERT INTO `sys_oper_log` VALUES (132, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/208', '127.0.0.1', '内网IP', '208', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-10 19:56:50', 23);
INSERT INTO `sys_oper_log` VALUES (133, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/207', '127.0.0.1', '内网IP', '207', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-10 19:56:52', 8);
INSERT INTO `sys_oper_log` VALUES (134, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/user/100', '127.0.0.1', '内网IP', '[100]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-11 09:32:20', 30);
INSERT INTO `sys_oper_log` VALUES (135, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '项目一部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"往期学院\",\"menuType\":\"M\",\"orderNum\":9,\"params\":{},\"parentId\":0,\"path\":\"onuser\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-11 09:34:56', 10);
INSERT INTO `sys_oper_log` VALUES (136, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-03-11 09:34:56\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"往期学员\",\"menuType\":\"M\",\"orderNum\":9,\"params\":{},\"parentId\":0,\"path\":\"onuser\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-11 09:35:13', 9);
INSERT INTO `sys_oper_log` VALUES (137, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-03-10 19:20:29\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101,106\",\"children\":[],\"deptId\":204,\"deptName\":\"五组\",\"leader\":\"李书合\",\"orderNum\":5,\"params\":{},\"parentId\":106,\"status\":\"0\"},\"deptId\":204,\"email\":\"1791693198@qq.com\",\"loginIp\":\"\",\"nickName\":\"zs\",\"params\":{},\"phonenumber\":\"19963224915\",\"postIds\":[4],\"remark\":\"第八期\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":101,\"userName\":\"刘文昂\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-11 09:44:05', 12);
INSERT INTO `sys_oper_log` VALUES (138, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '项目一部', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_user\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-11 09:46:56', 39);
INSERT INTO `sys_oper_log` VALUES (139, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '项目一部', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"onuser\",\"className\":\"SysUser\",\"columns\":[{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":1,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-11 09:46:56\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DeptId\",\"columnComment\":\"部门ID\",\"columnId\":2,\"columnName\":\"dept_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-11 09:46:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"deptId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserName\",\"columnComment\":\"用户账号\",\"columnId\":3,\"columnName\":\"user_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-11 09:46:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"NickName\",\"columnComment\":\"用户昵称\",\"columnId\":4,\"columnName\":\"nick_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-11 09:46:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-11 09:49:29', 26);
INSERT INTO `sys_oper_log` VALUES (140, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '项目一部', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_user\"}', NULL, 0, NULL, '2025-03-11 09:56:55', 32);
INSERT INTO `sys_oper_log` VALUES (141, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '项目一部', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"onusers\",\"className\":\"SysUser\",\"columns\":[{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":1,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-11 09:46:56\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-03-11 09:49:28\",\"usableColumn\":false},{\"capJavaField\":\"DeptId\",\"columnComment\":\"部门ID\",\"columnId\":2,\"columnName\":\"dept_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-11 09:46:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"deptId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-03-11 09:49:28\",\"usableColumn\":false},{\"capJavaField\":\"UserName\",\"columnComment\":\"用户账号\",\"columnId\":3,\"columnName\":\"user_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-11 09:46:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-03-11 09:49:28\",\"usableColumn\":false},{\"capJavaField\":\"NickName\",\"columnComment\":\"用户昵称\",\"columnId\":4,\"columnName\":\"nick_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-11 09:46:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-11 10:47:49', 106);
INSERT INTO `sys_oper_log` VALUES (142, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '项目一部', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_user\"}', NULL, 0, NULL, '2025-03-11 10:48:01', 182);
INSERT INTO `sys_oper_log` VALUES (143, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/menu/2006', '127.0.0.1', '内网IP', '2006', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-11 11:06:13', 20);
INSERT INTO `sys_oper_log` VALUES (144, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/menu/2005', '127.0.0.1', '内网IP', '2005', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-11 11:06:15', 12);
INSERT INTO `sys_oper_log` VALUES (145, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/menu/2004', '127.0.0.1', '内网IP', '2004', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-11 11:06:17', 9);
INSERT INTO `sys_oper_log` VALUES (146, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/menu/2003', '127.0.0.1', '内网IP', '2003', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-11 11:06:18', 13);
INSERT INTO `sys_oper_log` VALUES (147, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/menu/2002', '127.0.0.1', '内网IP', '2002', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-11 11:06:20', 16);
INSERT INTO `sys_oper_log` VALUES (148, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/menu/2001', '127.0.0.1', '内网IP', '2001', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-11 11:06:22', 13);
INSERT INTO `sys_oper_log` VALUES (149, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/menu/2008', '127.0.0.1', '内网IP', '2008', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-11 11:20:49', 12);
INSERT INTO `sys_oper_log` VALUES (150, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/menu/2009', '127.0.0.1', '内网IP', '2009', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-11 11:20:50', 15);
INSERT INTO `sys_oper_log` VALUES (151, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/menu/2010', '127.0.0.1', '内网IP', '2010', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-11 11:20:52', 17);
INSERT INTO `sys_oper_log` VALUES (152, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/menu/2011', '127.0.0.1', '内网IP', '2011', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-11 11:20:55', 13);
INSERT INTO `sys_oper_log` VALUES (153, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/menu/2012', '127.0.0.1', '内网IP', '2012', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-11 11:20:57', 12);
INSERT INTO `sys_oper_log` VALUES (154, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/user/100', '127.0.0.1', '内网IP', '[100]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-11 15:19:27', 15994);
INSERT INTO `sys_oper_log` VALUES (155, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/user/100', '127.0.0.1', '内网IP', '[100]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-11 15:19:27', 1167);
INSERT INTO `sys_oper_log` VALUES (156, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/user/101', '127.0.0.1', '内网IP', '[101]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-11 15:22:05', 6794);
INSERT INTO `sys_oper_log` VALUES (157, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/user/2', '127.0.0.1', '内网IP', '[2]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-11 15:23:35', 21);
INSERT INTO `sys_oper_log` VALUES (158, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.removesdel()', 'DELETE', 1, 'admin', '项目一部', '/system/user/del/101', '127.0.0.1', '内网IP', '[101]', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'userIdsdel\' not found. Available parameters are [array, arg0]', '2025-03-11 15:31:15', 61501);
INSERT INTO `sys_oper_log` VALUES (159, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.removesdel()', 'DELETE', 1, 'admin', '项目一部', '/system/user/del/100', '127.0.0.1', '内网IP', '[100]', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'userIdsdel\' not found. Available parameters are [array, arg0]', '2025-03-11 15:31:30', 21);
INSERT INTO `sys_oper_log` VALUES (160, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.removesdel()', 'DELETE', 1, 'admin', '项目一部', '/system/user/del/100', '127.0.0.1', '内网IP', '[100]', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'userIds\' not found. Available parameters are [array, arg0]', '2025-03-11 15:33:19', 18);
INSERT INTO `sys_oper_log` VALUES (161, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.removesdel()', 'DELETE', 1, 'admin', '项目一部', '/system/user/del/100', '127.0.0.1', '内网IP', '[100]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-11 15:34:59', 16);
INSERT INTO `sys_oper_log` VALUES (162, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/user/101', '127.0.0.1', '内网IP', '[101]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-11 16:57:31', 15);
INSERT INTO `sys_oper_log` VALUES (163, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '项目一部', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":201,\"email\":\"1055635267@qq.com\",\"nickName\":\"1\",\"params\":{},\"phonenumber\":\"13153172428\",\"postIds\":[1],\"roleIds\":[100],\"semester\":\"第八期\",\"sex\":\"0\",\"status\":\"0\",\"userId\":102,\"userName\":\"李四\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-11 19:52:12', 208);
INSERT INTO `sys_oper_log` VALUES (164, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-03-11 19:52:12\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101,106\",\"children\":[],\"deptId\":201,\"deptName\":\"二组\",\"leader\":\"周国鲁\",\"orderNum\":2,\"params\":{},\"parentId\":106,\"status\":\"0\"},\"deptId\":201,\"email\":\"1055635267@qq.com\",\"loginIp\":\"\",\"nickName\":\"1\",\"params\":{},\"phonenumber\":\"13153172428\",\"postIds\":[1],\"remark\":\"123\",\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"terman\",\"roleName\":\"老师管理\",\"roleSort\":3,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":102,\"userName\":\"李四\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-11 20:05:46', 132);
INSERT INTO `sys_oper_log` VALUES (165, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-03-11 19:52:12\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101,106\",\"children\":[],\"deptId\":201,\"deptName\":\"二组\",\"leader\":\"周国鲁\",\"orderNum\":2,\"params\":{},\"parentId\":106,\"status\":\"0\"},\"deptId\":201,\"email\":\"1055635267@qq.com\",\"loginIp\":\"\",\"nickName\":\"1\",\"params\":{},\"phonenumber\":\"13153172428\",\"postIds\":[1],\"remark\":\"123\",\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"terman\",\"roleName\":\"老师管理\",\"roleSort\":3,\"status\":\"0\"}],\"semester\":\"第八期\",\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":102,\"userName\":\"李四\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-11 20:05:54', 33);
INSERT INTO `sys_oper_log` VALUES (166, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-03-11 19:52:12\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101,106\",\"children\":[],\"deptId\":201,\"deptName\":\"二组\",\"leader\":\"周国鲁\",\"orderNum\":2,\"params\":{},\"parentId\":106,\"status\":\"0\"},\"deptId\":201,\"email\":\"1055635267@qq.com\",\"loginIp\":\"\",\"nickName\":\"1\",\"params\":{},\"phonenumber\":\"13153172428\",\"postIds\":[1],\"remark\":\"123\",\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"terman\",\"roleName\":\"老师管理\",\"roleSort\":3,\"status\":\"0\"}],\"semester\":\"第九期\",\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":102,\"userName\":\"李四\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-11 20:09:14', 13);
INSERT INTO `sys_oper_log` VALUES (167, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', '项目一部', '/system/user/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"0\"}', NULL, 1, 'Cannot invoke \"com.ruoyi.common.core.domain.entity.SysUser.getUserName()\" because \"user\" is null', '2025-03-12 09:23:49', 425);
INSERT INTO `sys_oper_log` VALUES (168, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', '项目一部', '/system/user/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"0\"}', NULL, 1, 'Cannot invoke \"com.ruoyi.common.core.domain.entity.SysUser.getUserName()\" because \"user\" is null', '2025-03-12 09:24:48', 14);
INSERT INTO `sys_oper_log` VALUES (169, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', '项目一部', '/system/user/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"0\"}', NULL, 1, '很抱歉，导入失败！共 6 条数据格式不正确，错误如下：<br/>1、账号 null 导入失败：userName: 用户账号不能为空<br/>2、账号 null 导入失败：userName: 用户账号不能为空<br/>3、账号 null 导入失败：userName: 用户账号不能为空<br/>4、账号 null 导入失败：userName: 用户账号不能为空<br/>5、账号 null 导入失败：userName: 用户账号不能为空<br/>6、账号 null 导入失败：userName: 用户账号不能为空', '2025-03-12 10:25:17', 363);
INSERT INTO `sys_oper_log` VALUES (170, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', '项目一部', '/system/user/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"0\"}', NULL, 1, '很抱歉，导入失败！共 6 条数据格式不正确，错误如下：<br/>1、账号 2024251179 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\ROG\\Desktop\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysUserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user(                  user_name,                         phonenumber,       sex,       password,             create_by,                 create_time    )values(                  ?,                         ?,       ?,       ?,             ?,                 sysdate()    )\r\n### Cause: java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value\n; Field \'nick_name\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value<br/>2、账号 2024250455 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\ROG\\Desktop\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysUserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user(                  user_name,                         phonenumber,       sex,       password,             create_by,                 create_time    )values(                  ?,                         ?,       ?,       ?,             ?,                 sysdate()    )\r\n### Cause: java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value\n; Field \'nick_name\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value<br/>3、账号 2024250252 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'nick_n', '2025-03-12 10:26:21', 381);
INSERT INTO `sys_oper_log` VALUES (171, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', '项目一部', '/system/user/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"0\"}', NULL, 1, '很抱歉，导入失败！共 6 条数据格式不正确，错误如下：<br/>1、账号 2024251179 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\ROG\\Desktop\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysUserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user(                  user_name,                   avatar,       phonenumber,       sex,       password,             create_by,                 create_time    )values(                  ?,                   ?,       ?,       ?,       ?,             ?,                 sysdate()    )\r\n### Cause: java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value\n; Field \'nick_name\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value<br/>2、账号 2024250455 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\ROG\\Desktop\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysUserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user(                  user_name,                   avatar,       phonenumber,       sex,       password,             create_by,                 create_time    )values(                  ?,                   ?,       ?,       ?,       ?,             ?,                 sysdate()    )\r\n### Cause: java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value\n; Field \'nick_name\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value<br/>3、账号 2024250252 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLEx', '2025-03-12 10:31:05', 1032);
INSERT INTO `sys_oper_log` VALUES (172, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', '项目一部', '/system/user/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"0\"}', NULL, 1, '很抱歉，导入失败！共 6 条数据格式不正确，错误如下：<br/>1、账号 2024251179 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\ROG\\Desktop\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysUserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user(                  user_name,                   avatar,       phonenumber,       sex,       password,             create_by,                 create_time    )values(                  ?,                   ?,       ?,       ?,       ?,             ?,                 sysdate()    )\r\n### Cause: java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value\n; Field \'nick_name\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value<br/>2、账号 2024250455 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\ROG\\Desktop\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysUserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user(                  user_name,                   avatar,       phonenumber,       sex,       password,             create_by,                 create_time    )values(                  ?,                   ?,       ?,       ?,       ?,             ?,                 sysdate()    )\r\n### Cause: java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value\n; Field \'nick_name\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value<br/>3、账号 2024250252 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLEx', '2025-03-12 10:33:51', 988);
INSERT INTO `sys_oper_log` VALUES (173, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', '项目一部', '/system/user/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"0\"}', NULL, 1, '很抱歉，导入失败！共 6 条数据格式不正确，错误如下：<br/>1、账号 2024251179 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\ROG\\Desktop\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysUserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user(                  user_name,                   avatar,       phonenumber,       sex,       password,             create_by,                 create_time    )values(                  ?,                   ?,       ?,       ?,       ?,             ?,                 sysdate()    )\r\n### Cause: java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value\n; Field \'nick_name\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value<br/>2、账号 2024250455 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\ROG\\Desktop\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysUserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user(                  user_name,                   avatar,       phonenumber,       sex,       password,             create_by,                 create_time    )values(                  ?,                   ?,       ?,       ?,       ?,             ?,                 sysdate()    )\r\n### Cause: java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value\n; Field \'nick_name\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value<br/>3、账号 2024250252 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLEx', '2025-03-12 10:34:58', 389);
INSERT INTO `sys_oper_log` VALUES (174, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', '项目一部', '/system/user/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"0\"}', '{\"msg\":\"恭喜您，数据已全部导入成功！共 6 条，数据如下：<br/>1、账号 2024251179 导入成功<br/>2、账号 2024250455 导入成功<br/>3、账号 2024250252 导入成功<br/>4、账号 2024250558 导入成功<br/>5、账号 2024250580 导入成功<br/>6、账号 2024250117 导入成功\",\"code\":200}', 0, NULL, '2025-03-12 10:38:53', 330);
INSERT INTO `sys_oper_log` VALUES (175, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', '项目一部', '/system/user/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"true\"}', '{\"msg\":\"恭喜您，数据已全部导入成功！共 6 条，数据如下：<br/>1、账号 2024251179 更新成功<br/>2、账号 2024250455 更新成功<br/>3、账号 2024250252 更新成功<br/>4、账号 2024250558 更新成功<br/>5、账号 2024250580 更新成功<br/>6、账号 2024250117 更新成功\",\"code\":200}', 0, NULL, '2025-03-12 10:44:35', 40);
INSERT INTO `sys_oper_log` VALUES (176, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', '项目一部', '/system/user/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"0\"}', NULL, 1, '很抱歉，导入失败！共 6 条数据格式不正确，错误如下：<br/>1、账号 2024251179 已存在<br/>2、账号 2024250455 已存在<br/>3、账号 2024250252 已存在<br/>4、账号 2024250558 已存在<br/>5、账号 2024250580 已存在<br/>6、账号 2024250117 已存在', '2025-03-12 14:00:10', 50);
INSERT INTO `sys_oper_log` VALUES (177, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', '项目一部', '/system/user/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"true\"}', '{\"msg\":\"恭喜您，数据已全部导入成功！共 6 条，数据如下：<br/>1、账号 2024251179 导入成功<br/>2、账号 2024250455 导入成功<br/>3、账号 2024250252 导入成功<br/>4、账号 2024250558 导入成功<br/>5、账号 2024250580 导入成功<br/>6、账号 2024250117 导入成功\",\"code\":200}', 0, NULL, '2025-03-12 14:01:03', 419);
INSERT INTO `sys_oper_log` VALUES (178, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', '项目一部', '/system/user/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"true\"}', '{\"msg\":\"恭喜您，数据已全部导入成功！共 6 条，数据如下：<br/>1、账号 2024251179 导入成功<br/>2、账号 2024250455 导入成功<br/>3、账号 2024250252 导入成功<br/>4、账号 2024250558 导入成功<br/>5、账号 2024250580 导入成功<br/>6、账号 2024250117 导入成功\",\"code\":200}', 0, NULL, '2025-03-12 14:07:31', 666);
INSERT INTO `sys_oper_log` VALUES (179, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', '项目一部', '/system/user/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"0\"}', '{\"msg\":\"恭喜您，数据已全部导入成功！共 1 条，数据如下：<br/>1、账号 2024251179 导入成功\",\"code\":200}', 0, NULL, '2025-03-12 14:08:31', 89);
INSERT INTO `sys_oper_log` VALUES (180, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', '项目一部', '/system/user/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"0\"}', NULL, 1, '很抱歉，导入失败！共 1 条数据格式不正确，错误如下：<br/>1、账号 2024251179 已存在', '2025-03-12 14:57:46', 27);
INSERT INTO `sys_oper_log` VALUES (181, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/menu/2025', '127.0.0.1', '内网IP', '2025', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2025-03-12 20:57:05', 15);
INSERT INTO `sys_oper_log` VALUES (182, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/menu/2030', '127.0.0.1', '内网IP', '2030', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-12 20:57:19', 41);
INSERT INTO `sys_oper_log` VALUES (183, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/menu/2029', '127.0.0.1', '内网IP', '2029', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-12 20:57:21', 17);
INSERT INTO `sys_oper_log` VALUES (184, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/menu/2028', '127.0.0.1', '内网IP', '2028', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-12 20:57:25', 26);
INSERT INTO `sys_oper_log` VALUES (185, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/menu/2027', '127.0.0.1', '内网IP', '2027', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-12 20:57:27', 19);
INSERT INTO `sys_oper_log` VALUES (186, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/menu/2026', '127.0.0.1', '内网IP', '2026', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-12 20:57:31', 31);
INSERT INTO `sys_oper_log` VALUES (187, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/menu/2025', '127.0.0.1', '内网IP', '2025', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-12 20:57:34', 30);
INSERT INTO `sys_oper_log` VALUES (188, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"leave/room/index\",\"createTime\":\"2025-03-12 20:45:25\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"教室管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"room\",\"perms\":\"leave:room:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-12 20:57:46', 38);
INSERT INTO `sys_oper_log` VALUES (189, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"leave/room/index\",\"createTime\":\"2025-03-12 20:45:25\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"教室管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"room\",\"perms\":\"leave:room:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-12 20:57:59', 80);
INSERT INTO `sys_oper_log` VALUES (190, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"leave/room/index\",\"createTime\":\"2025-03-12 20:45:25\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"教室管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"room\",\"perms\":\"leave:room:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-12 20:58:41', 63);
INSERT INTO `sys_oper_log` VALUES (191, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"leave/details/index\",\"createTime\":\"2025-03-12 21:04:10\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2031,\"menuName\":\"请假管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"details\",\"perms\":\"leave:details:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-12 21:06:48', 144);
INSERT INTO `sys_oper_log` VALUES (192, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"leave/details/index\",\"createTime\":\"2025-03-12 21:04:10\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2031,\"menuName\":\"请假管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"details\",\"perms\":\"leave:details:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-12 21:07:06', 58);
INSERT INTO `sys_oper_log` VALUES (193, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"leave/room/index\",\"createTime\":\"2025-03-12 20:45:25\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"教室管理\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"room\",\"perms\":\"leave:room:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-12 21:07:19', 94);
INSERT INTO `sys_oper_log` VALUES (194, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '项目一部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"leave/seat/seat\",\"createBy\":\"admin\",\"icon\":\"email\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"教室座位\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"seat\",\"perms\":\"leave:room:list\",\"status\":\"0\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-12 21:08:37', 41);
INSERT INTO `sys_oper_log` VALUES (195, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '项目一部', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"homework\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-15 15:15:55', 119);
INSERT INTO `sys_oper_log` VALUES (196, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '项目一部', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"homework\",\"className\":\"Homework\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":20,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 15:15:55\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Stuid\",\"columnComment\":\"学生id\",\"columnId\":21,\"columnName\":\"stuid\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 15:15:55\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"stuid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Homeword\",\"columnComment\":\"作业\",\"columnId\":22,\"columnName\":\"homeword\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 15:15:55\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"homeword\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Remark\",\"columnComment\":\"备注1\",\"columnId\":23,\"columnName\":\"remark\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 15:15:55\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"remark\",\"javaType\":\"String\",\"list\":true', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-15 15:16:32', 66);
INSERT INTO `sys_oper_log` VALUES (197, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '项目一部', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"homework\"}', NULL, 0, NULL, '2025-03-15 15:17:10', 321);
INSERT INTO `sys_oper_log` VALUES (198, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/menu/2039', '127.0.0.1', '内网IP', '2039', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-15 15:51:10', 25);
INSERT INTO `sys_oper_log` VALUES (199, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/menu/2040', '127.0.0.1', '内网IP', '2040', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-15 15:51:13', 14);
INSERT INTO `sys_oper_log` VALUES (200, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/menu/2041', '127.0.0.1', '内网IP', '2041', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-15 15:51:18', 14);
INSERT INTO `sys_oper_log` VALUES (201, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/menu/2042', '127.0.0.1', '内网IP', '2042', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-15 15:51:21', 9);
INSERT INTO `sys_oper_log` VALUES (202, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/menu/2043', '127.0.0.1', '内网IP', '2043', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-15 15:51:23', 12);
INSERT INTO `sys_oper_log` VALUES (203, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/menu/2038', '127.0.0.1', '内网IP', '2038', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-15 15:51:26', 15);
INSERT INTO `sys_oper_log` VALUES (204, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '项目一部', '/tool/gen/2', '127.0.0.1', '内网IP', '[2]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-15 16:11:27', 30);
INSERT INTO `sys_oper_log` VALUES (205, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '项目一部', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"homework\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-15 16:11:31', 93);
INSERT INTO `sys_oper_log` VALUES (206, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '项目一部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"作业管理\",\"menuType\":\"M\",\"orderNum\":10,\"params\":{},\"parentId\":0,\"path\":\"homework\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-15 16:12:12', 14);
INSERT INTO `sys_oper_log` VALUES (207, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '项目一部', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"homework\",\"className\":\"Homework\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":31,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 16:11:31\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"作业标题\",\"columnId\":32,\"columnName\":\"title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 16:11:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Content\",\"columnComment\":\"作业内容\",\"columnId\":33,\"columnName\":\"content\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 16:11:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"content\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DueDate\",\"columnComment\":\"截止日期\",\"columnId\":34,\"columnName\":\"due_date\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 16:11:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"dueDate\",\"javaType\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-15 16:14:32', 58);
INSERT INTO `sys_oper_log` VALUES (208, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '项目一部', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"homework\"}', NULL, 0, NULL, '2025-03-15 16:18:40', 203);
INSERT INTO `sys_oper_log` VALUES (209, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '项目一部', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"homework\"}', NULL, 0, NULL, '2025-03-15 16:19:02', 53);
INSERT INTO `sys_oper_log` VALUES (210, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '项目一部', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"homework\",\"className\":\"Homework\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":31,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 16:11:31\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-03-15 16:14:32\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"作业标题\",\"columnId\":32,\"columnName\":\"title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 16:11:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-03-15 16:14:32\",\"usableColumn\":false},{\"capJavaField\":\"Content\",\"columnComment\":\"作业内容\",\"columnId\":33,\"columnName\":\"content\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 16:11:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"fileUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"content\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-03-15 16:14:32\",\"usableColumn\":false},{\"capJavaField\":\"DueDate\",\"columnComment\":\"截止日期\",\"columnId\":34,\"columnName\":\"due_date\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 16:11:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-15 17:24:43', 117);
INSERT INTO `sys_oper_log` VALUES (211, '发布作业', 1, 'com.ruoyi.homework.controller.HomeworkController.add()', 'POST', 1, 'admin', '项目一部', '/homework/homework', '127.0.0.1', '内网IP', '{\"content\":\"/profile/upload/2025/03/17/五组翟帅_20250317103121A001.docx\",\"createTime\":\"2025-03-17 10:31:30\",\"dueDate\":\"2025-03-22\",\"id\":1,\"params\":{},\"teacherId\":1,\"title\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-17 10:31:30', 47);
INSERT INTO `sys_oper_log` VALUES (212, '发布作业', 1, 'com.ruoyi.homework.controller.HomeworkController.add()', 'POST', 1, 'admin', '项目一部', '/homework/homework', '127.0.0.1', '内网IP', '{\"content\":\"/profile/upload/2025/03/18/五组石玉秀_20250318102433A001.docx\",\"createTime\":\"2025-03-18 10:26:07\",\"dueDate\":\"2025-03-18\",\"id\":2,\"params\":{},\"teacherId\":1,\"title\":\"text\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-18 10:26:13', 91523);
INSERT INTO `sys_oper_log` VALUES (213, '发布作业', 1, 'com.ruoyi.homework.controller.HomeworkController.add()', 'POST', 1, 'admin', '项目一部', '/homework/homework', '127.0.0.1', '内网IP', '{\"content\":\"/profile/upload/2025/03/18/五组石玉秀_20250318102433A001.docx\",\"createTime\":\"2025-03-18 10:32:21\",\"dueDate\":\"2025-03-18\",\"id\":3,\"params\":{},\"teacherId\":1,\"title\":\"text\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-18 10:32:21', 144779);
INSERT INTO `sys_oper_log` VALUES (214, '发布作业', 1, 'com.ruoyi.homework.controller.HomeworkController.add()', 'POST', 1, 'admin', '项目一部', '/homework/homework', '127.0.0.1', '内网IP', '{\"content\":\"/profile/upload/2025/03/18/五组石玉秀_20250318102433A001.docx\",\"createTime\":\"2025-03-18 10:36:00\",\"dueDate\":\"2025-03-18\",\"id\":4,\"params\":{},\"teacherId\":1,\"title\":\"text\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-18 10:36:00', 28);
INSERT INTO `sys_oper_log` VALUES (215, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '项目一部', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"student_homework\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-18 11:17:05', 192);
INSERT INTO `sys_oper_log` VALUES (216, '发布作业', 1, 'com.ruoyi.homework.controller.HomeworkController.add()', 'POST', 1, 'admin', '项目一部', '/homework/homework', '127.0.0.1', '内网IP', '{\"content\":\"/profile/upload/2025/03/18/周总结模板(1)_20250318112613A001.docx\",\"createTime\":\"2025-03-18 11:26:18\",\"dueDate\":\"2025-03-18\",\"id\":5,\"params\":{},\"remark\":\"103\",\"teacherId\":1,\"title\":\"测试2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-18 11:26:18', 38);
INSERT INTO `sys_oper_log` VALUES (217, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '项目一部', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"stuhom\",\"className\":\"stuhom\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":41,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-18 11:17:04\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"HomeworkId\",\"columnComment\":\"作业ID\",\"columnId\":42,\"columnName\":\"homework_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-18 11:17:04\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"homeworkId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"StudentId\",\"columnComment\":\"学生ID\",\"columnId\":43,\"columnName\":\"student_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-18 11:17:04\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"studentId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Submission\",\"columnComment\":\"提交内容\",\"columnId\":44,\"columnName\":\"submission\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-03-18 11:17:04\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"submission\",\"jav', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-18 11:29:03', 98);
INSERT INTO `sys_oper_log` VALUES (218, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '项目一部', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"student_homework\"}', NULL, 0, NULL, '2025-03-18 11:31:07', 99);
INSERT INTO `sys_oper_log` VALUES (219, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '项目一部', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"stuhom\",\"className\":\"stuhom\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":41,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-18 11:17:04\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-03-18 11:29:02\",\"usableColumn\":false},{\"capJavaField\":\"HomeworkId\",\"columnComment\":\"作业ID\",\"columnId\":42,\"columnName\":\"homework_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-18 11:17:04\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"homeworkId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-03-18 11:29:02\",\"usableColumn\":false},{\"capJavaField\":\"StudentId\",\"columnComment\":\"学生ID\",\"columnId\":43,\"columnName\":\"student_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-18 11:17:04\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"studentId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-03-18 11:29:02\",\"usableColumn\":false},{\"capJavaField\":\"Submission\",\"columnComment\":\"提交内容\",\"columnId\":44,\"columnName\":\"submission\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-03-18 11:17:04\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"fileUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncreme', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-18 14:32:42', 130);
INSERT INTO `sys_oper_log` VALUES (220, '提交作业', 1, 'com.ruoyi.stuhom.controller.StuHomController.add()', 'POST', 1, 'admin', '项目一部', '/stuhom/stuhom', '127.0.0.1', '内网IP', '{\"params\":{},\"submission\":\"/profile/upload/2025/03/18/五组翟帅_20250318151039A001.docx\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'homework_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\ROG\\Desktop\\gu-sian-master\\gu-sian-master\\stuhom\\target\\classes\\mapper\\stuhom\\stuhomMapper.xml]\r\n### The error may involve com.ruoyi.stuhom.mapper.StuHomMapper.insertstuhom-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into student_homework          ( submission )           values ( ? )\r\n### Cause: java.sql.SQLException: Field \'homework_id\' doesn\'t have a default value\n; Field \'homework_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'homework_id\' doesn\'t have a default value', '2025-03-18 15:10:40', 107);
INSERT INTO `sys_oper_log` VALUES (221, '提交作业', 1, 'com.ruoyi.stuhom.controller.StuHomController.add()', 'POST', 1, 'admin', '项目一部', '/stuhom/stuhom', '127.0.0.1', '内网IP', '{\"params\":{},\"submission\":\"/profile/upload/2025/03/18/五组翟帅_20250318151256A002.docx\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'homework_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\ROG\\Desktop\\gu-sian-master\\gu-sian-master\\stuhom\\target\\classes\\mapper\\stuhom\\stuhomMapper.xml]\r\n### The error may involve com.ruoyi.stuhom.mapper.StuHomMapper.insertstuhom-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into student_homework          ( submission )           values ( ? )\r\n### Cause: java.sql.SQLException: Field \'homework_id\' doesn\'t have a default value\n; Field \'homework_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'homework_id\' doesn\'t have a default value', '2025-03-18 15:12:57', 8);
INSERT INTO `sys_oper_log` VALUES (222, '提交作业', 1, 'com.ruoyi.stuhom.controller.StuHomController.add()', 'POST', 1, 'admin', '项目一部', '/stuhom/stuhom', '127.0.0.1', '内网IP', '{\"params\":{},\"submission\":\"/profile/upload/2025/03/18/周总结模板(1)_20250318151917A003.docx\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'homework_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\ROG\\Desktop\\gu-sian-master\\gu-sian-master\\stuhom\\target\\classes\\mapper\\stuhom\\stuhomMapper.xml]\r\n### The error may involve com.ruoyi.stuhom.mapper.StuHomMapper.insertstuhom-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into student_homework          ( submission )           values ( ? )\r\n### Cause: java.sql.SQLException: Field \'homework_id\' doesn\'t have a default value\n; Field \'homework_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'homework_id\' doesn\'t have a default value', '2025-03-18 15:19:19', 2);
INSERT INTO `sys_oper_log` VALUES (223, '提交作业', 1, 'com.ruoyi.stuhom.controller.StuHomController.add()', 'POST', 1, 'admin', '项目一部', '/stuhom/stuhom', '127.0.0.1', '内网IP', '{\"params\":{},\"submission\":\"/profile/upload/2025/03/18/周总结模板(1)_20250318151917A003.docx\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'homework_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\ROG\\Desktop\\gu-sian-master\\gu-sian-master\\stuhom\\target\\classes\\mapper\\stuhom\\stuhomMapper.xml]\r\n### The error may involve com.ruoyi.stuhom.mapper.StuHomMapper.insertstuhom-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into student_homework          ( submission )           values ( ? )\r\n### Cause: java.sql.SQLException: Field \'homework_id\' doesn\'t have a default value\n; Field \'homework_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'homework_id\' doesn\'t have a default value', '2025-03-18 15:22:31', 5);
INSERT INTO `sys_oper_log` VALUES (224, '提交作业', 1, 'com.ruoyi.stuhom.controller.StuHomController.add()', 'POST', 1, 'admin', '项目一部', '/stuhom/stuhom', '127.0.0.1', '内网IP', '{\"params\":{},\"submission\":\"/profile/upload/2025/03/18/五组翟帅_20250318152335A004.docx\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'homework_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\ROG\\Desktop\\gu-sian-master\\gu-sian-master\\stuhom\\target\\classes\\mapper\\stuhom\\stuhomMapper.xml]\r\n### The error may involve com.ruoyi.stuhom.mapper.StuHomMapper.insertstuhom-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into student_homework          ( submission )           values ( ? )\r\n### Cause: java.sql.SQLException: Field \'homework_id\' doesn\'t have a default value\n; Field \'homework_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'homework_id\' doesn\'t have a default value', '2025-03-18 15:23:36', 3);
INSERT INTO `sys_oper_log` VALUES (225, '发布作业', 5, 'com.ruoyi.homework.controller.HomeworkController.export()', 'POST', 1, 'admin', '项目一部', '/homework/homework/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-03-18 16:01:20', 1200);
INSERT INTO `sys_oper_log` VALUES (226, '提交作业', 1, 'com.ruoyi.stuhom.controller.StuHomController.add()', 'POST', 1, 'admin', '项目一部', '/stuhom/stuhom', '127.0.0.1', '内网IP', '{\"params\":{},\"submission\":\"/profile/upload/2025/03/18/实验一创建线程_学号_姓名_班级_ 操作系统_20250318161048A001.docx\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'student_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\ROG\\Desktop\\gu-sian-master\\gu-sian-master\\stuhom\\target\\classes\\mapper\\stuhom\\stuhomMapper.xml]\r\n### The error may involve com.ruoyi.stuhom.mapper.StuHomMapper.insertstuhom-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into student_homework          ( submission )           values ( ? )\r\n### Cause: java.sql.SQLException: Field \'student_id\' doesn\'t have a default value\n; Field \'student_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'student_id\' doesn\'t have a default value', '2025-03-18 16:10:51', 96);
INSERT INTO `sys_oper_log` VALUES (227, '提交作业', 1, 'com.ruoyi.stuhom.controller.StuHomController.add()', 'POST', 1, 'admin', '项目一部', '/stuhom/stuhom', '127.0.0.1', '内网IP', '{\"params\":{},\"studentId\":101,\"submission\":\"/profile/upload/2025/03/18/周总结模板(1)_20250318161254A002.docx\"}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'submission\' at row 1\r\n### The error may exist in file [C:\\Users\\ROG\\Desktop\\gu-sian-master\\gu-sian-master\\stuhom\\target\\classes\\mapper\\stuhom\\stuhomMapper.xml]\r\n### The error may involve com.ruoyi.stuhom.mapper.StuHomMapper.insertstuhom-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into student_homework          ( student_id,             submission )           values ( ?,             ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'submission\' at row 1\n; Data truncation: Data too long for column \'submission\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'submission\' at row 1', '2025-03-18 16:13:01', 11);
INSERT INTO `sys_oper_log` VALUES (228, '提交作业', 1, 'com.ruoyi.stuhom.controller.StuHomController.add()', 'POST', 1, 'admin', '项目一部', '/stuhom/stuhom', '127.0.0.1', '内网IP', '{\"params\":{},\"studentId\":101,\"submission\":\"/profile/upload/2025/03/18/周总结模板(1)_20250318161424A001.docx\"}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'submission\' at row 1\r\n### The error may exist in file [C:\\Users\\ROG\\Desktop\\gu-sian-master\\gu-sian-master\\stuhom\\target\\classes\\mapper\\stuhom\\stuhomMapper.xml]\r\n### The error may involve com.ruoyi.stuhom.mapper.StuHomMapper.insertstuhom-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into student_homework          ( student_id,             submission )           values ( ?,             ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'submission\' at row 1\n; Data truncation: Data too long for column \'submission\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'submission\' at row 1', '2025-03-18 16:14:31', 91);
INSERT INTO `sys_oper_log` VALUES (229, '提交作业', 1, 'com.ruoyi.stuhom.controller.StuHomController.add()', 'POST', 1, 'admin', '项目一部', '/stuhom/stuhom', '127.0.0.1', '内网IP', '{\"params\":{},\"studentId\":101,\"submission\":\"/profile/upload/2025/03/18/五组翟帅_20250318161643A001.docx\"}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'submission\' at row 1\r\n### The error may exist in file [C:\\Users\\ROG\\Desktop\\gu-sian-master\\gu-sian-master\\stuhom\\target\\classes\\mapper\\stuhom\\stuhomMapper.xml]\r\n### The error may involve com.ruoyi.stuhom.mapper.StuHomMapper.insertstuhom-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into student_homework          ( student_id,             submission )           values ( ?,             ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'submission\' at row 1\n; Data truncation: Data too long for column \'submission\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'submission\' at row 1', '2025-03-18 16:16:46', 131);
INSERT INTO `sys_oper_log` VALUES (230, '提交作业', 1, 'com.ruoyi.stuhom.controller.StuHomController.add()', 'POST', 1, 'admin', '项目一部', '/stuhom/stuhom', '127.0.0.1', '内网IP', '{\"id\":2,\"params\":{},\"studentId\":101,\"submission\":\"/profile/upload/2025/03/18/五组翟帅_20250318161643A001.docx\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-18 16:18:51', 101149);
INSERT INTO `sys_oper_log` VALUES (231, '提交作业', 1, 'com.ruoyi.stuhom.controller.StuHomController.add()', 'POST', 1, 'admin', '项目一部', '/stuhom/stuhom', '127.0.0.1', '内网IP', '{\"id\":4,\"params\":{},\"studentId\":101,\"submission\":\"/profile/upload/2025/03/18/五组翟帅_20250318161643A001.docx\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-18 16:19:05', 20);
INSERT INTO `sys_oper_log` VALUES (232, '提交作业', 1, 'com.ruoyi.stuhom.controller.StuHomController.add()', 'POST', 1, 'admin', '项目一部', '/stuhom/stuhom', '127.0.0.1', '内网IP', '{\"params\":{},\"submission\":\"/profile/upload/2025/03/19/实验一创建线程_学号_姓名_班级_ 操作系统_20250319110522A001.docx\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'student_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\ROG\\Desktop\\gu-sian-master\\gu-sian-master\\stuhom\\target\\classes\\mapper\\stuhom\\stuhomMapper.xml]\r\n### The error may involve com.ruoyi.stuhom.mapper.StuHomMapper.insertstuhom-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into student_homework          ( submission )           values ( ? )\r\n### Cause: java.sql.SQLException: Field \'student_id\' doesn\'t have a default value\n; Field \'student_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'student_id\' doesn\'t have a default value', '2025-03-19 11:05:29', 212);
INSERT INTO `sys_oper_log` VALUES (233, '提交作业', 1, 'com.ruoyi.stuhom.controller.StuHomController.add()', 'POST', 1, 'admin', '项目一部', '/stuhom/stuhom', '127.0.0.1', '内网IP', '{\"department\":\"103\",\"id\":5,\"params\":{},\"studentId\":1,\"submission\":\"/profile/upload/2025/03/19/五组翟帅_20250319111358A001.docx\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-19 11:14:02', 38);
INSERT INTO `sys_oper_log` VALUES (234, '提交作业', 1, 'com.ruoyi.stuhom.controller.StuHomController.add()', 'POST', 1, 'admin', '项目一部', '/stuhom/stuhom', '127.0.0.1', '内网IP', '{\"department\":\"103\",\"id\":6,\"params\":{},\"studentId\":1,\"submission\":\"/profile/upload/2025/03/19/user_template_1741759467993(1)_20250319111437A002.xlsx\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-19 11:14:38', 8);
INSERT INTO `sys_oper_log` VALUES (235, '提交作业', 3, 'com.ruoyi.stuhom.controller.StuHomController.remove()', 'DELETE', 1, 'admin', '项目一部', '/stuhom/stuhom/5', '127.0.0.1', '内网IP', '[5]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-19 11:16:04', 6);
INSERT INTO `sys_oper_log` VALUES (236, '提交作业', 3, 'com.ruoyi.stuhom.controller.StuHomController.remove()', 'DELETE', 1, 'admin', '项目一部', '/stuhom/stuhom/6', '127.0.0.1', '内网IP', '[6]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-19 11:16:10', 4);
INSERT INTO `sys_oper_log` VALUES (237, '提交作业', 1, 'com.ruoyi.stuhom.controller.StuHomController.add()', 'POST', 1, 'admin', '项目一部', '/stuhom/stuhom', '127.0.0.1', '内网IP', '{\"department\":\"103\",\"id\":7,\"params\":{},\"studentId\":1,\"submission\":\"/profile/upload/2025/03/19/五组翟帅_20250319111720A003.docx\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-19 11:17:21', 9);
INSERT INTO `sys_oper_log` VALUES (238, '提交作业', 1, 'com.ruoyi.stuhom.controller.StuHomController.add()', 'POST', 1, 'admin', '项目一部', '/stuhom/stuhom', '127.0.0.1', '内网IP', '{\"department\":\"103\",\"id\":8,\"params\":{},\"studentId\":1,\"submission\":\"/profile/upload/2025/03/19/五组翟帅_20250319111813A004.docx\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-19 11:18:15', 8);
INSERT INTO `sys_oper_log` VALUES (239, '行事历', 3, 'com.ruoyi.web.controller.activity.SysEventController.remove()', 'DELETE', 1, 'admin', '项目一部', '/activity/event/20', '127.0.0.1', '内网IP', '[20]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-31 11:19:23', 102);
INSERT INTO `sys_oper_log` VALUES (240, '行事历', 3, 'com.ruoyi.web.controller.activity.SysEventController.remove()', 'DELETE', 1, 'admin', '项目一部', '/activity/event/11', '127.0.0.1', '内网IP', '[11]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-31 11:19:23', 13);
INSERT INTO `sys_oper_log` VALUES (241, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"activity/calendar/index\",\"createTime\":\"2025-03-14 18:35:27\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2041,\"menuName\":\"行事历\",\"menuType\":\"C\",\"orderNum\":9,\"params\":{},\"parentId\":0,\"path\":\"calendar\",\"perms\":\"activity:event:listCalendar\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-31 11:19:43', 77);
INSERT INTO `sys_oper_log` VALUES (242, '请假管理', 2, 'com.ruoyi.web.controller.leave.SysLeaveController.edit()', 'PUT', 1, 'admin', '项目一部', '/leave/details', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where leave_id = null\' at line 3\r\n### The error may exist in file [G:\\code\\git\\gu-sian\\ruoyi-leave\\target\\classes\\mapper\\leave\\SysLeaveMapper.xml]\r\n### The error may involve com.ruoyi.leave.mapper.SysLeaveMapper.updateSysLeave-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_leave                    where leave_id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where leave_id = null\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where leave_id = null\' at line 3', '2025-03-31 11:20:30', 59);
INSERT INTO `sys_oper_log` VALUES (243, '请假管理', 2, 'com.ruoyi.web.controller.leave.SysLeaveController.edit()', 'PUT', 1, 'admin', '项目一部', '/leave/details', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.leave.mapper.SysLeaveMapper.updateSysLeave', '2025-03-31 11:23:21', 12);
INSERT INTO `sys_oper_log` VALUES (244, '请假管理', 2, 'com.ruoyi.web.controller.leave.SysLeaveController.edit()', 'PUT', 1, 'admin', '项目一部', '/leave/details', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.leave.mapper.SysLeaveMapper.updateSysLeave', '2025-03-31 11:23:26', 0);
INSERT INTO `sys_oper_log` VALUES (245, '请假管理', 2, 'com.ruoyi.web.controller.leave.SysLeaveController.edit()', 'PUT', 1, 'admin', '项目一部', '/leave/details', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where leave_id = null\' at line 3\r\n### The error may exist in file [G:\\code\\git\\gu-sian\\ruoyi-leave\\target\\classes\\mapper\\leave\\SysLeaveMapper.xml]\r\n### The error may involve com.ruoyi.leave.mapper.SysLeaveMapper.updateSysLeave-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_leave                    where leave_id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where leave_id = null\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where leave_id = null\' at line 3', '2025-03-31 13:43:37', 175);
INSERT INTO `sys_oper_log` VALUES (246, '请假管理', 2, 'com.ruoyi.web.controller.leave.SysLeaveController.edit()', 'PUT', 1, 'admin', '项目一部', '/leave/details', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where leave_id = null\' at line 3\r\n### The error may exist in file [G:\\code\\git\\gu-sian\\ruoyi-leave\\target\\classes\\mapper\\leave\\SysLeaveMapper.xml]\r\n### The error may involve com.ruoyi.leave.mapper.SysLeaveMapper.updateSysLeave-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_leave                    where leave_id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where leave_id = null\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where leave_id = null\' at line 3', '2025-03-31 13:47:57', 8);
INSERT INTO `sys_oper_log` VALUES (247, '教室管理', 2, 'com.ruoyi.web.controller.leave.SysRoomController.edit()', 'PUT', 1, 'admin', '项目一部', '/leave/room', '127.0.0.1', '内网IP', '{\"arr\":[[{\"color\":\"height:90%;width:90%\",\"dept\":\"\",\"id\":0,\"name\":\"\",\"title\":\"0-0\",\"username\":\"\"},{\"color\":\"height:90%;width:90%\",\"dept\":\"\",\"id\":0,\"name\":\"\",\"title\":\"0-0\",\"username\":\"\"},{\"color\":\"height:90%;width:90%\",\"dept\":\"\",\"id\":0,\"name\":\"\",\"title\":\"0-0\",\"username\":\"\"},{\"color\":\"height:90%;width:90%\",\"dept\":\"二组\",\"id\":102,\"name\":\"1\",\"title\":\"0-0\",\"username\":\"李四\"},{\"color\":\"height:90%;width:90%\",\"dept\":\"\",\"id\":0,\"name\":\"\",\"title\":\"0-0\",\"username\":\"\"}],[{\"color\":\"height:90%;width:90%\",\"dept\":\"\",\"id\":0,\"name\":\"\",\"title\":\"0-0\",\"username\":\"\"},{\"color\":\"height:90%;width:90%\",\"dept\":\"\",\"id\":0,\"name\":\"\",\"title\":\"0-0\",\"username\":\"\"},{\"color\":\"height:90%;width:90%\",\"dept\":\"五组\",\"id\":121,\"name\":\"王清硕\",\"title\":\"0-0\",\"username\":\"2024251179\"},{\"color\":\"height:90%;width:90%\",\"dept\":\"\",\"id\":0,\"name\":\"\",\"title\":\"0-0\",\"username\":\"\"},{\"color\":\"height:90%;width:90%\",\"dept\":\"\",\"id\":0,\"name\":\"\",\"title\":\"0-0\",\"username\":\"\"}],[{\"color\":\"height:90%;width:90%\",\"dept\":\"\",\"id\":0,\"name\":\"\",\"title\":\"0-0\",\"username\":\"\"},{\"color\":\"height:90%;width:90%\",\"dept\":\"\",\"id\":0,\"name\":\"\",\"title\":\"0-0\",\"username\":\"\"},{\"color\":\"height:90%;width:90%\",\"dept\":\"\",\"id\":0,\"name\":\"\",\"title\":\"0-0\",\"username\":\"\"},{\"color\":\"height:90%;width:90%\",\"dept\":\"\",\"id\":0,\"name\":\"\",\"title\":\"0-0\",\"username\":\"\"},{\"color\":\"height:90%;width:90%\",\"dept\":\"\",\"id\":0,\"name\":\"\",\"title\":\"0-0\",\"username\":\"\"}],[{\"color\":\"height:90%;width:90%\",\"dept\":\"\",\"id\":0,\"name\":\"\",\"title\":\"0-0\",\"username\":\"\"},{\"color\":\"height:90%;width:90%\",\"dept\":\"\",\"id\":0,\"name\":\"\",\"title\":\"0-0\",\"username\":\"\"},{\"color\":\"height:90%;width:90%\",\"dept\":\"\",\"id\":0,\"name\":\"\",\"title\":\"0-0\",\"username\":\"\"},{\"color\":\"height:90%;width:90%\",\"dept\":\"\",\"id\":0,\"name\":\"\",\"title\":\"0-0\",\"username\":\"\"},{\"color\":\"height:90%;width:90%\",\"dept\":\"\",\"id\":0,\"name\":\"\",\"title\":\"0-0\",\"username\":\"\"}],[{\"color\":\"height:90%;width:90%\",\"dept\":\"\",\"id\":0,\"name\":\"\",\"title\":\"0-0\",\"username\":\"\"},{\"color\":\"height:90%;width:90%\",\"dept\":\"\",\"id\":0,\"name\":\"\",\"title\":\"0-0\",\"username\":\"\"},{\"color\":\"height:90%;wi', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-31 13:53:07', 85);
INSERT INTO `sys_oper_log` VALUES (248, '行事历', 3, 'com.ruoyi.web.controller.activity.SysEventController.remove()', 'DELETE', 1, 'admin', '项目一部', '/activity/event/14', '127.0.0.1', '内网IP', '[14]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-31 13:54:50', 18);
INSERT INTO `sys_oper_log` VALUES (249, '行事历', 3, 'com.ruoyi.web.controller.activity.SysEventController.remove()', 'DELETE', 1, 'admin', '项目一部', '/activity/event/15', '127.0.0.1', '内网IP', '[15]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-31 13:54:51', 13);
INSERT INTO `sys_oper_log` VALUES (250, '行事历', 3, 'com.ruoyi.web.controller.activity.SysEventController.remove()', 'DELETE', 1, 'admin', '项目一部', '/activity/event/16', '127.0.0.1', '内网IP', '[16]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-31 13:54:51', 11);
INSERT INTO `sys_oper_log` VALUES (251, '请假管理', 2, 'com.ruoyi.web.controller.leave.SysLeaveController.edit()', 'PUT', 1, 'admin', '项目一部', '/leave/details', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where leave_id = null\' at line 3\r\n### The error may exist in file [C:\\Users\\ROG\\Desktop\\shuangti\\gu-sian-master\\ruoyi-leave\\target\\classes\\mapper\\leave\\SysLeaveMapper.xml]\r\n### The error may involve com.ruoyi.leave.mapper.SysLeaveMapper.updateSysLeave-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_leave                    where leave_id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where leave_id = null\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where leave_id = null\' at line 3', '2025-03-31 17:36:04', 31);
INSERT INTO `sys_oper_log` VALUES (252, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '项目一部', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"resume\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-31 18:55:24', 89);
INSERT INTO `sys_oper_log` VALUES (253, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"Resume/Resume/index\",\"createTime\":\"2025-03-31 17:33:36\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2066,\"menuName\":\"简历管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":2058,\"path\":\"Resume\",\"perms\":\"Resume:Resume:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-31 18:57:24', 11);
INSERT INTO `sys_oper_log` VALUES (254, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/menu/2067', '127.0.0.1', '内网IP', '2067', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-31 18:58:59', 9);
INSERT INTO `sys_oper_log` VALUES (255, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/menu/2068', '127.0.0.1', '内网IP', '2068', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-31 18:59:01', 12);
INSERT INTO `sys_oper_log` VALUES (256, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/menu/2069', '127.0.0.1', '内网IP', '2069', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-31 18:59:03', 18);
INSERT INTO `sys_oper_log` VALUES (257, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/menu/2070', '127.0.0.1', '内网IP', '2070', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-31 18:59:05', 10);
INSERT INTO `sys_oper_log` VALUES (258, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/menu/2071', '127.0.0.1', '内网IP', '2071', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-31 18:59:07', 16);
INSERT INTO `sys_oper_log` VALUES (259, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/menu/2066', '127.0.0.1', '内网IP', '2066', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-31 18:59:09', 24);
INSERT INTO `sys_oper_log` VALUES (260, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '项目一部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"excel\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"简历管理\",\"menuType\":\"M\",\"orderNum\":15,\"params\":{},\"parentId\":0,\"path\":\"Resume\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-31 18:59:45', 9);
INSERT INTO `sys_oper_log` VALUES (261, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '项目一部', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"Resume\",\"className\":\"Resume\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"简历id\",\"columnId\":54,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-31 18:55:24\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"StuId\",\"columnComment\":\"学生id\",\"columnId\":55,\"columnName\":\"stu_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-31 18:55:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"stuId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Notes\",\"columnComment\":\"简历\",\"columnId\":56,\"columnName\":\"notes\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-31 18:55:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"notes\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Remark\",\"columnComment\":\"备注\",\"columnId\":57,\"columnName\":\"remark\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-31 18:55:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"remark\",\"javaType\":\"String\",\"list\":true,\"params\":{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-31 19:01:05', 22);
INSERT INTO `sys_oper_log` VALUES (262, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', '项目一部', '/system/user/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-03-31 19:02:54', 471);
INSERT INTO `sys_oper_log` VALUES (263, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '项目一部', '/tool/gen/synchDb/sys_user', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-31 19:04:43', 32);
INSERT INTO `sys_oper_log` VALUES (264, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '项目一部', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2031,2019,2044,2032,2020,2051,2052,2053,2054,2055,2056],\"params\":{},\"roleId\":102,\"roleKey\":\"groupLeader\",\"roleName\":\"学生组长\",\"roleSort\":102,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-31 19:48:09', 20);
INSERT INTO `sys_oper_log` VALUES (265, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-03-31 19:48:09\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2031,2019,2044,2032,2020,2051,2052,2053,2054,2055,2056],\"params\":{},\"roleId\":102,\"roleKey\":\"groupLeader\",\"roleName\":\"学生组长\",\"roleSort\":5,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-31 19:48:23', 10);
INSERT INTO `sys_oper_log` VALUES (266, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-03-31 19:48:09\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2031,2019,2044,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4,2032,2020,2051,2052,2053,2054,2055,2056],\"params\":{},\"roleId\":102,\"roleKey\":\"groupLeader\",\"roleName\":\"学生组长\",\"roleSort\":5,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-31 19:48:47', 13);
INSERT INTO `sys_oper_log` VALUES (267, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-03-10 19:06:45\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4],\"params\":{},\"roleId\":101,\"roleKey\":\"stuman\",\"roleName\":\"学生主管\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-31 19:49:04', 14);
INSERT INTO `sys_oper_log` VALUES (268, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-03-10 19:06:45\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2044,2072,2073,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4,2051,2052,2053,2054,2055,2056,2074],\"params\":{},\"roleId\":101,\"roleKey\":\"stuman\",\"roleName\":\"学生主管\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-31 19:50:30', 11);
INSERT INTO `sys_oper_log` VALUES (269, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', '项目一部', '/system/user/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-03-31 19:51:33', 48);
INSERT INTO `sys_oper_log` VALUES (270, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', '项目一部', '/system/user/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"0\"}', NULL, 1, '很抱歉，导入失败！共 41 条数据格式不正确，错误如下：<br/>1、账号 user1​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>2、账号 user2​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>3、账号 user3​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>4、账号 user4​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>5、账号 user5​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>6、账号 user6​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>7、账号 user7​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>8、账号 user8​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>9、账号 user9​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>10、账号 user10​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>11、账号 testuser11​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>12、账号 testuser12​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>13、账号 testuser13​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>14、账号 testuser14​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>15、账号 testuser15​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>16、账号 login16​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>17、账号 login17​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>18、账号 login18​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>19、账号 login19​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>20、账号 login20​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>21、账号 account21​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>22、账号 account22​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>23、账号 account23​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>24、账号 account24​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>25、账号 account25​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>26、账号 abcuser26​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>27、账号 abcuser27​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>28、账号 abcuser28​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>29、账号 abcuser29​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>30、账号 abcuser30​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>31、账号 xyzlogin31​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>32、账号 xyzlogin32​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>33、账号 xyzlogin33​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>34、账号 xyzlogin34​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>35、账号 xyzlogin35​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>36、账号 numuser36​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>37、账号 numuser37​ 导入失败：phonenumber: ', '2025-03-31 19:51:39', 250);
INSERT INTO `sys_oper_log` VALUES (271, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', '项目一部', '/system/user/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"0\"}', NULL, 1, '很抱歉，导入失败！共 38 条数据格式不正确，错误如下：<br/>1、账号 user2​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>2、账号 user3​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>3、账号 user4​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>4、账号 user5​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>5、账号 user6​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>6、账号 user7​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>7、账号 user8​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>8、账号 user9​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>9、账号 user10​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>10、账号 testuser11​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>11、账号 testuser12​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>12、账号 testuser13​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>13、账号 testuser14​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>14、账号 testuser15​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>15、账号 login16​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>16、账号 login17​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>17、账号 login18​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>18、账号 login19​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>19、账号 login20​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>20、账号 account21​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>21、账号 account22​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>22、账号 account23​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>23、账号 account24​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>24、账号 account25​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>25、账号 abcuser26​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>26、账号 abcuser27​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>27、账号 abcuser28​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>28、账号 abcuser29​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>29、账号 abcuser30​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>30、账号 xyzlogin31​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>31、账号 xyzlogin32​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>32、账号 xyzlogin33​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>33、账号 xyzlogin34​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>34、账号 xyzlogin35​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>35、账号 numuser36​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>36、账号 numuser37​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>37、账号 numuser38​ 导入失败：phonenumb', '2025-03-31 20:00:05', 147);
INSERT INTO `sys_oper_log` VALUES (272, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', '项目一部', '/system/user/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"0\"}', NULL, 1, '很抱歉，导入失败！共 39 条数据格式不正确，错误如下：<br/>1、账号 user1​ 已存在<br/>2、账号 user2​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>3、账号 user3​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>4、账号 user4​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>5、账号 user5​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>6、账号 user6​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>7、账号 user7​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>8、账号 user8​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>9、账号 user9​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>10、账号 user10​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>11、账号 testuser11​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>12、账号 testuser12​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>13、账号 testuser13​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>14、账号 testuser14​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>15、账号 testuser15​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>16、账号 login16​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>17、账号 login17​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>18、账号 login18​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>19、账号 login19​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>20、账号 login20​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>21、账号 account21​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>22、账号 account22​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>23、账号 account23​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>24、账号 account24​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>25、账号 account25​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>26、账号 abcuser26​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>27、账号 abcuser27​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>28、账号 abcuser28​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>29、账号 abcuser29​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>30、账号 abcuser30​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>31、账号 xyzlogin31​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>32、账号 xyzlogin32​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>33、账号 xyzlogin33​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>34、账号 xyzlogin34​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>35、账号 xyzlogin35​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>36、账号 numuser36​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>37、账号 numuser37​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>38、账号 numu', '2025-03-31 20:00:37', 91);
INSERT INTO `sys_oper_log` VALUES (273, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', '项目一部', '/system/user/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"0\"}', NULL, 1, '很抱歉，导入失败！共 32 条数据格式不正确，错误如下：<br/>1、账号 user1​ 已存在<br/>2、账号 user9​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>3、账号 user10​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>4、账号 testuser11​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>5、账号 testuser12​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>6、账号 testuser13​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>7、账号 testuser14​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>8、账号 testuser15​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>9、账号 login16​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>10、账号 login17​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>11、账号 login18​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>12、账号 login19​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>13、账号 login20​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>14、账号 account21​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>15、账号 account22​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>16、账号 account23​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>17、账号 account24​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>18、账号 account25​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>19、账号 abcuser26​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>20、账号 abcuser27​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>21、账号 abcuser28​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>22、账号 abcuser29​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>23、账号 abcuser30​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>24、账号 xyzlogin31​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>25、账号 xyzlogin32​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>26、账号 xyzlogin33​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>27、账号 xyzlogin34​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>28、账号 xyzlogin35​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>29、账号 numuser36​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>30、账号 numuser37​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>31、账号 numuser38​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>32、账号 numuser39​ 导入失败：phonenumber: 手机号码长度不能超过11个字符', '2025-03-31 20:01:22', 530);
INSERT INTO `sys_oper_log` VALUES (274, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', '项目一部', '/system/user/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"0\"}', NULL, 1, '很抱歉，导入失败！共 29 条数据格式不正确，错误如下：<br/>1、账号 user1​ 已存在<br/>2、账号 user2​ 已存在<br/>3、账号 user3​ 已存在<br/>4、账号 user4​ 已存在<br/>5、账号 user5​ 已存在<br/>6、账号 user6​ 已存在<br/>7、账号 user7​ 已存在<br/>8、账号 user8​ 已存在<br/>9、账号 login19​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>10、账号 login20​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>11、账号 account21​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>12、账号 account22​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>13、账号 account23​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>14、账号 account24​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>15、账号 account25​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>16、账号 abcuser26​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>17、账号 abcuser27​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>18、账号 abcuser28​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>19、账号 abcuser29​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>20、账号 abcuser30​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>21、账号 xyzlogin31​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>22、账号 xyzlogin32​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>23、账号 xyzlogin33​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>24、账号 xyzlogin34​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>25、账号 xyzlogin35​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>26、账号 numuser36​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>27、账号 numuser37​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>28、账号 numuser38​ 导入失败：phonenumber: 手机号码长度不能超过11个字符<br/>29、账号 numuser39​ 导入失败：phonenumber: 手机号码长度不能超过11个字符', '2025-03-31 20:05:00', 709);
INSERT INTO `sys_oper_log` VALUES (275, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', '项目一部', '/system/user/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"0\"}', NULL, 1, '很抱歉，导入失败！共 18 条数据格式不正确，错误如下：<br/>1、账号 user1​ 已存在<br/>2、账号 user2​ 已存在<br/>3、账号 user3​ 已存在<br/>4、账号 user4​ 已存在<br/>5、账号 user5​ 已存在<br/>6、账号 user6​ 已存在<br/>7、账号 user7​ 已存在<br/>8、账号 user8​ 已存在<br/>9、账号 user9​ 已存在<br/>10、账号 user10​ 已存在<br/>11、账号 testuser11​ 已存在<br/>12、账号 testuser12​ 已存在<br/>13、账号 testuser13​ 已存在<br/>14、账号 testuser14​ 已存在<br/>15、账号 testuser15​ 已存在<br/>16、账号 login16​ 已存在<br/>17、账号 login17​ 已存在<br/>18、账号 login18​ 已存在', '2025-03-31 20:06:54', 1486);
INSERT INTO `sys_oper_log` VALUES (276, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"北京市海淀区中关村大街 18 号数字广场 A 座 1201 室​\",\"createBy\":\"admin\",\"createTime\":\"2025-03-31 20:00:05\",\"delFlag\":\"0\",\"deptId\":104,\"email\":\"1801253796@qq.com\",\"loginIp\":\"\",\"nickName\":\"王老吉\",\"params\":{},\"phonenumber\":\"13153172427\",\"postIds\":[5],\"roleIds\":[],\"roles\":[],\"semester\":\"8\",\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":122,\"userName\":\"user1​\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-31 20:08:58', 16);
INSERT INTO `sys_oper_log` VALUES (277, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', '项目一部', '/system/user/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"0\"}', NULL, 1, '很抱歉，导入失败！共 39 条数据格式不正确，错误如下：<br/>1、账号 user1​ 已存在<br/>2、账号 user2​ 已存在<br/>3、账号 user3​ 已存在<br/>4、账号 user4​ 已存在<br/>5、账号 user5​ 已存在<br/>6、账号 user6​ 已存在<br/>7、账号 user7​ 已存在<br/>8、账号 user8​ 已存在<br/>9、账号 user9​ 已存在<br/>10、账号 user10​ 已存在<br/>11、账号 testuser11​ 已存在<br/>12、账号 testuser12​ 已存在<br/>13、账号 testuser13​ 已存在<br/>14、账号 testuser14​ 已存在<br/>15、账号 testuser15​ 已存在<br/>16、账号 login16​ 已存在<br/>17、账号 login17​ 已存在<br/>18、账号 login18​ 已存在<br/>19、账号 login19​ 已存在<br/>20、账号 login20​ 已存在<br/>21、账号 account21​ 已存在<br/>22、账号 account22​ 已存在<br/>23、账号 account23​ 已存在<br/>24、账号 account24​ 已存在<br/>25、账号 account25​ 已存在<br/>26、账号 abcuser26​ 已存在<br/>27、账号 abcuser27​ 已存在<br/>28、账号 abcuser28​ 已存在<br/>29、账号 abcuser29​ 已存在<br/>30、账号 abcuser30​ 已存在<br/>31、账号 xyzlogin31​ 已存在<br/>32、账号 xyzlogin32​ 已存在<br/>33、账号 xyzlogin33​ 已存在<br/>34、账号 xyzlogin34​ 已存在<br/>35、账号 xyzlogin35​ 已存在<br/>36、账号 numuser36​ 已存在<br/>37、账号 numuser37​ 已存在<br/>38、账号 numuser38​ 已存在<br/>39、账号 numuser39​ 已存在', '2025-03-31 20:25:28', 64);
INSERT INTO `sys_oper_log` VALUES (278, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', '项目一部', '/system/user/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"true\"}', '{\"msg\":\"恭喜您，数据已全部导入成功！共 39 条，数据如下：<br/>1、账号 user1​ 更新成功<br/>2、账号 user2​ 更新成功<br/>3、账号 user3​ 更新成功<br/>4、账号 user4​ 更新成功<br/>5、账号 user5​ 更新成功<br/>6、账号 user6​ 更新成功<br/>7、账号 user7​ 更新成功<br/>8、账号 user8​ 更新成功<br/>9、账号 user9​ 更新成功<br/>10、账号 user10​ 更新成功<br/>11、账号 testuser11​ 更新成功<br/>12、账号 testuser12​ 更新成功<br/>13、账号 testuser13​ 更新成功<br/>14、账号 testuser14​ 更新成功<br/>15、账号 testuser15​ 更新成功<br/>16、账号 login16​ 更新成功<br/>17、账号 login17​ 更新成功<br/>18、账号 login18​ 更新成功<br/>19、账号 login19​ 更新成功<br/>20、账号 login20​ 更新成功<br/>21、账号 account21​ 更新成功<br/>22、账号 account22​ 更新成功<br/>23、账号 account23​ 更新成功<br/>24、账号 account24​ 更新成功<br/>25、账号 account25​ 更新成功<br/>26、账号 abcuser26​ 更新成功<br/>27、账号 abcuser27​ 更新成功<br/>28、账号 abcuser28​ 更新成功<br/>29、账号 abcuser29​ 更新成功<br/>30、账号 abcuser30​ 更新成功<br/>31、账号 xyzlogin31​ 更新成功<br/>32、账号 xyzlogin32​ 更新成功<br/>33、账号 xyzlogin33​ 更新成功<br/>34、账号 xyzlogin34​ 更新成功<br/>35、账号 xyzlogin35​ 更新成功<br/>36、账号 numuser36​ 更新成功<br/>37、账号 numuser37​ 更新成功<br/>38、账号 numuser38​ 更新成功<br/>39、账号 numuser39​ 更新成功\",\"code\":200}', 0, NULL, '2025-03-31 20:25:49', 189);
INSERT INTO `sys_oper_log` VALUES (279, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', '项目一部', '/system/user/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"true\"}', '{\"msg\":\"恭喜您，数据已全部导入成功！共 39 条，数据如下：<br/>1、账号 user1​ 更新成功<br/>2、账号 user2​ 更新成功<br/>3、账号 user3​ 更新成功<br/>4、账号 user4​ 更新成功<br/>5、账号 user5​ 更新成功<br/>6、账号 user6​ 更新成功<br/>7、账号 user7​ 更新成功<br/>8、账号 user8​ 更新成功<br/>9、账号 user9​ 更新成功<br/>10、账号 user10​ 更新成功<br/>11、账号 testuser11​ 更新成功<br/>12、账号 testuser12​ 更新成功<br/>13、账号 testuser13​ 更新成功<br/>14、账号 testuser14​ 更新成功<br/>15、账号 testuser15​ 更新成功<br/>16、账号 login16​ 更新成功<br/>17、账号 login17​ 更新成功<br/>18、账号 login18​ 更新成功<br/>19、账号 login19​ 更新成功<br/>20、账号 login20​ 更新成功<br/>21、账号 account21​ 更新成功<br/>22、账号 account22​ 更新成功<br/>23、账号 account23​ 更新成功<br/>24、账号 account24​ 更新成功<br/>25、账号 account25​ 更新成功<br/>26、账号 abcuser26​ 更新成功<br/>27、账号 abcuser27​ 更新成功<br/>28、账号 abcuser28​ 更新成功<br/>29、账号 abcuser29​ 更新成功<br/>30、账号 abcuser30​ 更新成功<br/>31、账号 xyzlogin31​ 更新成功<br/>32、账号 xyzlogin32​ 更新成功<br/>33、账号 xyzlogin33​ 更新成功<br/>34、账号 xyzlogin34​ 更新成功<br/>35、账号 xyzlogin35​ 更新成功<br/>36、账号 numuser36​ 更新成功<br/>37、账号 numuser37​ 更新成功<br/>38、账号 numuser38​ 更新成功<br/>39、账号 numuser39​ 更新成功\",\"code\":200}', 0, NULL, '2025-03-31 20:27:05', 130);
INSERT INTO `sys_oper_log` VALUES (280, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"天津市和平区南京路 20 号世纪都会公寓 3 栋 1502​\",\"createBy\":\"admin\",\"createTime\":\"2025-03-31 20:01:22\",\"delFlag\":\"0\",\"deptId\":106,\"email\":\"1801253797@qq.com\",\"loginIp\":\"\",\"nickName\":\"加多宝\",\"params\":{},\"phonenumber\":\"13867230581\",\"postIds\":[5],\"remark\":\"\",\"roleIds\":[100],\"roles\":[],\"semester\":\"8\",\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":123,\"userName\":\"user2​\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-31 20:27:30', 7);
INSERT INTO `sys_oper_log` VALUES (281, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"石家庄市长安区中山东路 567 号荣盛华府 7 号楼 3 单元 201​\",\"createBy\":\"admin\",\"createTime\":\"2025-03-31 20:01:22\",\"delFlag\":\"0\",\"deptId\":200,\"email\":\"1801253798@qq.com\",\"loginIp\":\"\",\"nickName\":\"和其正\",\"params\":{},\"phonenumber\":\"13145128374\",\"postIds\":[4],\"remark\":\"\",\"roleIds\":[2],\"roles\":[],\"semester\":\"8\",\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":124,\"userName\":\"user3​\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-01 11:21:09', 38);
INSERT INTO `sys_oper_log` VALUES (282, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"太原市杏花岭区府西街 9 号王府商务大厦 18 层 1803​\",\"createBy\":\"admin\",\"createTime\":\"2025-03-31 20:01:22\",\"delFlag\":\"0\",\"deptId\":201,\"email\":\"1801253799@qq.com\",\"loginIp\":\"\",\"nickName\":\"大麦茶\",\"params\":{},\"phonenumber\":\"13956372810\",\"postIds\":[],\"remark\":\"\",\"roleIds\":[],\"roles\":[],\"semester\":\"8\",\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":125,\"userName\":\"user4​\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-01 11:21:41', 10);
INSERT INTO `sys_oper_log` VALUES (283, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"呼和浩特市赛罕区新华东街 12 号奈伦国际 B 座 1006​\",\"createBy\":\"admin\",\"createTime\":\"2025-03-31 20:01:22\",\"delFlag\":\"0\",\"deptId\":205,\"email\":\"1801253800@qq.com\",\"loginIp\":\"\",\"nickName\":\"不死牛马A\",\"params\":{},\"phonenumber\":\"13372981456\",\"postIds\":[4],\"remark\":\"\",\"roleIds\":[2],\"roles\":[],\"semester\":\"8\",\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":126,\"userName\":\"user5​\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-01 11:21:56', 12);
INSERT INTO `sys_oper_log` VALUES (284, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"沈阳市沈河区青年大街 1 号市府恒隆广场 3 号楼 2205​\",\"createBy\":\"admin\",\"createTime\":\"2025-03-31 20:01:22\",\"delFlag\":\"0\",\"deptId\":203,\"email\":\"1801253801@qq.com\",\"loginIp\":\"\",\"nickName\":\"限定版牛马\",\"params\":{},\"phonenumber\":\"13076283915\",\"postIds\":[4],\"remark\":\"\",\"roleIds\":[2],\"roles\":[],\"semester\":\"8\",\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":127,\"userName\":\"user6​\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-01 11:22:08', 22);
INSERT INTO `sys_oper_log` VALUES (285, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"大连市中山区友好广场 8 号新世界大厦 16 层 1608​\",\"createBy\":\"admin\",\"createTime\":\"2025-03-31 20:01:22\",\"delFlag\":\"0\",\"deptId\":204,\"email\":\"1801253802@qq.com\",\"loginIp\":\"\",\"nickName\":\"普通牛马\",\"params\":{},\"phonenumber\":\"13650917823\",\"postIds\":[4],\"remark\":\"\",\"roleIds\":[2],\"roles\":[],\"semester\":\"8\",\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":128,\"userName\":\"user7​\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-01 11:22:27', 11);
INSERT INTO `sys_oper_log` VALUES (286, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"长春市南关区人民大街 99 号伟峰国际 19 层 1902​\",\"createBy\":\"admin\",\"createTime\":\"2025-03-31 20:01:22\",\"delFlag\":\"0\",\"deptId\":204,\"email\":\"1801253803@qq.com\",\"loginIp\":\"\",\"nickName\":\"半人马类人生物\",\"params\":{},\"phonenumber\":\"13287469052\",\"postIds\":[4],\"remark\":\"\",\"roleIds\":[2],\"roles\":[],\"semester\":\"8\",\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":129,\"userName\":\"user8​\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-01 11:22:53', 27);
INSERT INTO `sys_oper_log` VALUES (287, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-03-10 17:54:47\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4,2044,2045,2046,2047,2048,2049,2050,2051,2052,2053,2054,2055,2056,2072,2073,2074,2075,2076,2077,2078],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-01 11:23:35', 21);
INSERT INTO `sys_oper_log` VALUES (288, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-03-10 19:00:48\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4,2031,2032,2033,2034,2035,2036,2019,2020,2021,2022,2023,2024,2037,2039,2040,2000,2007,2013,2014,2015,2016,2017,2018,2041,2042,2060,2061,2062,2063,2064,2044,2045,2046,2047,2048,2049,2050,2051,2052,2053,2054,2055,2056,2072,2073,2074,2075,2076,2077,2078],\"params\":{},\"roleId\":100,\"roleKey\":\"terman\",\"roleName\":\"老师管理\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-01 11:23:44', 13);
INSERT INTO `sys_oper_log` VALUES (289, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-03-31 19:48:09\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2031,2019,2044,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4,2032,2020,2051,2052,2053,2054,2055,2056],\"params\":{},\"roleId\":102,\"roleKey\":\"groupLeader\",\"roleName\":\"学生组长\",\"roleSort\":5,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-01 11:23:54', 12);
INSERT INTO `sys_oper_log` VALUES (290, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-03-10 17:54:47\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4,2031,2032,2033,2034,2035,2036,2019,2020,2021,2022,2023,2024,2037,2039,2040,2000,2007,2013,2014,2015,2016,2017,2018,2041,2042,2060,2061,2062,2063,2064,2044,2045,2046,2047,2048,2049,2050,2051,2052,2053,2054,2055,2056,2072,2073,2074,2075,2076,2077,2078,2065],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-01 11:30:47', 34);
INSERT INTO `sys_oper_log` VALUES (291, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-03-31 19:48:09\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4,2031,2032,2033,2034,2035,2036,2019,2020,2021,2022,2023,2024,2037,2039,2040,2000,2007,2013,2014,2015,2016,2017,2018,2041,2042,2060,2061,2062,2063,2064,2044,2045,2046,2047,2048,2049,2050,2051,2052,2053,2054,2055,2056,2072,2073,2074,2075,2076,2077,2078,2065],\"params\":{},\"roleId\":102,\"roleKey\":\"groupLeader\",\"roleName\":\"学生组长\",\"roleSort\":5,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-01 11:30:57', 13);
INSERT INTO `sys_oper_log` VALUES (292, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-03-10 19:06:45\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4,2031,2032,2033,2034,2035,2036,2019,2020,2021,2022,2023,2024,2037,2039,2040,2000,2007,2013,2014,2015,2016,2017,2018,2041,2042,2060,2061,2062,2063,2064,2044,2045,2046,2047,2048,2049,2050,2051,2052,2053,2054,2055,2056,2072,2073,2074,2075,2076,2077,2078,2065],\"params\":{},\"roleId\":101,\"roleKey\":\"stuman\",\"roleName\":\"学生主管\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-01 11:31:01', 13);
INSERT INTO `sys_oper_log` VALUES (293, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'admin', '项目一部', '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-03-10 17:54:47\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[100,101,103,104,105,106,200,201,202,203,204,205,206],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-01 11:36:31', 16);
INSERT INTO `sys_oper_log` VALUES (294, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'admin', '项目一部', '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-03-10 19:00:48\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"roleId\":100,\"roleKey\":\"terman\",\"roleName\":\"老师管理\",\"roleSort\":3,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-01 11:36:38', 11);
INSERT INTO `sys_oper_log` VALUES (295, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'admin', '项目一部', '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-03-31 19:48:09\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"roleId\":102,\"roleKey\":\"groupLeader\",\"roleName\":\"学生组长\",\"roleSort\":5,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-01 11:36:46', 14);
INSERT INTO `sys_oper_log` VALUES (296, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'admin', '项目一部', '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-03-10 17:54:47\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-01 11:36:55', 12);
INSERT INTO `sys_oper_log` VALUES (297, '简历管理', 1, 'com.ruoyi.Resume.controller.ResumeController.add()', 'POST', 1, 'user3​', '一组', '/Resume/Resume', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-04-01 11:40:22\",\"deptId\":106,\"id\":10,\"notes\":\"/profile/upload/2025/04/01/翟帅 _20250401114017A001.pdf\",\"params\":{},\"remark\":\"123\",\"resumeSummary\":\"0\",\"stuDeptId\":200,\"stuId\":124}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-01 11:40:22', 12);
INSERT INTO `sys_oper_log` VALUES (298, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', '项目一部', '/system/user/authRole', '127.0.0.1', '内网IP', '{\"roleIds\":\"2\",\"userId\":\"125\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-01 14:13:29', 5);
INSERT INTO `sys_oper_log` VALUES (299, '简历管理', 1, 'com.ruoyi.Resume.controller.ResumeController.add()', 'POST', 1, 'user4​', '二组', '/Resume/Resume', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-04-01 14:14:59\",\"deptId\":106,\"id\":11,\"notes\":\"/profile/upload/2025/04/01/翟帅 _20250401141456A002.pdf\",\"params\":{},\"remark\":\"123\",\"resumeSummary\":\"0\",\"stuDeptId\":201,\"stuId\":125}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-01 14:14:59', 5);
INSERT INTO `sys_oper_log` VALUES (300, '提交作业', 5, 'com.ruoyi.stuhom.controller.StuHomController.export()', 'POST', 1, 'admin', '项目一部', '/stuhom/stuhom/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"department\":\"103\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-04-01 15:23:04', 24);
INSERT INTO `sys_oper_log` VALUES (301, '简历管理', 5, 'com.ruoyi.Resume.controller.ResumeController.exportStuRes()', 'POST', 1, 'user2​', '项目四部', '/Resume/Resume/exportStuRes', '127.0.0.1', '内网IP', '{\"qufen\":\"0\",\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-04-01 16:18:53', 46);
INSERT INTO `sys_oper_log` VALUES (302, '简历管理', 5, 'com.ruoyi.Resume.controller.ResumeController.exportStuRes()', 'POST', 1, 'user2​', '项目四部', '/Resume/Resume/exportStuRes', '127.0.0.1', '内网IP', '{\"qufen\":\"0\",\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-04-01 16:19:00', 27);
INSERT INTO `sys_oper_log` VALUES (303, '简历管理', 5, 'com.ruoyi.Resume.controller.ResumeController.exportStuRes()', 'POST', 1, 'user2​', '项目四部', '/Resume/Resume/exportStuRes', '127.0.0.1', '内网IP', '{\"qufen\":\"0\",\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-04-01 16:19:23', 21);
INSERT INTO `sys_oper_log` VALUES (304, '简历管理', 5, 'com.ruoyi.Resume.controller.ResumeController.exportStuRes()', 'POST', 1, 'user2​', '项目四部', '/Resume/Resume/exportStuRes', '127.0.0.1', '内网IP', '{\"qufen\":\"0\",\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-04-01 16:19:53', 17);
INSERT INTO `sys_oper_log` VALUES (305, '简历管理', 5, 'com.ruoyi.Resume.controller.ResumeController.exportStuRes()', 'POST', 1, 'user2​', '项目四部', '/Resume/Resume/exportStuRes', '127.0.0.1', '内网IP', '{\"qufen\":\"0\",\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-04-01 16:19:56', 20);
INSERT INTO `sys_oper_log` VALUES (306, '简历管理', 5, 'com.ruoyi.Resume.controller.ResumeController.exportStuRes()', 'POST', 1, 'user2​', '项目四部', '/Resume/Resume/exportStuRes', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 0, NULL, '2025-04-01 16:25:50', 21731);
INSERT INTO `sys_oper_log` VALUES (307, '简历管理', 5, 'com.ruoyi.Resume.controller.ResumeController.exportStuRes()', 'POST', 1, 'user2​', '项目四部', '/Resume/Resume/exportStuRes', '127.0.0.1', '内网IP', '{\"qufen\":\"0\",\"pageSize\":\"10\",\"id\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-04-01 16:28:15', 28);
INSERT INTO `sys_oper_log` VALUES (308, '简历管理', 5, 'com.ruoyi.Resume.controller.ResumeController.exportStuRes()', 'POST', 1, 'user2​', '项目四部', '/Resume/Resume/exportStuRes', '127.0.0.1', '内网IP', '{\"qufen\":\"0\",\"pageSize\":\"10\",\"id\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-04-01 16:29:22', 24);
INSERT INTO `sys_oper_log` VALUES (309, '简历管理', 5, 'com.ruoyi.Resume.controller.ResumeController.exportStuRes()', 'POST', 1, 'user2​', '项目四部', '/Resume/Resume/exportStuRes', '127.0.0.1', '内网IP', '{\"qufen\":\"0\",\"pageSize\":\"10\",\"id\":\"11\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-04-01 16:32:05', 15583);
INSERT INTO `sys_oper_log` VALUES (310, '简历管理', 5, 'com.ruoyi.Resume.controller.ResumeController.exportStuRes()', 'POST', 1, 'user2​', '项目四部', '/Resume/Resume/exportStuRes', '127.0.0.1', '内网IP', '{\"qufen\":\"0\",\"pageSize\":\"10\",\"id\":\"11\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-04-01 16:32:26', 17);
INSERT INTO `sys_oper_log` VALUES (311, '发布作业', 1, 'com.ruoyi.homework.controller.HomeworkController.add()', 'POST', 1, 'user2​', '项目四部', '/homework/homework', '127.0.0.1', '内网IP', '{\"content\":\"/profile/upload/2025/04/01/清新唯美浪漫桃花樱花PPT模板(www.52ppt.com)_20250401192614A001.pptx\",\"createTime\":\"2025-04-01 19:26:18\",\"dueDate\":\"2025-04-01\",\"id\":6,\"params\":{},\"remark\":\"106\",\"teacherId\":123,\"title\":\"测试1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-01 19:26:18', 19);
INSERT INTO `sys_oper_log` VALUES (312, '提交作业', 1, 'com.ruoyi.stuhom.controller.StuHomController.add()', 'POST', 1, 'user3​', '一组', '/stuhom/stuhom', '127.0.0.1', '内网IP', '{\"department\":\"106\",\"homeworkId\":6,\"id\":9,\"params\":{},\"remark\":\"测试1\",\"studentId\":124,\"submission\":\"/profile/upload/2025/04/01/知识库_20250401192721A002.docx\",\"submissionTime\":\"2025-04-01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-01 19:27:27', 7);
INSERT INTO `sys_oper_log` VALUES (313, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'user2​', '项目四部', '/system/menu/2007', '127.0.0.1', '内网IP', '2007', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2025-04-02 15:40:00', 32);
INSERT INTO `sys_oper_log` VALUES (314, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'user2​', '项目四部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"onusers/onusers/index\",\"createTime\":\"2025-03-11 11:15:41\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"往期学员\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"onusers\",\"perms\":\"onusers:onusers:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"user2​\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-02 15:40:13', 17);
INSERT INTO `sys_oper_log` VALUES (315, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'user2​', '项目四部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-03-11 09:34:56\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"往期学员管理\",\"menuType\":\"M\",\"orderNum\":9,\"params\":{},\"parentId\":0,\"path\":\"onuser\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"user2​\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-02 15:40:20', 4);
INSERT INTO `sys_oper_log` VALUES (316, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'user2​', '项目四部', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-03-10 17:54:47\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4,2031,2032,2033,2034,2035,2036,2019,2020,2021,2022,2023,2024,2037,2039,2040,2013,2014,2015,2016,2017,2018,2041,2042,2060,2061,2062,2063,2064,2044,2045,2046,2047,2048,2049,2050,2051,2052,2053,2054,2055,2056,2072,2073,2074,2075,2076,2077,2078],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"user2​\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-02 15:42:23', 104);
INSERT INTO `sys_oper_log` VALUES (317, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'user2​', '项目四部', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-03-10 19:00:48\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4,2031,2032,2033,2034,2035,2036,2019,2020,2021,2022,2023,2024,2037,2039,2040,2013,2014,2015,2016,2017,2018,2041,2042,2060,2061,2062,2063,2064,2044,2045,2046,2047,2048,2049,2050,2051,2052,2053,2054,2055,2056,2072,2073,2074,2075,2076,2077,2078],\"params\":{},\"roleId\":100,\"roleKey\":\"terman\",\"roleName\":\"老师管理\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"user2​\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-02 15:42:31', 25);
INSERT INTO `sys_oper_log` VALUES (318, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'user2​', '项目四部', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-03-10 19:06:45\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4,2031,2032,2033,2034,2035,2036,2019,2020,2021,2022,2023,2024,2037,2039,2040,2000,2013,2014,2015,2016,2017,2018,2041,2042,2060,2061,2062,2063,2064,2044,2045,2046,2047,2048,2049,2050,2051,2052,2053,2054,2055,2056,2072,2073,2074,2075,2076,2077,2078],\"params\":{},\"roleId\":101,\"roleKey\":\"stuman\",\"roleName\":\"学生主管\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"user2​\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-02 15:42:41', 17);
INSERT INTO `sys_oper_log` VALUES (319, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/menu/2007', '127.0.0.1', '内网IP', '2007', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2025-04-02 15:44:33', 3);
INSERT INTO `sys_oper_log` VALUES (320, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-03-31 19:48:09\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4,2031,2032,2033,2034,2035,2036,2019,2020,2021,2022,2023,2024,2037,2039,2040,2013,2014,2015,2016,2017,2018,2041,2042,2060,2061,2062,2063,2064,2044,2045,2046,2047,2048,2049,2050,2051,2052,2053,2054,2055,2056,2072,2073,2074,2075,2076,2077,2078,2065],\"params\":{},\"roleId\":102,\"roleKey\":\"groupLeader\",\"roleName\":\"学生组长\",\"roleSort\":5,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-02 15:44:53', 21);
INSERT INTO `sys_oper_log` VALUES (321, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/menu/2007', '127.0.0.1', '内网IP', '2007', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-02 15:45:02', 6);
INSERT INTO `sys_oper_log` VALUES (322, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '项目一部', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"学期\",\"dictType\":\"semester\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-02 15:49:11', 7);
INSERT INTO `sys_oper_log` VALUES (323, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '项目一部', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"第一期\",\"dictSort\":1,\"dictType\":\"semester\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-02 15:50:44', 6);
INSERT INTO `sys_oper_log` VALUES (324, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '项目一部', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"第二期\",\"dictSort\":1,\"dictType\":\"semester\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-02 15:55:12', 4);
INSERT INTO `sys_oper_log` VALUES (325, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '项目一部', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"第三期\",\"dictSort\":2,\"dictType\":\"semester\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-02 15:55:19', 6);
INSERT INTO `sys_oper_log` VALUES (326, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '项目一部', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"第四期\",\"dictSort\":3,\"dictType\":\"semester\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-02 15:55:32', 7);
INSERT INTO `sys_oper_log` VALUES (327, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '项目一部', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"第五期\",\"dictSort\":4,\"dictType\":\"semester\",\"dictValue\":\"4\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-02 15:56:26', 5);
INSERT INTO `sys_oper_log` VALUES (328, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '项目一部', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"第六期\",\"dictSort\":5,\"dictType\":\"semester\",\"dictValue\":\"5\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-02 15:56:35', 7);
INSERT INTO `sys_oper_log` VALUES (329, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '项目一部', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"第七期\",\"dictSort\":6,\"dictType\":\"semester\",\"dictValue\":\"6\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-02 15:57:59', 7);
INSERT INTO `sys_oper_log` VALUES (330, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '项目一部', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"第八期\",\"dictSort\":7,\"dictType\":\"semester\",\"dictValue\":\"7\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-02 15:58:24', 6);
INSERT INTO `sys_oper_log` VALUES (331, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '项目一部', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"onusers\",\"className\":\"SysUser\",\"columns\":[{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":1,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-11 09:46:56\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-03-31 19:04:43\",\"usableColumn\":false},{\"capJavaField\":\"DeptId\",\"columnComment\":\"部门ID\",\"columnId\":2,\"columnName\":\"dept_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-11 09:46:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"deptId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-03-31 19:04:43\",\"usableColumn\":false},{\"capJavaField\":\"UserName\",\"columnComment\":\"用户账号\",\"columnId\":3,\"columnName\":\"user_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-11 09:46:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-03-31 19:04:43\",\"usableColumn\":false},{\"capJavaField\":\"NickName\",\"columnComment\":\"用户昵称\",\"columnId\":4,\"columnName\":\"nick_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-11 09:46:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-02 16:02:31', 30);
INSERT INTO `sys_oper_log` VALUES (332, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '项目一部', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"onusers\",\"className\":\"SysUser\",\"columns\":[{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":1,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-11 09:46:56\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-04-02 16:02:31\",\"usableColumn\":false},{\"capJavaField\":\"DeptId\",\"columnComment\":\"部门ID\",\"columnId\":2,\"columnName\":\"dept_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-11 09:46:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"deptId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-04-02 16:02:31\",\"usableColumn\":false},{\"capJavaField\":\"UserName\",\"columnComment\":\"用户账号\",\"columnId\":3,\"columnName\":\"user_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-11 09:46:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-04-02 16:02:31\",\"usableColumn\":false},{\"capJavaField\":\"NickName\",\"columnComment\":\"用户昵称\",\"columnId\":4,\"columnName\":\"nick_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-11 09:46:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-02 16:05:22', 23);
INSERT INTO `sys_oper_log` VALUES (333, '简历管理', 5, 'com.ruoyi.Resume.controller.ResumeController.exportStuRes()', 'POST', 1, 'user2​', '项目四部', '/Resume/Resume/exportStuRes', '127.0.0.1', '内网IP', '{\"qufen\":\"0\",\"pageSize\":\"10\",\"id\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-04-08 11:15:38', 33);
INSERT INTO `sys_oper_log` VALUES (334, '简历管理', 5, 'com.ruoyi.Resume.controller.ResumeController.exportStuRes()', 'POST', 1, 'user2​', '项目四部', '/Resume/Resume/exportStuRes', '127.0.0.1', '内网IP', '{\"qufen\":\"0\",\"pageSize\":\"10\",\"id\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-04-08 11:24:10', 82);
INSERT INTO `sys_oper_log` VALUES (335, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'user2​', '项目四部', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"resume_work\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-08 11:36:22', 64);
INSERT INTO `sys_oper_log` VALUES (336, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'user2​', '项目四部', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"work\",\"className\":\"ResumeWork\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":67,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"user2​\",\"createTime\":\"2025-04-08 11:36:22\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"HomeworkName\",\"columnComment\":\"公司名称\",\"columnId\":68,\"columnName\":\"homework_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"user2​\",\"createTime\":\"2025-04-08 11:36:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"homeworkName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"HomeworkStatic\",\"columnComment\":\"简历状态\",\"columnId\":69,\"columnName\":\"homework_static\",\"columnType\":\"varchar(255)\",\"createBy\":\"user2​\",\"createTime\":\"2025-04-08 11:36:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"homeworkStatic\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"WorkPost\",\"columnComment\":\"工作岗位\",\"columnId\":70,\"columnName\":\"work_post\",\"columnType\":\"varchar(255)\",\"createBy\":\"user2​\",\"createTime\":\"2025-04-08 11:36:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQu', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-08 11:38:06', 18);
INSERT INTO `sys_oper_log` VALUES (337, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'user2​', '项目四部', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"resume_work\"}', NULL, 0, NULL, '2025-04-08 11:38:15', 25);
INSERT INTO `sys_oper_log` VALUES (338, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/menu/2084', '127.0.0.1', '内网IP', '2084', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-08 14:49:10', 11);
INSERT INTO `sys_oper_log` VALUES (339, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/menu/2083', '127.0.0.1', '内网IP', '2083', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-08 14:49:12', 13);
INSERT INTO `sys_oper_log` VALUES (340, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/menu/2082', '127.0.0.1', '内网IP', '2082', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-08 14:49:14', 16);
INSERT INTO `sys_oper_log` VALUES (341, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/menu/2081', '127.0.0.1', '内网IP', '2081', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-08 14:49:42', 8);
INSERT INTO `sys_oper_log` VALUES (342, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/menu/2080', '127.0.0.1', '内网IP', '2080', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-08 14:49:44', 6);
INSERT INTO `sys_oper_log` VALUES (343, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/menu/2079', '127.0.0.1', '内网IP', '2079', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-08 14:49:48', 9);
INSERT INTO `sys_oper_log` VALUES (344, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-03-10 19:00:48\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4,2031,2032,2033,2034,2035,2036,2019,2020,2021,2022,2023,2024,2037,2039,2040,2000,2013,2014,2015,2016,2017,2018,2041,2042,2060,2061,2062,2063,2064,2044,2045,2046,2047,2048,2049,2050,2051,2052,2053,2054,2055,2056,2072,2073,2074,2075,2076,2077,2078,2085,2086,2087,2088,2089,2090],\"params\":{},\"roleId\":100,\"roleKey\":\"terman\",\"roleName\":\"老师管理\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-09 09:58:15', 30);
INSERT INTO `sys_oper_log` VALUES (345, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-03-10 17:54:47\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4,2031,2032,2033,2034,2035,2036,2019,2020,2021,2022,2023,2024,2037,2039,2040,2000,2013,2014,2015,2016,2017,2018,2041,2042,2060,2061,2062,2063,2064,2044,2045,2046,2047,2048,2049,2050,2051,2052,2053,2054,2055,2056,2072,2073,2074,2075,2076,2077,2078,2085,2086,2087,2088,2089,2090],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-09 09:58:36', 16);
INSERT INTO `sys_oper_log` VALUES (346, '简历投递', 1, 'com.ruoyi.ResumeWork.controller.ResumeWorkController.add()', 'POST', 1, 'user2​', '项目四部', '/ResumeWork/work', '127.0.0.1', '内网IP', '{\"homeworkName\":\"测试\",\"homeworkStatic\":\"测试\",\"id\":1,\"params\":{},\"remark\":\"123\",\"workPost\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-09 10:33:43', 13);
INSERT INTO `sys_oper_log` VALUES (347, '简历管理', 1, 'com.ruoyi.Resume.controller.ResumeController.add()', 'POST', 1, 'user3​', '一组', '/Resume/Resume', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-04-09 10:42:52\",\"deptId\":106,\"id\":12,\"notes\":\"/profile/upload/2025/04/09/知识库_20250409104247A001.docx\",\"params\":{},\"remark\":\"1123\",\"resumeSummary\":\"1\",\"stuDeptId\":200,\"stuId\":124}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-09 10:42:52', 10);
INSERT INTO `sys_oper_log` VALUES (348, '简历投递', 1, 'com.ruoyi.ResumeWork.controller.ResumeWorkController.add()', 'POST', 1, 'user2​', '项目四部', '/ResumeWork/work', '127.0.0.1', '内网IP', '{\"homeworkName\":\"测试\",\"homeworkStatic\":\"测试\",\"id\":2,\"params\":{},\"remark\":\"123\",\"workPost\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-09 11:21:12', 11);
INSERT INTO `sys_oper_log` VALUES (349, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'user2​', '项目四部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"ResumeWork/work/index\",\"createTime\":\"2025-04-08 14:43:22\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2085,\"menuName\":\"简历投递\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2072,\"path\":\"work\",\"perms\":\"ResumeWork:work:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"user2​\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-09 14:00:27', 16);
INSERT INTO `sys_oper_log` VALUES (350, '简历管理', 5, 'com.ruoyi.Resume.controller.ResumeController.exportStuRes()', 'POST', 1, 'user2​', '项目四部', '/Resume/Resume/exportStuRes', '127.0.0.1', '内网IP', '{\"qufen\":\"1\",\"pageSize\":\"10\",\"id\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-04-09 20:40:51', 30);
INSERT INTO `sys_oper_log` VALUES (351, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'user2​', '项目四部', '/system/user/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-04-09 20:42:43', 383);
INSERT INTO `sys_oper_log` VALUES (352, '发布作业', 1, 'com.ruoyi.homework.controller.HomeworkController.add()', 'POST', 1, 'user2​', '项目四部', '/homework/homework', '127.0.0.1', '内网IP', '{\"content\":\"/profile/upload/2025/04/10/翟帅 _20250410202304A001.pdf\",\"createTime\":\"2025-04-10 20:23:05\",\"dueDate\":\"2025-04-10\",\"id\":7,\"params\":{},\"remark\":\"106\",\"teacherId\":123,\"title\":\"123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-10 20:23:05', 49);
INSERT INTO `sys_oper_log` VALUES (353, '提交作业', 5, 'com.ruoyi.stuhom.controller.StuHomController.export()', 'POST', 1, 'user2​', '项目四部', '/stuhom/stuhom/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"department\":\"106\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-04-10 20:25:04', 37);
INSERT INTO `sys_oper_log` VALUES (354, '简历管理', 5, 'com.ruoyi.Resume.controller.ResumeController.exportStuRes()', 'POST', 1, 'user2​', '项目四部', '/Resume/Resume/exportStuRes', '127.0.0.1', '内网IP', '{\"qufen\":\"1\",\"pageSize\":\"10\",\"id\":\"10\",\"resumeSummary\":\"0\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-04-10 20:40:03', 99);
INSERT INTO `sys_oper_log` VALUES (355, '行事历', 1, 'com.ruoyi.web.controller.activity.SysEventController.add()', 'POST', 1, 'admin', '项目一部', '/activity/event', '127.0.0.1', '内网IP', '{\"eventColor\":\"#409EFF\",\"eventDate\":\"2025-04-15\",\"eventId\":21,\"eventText\":\"1111\",\"eventTimestamp\":1744680734493,\"params\":{},\"slotId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 09:32:14', 147);
INSERT INTO `sys_oper_log` VALUES (356, '行事历', 1, 'com.ruoyi.web.controller.activity.SysEventController.add()', 'POST', 1, 'admin', '项目一部', '/activity/event', '127.0.0.1', '内网IP', '{\"eventColor\":\"#409EFF\",\"eventDate\":\"2025-04-15\",\"eventId\":22,\"eventText\":\"22222\",\"eventTimestamp\":1744680737613,\"params\":{},\"slotId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 09:32:17', 7);
INSERT INTO `sys_oper_log` VALUES (357, '行事历', 3, 'com.ruoyi.web.controller.activity.SysEventController.remove()', 'DELETE', 1, 'admin', '项目一部', '/activity/event/21', '127.0.0.1', '内网IP', '[21]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 09:32:20', 24);
INSERT INTO `sys_oper_log` VALUES (358, '行事历', 3, 'com.ruoyi.web.controller.activity.SysEventController.remove()', 'DELETE', 1, 'admin', '项目一部', '/activity/event/22', '127.0.0.1', '内网IP', '[22]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 09:32:20', 23);
INSERT INTO `sys_oper_log` VALUES (359, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '项目一部', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_event_number\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 09:57:39', 151);
INSERT INTO `sys_oper_log` VALUES (360, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '项目一部', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"number\",\"className\":\"SysEventNumber\",\"columns\":[{\"capJavaField\":\"NumberId\",\"columnComment\":\"期数id\",\"columnId\":74,\"columnName\":\"number_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-15 09:57:39\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"numberId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Number\",\"columnComment\":\"期数\",\"columnId\":75,\"columnName\":\"number\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-15 09:57:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"number\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"创建人id\",\"columnId\":76,\"columnName\":\"user_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-15 09:57:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreatTime\",\"columnComment\":\"创建时间\",\"columnId\":77,\"columnName\":\"creat_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2025-04-15 09:57:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 10:00:01', 51);
INSERT INTO `sys_oper_log` VALUES (361, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '项目一部', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"number\",\"className\":\"SysEventNumber\",\"columns\":[{\"capJavaField\":\"NumberId\",\"columnComment\":\"期数id\",\"columnId\":74,\"columnName\":\"number_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-15 09:57:39\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"numberId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2025-04-15 10:00:01\",\"usableColumn\":false},{\"capJavaField\":\"Number\",\"columnComment\":\"期数\",\"columnId\":75,\"columnName\":\"number\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-15 09:57:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"number\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2025-04-15 10:00:01\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"创建人id\",\"columnId\":76,\"columnName\":\"user_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-15 09:57:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2025-04-15 10:00:01\",\"usableColumn\":false},{\"capJavaField\":\"CreatTime\",\"columnComment\":\"创建时间\",\"columnId\":77,\"columnName\":\"creat_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2025-04-15 09:57:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 10:01:20', 27);
INSERT INTO `sys_oper_log` VALUES (362, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '项目一部', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_event_number\"}', NULL, 0, NULL, '2025-04-15 10:02:41', 53);
INSERT INTO `sys_oper_log` VALUES (363, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"activity/number/index\",\"createTime\":\"2025-04-15 10:08:50\",\"icon\":\"druid\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2091,\"menuName\":\"行事历期数\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"number\",\"perms\":\"activity:number:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 10:09:43', 59);
INSERT INTO `sys_oper_log` VALUES (364, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"activity/number/index\",\"createTime\":\"2025-04-15 10:08:50\",\"icon\":\"druid\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2091,\"menuName\":\"行事历期数\",\"menuType\":\"C\",\"orderNum\":10,\"params\":{},\"parentId\":0,\"path\":\"number\",\"perms\":\"activity:number:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 10:10:01', 13);
INSERT INTO `sys_oper_log` VALUES (365, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/menu/2060', '127.0.0.1', '内网IP', '2060', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2025-04-15 10:10:29', 6);
INSERT INTO `sys_oper_log` VALUES (366, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-03-10 17:54:47\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4,2031,2032,2033,2034,2035,2036,2019,2020,2021,2022,2023,2024,2037,2039,2040,2000,2013,2014,2015,2016,2017,2018,2041,2044,2051,2052,2053,2054,2055,2056,2045,2046,2047,2048,2049,2050,2072,2073,2074,2075,2076,2077,2078,2085,2086,2087,2088,2089,2090],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 10:10:49', 61);
INSERT INTO `sys_oper_log` VALUES (367, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-03-10 19:00:48\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4,2031,2032,2033,2034,2035,2036,2019,2020,2021,2022,2023,2024,2037,2039,2040,2000,2013,2014,2015,2016,2017,2018,2041,2044,2051,2052,2053,2054,2055,2056,2045,2046,2047,2048,2049,2050,2072,2073,2074,2075,2076,2077,2078,2085,2086,2087,2088,2089,2090],\"params\":{},\"roleId\":100,\"roleKey\":\"terman\",\"roleName\":\"老师管理\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 10:10:54', 30);
INSERT INTO `sys_oper_log` VALUES (368, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-03-10 19:06:45\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2072,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4,2031,2032,2033,2034,2035,2036,2019,2020,2021,2022,2023,2024,2037,2039,2040,2000,2013,2014,2015,2016,2017,2018,2041,2044,2051,2052,2053,2054,2055,2056,2045,2046,2047,2048,2049,2050,2073,2074,2075,2076,2077,2078],\"params\":{},\"roleId\":101,\"roleKey\":\"stuman\",\"roleName\":\"学生主管\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 10:11:01', 30);
INSERT INTO `sys_oper_log` VALUES (369, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-03-31 19:48:09\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2072,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4,2031,2032,2033,2034,2035,2036,2019,2020,2021,2022,2023,2024,2037,2039,2040,2000,2013,2014,2015,2016,2017,2018,2041,2044,2051,2052,2053,2054,2055,2056,2045,2046,2047,2048,2049,2050,2073,2074,2075,2076,2077,2078],\"params\":{},\"roleId\":102,\"roleKey\":\"groupLeader\",\"roleName\":\"学生组长\",\"roleSort\":5,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 10:11:05', 31);
INSERT INTO `sys_oper_log` VALUES (370, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/menu/2060', '127.0.0.1', '内网IP', '2060', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 10:11:25', 49);
INSERT INTO `sys_oper_log` VALUES (371, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/menu/2061', '127.0.0.1', '内网IP', '2061', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 10:11:28', 21);
INSERT INTO `sys_oper_log` VALUES (372, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/menu/2062', '127.0.0.1', '内网IP', '2062', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 10:11:30', 25);
INSERT INTO `sys_oper_log` VALUES (373, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/menu/2063', '127.0.0.1', '内网IP', '2063', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 10:11:33', 28);
INSERT INTO `sys_oper_log` VALUES (374, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/menu/2064', '127.0.0.1', '内网IP', '2064', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 10:11:40', 38);
INSERT INTO `sys_oper_log` VALUES (375, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/menu/2065', '127.0.0.1', '内网IP', '2065', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 10:11:48', 31);
INSERT INTO `sys_oper_log` VALUES (376, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"activity/event/index\",\"createTime\":\"2025-03-15 17:13:24\",\"icon\":\"date\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2042,\"menuName\":\"行事历管理\",\"menuType\":\"M\",\"orderNum\":9,\"params\":{},\"parentId\":0,\"path\":\"event\",\"perms\":\"activity:event:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 10:12:04', 65);
INSERT INTO `sys_oper_log` VALUES (377, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"activity/event/index\",\"createTime\":\"2025-03-15 17:13:24\",\"icon\":\"date\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2042,\"menuName\":\"行事历管理\",\"menuType\":\"M\",\"orderNum\":10,\"params\":{},\"parentId\":0,\"path\":\"event\",\"perms\":\"activity:event:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 10:12:15', 33);
INSERT INTO `sys_oper_log` VALUES (378, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"activity/calendar/index\",\"createTime\":\"2025-03-14 18:35:27\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2041,\"menuName\":\"行事历\",\"menuType\":\"C\",\"orderNum\":9,\"params\":{},\"parentId\":2042,\"path\":\"calendar\",\"perms\":\"activity:event:listCalendar\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 10:12:30', 32);
INSERT INTO `sys_oper_log` VALUES (379, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"activity/calendar/index\",\"createTime\":\"2025-03-14 18:35:27\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2041,\"menuName\":\"行事历\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2042,\"path\":\"calendar\",\"perms\":\"activity:event:listCalendar\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 10:12:46', 33);
INSERT INTO `sys_oper_log` VALUES (380, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"activity/number/index\",\"createTime\":\"2025-04-15 10:08:50\",\"icon\":\"druid\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2091,\"menuName\":\"行事历期数\",\"menuType\":\"C\",\"orderNum\":10,\"params\":{},\"parentId\":2042,\"path\":\"number\",\"perms\":\"activity:number:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 10:12:55', 18);
INSERT INTO `sys_oper_log` VALUES (381, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/menu/4', '127.0.0.1', '内网IP', '4', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2025-04-15 10:13:33', 4);
INSERT INTO `sys_oper_log` VALUES (382, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-03-10 17:54:47\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,2031,2032,2033,2034,2035,2036,2019,2020,2021,2022,2023,2024,2037,2039,2040,2000,2013,2014,2015,2016,2017,2018,2042,2041,2091,2092,2093,2094,2095,2096,2044,2051,2052,2053,2054,2055,2056,2045,2046,2047,2048,2049,2050,2072,2073,2074,2075,2076,2077,2078,2085,2086,2087,2088,2089,2090],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 10:13:45', 30);
INSERT INTO `sys_oper_log` VALUES (383, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-03-10 19:00:48\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,2031,2032,2033,2034,2035,2036,2019,2020,2021,2022,2023,2024,2037,2039,2040,2000,2013,2014,2015,2016,2017,2018,2042,2041,2091,2092,2093,2094,2095,2096,2044,2051,2052,2053,2054,2055,2056,2045,2046,2047,2048,2049,2050,2072,2073,2074,2075,2076,2077,2078,2085,2086,2087,2088,2089,2090],\"params\":{},\"roleId\":100,\"roleKey\":\"terman\",\"roleName\":\"老师管理\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 10:13:51', 29);
INSERT INTO `sys_oper_log` VALUES (384, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-03-10 19:06:45\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2072,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,2031,2032,2033,2034,2035,2036,2019,2020,2021,2022,2023,2024,2037,2039,2040,2000,2013,2014,2015,2016,2017,2018,2042,2041,2091,2092,2093,2094,2095,2096,2044,2051,2052,2053,2054,2055,2056,2045,2046,2047,2048,2049,2050,2073,2074,2075,2076,2077,2078],\"params\":{},\"roleId\":101,\"roleKey\":\"stuman\",\"roleName\":\"学生主管\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 10:13:57', 29);
INSERT INTO `sys_oper_log` VALUES (385, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-03-31 19:48:09\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2042,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,2031,2032,2033,2034,2035,2036,2019,2020,2021,2022,2023,2024,2037,2039,2040,2000,2013,2014,2015,2016,2017,2018,2041,2044,2051,2052,2053,2054,2055,2056,2045,2046,2047,2048,2049,2050,2072,2073,2074,2075,2076,2077,2078,2085,2086,2087,2088,2089,2090],\"params\":{},\"roleId\":102,\"roleKey\":\"groupLeader\",\"roleName\":\"学生组长\",\"roleSort\":5,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 10:14:04', 31);
INSERT INTO `sys_oper_log` VALUES (386, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '项目一部', '/system/menu/4', '127.0.0.1', '内网IP', '4', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 10:14:12', 16);
INSERT INTO `sys_oper_log` VALUES (387, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '项目一部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"考勤管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"leave\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 10:16:37', 137);
INSERT INTO `sys_oper_log` VALUES (388, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"leave/details/index\",\"createTime\":\"2025-03-12 21:04:10\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2031,\"menuName\":\"请假管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2097,\"path\":\"details\",\"perms\":\"leave:details:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 10:16:54', 81);
INSERT INTO `sys_oper_log` VALUES (389, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"leave/room/index\",\"createTime\":\"2025-03-12 20:45:25\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"教室管理\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":2097,\"path\":\"room\",\"perms\":\"leave:room:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 10:17:01', 16);
INSERT INTO `sys_oper_log` VALUES (390, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"leave/details/index\",\"createTime\":\"2025-03-12 21:04:10\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2031,\"menuName\":\"请假管理\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2097,\"path\":\"details\",\"perms\":\"leave:details:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 10:17:13', 34);
INSERT INTO `sys_oper_log` VALUES (391, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"leave/room/index\",\"createTime\":\"2025-03-12 20:45:25\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"教室管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2097,\"path\":\"room\",\"perms\":\"leave:room:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 10:17:21', 31);
INSERT INTO `sys_oper_log` VALUES (392, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"activity/number/index\",\"createTime\":\"2025-04-15 10:08:50\",\"icon\":\"druid\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2091,\"menuName\":\"行事历期数\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2042,\"path\":\"number\",\"perms\":\"activity:number:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 10:18:28', 90);
INSERT INTO `sys_oper_log` VALUES (393, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"activity/calendar/index\",\"createTime\":\"2025-03-14 18:35:27\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2041,\"menuName\":\"行事历\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2042,\"path\":\"calendar\",\"perms\":\"activity:event:listCalendar\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 10:19:18', 63);
INSERT INTO `sys_oper_log` VALUES (394, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2025-03-15 17:13:24\",\"icon\":\"date\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2042,\"menuName\":\"行事历管理\",\"menuType\":\"M\",\"orderNum\":10,\"params\":{},\"parentId\":0,\"path\":\"event\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 10:20:23', 79);
INSERT INTO `sys_oper_log` VALUES (395, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"leave/seat/seat\",\"createTime\":\"2025-03-12 21:08:37\",\"icon\":\"email\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2037,\"menuName\":\"教室座位\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":2037,\"path\":\"seat\",\"perms\":\"leave:room:list\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"1\"}', '{\"msg\":\"修改菜单\'教室座位\'失败，上级菜单不能选择自己\",\"code\":500}', 0, NULL, '2025-04-15 10:25:33', 3);
INSERT INTO `sys_oper_log` VALUES (396, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"leave/seat/seat\",\"createTime\":\"2025-03-12 21:08:37\",\"icon\":\"email\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2037,\"menuName\":\"教室座位\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":2097,\"path\":\"seat\",\"perms\":\"leave:room:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 10:25:40', 26);
INSERT INTO `sys_oper_log` VALUES (397, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '项目一部', '/tool/gen/synchDb/sys_event_number', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 10:25:55', 95);
INSERT INTO `sys_oper_log` VALUES (398, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '项目一部', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_event_number\"}', NULL, 0, NULL, '2025-04-15 10:26:05', 61);
INSERT INTO `sys_oper_log` VALUES (399, '行事历期数', 1, 'com.ruoyi.activity.controller.SysEventNumberController.add()', 'POST', 1, 'admin', '项目一部', '/activity/number', '127.0.0.1', '内网IP', '{\"creatTime\":\"2025-04-08\",\"number\":\"1111\",\"numberDescribe\":\"111\",\"numberId\":1,\"params\":{},\"userId\":11}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 10:28:29', 98);
INSERT INTO `sys_oper_log` VALUES (400, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '项目一部', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"number\",\"className\":\"SysEventNumber\",\"columns\":[{\"capJavaField\":\"NumberId\",\"columnComment\":\"期数id\",\"columnId\":74,\"columnName\":\"number_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-15 09:57:39\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"numberId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2025-04-15 10:25:55\",\"usableColumn\":false},{\"capJavaField\":\"Number\",\"columnComment\":\"期数名称\",\"columnId\":75,\"columnName\":\"number\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-15 09:57:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"number\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2025-04-15 10:25:55\",\"usableColumn\":false},{\"capJavaField\":\"NumberDescribe\",\"columnComment\":\"期数描述\",\"columnId\":78,\"columnName\":\"number_describe\",\"columnType\":\"varchar(255)\",\"createBy\":\"\",\"createTime\":\"2025-04-15 10:25:55\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"numberDescribe\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"创建人id\",\"columnId\":76,\"columnName\":\"user_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-15 09:57:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 10:29:21', 98);
INSERT INTO `sys_oper_log` VALUES (401, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '项目一部', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_event\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 10:36:58', 61);
INSERT INTO `sys_oper_log` VALUES (402, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '项目一部', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"event\",\"className\":\"SysEvent\",\"columns\":[{\"capJavaField\":\"EventId\",\"columnId\":79,\"columnName\":\"event_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-15 10:36:58\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"eventId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"NumberId\",\"columnComment\":\"期数表id\",\"columnId\":80,\"columnName\":\"number_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-15 10:36:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"numberId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"EventDate\",\"columnComment\":\"事件日期\",\"columnId\":81,\"columnName\":\"event_date\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-15 10:36:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"eventDate\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SlotId\",\"columnComment\":\"时间段标识\",\"columnId\":82,\"columnName\":\"slotId\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-15 10:36:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"slotI', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 10:45:45', 121);
INSERT INTO `sys_oper_log` VALUES (403, '行事历期数', 3, 'com.ruoyi.activity.controller.SysEventNumberController.remove()', 'DELETE', 1, 'admin', '项目一部', '/activity/number/1', '127.0.0.1', '内网IP', '[1]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 10:46:24', 17);
INSERT INTO `sys_oper_log` VALUES (404, '行事历期数', 1, 'com.ruoyi.activity.controller.SysEventNumberController.add()', 'POST', 1, 'admin', '项目一部', '/activity/number', '127.0.0.1', '内网IP', '{\"number\":\"第八期\",\"numberDescribe\":\"相爱相亲一家人\",\"numberId\":2,\"params\":{},\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 10:51:12', 156);
INSERT INTO `sys_oper_log` VALUES (405, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '项目一部', '/tool/gen/synchDb/sys_event_number', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 11:21:33', 281);
INSERT INTO `sys_oper_log` VALUES (406, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '项目一部', '/tool/gen/synchDb/sys_event', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 11:21:37', 73);
INSERT INTO `sys_oper_log` VALUES (407, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '项目一部', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"event\",\"className\":\"SysEvent\",\"columns\":[{\"capJavaField\":\"EventId\",\"columnComment\":\"\",\"columnId\":79,\"columnName\":\"event_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-15 10:36:58\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"eventId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2025-04-15 11:21:37\",\"usableColumn\":false},{\"capJavaField\":\"NumberId\",\"columnComment\":\"期数表id\",\"columnId\":80,\"columnName\":\"number_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-15 10:36:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"numberId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2025-04-15 11:21:37\",\"usableColumn\":false},{\"capJavaField\":\"EventWeeks\",\"columnComment\":\"周数\",\"columnId\":90,\"columnName\":\"event_weeks\",\"columnType\":\"int(11)\",\"createBy\":\"\",\"createTime\":\"2025-04-15 11:21:37\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"eventWeeks\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"EventDate\",\"columnComment\":\"事件日期\",\"columnId\":81,\"columnName\":\"event_date\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-15 10:36:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"i', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 11:23:48', 139);
INSERT INTO `sys_oper_log` VALUES (408, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '项目一部', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"event\",\"className\":\"SysEvent\",\"columns\":[{\"capJavaField\":\"EventId\",\"columnComment\":\"\",\"columnId\":79,\"columnName\":\"event_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-15 10:36:58\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"eventId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2025-04-15 11:23:48\",\"usableColumn\":false},{\"capJavaField\":\"NumberId\",\"columnComment\":\"期数表id\",\"columnId\":80,\"columnName\":\"number_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-15 10:36:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"numberId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2025-04-15 11:23:48\",\"usableColumn\":false},{\"capJavaField\":\"EventWeeks\",\"columnComment\":\"周数\",\"columnId\":90,\"columnName\":\"event_weeks\",\"columnType\":\"int(11)\",\"createBy\":\"\",\"createTime\":\"2025-04-15 11:21:37\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"eventWeeks\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2025-04-15 11:23:48\",\"usableColumn\":false},{\"capJavaField\":\"EventDate\",\"columnComment\":\"事件日期\",\"columnId\":81,\"columnName\":\"event_date\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-15 10:36:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":tru', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 11:25:23', 101);
INSERT INTO `sys_oper_log` VALUES (409, '行事历期数', 2, 'com.ruoyi.activity.controller.SysEventNumberController.edit()', 'PUT', 1, 'admin', '项目一部', '/activity/number', '127.0.0.1', '内网IP', '{\"creatTime\":\"2025-04-15 10:51:12\",\"number\":\"第八期\",\"numberDescribe\":\"相爱相亲一家人\",\"numberId\":2,\"numberTime\":\"2025-02-24\",\"numberWeeks\":16,\"params\":{},\"user\":{\"admin\":false,\"nickName\":\"若依\",\"params\":{},\"userName\":\"admin\"},\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 13:44:12', 43);
INSERT INTO `sys_oper_log` VALUES (410, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '项目一部', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_event_color,sys_event_time\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 14:27:39', 139);
INSERT INTO `sys_oper_log` VALUES (411, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '项目一部', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"time\",\"className\":\"SysEventTime\",\"columns\":[{\"capJavaField\":\"TimeId\",\"columnId\":97,\"columnName\":\"time_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-15 14:27:39\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"timeId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"NumberId\",\"columnComment\":\"期数\",\"columnId\":98,\"columnName\":\"number_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-15 14:27:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"numberId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"MondayDate\",\"columnComment\":\"周一日期\",\"columnId\":99,\"columnName\":\"monday_date\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2025-04-15 14:27:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"mondayDate\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SundayDate\",\"columnComment\":\"周天日期\",\"columnId\":100,\"columnName\":\"sunday_date\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2025-04-15 14:27:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 14:28:56', 68);
INSERT INTO `sys_oper_log` VALUES (412, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '项目一部', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"color\",\"className\":\"SysEventColor\",\"columns\":[{\"capJavaField\":\"ColorId\",\"columnId\":91,\"columnName\":\"color_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-15 14:27:38\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"colorId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"NumberId\",\"columnComment\":\"期数id\",\"columnId\":92,\"columnName\":\"number_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-15 14:27:38\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"numberId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DepartmentName\",\"columnComment\":\"部门名称\",\"columnId\":93,\"columnName\":\"department_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-15 14:27:38\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"departmentName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DepartmentColor\",\"columnComment\":\"部门颜色\",\"columnId\":94,\"columnName\":\"department_color\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-15 14:27:38\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 14:29:13', 46);
INSERT INTO `sys_oper_log` VALUES (413, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '项目一部', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"color\",\"className\":\"SysEventColor\",\"columns\":[{\"capJavaField\":\"ColorId\",\"columnId\":91,\"columnName\":\"color_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-15 14:27:38\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"colorId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2025-04-15 14:29:12\",\"usableColumn\":false},{\"capJavaField\":\"NumberId\",\"columnComment\":\"期数id\",\"columnId\":92,\"columnName\":\"number_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-15 14:27:38\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"numberId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2025-04-15 14:29:12\",\"usableColumn\":false},{\"capJavaField\":\"DepartmentName\",\"columnComment\":\"部门名称\",\"columnId\":93,\"columnName\":\"department_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-15 14:27:38\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"departmentName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2025-04-15 14:29:12\",\"usableColumn\":false},{\"capJavaField\":\"DepartmentColor\",\"columnComment\":\"部门颜色\",\"columnId\":94,\"columnName\":\"department_color\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-15 14:27:38\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increme', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 14:29:27', 45);
INSERT INTO `sys_oper_log` VALUES (414, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '项目一部', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_event_color,sys_event_time\"}', NULL, 0, NULL, '2025-04-15 14:29:59', 148);
INSERT INTO `sys_oper_log` VALUES (415, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '项目一部', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"number\",\"className\":\"SysEventNumber\",\"columns\":[{\"capJavaField\":\"NumberId\",\"columnComment\":\"期数id\",\"columnId\":74,\"columnName\":\"number_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-15 09:57:39\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"numberId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2025-04-15 11:21:33\",\"usableColumn\":false},{\"capJavaField\":\"Number\",\"columnComment\":\"期数名称\",\"columnId\":75,\"columnName\":\"number\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-15 09:57:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"number\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2025-04-15 11:21:33\",\"usableColumn\":false},{\"capJavaField\":\"NumberDescribe\",\"columnComment\":\"期数描述\",\"columnId\":78,\"columnName\":\"number_describe\",\"columnType\":\"varchar(255)\",\"createBy\":\"\",\"createTime\":\"2025-04-15 10:25:55\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"numberDescribe\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2025-04-15 11:21:33\",\"usableColumn\":false},{\"capJavaField\":\"NumberWeeks\",\"columnComment\":\"总周数\",\"columnId\":88,\"columnName\":\"number_weeks\",\"columnType\":\"int(11)\",\"createBy\":\"\",\"createTime\":\"2025-04-15 11:21:33\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"in', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 14:34:20', 126);
INSERT INTO `sys_oper_log` VALUES (416, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '项目一部', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"event\",\"className\":\"SysEvent\",\"columns\":[{\"capJavaField\":\"EventId\",\"columnComment\":\"\",\"columnId\":79,\"columnName\":\"event_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-15 10:36:58\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"eventId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2025-04-15 11:25:23\",\"usableColumn\":false},{\"capJavaField\":\"NumberId\",\"columnComment\":\"期数表id\",\"columnId\":80,\"columnName\":\"number_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-15 10:36:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"numberId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2025-04-15 11:25:23\",\"usableColumn\":false},{\"capJavaField\":\"EventWeeks\",\"columnComment\":\"周数\",\"columnId\":90,\"columnName\":\"event_weeks\",\"columnType\":\"int(11)\",\"createBy\":\"\",\"createTime\":\"2025-04-15 11:21:37\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"eventWeeks\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2025-04-15 11:25:23\",\"usableColumn\":false},{\"capJavaField\":\"EventDate\",\"columnComment\":\"事件日期\",\"columnId\":81,\"columnName\":\"event_date\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-15 10:36:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":tru', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 14:34:36', 66);
INSERT INTO `sys_oper_log` VALUES (417, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '项目一部', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"event\",\"className\":\"SysEvent\",\"columns\":[{\"capJavaField\":\"EventId\",\"columnComment\":\"\",\"columnId\":79,\"columnName\":\"event_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-15 10:36:58\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"eventId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2025-04-15 14:34:36\",\"usableColumn\":false},{\"capJavaField\":\"NumberId\",\"columnComment\":\"期数表id\",\"columnId\":80,\"columnName\":\"number_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-15 10:36:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"numberId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2025-04-15 14:34:36\",\"usableColumn\":false},{\"capJavaField\":\"EventWeeks\",\"columnComment\":\"周数\",\"columnId\":90,\"columnName\":\"event_weeks\",\"columnType\":\"int(11)\",\"createBy\":\"\",\"createTime\":\"2025-04-15 11:21:37\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"eventWeeks\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2025-04-15 14:34:36\",\"usableColumn\":false},{\"capJavaField\":\"EventDate\",\"columnComment\":\"事件日期\",\"columnId\":81,\"columnName\":\"event_date\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-15 10:36:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":tru', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 14:34:47', 45);
INSERT INTO `sys_oper_log` VALUES (418, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '项目一部', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"number\",\"className\":\"SysEventNumber\",\"columns\":[{\"capJavaField\":\"NumberId\",\"columnComment\":\"期数id\",\"columnId\":74,\"columnName\":\"number_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-15 09:57:39\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"numberId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2025-04-15 14:34:20\",\"usableColumn\":false},{\"capJavaField\":\"Number\",\"columnComment\":\"期数名称\",\"columnId\":75,\"columnName\":\"number\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-15 09:57:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"number\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2025-04-15 14:34:20\",\"usableColumn\":false},{\"capJavaField\":\"NumberDescribe\",\"columnComment\":\"期数描述\",\"columnId\":78,\"columnName\":\"number_describe\",\"columnType\":\"varchar(255)\",\"createBy\":\"\",\"createTime\":\"2025-04-15 10:25:55\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"numberDescribe\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2025-04-15 14:34:20\",\"usableColumn\":false},{\"capJavaField\":\"NumberWeeks\",\"columnComment\":\"总周数\",\"columnId\":88,\"columnName\":\"number_weeks\",\"columnType\":\"int(11)\",\"createBy\":\"\",\"createTime\":\"2025-04-15 11:21:33\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"in', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 14:34:59', 41);
INSERT INTO `sys_oper_log` VALUES (419, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '项目一部', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_event_color,sys_event_time,sys_event,sys_event_number\"}', NULL, 0, NULL, '2025-04-15 14:35:07', 141);
INSERT INTO `sys_oper_log` VALUES (420, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"activity/time/index\",\"createTime\":\"2025-04-15 14:33:27\",\"icon\":\"date\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2098,\"menuName\":\"行事历周数时间\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2042,\"path\":\"time\",\"perms\":\"activity:time:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 14:37:04', 32);
INSERT INTO `sys_oper_log` VALUES (421, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"activity/color/index\",\"createTime\":\"2025-04-15 14:33:38\",\"icon\":\"color\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2104,\"menuName\":\"行事历部门颜色\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2042,\"path\":\"color\",\"perms\":\"activity:color:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 14:37:30', 14);
INSERT INTO `sys_oper_log` VALUES (422, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"activity/time/index\",\"createTime\":\"2025-04-15 14:33:27\",\"icon\":\"date\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2098,\"menuName\":\"行事历周数时间\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2042,\"path\":\"time\",\"perms\":\"activity:time:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 14:44:26', 91);
INSERT INTO `sys_oper_log` VALUES (423, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"activity/time/index\",\"createTime\":\"2025-04-15 14:33:27\",\"icon\":\"date\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2098,\"menuName\":\"行事历周数时间\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2042,\"path\":\"time\",\"perms\":\"activity:time:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 14:44:32', 15);
INSERT INTO `sys_oper_log` VALUES (424, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"activity/number/index\",\"createTime\":\"2025-04-15 10:08:50\",\"icon\":\"druid\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2091,\"menuName\":\"行事历期数\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2042,\"path\":\"number\",\"perms\":\"activity:number:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 14:49:05', 53);
INSERT INTO `sys_oper_log` VALUES (425, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"activity/calendar/index\",\"createTime\":\"2025-03-14 18:35:27\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2041,\"menuName\":\"行事历\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2042,\"path\":\"calendar\",\"perms\":\"activity:event:listCalendar\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 14:49:11', 33);
INSERT INTO `sys_oper_log` VALUES (426, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"activity/color/index\",\"createTime\":\"2025-04-15 14:33:38\",\"icon\":\"color\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2104,\"menuName\":\"行事历部门颜色\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2042,\"path\":\"color\",\"perms\":\"activity:color:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 14:49:19', 15);
INSERT INTO `sys_oper_log` VALUES (427, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"activity/calendar/index\",\"createTime\":\"2025-03-14 18:35:27\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2041,\"menuName\":\"行事历\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2042,\"path\":\"calendar\",\"perms\":\"activity:event:listCalendar\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 14:49:28', 43);
INSERT INTO `sys_oper_log` VALUES (428, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"activity/calendar/index\",\"createTime\":\"2025-03-14 18:35:27\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2041,\"menuName\":\"行事历\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2042,\"path\":\"calendar\",\"perms\":\"activity:event:listCalendar\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 14:49:39', 29);
INSERT INTO `sys_oper_log` VALUES (429, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"activity/time/index\",\"createTime\":\"2025-04-15 14:33:27\",\"icon\":\"date\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2098,\"menuName\":\"行事历周数时间\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2042,\"path\":\"time\",\"perms\":\"activity:time:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 14:49:46', 50);
INSERT INTO `sys_oper_log` VALUES (430, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"activity/time/index\",\"createTime\":\"2025-04-15 14:33:27\",\"icon\":\"date\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2098,\"menuName\":\"行事历周数\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2042,\"path\":\"time\",\"perms\":\"activity:time:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 14:49:53', 17);
INSERT INTO `sys_oper_log` VALUES (431, '行事历周数时间', 1, 'com.ruoyi.activity.controller.SysEventTimeController.add()', 'POST', 1, 'admin', '项目一部', '/activity/time', '127.0.0.1', '内网IP', '{\"eventWeeks\":16,\"mondayDate\":\"2025-04-14\",\"numberId\":2,\"params\":{},\"sundayDate\":\"2025-04-20\",\"timeId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 15:24:02', 137);
INSERT INTO `sys_oper_log` VALUES (432, '行事历周数时间', 3, 'com.ruoyi.activity.controller.SysEventTimeController.remove()', 'DELETE', 1, 'admin', '项目一部', '/activity/time/1', '127.0.0.1', '内网IP', '[1]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 15:27:08', 68);
INSERT INTO `sys_oper_log` VALUES (433, '行事历周数时间', 1, 'com.ruoyi.activity.controller.SysEventTimeController.add()', 'POST', 1, 'admin', '项目一部', '/activity/time', '127.0.0.1', '内网IP', '{\"eventWeeks\":1,\"mondayDate\":\"2025-04-14\",\"numberId\":2,\"params\":{},\"sundayDate\":\"2025-04-20\",\"timeId\":2,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 15:27:29', 92);
INSERT INTO `sys_oper_log` VALUES (434, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"activity/color/index\",\"createTime\":\"2025-04-15 14:33:38\",\"icon\":\"color\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2104,\"menuName\":\"行事历颜色\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2042,\"path\":\"color\",\"perms\":\"activity:color:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 15:38:56', 38);
INSERT INTO `sys_oper_log` VALUES (435, '行事历部门颜色', 1, 'com.ruoyi.activity.controller.SysEventColorController.add()', 'POST', 1, 'admin', '项目一部', '/activity/color', '127.0.0.1', '内网IP', '{\"colorId\":1,\"departmentColor\":\"#17E358\",\"departmentName\":\"云程四部\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 15:40:46', 59);
INSERT INTO `sys_oper_log` VALUES (436, '行事历部门颜色', 3, 'com.ruoyi.activity.controller.SysEventColorController.remove()', 'DELETE', 1, 'admin', '项目一部', '/activity/color/1', '127.0.0.1', '内网IP', '[1]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 15:48:32', 131);
INSERT INTO `sys_oper_log` VALUES (437, '行事历部门颜色', 1, 'com.ruoyi.activity.controller.SysEventColorController.add()', 'POST', 1, 'admin', '项目一部', '/activity/color', '127.0.0.1', '内网IP', '{\"colorId\":2,\"departmentColor\":\"#80EB06\",\"departmentName\":\"云程四部\",\"params\":{},\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 15:48:47', 97);
INSERT INTO `sys_oper_log` VALUES (438, '请假管理', 1, 'com.ruoyi.leave.controller.SysLeaveController.add()', 'POST', 1, 'admin', '项目一部', '/leave/details', '127.0.0.1', '内网IP', '{\"approvalStatus\":0,\"deptId\":103,\"firstTime\":\"2025-04-16 00:00:00\",\"lastTime\":\"2025-04-17 00:00:00\",\"leaveForm\":\"/profile/upload/2025/04/15/图片1_20250415160744A001.png\",\"leaveId\":3,\"leaveReason\":\"1111\",\"leaveReserveA\":\"若依\",\"leaveReserveB\":\"双体精英产业学院-项目一部\",\"leaveType\":1,\"params\":{},\"timeType\":1,\"totalTime\":[\"2025-04-16 00:00:00\",\"2025-04-17 00:00:00\"],\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 16:07:56', 262);
INSERT INTO `sys_oper_log` VALUES (439, '行事历期数', 1, 'com.ruoyi.activity.controller.SysEventNumberController.add()', 'POST', 1, 'admin', '项目一部', '/activity/number', '127.0.0.1', '内网IP', '{\"number\":\"111\",\"numberDescribe\":\"111\",\"numberId\":3,\"numberTime\":\"2025-04-07\",\"numberWeeks\":6,\"params\":{},\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 16:10:19', 116);
INSERT INTO `sys_oper_log` VALUES (440, '行事历期数', 3, 'com.ruoyi.activity.controller.SysEventNumberController.remove()', 'DELETE', 1, 'admin', '项目一部', '/activity/number/3', '127.0.0.1', '内网IP', '[3]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 16:11:38', 76);
INSERT INTO `sys_oper_log` VALUES (441, '行事历期数', 1, 'com.ruoyi.activity.controller.SysEventNumberController.add()', 'POST', 1, 'admin', '项目一部', '/activity/number', '127.0.0.1', '内网IP', '{\"number\":\"111\",\"numberDescribe\":\"111\",\"numberId\":4,\"numberTime\":\"2025-04-15\",\"numberWeeks\":1,\"params\":{},\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 16:11:48', 58);
INSERT INTO `sys_oper_log` VALUES (442, '行事历期数', 3, 'com.ruoyi.activity.controller.SysEventNumberController.remove()', 'DELETE', 1, 'admin', '项目一部', '/activity/number/4', '127.0.0.1', '内网IP', '[4]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 16:49:55', 30);
INSERT INTO `sys_oper_log` VALUES (443, '行事历期数', 1, 'com.ruoyi.activity.controller.SysEventNumberController.add()', 'POST', 1, 'admin', '项目一部', '/activity/number', '127.0.0.1', '内网IP', '{\"number\":\"第九期\",\"numberDescribe\":\"相亲相爱\",\"numberId\":5,\"numberTime\":\"2025-02-24\",\"numberWeeks\":16,\"params\":{},\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 16:50:30', 86);
INSERT INTO `sys_oper_log` VALUES (444, '行事历周数时间', 3, 'com.ruoyi.activity.controller.SysEventTimeController.remove()', 'DELETE', 1, 'admin', '项目一部', '/activity/time/2', '127.0.0.1', '内网IP', '[2]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 16:52:16', 105);
INSERT INTO `sys_oper_log` VALUES (445, '行事历期数', 3, 'com.ruoyi.activity.controller.SysEventNumberController.remove()', 'DELETE', 1, 'admin', '项目一部', '/activity/number/5', '127.0.0.1', '内网IP', '[5]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 16:52:56', 102);
INSERT INTO `sys_oper_log` VALUES (446, '行事历期数', 1, 'com.ruoyi.activity.controller.SysEventNumberController.add()', 'POST', 1, 'admin', '项目一部', '/activity/number', '127.0.0.1', '内网IP', '{\"number\":\"第九期\",\"numberDescribe\":\"第九期\",\"numberId\":6,\"numberTime\":\"2025-02-24\",\"numberWeeks\":16,\"params\":{},\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 16:54:22', 200);
INSERT INTO `sys_oper_log` VALUES (447, '行事历期数', 3, 'com.ruoyi.activity.controller.SysEventNumberController.remove()', 'DELETE', 1, 'admin', '项目一部', '/activity/number/6', '127.0.0.1', '内网IP', '[6]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 16:54:58', 126);
INSERT INTO `sys_oper_log` VALUES (448, '行事历期数', 1, 'com.ruoyi.activity.controller.SysEventNumberController.add()', 'POST', 1, 'admin', '项目一部', '/activity/number', '127.0.0.1', '内网IP', '{\"number\":\"第九期\",\"numberDescribe\":\"第九期\",\"numberId\":7,\"numberTime\":\"2025-04-28\",\"numberWeeks\":16,\"params\":{},\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 16:55:12', 36);
INSERT INTO `sys_oper_log` VALUES (449, '行事历期数', 3, 'com.ruoyi.activity.controller.SysEventNumberController.remove()', 'DELETE', 1, 'admin', '项目一部', '/activity/number/7', '127.0.0.1', '内网IP', '[7]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 16:55:40', 99);
INSERT INTO `sys_oper_log` VALUES (450, '行事历期数', 1, 'com.ruoyi.activity.controller.SysEventNumberController.add()', 'POST', 1, 'admin', '项目一部', '/activity/number', '127.0.0.1', '内网IP', '{\"number\":\"第九期\",\"numberDescribe\":\"第九期\",\"numberId\":8,\"numberTime\":\"2025-02-24\",\"numberWeeks\":16,\"params\":{},\"userId\":1}', NULL, 1, 'Mapper method \'com.ruoyi.activity.mapper.SysEventNumberMapper.insertSysEventNumbers\' has an unsupported return type: class com.ruoyi.activity.domain.SysEventNumber', '2025-04-15 16:56:47', 207);
INSERT INTO `sys_oper_log` VALUES (451, '行事历期数', 1, 'com.ruoyi.activity.controller.SysEventNumberController.add()', 'POST', 1, 'admin', '项目一部', '/activity/number', '127.0.0.1', '内网IP', '{\"number\":\"第八期\",\"numberDescribe\":\"第八期\",\"numberId\":9,\"numberTime\":\"2025-02-24\",\"numberWeeks\":16,\"params\":{},\"userId\":1}', NULL, 1, '\r\n### Error querying database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'user_id\' in where clause is ambiguous\r\n### The error may exist in file [E:\\code\\dual-body-management-system\\ruoyi-activity\\target\\classes\\mapper\\activity\\SysEventNumberMapper.xml]\r\n### The error may involve com.ruoyi.activity.mapper.SysEventNumberMapper.selectSysEventNumberList-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select sen.number_id, sen.number, sen.number_describe, sen.number_weeks, sen.number_time, sen.user_id as e_user_id, sen.creat_time, u.user_name, u.nick_name         from sys_event_number sen         join sys_user u on sen.user_id = u.user_id                WHERE  number = ?              and number_describe = ?              and number_weeks = ?              and number_time = ?              and user_id = ?\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'user_id\' in where clause is ambiguous\n; Column \'user_id\' in where clause is ambiguous; nested exception is java.sql.SQLIntegrityConstraintViolationException: Column \'user_id\' in where clause is ambiguous', '2025-04-15 17:07:22', 205);
INSERT INTO `sys_oper_log` VALUES (452, '行事历期数', 1, 'com.ruoyi.activity.controller.SysEventNumberController.add()', 'POST', 1, 'admin', '项目一部', '/activity/number', '127.0.0.1', '内网IP', '{\"number\":\"第八期\",\"numberDescribe\":\"第八期\",\"numberId\":10,\"numberTime\":\"2025-02-24\",\"numberWeeks\":16,\"params\":{},\"userId\":1}', NULL, 1, '\r\n### Error querying database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'user_id\' in where clause is ambiguous\r\n### The error may exist in file [E:\\code\\dual-body-management-system\\ruoyi-activity\\target\\classes\\mapper\\activity\\SysEventNumberMapper.xml]\r\n### The error may involve com.ruoyi.activity.mapper.SysEventNumberMapper.selectSysEventNumberList-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select sen.number_id, sen.number, sen.number_describe, sen.number_weeks, sen.number_time, sen.user_id as e_user_id, sen.creat_time, u.user_name, u.nick_name         from sys_event_number sen         join sys_user u on sen.user_id = u.user_id                WHERE  number = ?              and number_describe = ?              and number_weeks = ?              and number_time = ?              and user_id = ?\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'user_id\' in where clause is ambiguous\n; Column \'user_id\' in where clause is ambiguous; nested exception is java.sql.SQLIntegrityConstraintViolationException: Column \'user_id\' in where clause is ambiguous', '2025-04-15 17:09:40', 239);
INSERT INTO `sys_oper_log` VALUES (453, '行事历期数', 1, 'com.ruoyi.activity.controller.SysEventNumberController.add()', 'POST', 1, 'admin', '项目一部', '/activity/number', '127.0.0.1', '内网IP', '{\"number\":\"第八期\",\"numberDescribe\":\"第八期\",\"numberId\":11,\"numberTime\":\"2025-02-24\",\"numberWeeks\":16,\"params\":{},\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 17:12:17', 332);
INSERT INTO `sys_oper_log` VALUES (454, '行事历期数', 3, 'com.ruoyi.activity.controller.SysEventNumberController.remove()', 'DELETE', 1, 'admin', '项目一部', '/activity/number/11', '127.0.0.1', '内网IP', '[11]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 17:34:48', 315);
INSERT INTO `sys_oper_log` VALUES (455, '行事历期数', 3, 'com.ruoyi.activity.controller.SysEventNumberController.remove()', 'DELETE', 1, 'admin', '项目一部', '/activity/number/2', '127.0.0.1', '内网IP', '[2]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 17:36:33', 134);
INSERT INTO `sys_oper_log` VALUES (456, '行事历期数', 1, 'com.ruoyi.activity.controller.SysEventNumberController.add()', 'POST', 1, 'admin', '项目一部', '/activity/number', '127.0.0.1', '内网IP', '{\"number\":\"第九期\",\"numberDescribe\":\"相亲相爱一家人\",\"numberId\":12,\"numberTime\":\"2025-02-24\",\"numberWeeks\":16,\"params\":{},\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 20:26:16', 108);
INSERT INTO `sys_oper_log` VALUES (457, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":4,\"configKey\":\"sys.account.captchaEnabled\",\"configName\":\"账号自助-验证码开关\",\"configType\":\"Y\",\"configValue\":\"false\",\"createBy\":\"admin\",\"createTime\":\"2025-03-10 17:54:48\",\"params\":{},\"remark\":\"是否开启验证码功能（true开启，false关闭）\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-16 09:16:37', 95);
INSERT INTO `sys_oper_log` VALUES (458, '行事历', 1, 'com.ruoyi.activity.controller.SysEventController.add()', 'POST', 1, 'admin', '项目一部', '/activity/event', '127.0.0.1', '内网IP', '{\"eventColor\":\"#409EFF\",\"eventDate\":\"2025-04-16\",\"eventId\":23,\"eventText\":\"111\",\"eventTimestamp\":1744772590274,\"numberId\":12,\"params\":{},\"slotId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-16 11:03:10', 263);
INSERT INTO `sys_oper_log` VALUES (459, '行事历', 3, 'com.ruoyi.activity.controller.SysEventController.remove()', 'DELETE', 1, 'admin', '项目一部', '/activity/event/23', '127.0.0.1', '内网IP', '[23]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-16 11:03:59', 45);
INSERT INTO `sys_oper_log` VALUES (460, '行事历', 1, 'com.ruoyi.activity.controller.SysEventController.add()', 'POST', 1, 'admin', '项目一部', '/activity/event', '127.0.0.1', '内网IP', '{\"eventColor\":\"#409EFF\",\"eventDate\":\"2025-04-16\",\"eventId\":24,\"eventText\":\"1111\",\"eventTimestamp\":1744772644280,\"eventWeeks\":8,\"numberId\":12,\"params\":{},\"slotId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-16 11:04:04', 29);
INSERT INTO `sys_oper_log` VALUES (461, '行事历', 3, 'com.ruoyi.activity.controller.SysEventController.remove()', 'DELETE', 1, 'admin', '项目一部', '/activity/event/24', '127.0.0.1', '内网IP', '[24]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-16 11:04:17', 72);
INSERT INTO `sys_oper_log` VALUES (462, '行事历', 3, 'com.ruoyi.activity.controller.SysEventController.remove()', 'DELETE', 1, 'admin', '项目一部', '/activity/event/26', '127.0.0.1', '内网IP', '[26]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-16 11:10:22', 43);
INSERT INTO `sys_oper_log` VALUES (463, '行事历', 1, 'com.ruoyi.activity.controller.SysEventController.add()', 'POST', 1, 'admin', '项目一部', '/activity/event', '127.0.0.1', '内网IP', '{\"eventColor\":\"#409EFF\",\"eventDate\":\"2025-04-16\",\"eventId\":27,\"eventText\":\"1111\",\"eventTimestamp\":1744773375567,\"eventWeeks\":8,\"numberId\":12,\"params\":{},\"slotId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-16 11:16:15', 191);
INSERT INTO `sys_oper_log` VALUES (464, '行事历', 1, 'com.ruoyi.activity.controller.SysEventController.add()', 'POST', 1, 'admin', '项目一部', '/activity/event', '127.0.0.1', '内网IP', '{\"eventColor\":\"#409EFF\",\"eventDate\":\"2025-04-16\",\"eventId\":28,\"eventText\":\"222\",\"eventTimestamp\":1744773379289,\"eventWeeks\":8,\"numberId\":12,\"params\":{},\"slotId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-16 11:16:19', 12);
INSERT INTO `sys_oper_log` VALUES (465, '行事历', 3, 'com.ruoyi.activity.controller.SysEventController.remove()', 'DELETE', 1, 'admin', '项目一部', '/activity/event/25', '127.0.0.1', '内网IP', '[25]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-16 11:16:22', 20);
INSERT INTO `sys_oper_log` VALUES (466, '行事历', 3, 'com.ruoyi.activity.controller.SysEventController.remove()', 'DELETE', 1, 'admin', '项目一部', '/activity/event/27', '127.0.0.1', '内网IP', '[27]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-16 11:16:23', 13);
INSERT INTO `sys_oper_log` VALUES (467, '行事历', 3, 'com.ruoyi.activity.controller.SysEventController.remove()', 'DELETE', 1, 'admin', '项目一部', '/activity/event/28', '127.0.0.1', '内网IP', '[28]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-16 11:16:23', 14);
INSERT INTO `sys_oper_log` VALUES (468, '行事历', 1, 'com.ruoyi.activity.controller.SysEventController.add()', 'POST', 1, 'admin', '项目一部', '/activity/event', '127.0.0.1', '内网IP', '{\"eventColor\":\"#409EFF\",\"eventDate\":\"2025-04-16\",\"eventId\":29,\"eventText\":\"111\",\"eventTimestamp\":1744773558244,\"eventWeeks\":8,\"numberId\":12,\"params\":{},\"slotId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-16 11:19:18', 12);
INSERT INTO `sys_oper_log` VALUES (469, '行事历', 3, 'com.ruoyi.activity.controller.SysEventController.remove()', 'DELETE', 1, 'admin', '项目一部', '/activity/event/29', '127.0.0.1', '内网IP', '[29]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-16 11:19:20', 16);
INSERT INTO `sys_oper_log` VALUES (470, '行事历', 1, 'com.ruoyi.activity.controller.SysEventController.add()', 'POST', 1, 'admin', '项目一部', '/activity/event', '127.0.0.1', '内网IP', '{\"eventColor\":\"#409EFF\",\"eventDate\":\"2025-04-16\",\"eventId\":30,\"eventText\":\"测试\",\"eventTimestamp\":1744773628267,\"eventWeeks\":8,\"numberId\":12,\"params\":{},\"slotId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-16 11:20:28', 80);
INSERT INTO `sys_oper_log` VALUES (471, '行事历', 1, 'com.ruoyi.activity.controller.SysEventController.add()', 'POST', 1, 'admin', '项目一部', '/activity/event', '127.0.0.1', '内网IP', '{\"eventColor\":\"#409EFF\",\"eventDate\":\"2025-04-23\",\"eventId\":31,\"eventText\":\"111\",\"eventTimestamp\":1744774642204,\"eventWeeks\":9,\"numberId\":12,\"params\":{},\"slotId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-16 11:37:22', 15);
INSERT INTO `sys_oper_log` VALUES (472, '行事历', 3, 'com.ruoyi.activity.controller.SysEventController.remove()', 'DELETE', 1, 'admin', '项目一部', '/activity/event/31', '127.0.0.1', '内网IP', '[31]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-16 11:37:28', 30);
INSERT INTO `sys_oper_log` VALUES (473, '行事历', 1, 'com.ruoyi.activity.controller.SysEventController.add()', 'POST', 1, 'admin', '项目一部', '/activity/event', '127.0.0.1', '内网IP', '{\"eventColor\":\"#409EFF\",\"eventDate\":\"2025-05-07\",\"eventId\":32,\"eventText\":\"1111\",\"eventTimestamp\":1744774749886,\"eventWeeks\":11,\"numberId\":12,\"params\":{},\"slotId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-16 11:39:09', 59);
INSERT INTO `sys_oper_log` VALUES (474, '行事历', 3, 'com.ruoyi.activity.controller.SysEventController.remove()', 'DELETE', 1, 'admin', '项目一部', '/activity/event/32', '127.0.0.1', '内网IP', '[32]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-16 11:39:19', 48);
INSERT INTO `sys_oper_log` VALUES (475, '行事历', 3, 'com.ruoyi.activity.controller.SysEventController.remove()', 'DELETE', 1, 'admin', '项目一部', '/activity/event/30', '127.0.0.1', '内网IP', '[30]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-16 13:52:42', 15);
INSERT INTO `sys_oper_log` VALUES (476, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '项目一部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"date\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"行事历查看\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2042,\"path\":\"userss\",\"perms\":\"activity:event:listCalendar\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-16 13:58:04', 108);
INSERT INTO `sys_oper_log` VALUES (477, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"activity/calendar/indexView\",\"createTime\":\"2025-04-16 13:58:04\",\"icon\":\"date\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2110,\"menuName\":\"行事历查看\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2042,\"path\":\"calendarView\",\"perms\":\"activity:event:listCalendar\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-16 13:59:11', 13);
INSERT INTO `sys_oper_log` VALUES (478, '行事历', 1, 'com.ruoyi.activity.controller.SysEventController.add()', 'POST', 1, 'admin', '项目一部', '/activity/event', '127.0.0.1', '内网IP', '{\"eventColor\":\"#409EFF\",\"eventDate\":\"2025-02-26\",\"eventId\":33,\"eventText\":\"111\",\"eventTimestamp\":1744783738955,\"eventWeeks\":1,\"numberId\":12,\"params\":{},\"slotId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-16 14:08:59', 70);
INSERT INTO `sys_oper_log` VALUES (479, '行事历', 3, 'com.ruoyi.activity.controller.SysEventController.remove()', 'DELETE', 1, 'admin', '项目一部', '/activity/event/33', '127.0.0.1', '内网IP', '[33]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-16 14:09:02', 14);
INSERT INTO `sys_oper_log` VALUES (480, '行事历', 1, 'com.ruoyi.activity.controller.SysEventController.add()', 'POST', 1, 'admin', '项目一部', '/activity/event', '127.0.0.1', '内网IP', '{\"eventColor\":\"#409EFF\",\"eventDate\":\"2025-04-16\",\"eventId\":34,\"eventText\":\"测试\",\"eventTimestamp\":1744783812110,\"eventWeeks\":8,\"numberId\":12,\"params\":{},\"slotId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-16 14:10:12', 27);
INSERT INTO `sys_oper_log` VALUES (481, '行事历', 1, 'com.ruoyi.activity.controller.SysEventController.add()', 'POST', 1, 'admin', '项目一部', '/activity/event', '127.0.0.1', '内网IP', '{\"eventColor\":\"#409EFF\",\"eventDate\":\"2025-04-26\",\"eventId\":35,\"eventText\":\"测试\",\"eventTimestamp\":1744783819571,\"eventWeeks\":9,\"numberId\":12,\"params\":{},\"slotId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-16 14:10:19', 46);
INSERT INTO `sys_oper_log` VALUES (482, '行事历', 1, 'com.ruoyi.activity.controller.SysEventController.add()', 'POST', 1, 'admin', '项目一部', '/activity/event', '127.0.0.1', '内网IP', '{\"eventColor\":\"#1CD9B3\",\"eventDate\":\"2025-05-03\",\"eventId\":36,\"eventText\":\"测试\",\"eventTimestamp\":1744783829372,\"eventWeeks\":10,\"numberId\":12,\"params\":{},\"slotId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-16 14:10:29', 47);
INSERT INTO `sys_oper_log` VALUES (483, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"activity/time/index\",\"createTime\":\"2025-04-15 14:33:27\",\"icon\":\"date\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2098,\"menuName\":\"行事历周数\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2042,\"path\":\"time\",\"perms\":\"activity:time:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-16 14:11:19', 72);
INSERT INTO `sys_oper_log` VALUES (484, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"activity/color/index\",\"createTime\":\"2025-04-15 14:33:38\",\"icon\":\"color\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2104,\"menuName\":\"行事历颜色\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2042,\"path\":\"color\",\"perms\":\"activity:color:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-16 14:11:24', 15);
INSERT INTO `sys_oper_log` VALUES (485, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '项目一部', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"activity/calendar/indexView\",\"createTime\":\"2025-04-16 13:58:04\",\"icon\":\"date\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2110,\"menuName\":\"行事历查看\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2042,\"path\":\"calendarView\",\"perms\":\"activity:event:listCalendar\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-16 14:11:28', 15);
INSERT INTO `sys_oper_log` VALUES (486, '行事历期数', 1, 'com.ruoyi.activity.controller.SysEventNumberController.add()', 'POST', 1, 'admin', '项目一部', '/activity/number', '127.0.0.1', '内网IP', '{\"number\":\"第九期\",\"numberDescribe\":\"相亲相爱\",\"numberId\":13,\"numberTime\":\"2025-04-07\",\"numberWeeks\":16,\"params\":{},\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-16 14:18:23', 181);
INSERT INTO `sys_oper_log` VALUES (487, '行事历期数', 3, 'com.ruoyi.activity.controller.SysEventNumberController.remove()', 'DELETE', 1, 'admin', '项目一部', '/activity/number/13', '127.0.0.1', '内网IP', '[13]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-16 14:23:18', 92);
INSERT INTO `sys_oper_log` VALUES (488, '行事历期数', 1, 'com.ruoyi.activity.controller.SysEventNumberController.add()', 'POST', 1, 'admin', '项目一部', '/activity/number', '127.0.0.1', '内网IP', '{\"number\":\"111\",\"numberDescribe\":\"111\",\"numberTime\":\"2025-04-16\",\"numberWeeks\":6,\"params\":{}}', '{\"msg\":\"开学日期请选择周一\",\"code\":500}', 0, NULL, '2025-04-16 14:44:35', 12);
INSERT INTO `sys_oper_log` VALUES (489, '行事历周数时间', 2, 'com.ruoyi.activity.controller.SysEventTimeController.edit()', 'PUT', 1, 'admin', '项目一部', '/activity/time', '127.0.0.1', '内网IP', '{\"creatTime\":\"2025-04-15 20:26:16\",\"eventWeeks\":1,\"mondayDate\":\"2025-02-25\",\"number\":{\"numberWeeks\":16,\"params\":{}},\"numberId\":12,\"params\":{},\"sundayDate\":\"2025-03-02\",\"timeId\":19,\"user\":{\"admin\":false,\"nickName\":\"若依\",\"params\":{},\"userName\":\"admin\"},\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-16 14:51:08', 123);
INSERT INTO `sys_oper_log` VALUES (490, '行事历周数时间', 2, 'com.ruoyi.activity.controller.SysEventTimeController.edit()', 'PUT', 1, 'admin', '项目一部', '/activity/time', '127.0.0.1', '内网IP', '{\"creatTime\":\"2025-04-15 20:26:16\",\"eventWeeks\":1,\"mondayDate\":\"2025-02-24\",\"number\":{\"numberWeeks\":16,\"params\":{}},\"numberId\":12,\"params\":{},\"sundayDate\":\"2025-03-02\",\"timeId\":19,\"user\":{\"admin\":false,\"nickName\":\"若依\",\"params\":{},\"userName\":\"admin\"},\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-16 14:51:21', 50);
INSERT INTO `sys_oper_log` VALUES (491, '行事历周数时间', 2, 'com.ruoyi.activity.controller.SysEventTimeController.edit()', 'PUT', 1, 'admin', '项目一部', '/activity/time', '127.0.0.1', '内网IP', '{\"creatTime\":\"2025-04-15 20:26:16\",\"eventWeeks\":1,\"mondayDate\":\"2025-02-25\",\"number\":{\"numberWeeks\":16,\"params\":{}},\"numberId\":12,\"params\":{},\"sundayDate\":\"2025-03-02\",\"timeId\":19,\"user\":{\"admin\":false,\"nickName\":\"若依\",\"params\":{},\"userName\":\"admin\"},\"userId\":1}', '{\"msg\":\"周一日期必须是周一\",\"code\":500}', 0, NULL, '2025-04-16 14:52:32', 24);
INSERT INTO `sys_oper_log` VALUES (492, '字典类型', 9, 'com.ruoyi.web.controller.system.SysDictTypeController.refreshCache()', 'DELETE', 1, 'admin', '项目一部', '/system/dict/type/refreshCache', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-17 09:30:43', 57);
INSERT INTO `sys_oper_log` VALUES (493, '字典类型', 5, 'com.ruoyi.web.controller.system.SysDictTypeController.export()', 'POST', 1, 'admin', '项目一部', '/system/dict/type/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"2\"}', NULL, 0, NULL, '2025-04-17 09:30:47', 1155);
INSERT INTO `sys_oper_log` VALUES (494, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '项目一部', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"请假类型\",\"dictType\":\"sys_leave_type\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-17 09:35:57', 129);
INSERT INTO `sys_oper_log` VALUES (495, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '项目一部', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"审核状态\",\"dictType\":\"sys_leave_approval\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-17 09:36:31', 62);
INSERT INTO `sys_oper_log` VALUES (496, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '项目一部', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"请假时间类型\",\"dictType\":\"sys_leave_time\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-17 09:36:58', 89);
INSERT INTO `sys_oper_log` VALUES (497, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '项目一部', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"八小时以上\",\"dictSort\":2,\"dictType\":\"sys_leave_time\",\"dictValue\":\"3\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-17 09:37:48', 113);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(11) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'WorkplaceTeacher', '职场老师', 1, '0', 'admin', '2025-03-10 17:54:47', 'admin', '2025-03-10 18:43:55', '');
INSERT INTO `sys_post` VALUES (2, 'PinxuanSupervisor', '品轩主管', 2, '0', 'admin', '2025-03-10 17:54:47', 'admin', '2025-03-10 18:44:49', '');
INSERT INTO `sys_post` VALUES (3, 'Treasurer', '财务主管', 3, '0', 'admin', '2025-03-10 17:54:47', 'admin', '2025-03-10 18:46:16', '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2025-03-10 17:54:47', '', NULL, '');
INSERT INTO `sys_post` VALUES (5, 'TechnicalTeacher', '技术老师', 5, '0', 'admin', '2025-03-10 18:43:11', '', NULL, NULL);
INSERT INTO `sys_post` VALUES (6, 'TechnicalSupervisor', '技术主管', 6, '0', 'admin', '2025-03-10 18:47:19', '', NULL, NULL);
INSERT INTO `sys_post` VALUES (7, 'HeadofPersonnel', '人事主管', 7, '0', 'admin', '2025-03-10 18:48:52', '', NULL, NULL);
INSERT INTO `sys_post` VALUES (8, 'HeadofAdministration', '行政主管', 8, '0', 'admin', '2025-03-10 18:49:23', '', NULL, NULL);
INSERT INTO `sys_post` VALUES (9, 'Leader', '组长', 9, '0', 'admin', '2025-03-10 18:54:38', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(11) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2025-03-10 17:54:47', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '1', 1, 1, '0', '0', 'admin', '2025-03-10 17:54:47', 'admin', '2025-04-15 10:13:45', '普通角色');
INSERT INTO `sys_role` VALUES (100, '老师管理', 'terman', 3, '1', 1, 1, '0', '0', 'admin', '2025-03-10 19:00:48', 'admin', '2025-04-15 10:13:51', NULL);
INSERT INTO `sys_role` VALUES (101, '学生主管', 'stuman', 4, '1', 1, 1, '0', '0', 'admin', '2025-03-10 19:06:45', 'admin', '2025-04-15 10:13:57', NULL);
INSERT INTO `sys_role` VALUES (102, '学生组长', 'groupLeader', 5, '1', 1, 1, '0', '0', 'admin', '2025-03-31 19:48:09', 'admin', '2025-04-15 10:14:04', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 2000);
INSERT INTO `sys_role_menu` VALUES (2, 2013);
INSERT INTO `sys_role_menu` VALUES (2, 2014);
INSERT INTO `sys_role_menu` VALUES (2, 2015);
INSERT INTO `sys_role_menu` VALUES (2, 2016);
INSERT INTO `sys_role_menu` VALUES (2, 2017);
INSERT INTO `sys_role_menu` VALUES (2, 2018);
INSERT INTO `sys_role_menu` VALUES (2, 2019);
INSERT INTO `sys_role_menu` VALUES (2, 2020);
INSERT INTO `sys_role_menu` VALUES (2, 2021);
INSERT INTO `sys_role_menu` VALUES (2, 2022);
INSERT INTO `sys_role_menu` VALUES (2, 2023);
INSERT INTO `sys_role_menu` VALUES (2, 2024);
INSERT INTO `sys_role_menu` VALUES (2, 2031);
INSERT INTO `sys_role_menu` VALUES (2, 2032);
INSERT INTO `sys_role_menu` VALUES (2, 2033);
INSERT INTO `sys_role_menu` VALUES (2, 2034);
INSERT INTO `sys_role_menu` VALUES (2, 2035);
INSERT INTO `sys_role_menu` VALUES (2, 2036);
INSERT INTO `sys_role_menu` VALUES (2, 2037);
INSERT INTO `sys_role_menu` VALUES (2, 2039);
INSERT INTO `sys_role_menu` VALUES (2, 2040);
INSERT INTO `sys_role_menu` VALUES (2, 2041);
INSERT INTO `sys_role_menu` VALUES (2, 2042);
INSERT INTO `sys_role_menu` VALUES (2, 2044);
INSERT INTO `sys_role_menu` VALUES (2, 2045);
INSERT INTO `sys_role_menu` VALUES (2, 2046);
INSERT INTO `sys_role_menu` VALUES (2, 2047);
INSERT INTO `sys_role_menu` VALUES (2, 2048);
INSERT INTO `sys_role_menu` VALUES (2, 2049);
INSERT INTO `sys_role_menu` VALUES (2, 2050);
INSERT INTO `sys_role_menu` VALUES (2, 2051);
INSERT INTO `sys_role_menu` VALUES (2, 2052);
INSERT INTO `sys_role_menu` VALUES (2, 2053);
INSERT INTO `sys_role_menu` VALUES (2, 2054);
INSERT INTO `sys_role_menu` VALUES (2, 2055);
INSERT INTO `sys_role_menu` VALUES (2, 2056);
INSERT INTO `sys_role_menu` VALUES (2, 2072);
INSERT INTO `sys_role_menu` VALUES (2, 2073);
INSERT INTO `sys_role_menu` VALUES (2, 2074);
INSERT INTO `sys_role_menu` VALUES (2, 2075);
INSERT INTO `sys_role_menu` VALUES (2, 2076);
INSERT INTO `sys_role_menu` VALUES (2, 2077);
INSERT INTO `sys_role_menu` VALUES (2, 2078);
INSERT INTO `sys_role_menu` VALUES (2, 2085);
INSERT INTO `sys_role_menu` VALUES (2, 2086);
INSERT INTO `sys_role_menu` VALUES (2, 2087);
INSERT INTO `sys_role_menu` VALUES (2, 2088);
INSERT INTO `sys_role_menu` VALUES (2, 2089);
INSERT INTO `sys_role_menu` VALUES (2, 2090);
INSERT INTO `sys_role_menu` VALUES (2, 2091);
INSERT INTO `sys_role_menu` VALUES (2, 2092);
INSERT INTO `sys_role_menu` VALUES (2, 2093);
INSERT INTO `sys_role_menu` VALUES (2, 2094);
INSERT INTO `sys_role_menu` VALUES (2, 2095);
INSERT INTO `sys_role_menu` VALUES (2, 2096);
INSERT INTO `sys_role_menu` VALUES (100, 1);
INSERT INTO `sys_role_menu` VALUES (100, 2);
INSERT INTO `sys_role_menu` VALUES (100, 3);
INSERT INTO `sys_role_menu` VALUES (100, 100);
INSERT INTO `sys_role_menu` VALUES (100, 101);
INSERT INTO `sys_role_menu` VALUES (100, 102);
INSERT INTO `sys_role_menu` VALUES (100, 103);
INSERT INTO `sys_role_menu` VALUES (100, 104);
INSERT INTO `sys_role_menu` VALUES (100, 105);
INSERT INTO `sys_role_menu` VALUES (100, 106);
INSERT INTO `sys_role_menu` VALUES (100, 107);
INSERT INTO `sys_role_menu` VALUES (100, 108);
INSERT INTO `sys_role_menu` VALUES (100, 109);
INSERT INTO `sys_role_menu` VALUES (100, 110);
INSERT INTO `sys_role_menu` VALUES (100, 111);
INSERT INTO `sys_role_menu` VALUES (100, 112);
INSERT INTO `sys_role_menu` VALUES (100, 113);
INSERT INTO `sys_role_menu` VALUES (100, 114);
INSERT INTO `sys_role_menu` VALUES (100, 115);
INSERT INTO `sys_role_menu` VALUES (100, 116);
INSERT INTO `sys_role_menu` VALUES (100, 117);
INSERT INTO `sys_role_menu` VALUES (100, 500);
INSERT INTO `sys_role_menu` VALUES (100, 501);
INSERT INTO `sys_role_menu` VALUES (100, 1000);
INSERT INTO `sys_role_menu` VALUES (100, 1001);
INSERT INTO `sys_role_menu` VALUES (100, 1002);
INSERT INTO `sys_role_menu` VALUES (100, 1003);
INSERT INTO `sys_role_menu` VALUES (100, 1004);
INSERT INTO `sys_role_menu` VALUES (100, 1005);
INSERT INTO `sys_role_menu` VALUES (100, 1006);
INSERT INTO `sys_role_menu` VALUES (100, 1007);
INSERT INTO `sys_role_menu` VALUES (100, 1008);
INSERT INTO `sys_role_menu` VALUES (100, 1009);
INSERT INTO `sys_role_menu` VALUES (100, 1010);
INSERT INTO `sys_role_menu` VALUES (100, 1011);
INSERT INTO `sys_role_menu` VALUES (100, 1012);
INSERT INTO `sys_role_menu` VALUES (100, 1013);
INSERT INTO `sys_role_menu` VALUES (100, 1014);
INSERT INTO `sys_role_menu` VALUES (100, 1015);
INSERT INTO `sys_role_menu` VALUES (100, 1016);
INSERT INTO `sys_role_menu` VALUES (100, 1017);
INSERT INTO `sys_role_menu` VALUES (100, 1018);
INSERT INTO `sys_role_menu` VALUES (100, 1019);
INSERT INTO `sys_role_menu` VALUES (100, 1020);
INSERT INTO `sys_role_menu` VALUES (100, 1021);
INSERT INTO `sys_role_menu` VALUES (100, 1022);
INSERT INTO `sys_role_menu` VALUES (100, 1023);
INSERT INTO `sys_role_menu` VALUES (100, 1024);
INSERT INTO `sys_role_menu` VALUES (100, 1025);
INSERT INTO `sys_role_menu` VALUES (100, 1026);
INSERT INTO `sys_role_menu` VALUES (100, 1027);
INSERT INTO `sys_role_menu` VALUES (100, 1028);
INSERT INTO `sys_role_menu` VALUES (100, 1029);
INSERT INTO `sys_role_menu` VALUES (100, 1030);
INSERT INTO `sys_role_menu` VALUES (100, 1031);
INSERT INTO `sys_role_menu` VALUES (100, 1032);
INSERT INTO `sys_role_menu` VALUES (100, 1033);
INSERT INTO `sys_role_menu` VALUES (100, 1034);
INSERT INTO `sys_role_menu` VALUES (100, 1035);
INSERT INTO `sys_role_menu` VALUES (100, 1036);
INSERT INTO `sys_role_menu` VALUES (100, 1037);
INSERT INTO `sys_role_menu` VALUES (100, 1038);
INSERT INTO `sys_role_menu` VALUES (100, 1039);
INSERT INTO `sys_role_menu` VALUES (100, 1040);
INSERT INTO `sys_role_menu` VALUES (100, 1041);
INSERT INTO `sys_role_menu` VALUES (100, 1042);
INSERT INTO `sys_role_menu` VALUES (100, 1043);
INSERT INTO `sys_role_menu` VALUES (100, 1044);
INSERT INTO `sys_role_menu` VALUES (100, 1045);
INSERT INTO `sys_role_menu` VALUES (100, 1046);
INSERT INTO `sys_role_menu` VALUES (100, 1047);
INSERT INTO `sys_role_menu` VALUES (100, 1048);
INSERT INTO `sys_role_menu` VALUES (100, 1049);
INSERT INTO `sys_role_menu` VALUES (100, 1050);
INSERT INTO `sys_role_menu` VALUES (100, 1051);
INSERT INTO `sys_role_menu` VALUES (100, 1052);
INSERT INTO `sys_role_menu` VALUES (100, 1053);
INSERT INTO `sys_role_menu` VALUES (100, 1054);
INSERT INTO `sys_role_menu` VALUES (100, 1055);
INSERT INTO `sys_role_menu` VALUES (100, 1056);
INSERT INTO `sys_role_menu` VALUES (100, 1057);
INSERT INTO `sys_role_menu` VALUES (100, 1058);
INSERT INTO `sys_role_menu` VALUES (100, 1059);
INSERT INTO `sys_role_menu` VALUES (100, 1060);
INSERT INTO `sys_role_menu` VALUES (100, 2000);
INSERT INTO `sys_role_menu` VALUES (100, 2013);
INSERT INTO `sys_role_menu` VALUES (100, 2014);
INSERT INTO `sys_role_menu` VALUES (100, 2015);
INSERT INTO `sys_role_menu` VALUES (100, 2016);
INSERT INTO `sys_role_menu` VALUES (100, 2017);
INSERT INTO `sys_role_menu` VALUES (100, 2018);
INSERT INTO `sys_role_menu` VALUES (100, 2019);
INSERT INTO `sys_role_menu` VALUES (100, 2020);
INSERT INTO `sys_role_menu` VALUES (100, 2021);
INSERT INTO `sys_role_menu` VALUES (100, 2022);
INSERT INTO `sys_role_menu` VALUES (100, 2023);
INSERT INTO `sys_role_menu` VALUES (100, 2024);
INSERT INTO `sys_role_menu` VALUES (100, 2031);
INSERT INTO `sys_role_menu` VALUES (100, 2032);
INSERT INTO `sys_role_menu` VALUES (100, 2033);
INSERT INTO `sys_role_menu` VALUES (100, 2034);
INSERT INTO `sys_role_menu` VALUES (100, 2035);
INSERT INTO `sys_role_menu` VALUES (100, 2036);
INSERT INTO `sys_role_menu` VALUES (100, 2037);
INSERT INTO `sys_role_menu` VALUES (100, 2039);
INSERT INTO `sys_role_menu` VALUES (100, 2040);
INSERT INTO `sys_role_menu` VALUES (100, 2041);
INSERT INTO `sys_role_menu` VALUES (100, 2042);
INSERT INTO `sys_role_menu` VALUES (100, 2044);
INSERT INTO `sys_role_menu` VALUES (100, 2045);
INSERT INTO `sys_role_menu` VALUES (100, 2046);
INSERT INTO `sys_role_menu` VALUES (100, 2047);
INSERT INTO `sys_role_menu` VALUES (100, 2048);
INSERT INTO `sys_role_menu` VALUES (100, 2049);
INSERT INTO `sys_role_menu` VALUES (100, 2050);
INSERT INTO `sys_role_menu` VALUES (100, 2051);
INSERT INTO `sys_role_menu` VALUES (100, 2052);
INSERT INTO `sys_role_menu` VALUES (100, 2053);
INSERT INTO `sys_role_menu` VALUES (100, 2054);
INSERT INTO `sys_role_menu` VALUES (100, 2055);
INSERT INTO `sys_role_menu` VALUES (100, 2056);
INSERT INTO `sys_role_menu` VALUES (100, 2072);
INSERT INTO `sys_role_menu` VALUES (100, 2073);
INSERT INTO `sys_role_menu` VALUES (100, 2074);
INSERT INTO `sys_role_menu` VALUES (100, 2075);
INSERT INTO `sys_role_menu` VALUES (100, 2076);
INSERT INTO `sys_role_menu` VALUES (100, 2077);
INSERT INTO `sys_role_menu` VALUES (100, 2078);
INSERT INTO `sys_role_menu` VALUES (100, 2085);
INSERT INTO `sys_role_menu` VALUES (100, 2086);
INSERT INTO `sys_role_menu` VALUES (100, 2087);
INSERT INTO `sys_role_menu` VALUES (100, 2088);
INSERT INTO `sys_role_menu` VALUES (100, 2089);
INSERT INTO `sys_role_menu` VALUES (100, 2090);
INSERT INTO `sys_role_menu` VALUES (100, 2091);
INSERT INTO `sys_role_menu` VALUES (100, 2092);
INSERT INTO `sys_role_menu` VALUES (100, 2093);
INSERT INTO `sys_role_menu` VALUES (100, 2094);
INSERT INTO `sys_role_menu` VALUES (100, 2095);
INSERT INTO `sys_role_menu` VALUES (100, 2096);
INSERT INTO `sys_role_menu` VALUES (101, 1);
INSERT INTO `sys_role_menu` VALUES (101, 2);
INSERT INTO `sys_role_menu` VALUES (101, 3);
INSERT INTO `sys_role_menu` VALUES (101, 100);
INSERT INTO `sys_role_menu` VALUES (101, 101);
INSERT INTO `sys_role_menu` VALUES (101, 102);
INSERT INTO `sys_role_menu` VALUES (101, 103);
INSERT INTO `sys_role_menu` VALUES (101, 104);
INSERT INTO `sys_role_menu` VALUES (101, 105);
INSERT INTO `sys_role_menu` VALUES (101, 106);
INSERT INTO `sys_role_menu` VALUES (101, 107);
INSERT INTO `sys_role_menu` VALUES (101, 108);
INSERT INTO `sys_role_menu` VALUES (101, 109);
INSERT INTO `sys_role_menu` VALUES (101, 110);
INSERT INTO `sys_role_menu` VALUES (101, 111);
INSERT INTO `sys_role_menu` VALUES (101, 112);
INSERT INTO `sys_role_menu` VALUES (101, 113);
INSERT INTO `sys_role_menu` VALUES (101, 114);
INSERT INTO `sys_role_menu` VALUES (101, 115);
INSERT INTO `sys_role_menu` VALUES (101, 116);
INSERT INTO `sys_role_menu` VALUES (101, 117);
INSERT INTO `sys_role_menu` VALUES (101, 500);
INSERT INTO `sys_role_menu` VALUES (101, 501);
INSERT INTO `sys_role_menu` VALUES (101, 1000);
INSERT INTO `sys_role_menu` VALUES (101, 1001);
INSERT INTO `sys_role_menu` VALUES (101, 1002);
INSERT INTO `sys_role_menu` VALUES (101, 1003);
INSERT INTO `sys_role_menu` VALUES (101, 1004);
INSERT INTO `sys_role_menu` VALUES (101, 1005);
INSERT INTO `sys_role_menu` VALUES (101, 1006);
INSERT INTO `sys_role_menu` VALUES (101, 1007);
INSERT INTO `sys_role_menu` VALUES (101, 1008);
INSERT INTO `sys_role_menu` VALUES (101, 1009);
INSERT INTO `sys_role_menu` VALUES (101, 1010);
INSERT INTO `sys_role_menu` VALUES (101, 1011);
INSERT INTO `sys_role_menu` VALUES (101, 1012);
INSERT INTO `sys_role_menu` VALUES (101, 1013);
INSERT INTO `sys_role_menu` VALUES (101, 1014);
INSERT INTO `sys_role_menu` VALUES (101, 1015);
INSERT INTO `sys_role_menu` VALUES (101, 1016);
INSERT INTO `sys_role_menu` VALUES (101, 1017);
INSERT INTO `sys_role_menu` VALUES (101, 1018);
INSERT INTO `sys_role_menu` VALUES (101, 1019);
INSERT INTO `sys_role_menu` VALUES (101, 1020);
INSERT INTO `sys_role_menu` VALUES (101, 1021);
INSERT INTO `sys_role_menu` VALUES (101, 1022);
INSERT INTO `sys_role_menu` VALUES (101, 1023);
INSERT INTO `sys_role_menu` VALUES (101, 1024);
INSERT INTO `sys_role_menu` VALUES (101, 1025);
INSERT INTO `sys_role_menu` VALUES (101, 1026);
INSERT INTO `sys_role_menu` VALUES (101, 1027);
INSERT INTO `sys_role_menu` VALUES (101, 1028);
INSERT INTO `sys_role_menu` VALUES (101, 1029);
INSERT INTO `sys_role_menu` VALUES (101, 1030);
INSERT INTO `sys_role_menu` VALUES (101, 1031);
INSERT INTO `sys_role_menu` VALUES (101, 1032);
INSERT INTO `sys_role_menu` VALUES (101, 1033);
INSERT INTO `sys_role_menu` VALUES (101, 1034);
INSERT INTO `sys_role_menu` VALUES (101, 1035);
INSERT INTO `sys_role_menu` VALUES (101, 1036);
INSERT INTO `sys_role_menu` VALUES (101, 1037);
INSERT INTO `sys_role_menu` VALUES (101, 1038);
INSERT INTO `sys_role_menu` VALUES (101, 1039);
INSERT INTO `sys_role_menu` VALUES (101, 1040);
INSERT INTO `sys_role_menu` VALUES (101, 1041);
INSERT INTO `sys_role_menu` VALUES (101, 1042);
INSERT INTO `sys_role_menu` VALUES (101, 1043);
INSERT INTO `sys_role_menu` VALUES (101, 1044);
INSERT INTO `sys_role_menu` VALUES (101, 1045);
INSERT INTO `sys_role_menu` VALUES (101, 1046);
INSERT INTO `sys_role_menu` VALUES (101, 1047);
INSERT INTO `sys_role_menu` VALUES (101, 1048);
INSERT INTO `sys_role_menu` VALUES (101, 1049);
INSERT INTO `sys_role_menu` VALUES (101, 1050);
INSERT INTO `sys_role_menu` VALUES (101, 1051);
INSERT INTO `sys_role_menu` VALUES (101, 1052);
INSERT INTO `sys_role_menu` VALUES (101, 1053);
INSERT INTO `sys_role_menu` VALUES (101, 1054);
INSERT INTO `sys_role_menu` VALUES (101, 1055);
INSERT INTO `sys_role_menu` VALUES (101, 1056);
INSERT INTO `sys_role_menu` VALUES (101, 1057);
INSERT INTO `sys_role_menu` VALUES (101, 1058);
INSERT INTO `sys_role_menu` VALUES (101, 1059);
INSERT INTO `sys_role_menu` VALUES (101, 1060);
INSERT INTO `sys_role_menu` VALUES (101, 2000);
INSERT INTO `sys_role_menu` VALUES (101, 2013);
INSERT INTO `sys_role_menu` VALUES (101, 2014);
INSERT INTO `sys_role_menu` VALUES (101, 2015);
INSERT INTO `sys_role_menu` VALUES (101, 2016);
INSERT INTO `sys_role_menu` VALUES (101, 2017);
INSERT INTO `sys_role_menu` VALUES (101, 2018);
INSERT INTO `sys_role_menu` VALUES (101, 2019);
INSERT INTO `sys_role_menu` VALUES (101, 2020);
INSERT INTO `sys_role_menu` VALUES (101, 2021);
INSERT INTO `sys_role_menu` VALUES (101, 2022);
INSERT INTO `sys_role_menu` VALUES (101, 2023);
INSERT INTO `sys_role_menu` VALUES (101, 2024);
INSERT INTO `sys_role_menu` VALUES (101, 2031);
INSERT INTO `sys_role_menu` VALUES (101, 2032);
INSERT INTO `sys_role_menu` VALUES (101, 2033);
INSERT INTO `sys_role_menu` VALUES (101, 2034);
INSERT INTO `sys_role_menu` VALUES (101, 2035);
INSERT INTO `sys_role_menu` VALUES (101, 2036);
INSERT INTO `sys_role_menu` VALUES (101, 2037);
INSERT INTO `sys_role_menu` VALUES (101, 2039);
INSERT INTO `sys_role_menu` VALUES (101, 2040);
INSERT INTO `sys_role_menu` VALUES (101, 2041);
INSERT INTO `sys_role_menu` VALUES (101, 2042);
INSERT INTO `sys_role_menu` VALUES (101, 2044);
INSERT INTO `sys_role_menu` VALUES (101, 2045);
INSERT INTO `sys_role_menu` VALUES (101, 2046);
INSERT INTO `sys_role_menu` VALUES (101, 2047);
INSERT INTO `sys_role_menu` VALUES (101, 2048);
INSERT INTO `sys_role_menu` VALUES (101, 2049);
INSERT INTO `sys_role_menu` VALUES (101, 2050);
INSERT INTO `sys_role_menu` VALUES (101, 2051);
INSERT INTO `sys_role_menu` VALUES (101, 2052);
INSERT INTO `sys_role_menu` VALUES (101, 2053);
INSERT INTO `sys_role_menu` VALUES (101, 2054);
INSERT INTO `sys_role_menu` VALUES (101, 2055);
INSERT INTO `sys_role_menu` VALUES (101, 2056);
INSERT INTO `sys_role_menu` VALUES (101, 2072);
INSERT INTO `sys_role_menu` VALUES (101, 2073);
INSERT INTO `sys_role_menu` VALUES (101, 2074);
INSERT INTO `sys_role_menu` VALUES (101, 2075);
INSERT INTO `sys_role_menu` VALUES (101, 2076);
INSERT INTO `sys_role_menu` VALUES (101, 2077);
INSERT INTO `sys_role_menu` VALUES (101, 2078);
INSERT INTO `sys_role_menu` VALUES (101, 2091);
INSERT INTO `sys_role_menu` VALUES (101, 2092);
INSERT INTO `sys_role_menu` VALUES (101, 2093);
INSERT INTO `sys_role_menu` VALUES (101, 2094);
INSERT INTO `sys_role_menu` VALUES (101, 2095);
INSERT INTO `sys_role_menu` VALUES (101, 2096);
INSERT INTO `sys_role_menu` VALUES (102, 1);
INSERT INTO `sys_role_menu` VALUES (102, 2);
INSERT INTO `sys_role_menu` VALUES (102, 3);
INSERT INTO `sys_role_menu` VALUES (102, 100);
INSERT INTO `sys_role_menu` VALUES (102, 101);
INSERT INTO `sys_role_menu` VALUES (102, 102);
INSERT INTO `sys_role_menu` VALUES (102, 103);
INSERT INTO `sys_role_menu` VALUES (102, 104);
INSERT INTO `sys_role_menu` VALUES (102, 105);
INSERT INTO `sys_role_menu` VALUES (102, 106);
INSERT INTO `sys_role_menu` VALUES (102, 107);
INSERT INTO `sys_role_menu` VALUES (102, 108);
INSERT INTO `sys_role_menu` VALUES (102, 109);
INSERT INTO `sys_role_menu` VALUES (102, 110);
INSERT INTO `sys_role_menu` VALUES (102, 111);
INSERT INTO `sys_role_menu` VALUES (102, 112);
INSERT INTO `sys_role_menu` VALUES (102, 113);
INSERT INTO `sys_role_menu` VALUES (102, 114);
INSERT INTO `sys_role_menu` VALUES (102, 115);
INSERT INTO `sys_role_menu` VALUES (102, 116);
INSERT INTO `sys_role_menu` VALUES (102, 117);
INSERT INTO `sys_role_menu` VALUES (102, 500);
INSERT INTO `sys_role_menu` VALUES (102, 501);
INSERT INTO `sys_role_menu` VALUES (102, 1000);
INSERT INTO `sys_role_menu` VALUES (102, 1001);
INSERT INTO `sys_role_menu` VALUES (102, 1002);
INSERT INTO `sys_role_menu` VALUES (102, 1003);
INSERT INTO `sys_role_menu` VALUES (102, 1004);
INSERT INTO `sys_role_menu` VALUES (102, 1005);
INSERT INTO `sys_role_menu` VALUES (102, 1006);
INSERT INTO `sys_role_menu` VALUES (102, 1007);
INSERT INTO `sys_role_menu` VALUES (102, 1008);
INSERT INTO `sys_role_menu` VALUES (102, 1009);
INSERT INTO `sys_role_menu` VALUES (102, 1010);
INSERT INTO `sys_role_menu` VALUES (102, 1011);
INSERT INTO `sys_role_menu` VALUES (102, 1012);
INSERT INTO `sys_role_menu` VALUES (102, 1013);
INSERT INTO `sys_role_menu` VALUES (102, 1014);
INSERT INTO `sys_role_menu` VALUES (102, 1015);
INSERT INTO `sys_role_menu` VALUES (102, 1016);
INSERT INTO `sys_role_menu` VALUES (102, 1017);
INSERT INTO `sys_role_menu` VALUES (102, 1018);
INSERT INTO `sys_role_menu` VALUES (102, 1019);
INSERT INTO `sys_role_menu` VALUES (102, 1020);
INSERT INTO `sys_role_menu` VALUES (102, 1021);
INSERT INTO `sys_role_menu` VALUES (102, 1022);
INSERT INTO `sys_role_menu` VALUES (102, 1023);
INSERT INTO `sys_role_menu` VALUES (102, 1024);
INSERT INTO `sys_role_menu` VALUES (102, 1025);
INSERT INTO `sys_role_menu` VALUES (102, 1026);
INSERT INTO `sys_role_menu` VALUES (102, 1027);
INSERT INTO `sys_role_menu` VALUES (102, 1028);
INSERT INTO `sys_role_menu` VALUES (102, 1029);
INSERT INTO `sys_role_menu` VALUES (102, 1030);
INSERT INTO `sys_role_menu` VALUES (102, 1031);
INSERT INTO `sys_role_menu` VALUES (102, 1032);
INSERT INTO `sys_role_menu` VALUES (102, 1033);
INSERT INTO `sys_role_menu` VALUES (102, 1034);
INSERT INTO `sys_role_menu` VALUES (102, 1035);
INSERT INTO `sys_role_menu` VALUES (102, 1036);
INSERT INTO `sys_role_menu` VALUES (102, 1037);
INSERT INTO `sys_role_menu` VALUES (102, 1038);
INSERT INTO `sys_role_menu` VALUES (102, 1039);
INSERT INTO `sys_role_menu` VALUES (102, 1040);
INSERT INTO `sys_role_menu` VALUES (102, 1041);
INSERT INTO `sys_role_menu` VALUES (102, 1042);
INSERT INTO `sys_role_menu` VALUES (102, 1043);
INSERT INTO `sys_role_menu` VALUES (102, 1044);
INSERT INTO `sys_role_menu` VALUES (102, 1045);
INSERT INTO `sys_role_menu` VALUES (102, 1046);
INSERT INTO `sys_role_menu` VALUES (102, 1047);
INSERT INTO `sys_role_menu` VALUES (102, 1048);
INSERT INTO `sys_role_menu` VALUES (102, 1049);
INSERT INTO `sys_role_menu` VALUES (102, 1050);
INSERT INTO `sys_role_menu` VALUES (102, 1051);
INSERT INTO `sys_role_menu` VALUES (102, 1052);
INSERT INTO `sys_role_menu` VALUES (102, 1053);
INSERT INTO `sys_role_menu` VALUES (102, 1054);
INSERT INTO `sys_role_menu` VALUES (102, 1055);
INSERT INTO `sys_role_menu` VALUES (102, 1056);
INSERT INTO `sys_role_menu` VALUES (102, 1057);
INSERT INTO `sys_role_menu` VALUES (102, 1058);
INSERT INTO `sys_role_menu` VALUES (102, 1059);
INSERT INTO `sys_role_menu` VALUES (102, 1060);
INSERT INTO `sys_role_menu` VALUES (102, 2000);
INSERT INTO `sys_role_menu` VALUES (102, 2013);
INSERT INTO `sys_role_menu` VALUES (102, 2014);
INSERT INTO `sys_role_menu` VALUES (102, 2015);
INSERT INTO `sys_role_menu` VALUES (102, 2016);
INSERT INTO `sys_role_menu` VALUES (102, 2017);
INSERT INTO `sys_role_menu` VALUES (102, 2018);
INSERT INTO `sys_role_menu` VALUES (102, 2019);
INSERT INTO `sys_role_menu` VALUES (102, 2020);
INSERT INTO `sys_role_menu` VALUES (102, 2021);
INSERT INTO `sys_role_menu` VALUES (102, 2022);
INSERT INTO `sys_role_menu` VALUES (102, 2023);
INSERT INTO `sys_role_menu` VALUES (102, 2024);
INSERT INTO `sys_role_menu` VALUES (102, 2031);
INSERT INTO `sys_role_menu` VALUES (102, 2032);
INSERT INTO `sys_role_menu` VALUES (102, 2033);
INSERT INTO `sys_role_menu` VALUES (102, 2034);
INSERT INTO `sys_role_menu` VALUES (102, 2035);
INSERT INTO `sys_role_menu` VALUES (102, 2036);
INSERT INTO `sys_role_menu` VALUES (102, 2037);
INSERT INTO `sys_role_menu` VALUES (102, 2039);
INSERT INTO `sys_role_menu` VALUES (102, 2040);
INSERT INTO `sys_role_menu` VALUES (102, 2041);
INSERT INTO `sys_role_menu` VALUES (102, 2042);
INSERT INTO `sys_role_menu` VALUES (102, 2044);
INSERT INTO `sys_role_menu` VALUES (102, 2045);
INSERT INTO `sys_role_menu` VALUES (102, 2046);
INSERT INTO `sys_role_menu` VALUES (102, 2047);
INSERT INTO `sys_role_menu` VALUES (102, 2048);
INSERT INTO `sys_role_menu` VALUES (102, 2049);
INSERT INTO `sys_role_menu` VALUES (102, 2050);
INSERT INTO `sys_role_menu` VALUES (102, 2051);
INSERT INTO `sys_role_menu` VALUES (102, 2052);
INSERT INTO `sys_role_menu` VALUES (102, 2053);
INSERT INTO `sys_role_menu` VALUES (102, 2054);
INSERT INTO `sys_role_menu` VALUES (102, 2055);
INSERT INTO `sys_role_menu` VALUES (102, 2056);
INSERT INTO `sys_role_menu` VALUES (102, 2072);
INSERT INTO `sys_role_menu` VALUES (102, 2073);
INSERT INTO `sys_role_menu` VALUES (102, 2074);
INSERT INTO `sys_role_menu` VALUES (102, 2075);
INSERT INTO `sys_role_menu` VALUES (102, 2076);
INSERT INTO `sys_role_menu` VALUES (102, 2077);
INSERT INTO `sys_role_menu` VALUES (102, 2078);
INSERT INTO `sys_role_menu` VALUES (102, 2085);
INSERT INTO `sys_role_menu` VALUES (102, 2086);
INSERT INTO `sys_role_menu` VALUES (102, 2087);
INSERT INTO `sys_role_menu` VALUES (102, 2088);
INSERT INTO `sys_role_menu` VALUES (102, 2089);
INSERT INTO `sys_role_menu` VALUES (102, 2090);

-- ----------------------------
-- Table structure for sys_room
-- ----------------------------
DROP TABLE IF EXISTS `sys_room`;
CREATE TABLE `sys_room`  (
  `room_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '教室id',
  `room_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '教室名称',
  `room_describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '教室描述',
  `room` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '教室数据',
  `room_height` int(11) NULL DEFAULT NULL COMMENT '教室长度',
  `room_weight` int(11) NULL DEFAULT NULL COMMENT '教室宽度',
  `dept_id` int(11) NULL DEFAULT NULL COMMENT '部门id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '创建人id',
  `room_reserve_a` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '预留_a',
  `room_reserve_b` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '预留_b',
  PRIMARY KEY (`room_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '教室信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_room
-- ----------------------------
INSERT INTO `sys_room` VALUES (2, '1', '1', '[[{\"color\":\"height:90%;width:90%\",\"dept\":\"\",\"id\":0,\"name\":\"\",\"title\":\"0-0\",\"username\":\"\"},{\"color\":\"height:90%;width:90%\",\"dept\":\"\",\"id\":0,\"name\":\"\",\"title\":\"0-0\",\"username\":\"\"},{\"color\":\"height:90%;width:90%\",\"dept\":\"\",\"id\":0,\"name\":\"\",\"title\":\"0-0\",\"username\":\"\"},{\"color\":\"height:90%;width:90%\",\"dept\":\"二组\",\"id\":102,\"name\":\"1\",\"title\":\"0-0\",\"username\":\"李四\"},{\"color\":\"height:90%;width:90%\",\"dept\":\"\",\"id\":0,\"name\":\"\",\"title\":\"0-0\",\"username\":\"\"}],[{\"color\":\"height:90%;width:90%\",\"dept\":\"\",\"id\":0,\"name\":\"\",\"title\":\"0-0\",\"username\":\"\"},{\"color\":\"height:90%;width:90%\",\"dept\":\"\",\"id\":0,\"name\":\"\",\"title\":\"0-0\",\"username\":\"\"},{\"color\":\"height:90%;width:90%\",\"dept\":\"五组\",\"id\":121,\"name\":\"王清硕\",\"title\":\"0-0\",\"username\":\"2024251179\"},{\"color\":\"height:90%;width:90%\",\"dept\":\"\",\"id\":0,\"name\":\"\",\"title\":\"0-0\",\"username\":\"\"},{\"color\":\"height:90%;width:90%\",\"dept\":\"\",\"id\":0,\"name\":\"\",\"title\":\"0-0\",\"username\":\"\"}],[{\"color\":\"height:90%;width:90%\",\"dept\":\"\",\"id\":0,\"name\":\"\",\"title\":\"0-0\",\"username\":\"\"},{\"color\":\"height:90%;width:90%\",\"dept\":\"\",\"id\":0,\"name\":\"\",\"title\":\"0-0\",\"username\":\"\"},{\"color\":\"height:90%;width:90%\",\"dept\":\"\",\"id\":0,\"name\":\"\",\"title\":\"0-0\",\"username\":\"\"},{\"color\":\"height:90%;width:90%\",\"dept\":\"\",\"id\":0,\"name\":\"\",\"title\":\"0-0\",\"username\":\"\"},{\"color\":\"height:90%;width:90%\",\"dept\":\"\",\"id\":0,\"name\":\"\",\"title\":\"0-0\",\"username\":\"\"}],[{\"color\":\"height:90%;width:90%\",\"dept\":\"\",\"id\":0,\"name\":\"\",\"title\":\"0-0\",\"username\":\"\"},{\"color\":\"height:90%;width:90%\",\"dept\":\"\",\"id\":0,\"name\":\"\",\"title\":\"0-0\",\"username\":\"\"},{\"color\":\"height:90%;width:90%\",\"dept\":\"\",\"id\":0,\"name\":\"\",\"title\":\"0-0\",\"username\":\"\"},{\"color\":\"height:90%;width:90%\",\"dept\":\"\",\"id\":0,\"name\":\"\",\"title\":\"0-0\",\"username\":\"\"},{\"color\":\"height:90%;width:90%\",\"dept\":\"\",\"id\":0,\"name\":\"\",\"title\":\"0-0\",\"username\":\"\"}],[{\"color\":\"height:90%;width:90%\",\"dept\":\"\",\"id\":0,\"name\":\"\",\"title\":\"0-0\",\"username\":\"\"},{\"color\":\"height:90%;width:90%\",\"dept\":\"\",\"id\":0,\"name\":\"\",\"title\":\"0-0\",\"username\":\"\"},{\"color\":\"height:90%;width:90%\",\"dept\":\"\",\"id\":0,\"name\":\"\",\"title\":\"0-0\",\"username\":\"\"},{\"color\":\"height:90%;width:90%\",\"dept\":\"\",\"id\":0,\"name\":\"\",\"title\":\"0-0\",\"username\":\"\"},{\"color\":\"height:90%;width:90%\",\"dept\":\"\",\"id\":0,\"name\":\"\",\"title\":\"0-0\",\"username\":\"\"}]]', 5, 5, 106, 1, NULL, NULL);

-- ----------------------------
-- Table structure for sys_score
-- ----------------------------
DROP TABLE IF EXISTS `sys_score`;
CREATE TABLE `sys_score`  (
  `score_id` int(10) UNSIGNED NOT NULL COMMENT '成绩ID',
  `student_id` int(10) UNSIGNED NOT NULL COMMENT '学生ID',
  `course_name` int(11) NOT NULL COMMENT '课程名称',
  `teacher_id` int(10) UNSIGNED NOT NULL COMMENT '教师ID',
  `teacher_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '教师姓名',
  `score` float NOT NULL COMMENT '考试成绩（0-100）',
  `exam_time` datetime NOT NULL COMMENT '考试时间',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`score_id`) USING BTREE,
  INDEX `idx_student`(`student_id` ASC) USING BTREE,
  INDEX `idx_teacher`(`teacher_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '考试成绩管理表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_score
-- ----------------------------
INSERT INTO `sys_score` VALUES (1, 201, 0, 106, '薛夫龙', 100, '2025-03-20 00:00:00', '2025-03-30 20:43:52', '2025-03-30 20:43:52');
INSERT INTO `sys_score` VALUES (2, 202, 1, 106, '薛夫龙', 99, '2025-03-24 00:00:00', '2025-03-31 10:44:43', '2025-03-31 10:44:55');
INSERT INTO `sys_score` VALUES (3, 203, 0, 106, '薛夫龙', 88, '2025-03-12 00:00:00', '2025-03-31 10:47:54', '2025-03-31 10:47:54');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `semester` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学期',
  `qufen` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '老师是1学生是0',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 161 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-04-17 09:28:36', 'admin', '2025-03-10 17:54:47', '', '2025-04-17 09:28:35', '管理员', NULL, '1');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '薛老师', '00', 'ry@qq.com', '15666666666', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-03-10 17:54:47', 'admin', '2025-03-10 17:54:47', 'admin', '2025-03-10 18:22:49', '测试员', NULL, '1');
INSERT INTO `sys_user` VALUES (101, 204, '刘文昂', 'zs', '00', '1791693198@qq.com', '19963224915', '0', '', '$2a$10$UJvlOSnDD2va16AHGqaW5uWJ6nxH6VFnwMcC32d5WKVlFx3VTViya', '0', '2', '', NULL, 'admin', '2025-03-10 19:20:29', 'admin', '2025-03-11 09:44:05', '第八期', '7', '1');
INSERT INTO `sys_user` VALUES (102, 201, '李四', '1', '00', '1055635267@qq.com', '13153172428', '0', '', '$2a$10$WZ2XpxsZDwfmeOiusRdAOuczeTL/jQPPstYwtgtLLDVh329dPlz6u', '0', '0', '', NULL, 'admin', '2025-03-11 19:52:12', 'admin', '2025-03-11 20:09:14', '123', '第九期', '0');
INSERT INTO `sys_user` VALUES (121, 204, '王清硕', '2024251179', '00', '2740056514@qq.com', '13153172429', '0', '山东枣庄', '$2a$10$pqdNlYe2cjBjODtOMDT.9uB5HsSLDDvLZuiLmN7eb5G/kjyBmTGci', '0', '0', '', NULL, 'admin', '2025-03-12 14:08:31', '', NULL, '123', '第八学期', '0');
INSERT INTO `sys_user` VALUES (122, 104, 'user1​', '王老吉', '00', '1801253796@qq.com', '13452673892', '0', '北京市海淀区中关村大街 18 号数字广场 A 座 1201 室​', '$2a$10$ozXO9BJAn9P7.Cr9WQ/r5.Qw7/vD.2zTITlUfogwbdpZHHjJodyTK', '0', '0', '', NULL, 'admin', '2025-03-31 20:00:05', 'admin', '2025-03-31 20:27:05', '', '8', '1');
INSERT INTO `sys_user` VALUES (123, 106, 'user2​', '加多宝', '00', '1801253797@qq.com', '13867230581', '0', '天津市和平区南京路 20 号世纪都会公寓 3 栋 1502​', '$2a$10$zR0vMS.XbGmjPYcb1QFjKOigCavqizHUKsSHw.q4TvHQ3bBocUCuS', '0', '0', '127.0.0.1', '2025-04-14 20:20:09', 'admin', '2025-03-31 20:01:22', 'admin', '2025-04-14 20:20:09', '', '8', '1');
INSERT INTO `sys_user` VALUES (124, 200, 'user3​', '和其正', '00', '1801253798@qq.com', '13145128374', '0', '石家庄市长安区中山东路 567 号荣盛华府 7 号楼 3 单元 201​', '$2a$10$ns5WRoRKa3moxNXUP5kE3.Q4fD1gK7xB7T9UlILeWHmKlS2lSyAG.', '0', '0', '127.0.0.1', '2025-04-09 11:21:40', 'admin', '2025-03-31 20:01:22', 'admin', '2025-04-09 11:21:40', '', '8', '0');
INSERT INTO `sys_user` VALUES (125, 201, 'user4​', '大麦茶', '00', '1801253799@qq.com', '13956372810', '0', '太原市杏花岭区府西街 9 号王府商务大厦 18 层 1803​', '$2a$10$zIkTY5tzZWKK81TyyBlHoOH5dmDTqa5SDBArJOCKADatYFfEJ59YS', '0', '0', '127.0.0.1', '2025-04-01 14:15:07', 'admin', '2025-03-31 20:01:22', 'admin', '2025-04-01 14:15:06', '', '8', '0');
INSERT INTO `sys_user` VALUES (126, 205, 'user5​', '不死牛马A', '00', '1801253800@qq.com', '13372981456', '0', '呼和浩特市赛罕区新华东街 12 号奈伦国际 B 座 1006​', '$2a$10$mH/Hd4Zl2vrXyy26ZyzFRuESAsSDZJKQmdrrinXER53mKD4//o0Te', '0', '0', '', NULL, 'admin', '2025-03-31 20:01:22', 'admin', '2025-04-01 11:21:56', '', '8', '0');
INSERT INTO `sys_user` VALUES (127, 203, 'user6​', '限定版牛马', '00', '1801253801@qq.com', '13076283915', '0', '沈阳市沈河区青年大街 1 号市府恒隆广场 3 号楼 2205​', '$2a$10$Dl7j8B1JC6NZdT3xNOqYuORAeQrw38ihW8PONQV2FCDdXQzr/lxDi', '0', '0', '', NULL, 'admin', '2025-03-31 20:01:22', 'admin', '2025-04-01 11:22:08', '', '8', '0');
INSERT INTO `sys_user` VALUES (128, 204, 'user7​', '普通牛马', '00', '1801253802@qq.com', '13650917823', '0', '大连市中山区友好广场 8 号新世界大厦 16 层 1608​', '$2a$10$UUc.ZR8TVZnzHW4D0clc3eA.7xODXvZSIZt3S6p/Vh8nyabrB9Eia', '0', '0', '', NULL, 'admin', '2025-03-31 20:01:22', 'admin', '2025-04-01 11:22:27', '', '8', '0');
INSERT INTO `sys_user` VALUES (129, 204, 'user8​', '半人马类人生物', '00', '1801253803@qq.com', '13287469052', '0', '长春市南关区人民大街 99 号伟峰国际 19 层 1902​', '$2a$10$Np5FwOdW.7gWCS1NDOLC7uPU4EgHi3O365fVNh3Y0ndZuBfKOAs.6', '0', '0', '', NULL, 'admin', '2025-03-31 20:01:22', 'admin', '2025-04-01 11:22:53', '', '8', '0');
INSERT INTO `sys_user` VALUES (130, NULL, 'user9​', '朝鲜激光人', '00', '1801253804@qq.com', '13761298405', '0', '哈尔滨市道里区中央大街 21 号马迭尔公寓 803​', '$2a$10$6QzH.GZNG8hZ71bWrSCqHOfuTnk91dJTvAZs2QQzUYg/soamRgHIu', '0', '0', '', NULL, 'admin', '2025-03-31 20:04:59', 'admin', '2025-03-31 20:27:05', '', '8', '0');
INSERT INTO `sys_user` VALUES (131, NULL, 'user10​', '三餐特务', '00', '1801253805@qq.com', '13549360718', '0', '上海市浦东新区世纪大道 88 号金茂大厦裙楼公寓 6 层 601​', '$2a$10$G51wio/Ls2cyr2mt2erVluYpLg2hQJdTqKcMDEN2eLL59fyQVYEqu', '0', '0', '', NULL, 'admin', '2025-03-31 20:05:00', 'admin', '2025-03-31 20:27:05', '', '8', '0');
INSERT INTO `sys_user` VALUES (132, NULL, 'testuser11​', '超霸01', '00', '1801253806@qq.com', '13864907213', '0', '南京市鼓楼区中山路 10 号绿地广场紫峰大厦 26 层 2604​', '$2a$10$ydSKng28jNARTB/2trtsu.jIXGt03WA9TUfaDTKZ7jpn7gKpGikOO', '0', '0', '', NULL, 'admin', '2025-03-31 20:05:00', 'admin', '2025-03-31 20:27:05', '', '8', '0');
INSERT INTO `sys_user` VALUES (133, NULL, 'testuser12​', '陌生阿达西', '00', '1801253807@qq.com', '13952648067', '0', '杭州市上城区延安路 1 号嘉里中心 3 号楼 1206​', '$2a$10$ACrtwN8N1jPFXX0Prro2oeh.A7AAMjdkcsJkpowScUGOI35JAPOF2', '0', '0', '', NULL, 'admin', '2025-03-31 20:05:00', 'admin', '2025-03-31 20:27:05', '', '8', '0');
INSERT INTO `sys_user` VALUES (134, NULL, 'testuser13​', '飞舞贝利亚', '00', '1801253808@qq.com', '13146205387', '0', '宁波市鄞州区中山东路 1008 号宁波中心 A 座 15 层 1503​', '$2a$10$GmwB.gkOipyJB38X3jhAWO66b7cvi7hG3wbcvl2CB3As.tNO10He2', '0', '0', '', NULL, 'admin', '2025-03-31 20:05:00', 'admin', '2025-03-31 20:27:05', '', '8', '0');
INSERT INTO `sys_user` VALUES (135, NULL, 'testuser14​', '乃龙', '00', '1801253809@qq.com', '13371894530', '0', '温州市鹿城区府前街 88 号天一角大厦 9 层 905​', '$2a$10$iIuk7YEbTPhWW8FQMvLGReIfozkyMFgwOPvi51Wk8RvmRdLB7pIUS', '0', '0', '', NULL, 'admin', '2025-03-31 20:05:00', 'admin', '2025-03-31 20:27:05', '', '8', '0');
INSERT INTO `sys_user` VALUES (136, NULL, 'testuser15​', '二次元阿诺', '00', '1801253810@qq.com', '13057234961', '0', '合肥市蜀山区潜山路 190 号华润万象城写字楼 A 座 18 层 1807​', '$2a$10$/9oF2okBeo2OynU2ztVtEuKOs78vRfZnl5lwPuDAjaaKuGKA0d4Jq', '0', '0', '', NULL, 'admin', '2025-03-31 20:05:00', 'admin', '2025-03-31 20:27:05', '', '8', NULL);
INSERT INTO `sys_user` VALUES (137, NULL, 'login16​', '东北辣妹', '00', '1801253811@qq.com', '13768520394', '0', '福州市鼓楼区五四路 128 号恒力城 23 层 2309​', '$2a$10$vYNcGE/ifapqhciNo4LAz.9Wbxfi5DPBAl9gzUfrvOU1O3AnVbfJG', '0', '0', '', NULL, 'admin', '2025-03-31 20:05:00', 'admin', '2025-03-31 20:27:05', '', '8', NULL);
INSERT INTO `sys_user` VALUES (138, NULL, 'login17​', '南朝鲜空输', '00', '1801253812@qq.com', '13487196520', '0', '厦门市思明区鹭江道 2 号厦门国际银行大厦 17 层 1706​', '$2a$10$1qXWImAPzivy8kirjvghjewakGWXqVHSdtN6FeVTrl4JN9fY3l28m', '0', '0', '', NULL, 'admin', '2025-03-31 20:05:00', 'admin', '2025-03-31 20:27:05', '', '8', NULL);
INSERT INTO `sys_user` VALUES (139, NULL, 'login18​', '缅北kk', '00', '1801253813@qq.com', '13249380567', '0', '南昌市东湖区八一大道 358 号财富广场 A 座 14 层 1403​', '$2a$10$ixqLTjWLhqisvK4DcRQq/eK0OJH.4PqQLGMy0IEAKJwEq4aBANqbe', '0', '0', '', NULL, 'admin', '2025-03-31 20:05:00', 'admin', '2025-03-31 20:27:05', '', '8', NULL);
INSERT INTO `sys_user` VALUES (140, NULL, 'login19​', '类人张洛岩', '00', '1801253814@qq.com', '13625097184', '0', '广州市天河区珠江新城华夏路 10 号富力中心 30 层 3002​', '$2a$10$sOwAHEr9iL6UeOIWzvJ0TuNfvyW7Mh5030oaadm.kGr4vkpiJYQR.', '0', '0', '', NULL, 'admin', '2025-03-31 20:06:52', 'admin', '2025-03-31 20:27:05', '', '8', NULL);
INSERT INTO `sys_user` VALUES (141, NULL, 'login20​', '电子出生', '00', '1801253815@qq.com', '13398264015', '0', '深圳市福田区深南大道 2001 号嘉里建设广场 2 座 25 层 2507​', '$2a$10$i9KlneAAeomVO3pxnmRQgeJnftaMtnXMmqs/KxTiBGvAh4IQpQT/G', '0', '0', '', NULL, 'admin', '2025-03-31 20:06:52', 'admin', '2025-03-31 20:27:05', '', '8', NULL);
INSERT INTO `sys_user` VALUES (142, NULL, 'account21​', '原神高手', '00', '1801253816@qq.com', '13843167950', '0', '佛山市顺德区大良街道新城区观绿路 4 号保利国际金融中心 12 层 1204​', '$2a$10$gCckc.ThwdxLXo8k5QPdleqyMLWKSaP8kllBFxIzJisHhw.2O.6/m', '0', '0', '', NULL, 'admin', '2025-03-31 20:06:52', 'admin', '2025-03-31 20:27:05', '', '8', NULL);
INSERT INTO `sys_user` VALUES (143, NULL, 'account22​', '德三地雷妹', '00', '1801253817@qq.com', '13074819365', '0', '东莞市南城街道鸿福路 200 号第一国际 F 座 16 层 1609​', '$2a$10$oKBpCCQvc9.NXKhWohff3.Cq2khjD94NBTVrutMdIOWA.V3N0JEHC', '0', '0', '', NULL, 'admin', '2025-03-31 20:06:52', 'admin', '2025-03-31 20:27:05', '', '8', NULL);
INSERT INTO `sys_user` VALUES (144, NULL, 'account23​', '扎寨仙人', '00', '1801253818@qq.com', '13792485610', '0', '中山市东区中山五路 68 号盛景尚峰金融商务中心 2 座 8 层 803​', '$2a$10$sRa6KfrKrgf/Q7ye6kpccOQjkYRsNS5RoUrWwYl93BcQrSC8f1NFG', '0', '0', '', NULL, 'admin', '2025-03-31 20:06:52', 'admin', '2025-03-31 20:27:05', '', '8', NULL);
INSERT INTO `sys_user` VALUES (145, NULL, 'account24​', '不吃白菜', '00', '1801253819@qq.com', '13557310826', '0', '南宁市青秀区民族大道 136 号华润大厦 A 座 20 层 2006​', '$2a$10$Oj5/qqiJTw5DAfaDvIkg5eNnXVE6AA1Cx7oRD4h7C39nHMeWpATW2', '0', '0', '', NULL, 'admin', '2025-03-31 20:06:52', 'admin', '2025-03-31 20:27:05', '', '8', NULL);
INSERT INTO `sys_user` VALUES (146, NULL, 'account25​', '尼古丁真', '00', '1801253820@qq.com', '13964752104', '0', '海口市龙华区滨海大道 109 号海航国际广场 A 座 19 层 1905​', '$2a$10$B1fKVKVb6dCI.m5gA2xuC.Gng0MB7ZM3KYxIayi7Ud7TRFRdqE.ZC', '0', '0', '', NULL, 'admin', '2025-03-31 20:06:53', 'admin', '2025-03-31 20:27:05', '', '8', NULL);
INSERT INTO `sys_user` VALUES (147, NULL, 'abcuser26​', '芙蓉王源', '00', '1801253821@qq.com', '13154892073', '0', '武汉市江汉区解放大道 686 号武汉世界贸易大厦 38 层 3804​', '$2a$10$oNca8T4Cl7Ha6tNsV2ypN.UbKpYTshp/puGaPdXYRhvyzDXS5Nl/W', '0', '0', '', NULL, 'admin', '2025-03-31 20:06:53', 'admin', '2025-03-31 20:27:05', '', '8', NULL);
INSERT INTO `sys_user` VALUES (148, NULL, 'abcuser27​', '抽象工作室', '00', '1801253822@qq.com', '13267548109', '0', '长沙市岳麓区梅溪湖环湖路 1177 号金茂大厦南塔 21 层 2108​', '$2a$10$Il248B4fsU/JSTKXoc5hKOftUZOi4wI52IT2AwGXROm3/blaamfdK', '0', '0', '', NULL, 'admin', '2025-03-31 20:06:53', 'admin', '2025-03-31 20:27:05', '', '8', NULL);
INSERT INTO `sys_user` VALUES (149, NULL, 'abcuser28​', '甲级战犯', '00', '1801253823@qq.com', '13685379021', '0', '郑州市金水区花园路 126 号正弘中心 17 层 1703​', '$2a$10$VSvpZy3f/QkLces4RDid.exk5pn42CpYNz.TJCU3EDel2D/ArJsIG', '0', '0', '', NULL, 'admin', '2025-03-31 20:06:53', 'admin', '2025-03-31 20:27:05', '', '8', NULL);
INSERT INTO `sys_user` VALUES (150, NULL, 'abcuser29​', 'zun', '00', '1801253824@qq.com', '13397265481', '0', '西安市高新区锦业路 1 号都市之门 A 座 26 层 2605​', '$2a$10$RTmnnW9PkpUqWWkXehXq5uC1JM22vPp/ZeFPoF3kmzKTwwIwzuSlW', '0', '0', '', NULL, 'admin', '2025-03-31 20:06:53', 'admin', '2025-03-31 20:27:05', '', '8', NULL);
INSERT INTO `sys_user` VALUES (151, NULL, 'abcuser30​', '杨坤', '00', '1801253825@qq.com', '13742685093', '0', '兰州市城关区庆阳路 161 号亚欧国际 35 层 3506​', '$2a$10$6r5iH6nOndHCNaVU9no7xupqbPRHKVVz1iCeLglD5Iw/eZV1KpUey', '0', '0', '', NULL, 'admin', '2025-03-31 20:06:53', 'admin', '2025-03-31 20:27:05', '', '8', NULL);
INSERT INTO `sys_user` VALUES (152, NULL, 'xyzlogin31​', '具象人', '00', '1801253826@qq.com', '13742685093', '0', '西宁市城西区五四西路 56 号新华联国际中心 B 座 14 层 1402​', '$2a$10$CGtlA6ANK7DAckZHTaUgWu6nYmc9ZJnHacEi5FbuefCdm92k/42ze', '0', '0', '', NULL, 'admin', '2025-03-31 20:06:53', 'admin', '2025-03-31 20:27:05', '', '8', NULL);
INSERT INTO `sys_user` VALUES (153, NULL, 'xyzlogin32​', '民科领域副教授', '00', '1801253827@qq.com', '13742685093', '0', '香港九龙尖沙咀广东道 30 号新港中心 1 座 18 层 ', '$2a$10$yirGJt/u3YfURDUykOQrq.IYTnCGYRZZeouy8DUZPbCOJj3t6XbI.', '0', '0', '', NULL, 'admin', '2025-03-31 20:06:53', 'admin', '2025-03-31 20:27:05', '', '8', NULL);
INSERT INTO `sys_user` VALUES (154, NULL, 'xyzlogin33​', '苗寨最后大脑升级人', '00', '1801253828@qq.com', '13742685093', '0', '澳门半岛南湾大马路 810 号中华广场 15 层 1', '$2a$10$KjVqt66eWD2KgoZAl4aTzeoM4kh60CNJ1rTKl6C5fRXA2dh7CfxeC', '0', '0', '', NULL, 'admin', '2025-03-31 20:06:53', 'admin', '2025-03-31 20:27:05', '', '8', NULL);
INSERT INTO `sys_user` VALUES (155, NULL, 'xyzlogin34​', '烈火哈吉米', '00', '1801253829@qq.com', '13742685093', '0', '中国台湾省台北市信义区松智路 1 号威秀影城楼上公寓 9 层 902', '$2a$10$eq/NbdZ/LkfU98R7HGkXYeUuahu0Ho/RSuPcmHybsmnYG1NW3ZBIe', '0', '0', '', NULL, 'admin', '2025-03-31 20:06:53', 'admin', '2025-03-31 20:27:05', '', '8', NULL);
INSERT INTO `sys_user` VALUES (156, NULL, 'xyzlogin35​', '奈亚子', '00', '1801253830@qq.com', '13742685093', '0', '中国台湾省台北市计算机覅区松智路 1斯蒂芬 9 层 902', '$2a$10$6ZEiRYRT3Cs8N2yizRLVmeUXSJHJWgilcLvqF2.PDVFeUuqMDUIia', '0', '0', '', NULL, 'admin', '2025-03-31 20:06:53', 'admin', '2025-03-31 20:27:05', '', '8', NULL);
INSERT INTO `sys_user` VALUES (157, NULL, 'numuser36​', '哈吉米德', '00', '1801253831@qq.com', '13742685093', '0', '河北石家庄德军总部', '$2a$10$YHn17CA.OUtit8wBAj2HGuGa5Xm1L6VB/KYVAwRuTWVdIq65iikrO', '0', '0', '', NULL, 'admin', '2025-03-31 20:06:53', 'admin', '2025-03-31 20:27:05', '', '8', NULL);
INSERT INTO `sys_user` VALUES (158, NULL, 'numuser37​', 'CCB蓝色强人', '00', '1801253832@qq.com', '13742685093', '0', '双体省山口市三餐镇', '$2a$10$ZkYBPhHXgKo7q5fGByqkEe4/wVsIl8CflXewcfcOjAb02ei4NoIJ2', '0', '0', '', NULL, 'admin', '2025-03-31 20:06:53', 'admin', '2025-03-31 20:27:05', '', '8', NULL);
INSERT INTO `sys_user` VALUES (159, NULL, 'numuser38​', '唯一人类', '00', '1801253833@qq.com', '13742685093', '0', '南极洲企鹅省企鹅蛋市企鹅崽镇', '$2a$10$lBcX.Mf45aYdA.f/IsoXlO6gr0eFbqtcP344BG.1nWOqykR5Jclj2', '0', '0', '', NULL, 'admin', '2025-03-31 20:06:53', 'admin', '2025-03-31 20:27:05', '', '8', NULL);
INSERT INTO `sys_user` VALUES (160, NULL, 'numuser39​', '唯一类人', '00', '1801253834@qq.com', '13742685093', '0', 'DUST2市A大镇7355608', '$2a$10$jS34BXG9Spg6YtWt/AAx6etCPN6ZllOS7NrHjK4Ys9wESe.U0F0Fa', '0', '0', '', NULL, 'admin', '2025-03-31 20:06:53', 'admin', '2025-03-31 20:27:05', '', '8', NULL);

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime NULL DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime NULL DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(11) NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '在线用户记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (102, 1);
INSERT INTO `sys_user_post` VALUES (122, 5);
INSERT INTO `sys_user_post` VALUES (123, 5);
INSERT INTO `sys_user_post` VALUES (124, 4);
INSERT INTO `sys_user_post` VALUES (126, 4);
INSERT INTO `sys_user_post` VALUES (127, 4);
INSERT INTO `sys_user_post` VALUES (128, 4);
INSERT INTO `sys_user_post` VALUES (129, 4);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (102, 100);
INSERT INTO `sys_user_role` VALUES (123, 100);
INSERT INTO `sys_user_role` VALUES (124, 2);
INSERT INTO `sys_user_role` VALUES (125, 2);
INSERT INTO `sys_user_role` VALUES (126, 2);
INSERT INTO `sys_user_role` VALUES (127, 2);
INSERT INTO `sys_user_role` VALUES (128, 2);
INSERT INTO `sys_user_role` VALUES (129, 2);

SET FOREIGN_KEY_CHECKS = 1;
