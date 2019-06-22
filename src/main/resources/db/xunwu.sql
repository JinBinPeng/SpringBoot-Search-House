/*
 Navicat Premium Data Transfer

 Source Server         : bin
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost:3306
 Source Schema         : xunwu

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 22/06/2019 13:34:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for house
-- ----------------------------
DROP TABLE IF EXISTS `house`;
CREATE TABLE `house`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'house唯一标识',
  `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` int(11) UNSIGNED NOT NULL COMMENT '价格',
  `area` int(11) UNSIGNED NOT NULL COMMENT '面积',
  `room` int(11) UNSIGNED NOT NULL COMMENT '卧室数量',
  `floor` int(11) UNSIGNED NOT NULL COMMENT '楼层',
  `total_floor` int(11) UNSIGNED NOT NULL COMMENT '总楼层',
  `watch_times` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '被看次数',
  `build_year` int(4) NOT NULL COMMENT '建立年限',
  `status` int(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '房屋状态 0-未审核 1-审核通过 2-已出租 3-逻辑删除',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `last_update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最近数据更新时间',
  `city_en_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '城市标记缩写 如 北京bj',
  `region_en_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '地区英文简写 如昌平区 cpq',
  `cover` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '封面',
  `direction` int(11) NOT NULL COMMENT '房屋朝向',
  `distance_to_subway` int(11) NOT NULL DEFAULT -1 COMMENT '距地铁距离 默认-1 附近无地铁',
  `parlour` int(11) NOT NULL DEFAULT 0 COMMENT '客厅数量',
  `district` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所在小区',
  `admin_id` int(11) NOT NULL COMMENT '所属管理员id',
  `bathroom` int(11) NOT NULL DEFAULT 0,
  `street` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '街道',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '房屋信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of house
-- ----------------------------
INSERT INTO `house` VALUES (15, '富力城 国贸CBD 时尚休闲 商务办公', 6200, 70, 2, 10, 20, 2, 2005, 1, '2017-09-06 18:56:14', '2017-12-03 11:13:46', 'bj', 'hdq', 'Fhxz_c16YmEmIz5UVxrp6ihwbvCk', 2, 10, 1, '融泽嘉园', 2, 0, '龙域西二路');
INSERT INTO `house` VALUES (16, '富力城 国贸CBD 时尚休闲 商务办公', 6300, 70, 2, 10, 20, 0, 2012, 1, '2017-09-06 19:53:35', '2017-12-03 11:13:42', 'bj', 'hdq', 'FvkO1FFyGbrxCP_1O9tA94u2qvbP', 1, -1, 1, '融泽嘉园', 2, 0, '龙域西二路');
INSERT INTO `house` VALUES (17, '二环东直门地铁站附近、王府井、天安门、国贸、三里屯、南锣鼓巷', 3000, 35, 1, 5, 10, 2, 2013, 1, '2017-09-06 20:45:35', '2017-12-03 11:13:36', 'bj', 'hdq', 'FpVYJRsLykrBRyUSCEOeqsqWU-bt', 1, 200, 0, '融泽嘉园', 2, 0, '龙域西二路');
INSERT INTO `house` VALUES (18, '华贸城 东向一居挑空loft 干净温馨 随时可以签约', 5700, 52, 1, 7, 20, 0, 2012, 1, '2017-09-06 21:01:02', '2017-12-03 11:13:30', 'bj', 'hdq', 'Fl1lNikhmMIecbTn-JTsurxugtFU', 2, 1085, 1, '融泽嘉园', 2, 0, '龙域西二路');
INSERT INTO `house` VALUES (19, '望春园板楼三居室 自住精装 南北通透 采光好视野棒！', 9200, 132, 3, 6, 14, 0, 2005, 1, '2017-09-06 22:44:25', '2017-12-03 11:13:25', 'bj', 'hdq', 'Fp1xPKVYtPsCeVHVQVW0Hif2FXk7', 2, 1108, 2, '融泽嘉园', 2, 0, '龙域西二路');
INSERT INTO `house` VALUES (20, '高大上的整租两居室 业主诚意出租', 5400, 56, 2, 12, 20, 0, 2012, 1, '2017-09-06 23:39:50', '2017-12-03 11:13:20', 'bj', 'hdq', 'FvVqU8LneZZ5xaLBAOM1KXR2Pz1X', 2, -1, 1, '融泽嘉园', 2, 0, '龙域西二路');
INSERT INTO `house` VALUES (21, '新康园 正规三居室 精装修 家电家具齐全', 1900, 18, 1, 13, 25, 0, 2012, 1, '2017-09-07 00:52:47', '2017-12-03 11:13:15', 'bj', 'hdq', 'FnuOFbFtDYTbpPdFoZthR-R0tszC', 3, 1302, 0, '融泽嘉园', 2, 0, '龙域西二路');
INSERT INTO `house` VALUES (24, '湖光壹号望京华府183-387㎡阔景大宅', 50000, 288, 5, 1, 1, 0, 2015, 1, '2017-09-07 11:42:20', '2017-12-03 11:13:10', 'bj', 'hdq', 'FvVqU8LneZZ5xaLBAOM1KXR2Pz1X', 5, 200, 3, '融泽嘉园', 2, 0, '龙域西二路');
INSERT INTO `house` VALUES (25, '测试房源-编辑', 3000, 59, 2, 10, 20, 0, 2010, 3, '2017-10-28 22:34:48', '2017-11-11 12:22:50', 'bj', 'cpq', 'FtbxR2LY98lnnX_TPOgOPzti3k7G', 2, 1000, 1, '融泽嘉园', 2, 0, '龙域中街');

-- ----------------------------
-- Table structure for house_detail
-- ----------------------------
DROP TABLE IF EXISTS `house_detail`;
CREATE TABLE `house_detail`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细描述',
  `layout_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '户型介绍',
  `traffic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交通出行',
  `round_service` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '周边配套',
  `rent_way` int(2) NOT NULL COMMENT '租赁方式',
  `address` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '详细地址 ',
  `subway_line_id` int(11) NULL DEFAULT NULL COMMENT '附近地铁线id',
  `subway_line_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附近地铁线名称',
  `subway_station_id` int(11) NULL DEFAULT NULL COMMENT '地铁站id',
  `subway_station_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地铁站名',
  `house_id` int(11) NOT NULL COMMENT '对应house的id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_on_house_id`(`house_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of house_detail
-- ----------------------------
INSERT INTO `house_detail` VALUES (21, '国贸CBD商务区,近SOHO现代城,富顿中心,富力城商业街区,乐成中心,潘家园古玩城,八王坟长途客运站,北京游乐园,经由三环路可直达首都机场。附近有双井桥南,双井桥北,双井桥东双井桥西等30多条公交站牌!\n《天安门,故宫,王府井,三里屯,前门,天坛,北海,颐和园,雍和宫,奥林匹克公园,水立方,西单,欢乐谷,燕莎商城等》知名购物区及旅游名胜古迹,是您休闲旅游及商务下榻的理想选择', '房间采光良好,落地窗外景色宜人', '房子处于北京的CBD商务中心区国贸双井!紧邻双井地铁站,步行5分钟即到!这离国贸、中央电视台、潘家园、三里屯、团结湖、日坛使馆区、儿研所、大郊亭都很近', '房子闹中取静,地理位置优越,交通方便,紧邻呼家楼地铁站和东大桥地铁站;去机场可乘坐东直门机场快轨,非常方便｡购物中心有双井购物中心、国贸购物中心和侨福芳草地购物中心、三里屯购物中心等,远道而来的朋友可尽览都市璀璨!', 0, '二号院7号楼', 4, '10号线', 58, '双井', 15);
INSERT INTO `house_detail` VALUES (22, '国贸CBD商务区,近SOHO现代城,富顿中心,富力城商业街区,乐成中心,潘家园古玩城,八王坟长途客运站,北京游乐园,经由三环路可直达首都机场。附近有双井桥南,双井桥北,双井桥东双井桥西等30多条公交站牌!\n《天安门,故宫,王府井,三里屯,前门,天坛,北海,颐和园,雍和宫,奥林匹克公园,水立方,西单,欢乐谷,燕莎商城等》知名购物区及旅游名胜古迹,是您休闲旅游及商务下榻的理想选择!', '房间采光良好,落地窗外景色宜人', '房子处于北京的CBD商务中心区国贸双井!紧邻双井地铁站,步行5分钟即到', '这离国贸、中央电视台、潘家园、三里屯、团结湖、日坛使馆区、儿研所、大郊亭都很近。房子闹中取静,地理位置优越,交通方便,紧邻呼家楼地铁站和东大桥地铁站;去机场可乘坐东直门机场快轨,非常方便｡购物中心有双井购物中心、国贸购物中心和侨福芳草地购物中心、三里屯购物中心等,远道而来的朋友可尽览都市璀璨！', 0, '1号院1号楼', 1, '13号线', 5, '上地', 16);
INSERT INTO `house_detail` VALUES (24, '我和我女盆友当房东已经一年了,也是超赞房东,希望能为大家提供舒适的住所~ 房间的大门和房门都是密码门,小区有保安24小时值班,非常安全方便。 通常入住时间是下午三点,提前来的同学可以先寄存行李和洗澡哦~\n\n', '房間非常漂亮,空間很大,鵝黃色的牆壁看起來非常舒服', '位置距離地鐵站不遠', '距故宫、天安门、王府井、三里屯、簋街、南锣鼓巷等景点均可地铁半小时内到达,交通便利~', 0, '1号院2号楼', 1, '13号线', 16, '东直门', 17);
INSERT INTO `house_detail` VALUES (25, '这个经纪人很懒，没写核心卖点', '此房是一居室的格局，上下两层，面宽，房间亮堂，进门右手厨房，正前方是25平米的客厅，楼上是卧室，带洗手间！ 喧闹和安静隔开，适合居住', '小区距离地铁13号线北苑站500米的距离，交通出行便利....', '小区楼下就是华贸天地娱乐街，保利电影院，眉州东坡，中信银行，麦当劳等娱乐休闲设施齐全', 0, '1号院3号楼', 1, '13号线', 11, '北苑', 18);
INSERT INTO `house_detail` VALUES (26, '这个经纪人很懒，没写核心卖点', '此房为望春园小区板楼南北通透户型，主卧客厅朝南，次卧朝北，两个客厅双卫，居住很舒适。', '距离地铁5号线立水桥南站630米，有464,465,966,081，621等多条公交线路，交通出行四通八达。', '小区旁有大型购物商场易事达，物美超市，丰宁蔬菜基地，航空总医院、安贞医院北苑分院，中国银行、中国农业银行、中国工商银行、中国交通银行、中国建设银行、招商银行分布。小区旁有天奥健身房，还有立水桥公园..', 0, '6号院1号楼', 1, '13号线', 10, '立水桥', 19);
INSERT INTO `house_detail` VALUES (27, '高大上的整租两居室 业主诚意出租\n1、客厅挑高、宽敞舒适、阳光充足 2、卧室搭配的很新颖，使用之高 3、厨房带阳台，让您和家人有足够的空间展现私家厨艺', '客厅挑高、宽敞舒适、阳光充足 2、卧室搭配的很新颖，使用之高 3、厨房带阳台，让您和家人有足够的空间展现私家厨艺', '近地铁13号线东直门站', '社区环境好，环境优美，适宜居住，人文素质高，物业管理完善； 2、属于低密度社区 ，适宜居住 3、小区的林密树多，让您感受花园一样的家', 0, '1号院5号楼', 1, '13号线', 16, '东直门', 20);
INSERT INTO `house_detail` VALUES (28, '房子是正规三室一厅一厨一卫，装修保持的不错，家电家具都齐全。\n', '房子客厅朝北面积比较大，主卧西南朝向，次卧朝北，另一个次卧朝西，两个次卧面积差不多大。', '小区出南门到8号线育新地铁站614米，交通便利，小区500米范围内有物美，三旗百汇，龙旗广场等几个比较大的商场，生活购物便利，出小区北门朝东952米是地铁霍营站，是8号线和 13号线的换乘站，同时还有个S2线，通往怀来。（数据来源百度地图）', '小区西边300米就是物美超市和三旗百汇市场（日常百货、粮油米面、瓜果蔬菜、生鲜海货等等，日常生活很便利，消费成本低），北边200米是龙旗购物广场和永辉超市（保利影院，KFC，麦当劳等，轻松满足娱乐消费）。小区里还有商店，饭店，家政等。', 0, '2号院1号楼', 1, '13号线', 9, '霍营', 21);
INSERT INTO `house_detail` VALUES (31, '懒死了 不谢', '户型介绍', '交通出行', '周边配套', 0, '3号院1号楼', 1, '13号线', 12, '望京西', 24);
INSERT INTO `house_detail` VALUES (32, '房屋描述-编辑', '户型介绍', '交通出行', '周边配套-编辑', 0, '3号院2单元1003', 1, '13号线', 8, '回龙观', 25);

-- ----------------------------
-- Table structure for house_picture
-- ----------------------------
DROP TABLE IF EXISTS `house_picture`;
CREATE TABLE `house_picture`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `house_id` int(11) NOT NULL COMMENT '所属房屋id',
  `cdn_prefix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片路径',
  `width` int(11) NULL DEFAULT NULL COMMENT '宽',
  `height` int(11) NULL DEFAULT NULL COMMENT '高',
  `location` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属房屋位置',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 86 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '房屋图片信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of house_picture
-- ----------------------------
INSERT INTO `house_picture` VALUES (68, 19, 'http://7xo6gy.com1.z0.glb.clouddn.com/', 911, 683, NULL, 'Fp1xPKVYtPsCeVHVQVW0Hif2FXk7');
INSERT INTO `house_picture` VALUES (69, 19, 'http://7xo6gy.com1.z0.glb.clouddn.com/', 1012, 683, NULL, 'Fn371N5gLsJvjuIRC4IHjPtMy61h');
INSERT INTO `house_picture` VALUES (70, 24, 'http://7xo6gy.com1.z0.glb.clouddn.com/', 1280, 960, NULL, 'Fn1AGNmZfadCIVTJA33gByg6a33B');
INSERT INTO `house_picture` VALUES (71, 24, 'http://7xo6gy.com1.z0.glb.clouddn.com/', 1024, 683, NULL, 'FlgoAylUv1ilx1SAtxSyBCJF3bwb');
INSERT INTO `house_picture` VALUES (72, 21, 'http://7xo6gy.com1.z0.glb.clouddn.com/', 1024, 683, NULL, 'FnuOFbFtDYTbpPdFoZthR-R0tszC');
INSERT INTO `house_picture` VALUES (73, 21, 'http://7xo6gy.com1.z0.glb.clouddn.com/', 455, 683, NULL, 'FhCiRnyCDQ-O6pXusu5ftmZkIh0-');
INSERT INTO `house_picture` VALUES (74, 20, 'http://7xo6gy.com1.z0.glb.clouddn.com/', 1024, 683, NULL, 'FvVqU8LneZZ5xaLBAOM1KXR2Pz1X');
INSERT INTO `house_picture` VALUES (75, 20, 'http://7xo6gy.com1.z0.glb.clouddn.com/', 1024, 683, NULL, 'FtNl9uPM6p5PjEs8z2FnOuViNtOM');
INSERT INTO `house_picture` VALUES (76, 18, 'http://7xo6gy.com1.z0.glb.clouddn.com/', 1440, 960, NULL, 'FgcD3BufAprERe5y3Gd-Mezu5VAy');
INSERT INTO `house_picture` VALUES (77, 18, 'http://7xo6gy.com1.z0.glb.clouddn.com/', 1024, 683, NULL, 'Fl1lNikhmMIecbTn-JTsurxugtFU');
INSERT INTO `house_picture` VALUES (78, 17, 'http://7xo6gy.com1.z0.glb.clouddn.com/', 1024, 683, NULL, 'FvVHtS1qAApFFh6k5LMDm5tliufK');
INSERT INTO `house_picture` VALUES (79, 17, 'http://7xo6gy.com1.z0.glb.clouddn.com/', 1024, 683, NULL, 'FpVYJRsLykrBRyUSCEOeqsqWU-bt');
INSERT INTO `house_picture` VALUES (80, 16, 'http://7xo6gy.com1.z0.glb.clouddn.com/', 1024, 683, NULL, 'Fhysh6EcQ_ZTl-jdGe2zaCFi5Uvm');
INSERT INTO `house_picture` VALUES (81, 16, 'http://7xo6gy.com1.z0.glb.clouddn.com/', 1024, 683, NULL, 'Fvb9TDMRtl1haBj9gK9C0k43X0u0');
INSERT INTO `house_picture` VALUES (82, 16, 'http://7xo6gy.com1.z0.glb.clouddn.com/', 1024, 683, NULL, 'FvkO1FFyGbrxCP_1O9tA94u2qvbP');
INSERT INTO `house_picture` VALUES (83, 15, 'http://7xo6gy.com1.z0.glb.clouddn.com/', 1024, 683, NULL, 'FsxiS6rOTpSg5pK7tv41e8Zpnn_c');
INSERT INTO `house_picture` VALUES (84, 15, 'http://7xo6gy.com1.z0.glb.clouddn.com/', 1024, 683, NULL, 'FpOKJ2IEmbA1y1RbIqgZfqFKkJyS');
INSERT INTO `house_picture` VALUES (85, 15, 'http://7xo6gy.com1.z0.glb.clouddn.com/', 1440, 960, NULL, 'Fhxz_c16YmEmIz5UVxrp6ihwbvCk');

-- ----------------------------
-- Table structure for house_subscribe
-- ----------------------------
DROP TABLE IF EXISTS `house_subscribe`;
CREATE TABLE `house_subscribe`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `house_id` int(11) NOT NULL COMMENT '房源id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户描述',
  `status` int(2) NOT NULL DEFAULT 0 COMMENT '预约状态 1-加入待看清单 2-已预约看房时间 3-看房完成',
  `create_time` datetime(0) NOT NULL COMMENT '数据创建时间',
  `last_update_time` datetime(0) NOT NULL COMMENT '记录更新时间',
  `order_time` datetime(0) NULL DEFAULT NULL COMMENT '预约时间',
  `telephone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `admin_id` int(11) NOT NULL COMMENT '房源发布者id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_on_user_and_house`(`house_id`, `user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '预约看房信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of house_subscribe
-- ----------------------------
INSERT INTO `house_subscribe` VALUES (9, 17, 1, NULL, 3, '2017-11-26 11:06:23', '2017-12-02 09:21:01', '2017-12-03 00:00:00', '13888888888', 2);

-- ----------------------------
-- Table structure for house_tag
-- ----------------------------
DROP TABLE IF EXISTS `house_tag`;
CREATE TABLE `house_tag`  (
  `house_id` int(11) NOT NULL COMMENT '房屋id',
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '标签id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_on_house_id_and_name`(`house_id`, `name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '房屋标签映射关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of house_tag
-- ----------------------------
INSERT INTO `house_tag` VALUES (15, 18, '独立阳台');
INSERT INTO `house_tag` VALUES (15, 17, '空调');
INSERT INTO `house_tag` VALUES (16, 16, '光照充足');
INSERT INTO `house_tag` VALUES (17, 15, '随时看房');
INSERT INTO `house_tag` VALUES (17, 14, '集体供暖');
INSERT INTO `house_tag` VALUES (18, 13, '精装修');
INSERT INTO `house_tag` VALUES (19, 12, '独立卫生间');
INSERT INTO `house_tag` VALUES (19, 11, '独立阳台');
INSERT INTO `house_tag` VALUES (21, 19, '光照充足');
INSERT INTO `house_tag` VALUES (21, 20, '独立卫生间');
INSERT INTO `house_tag` VALUES (24, 10, '光照充足');
INSERT INTO `house_tag` VALUES (24, 3, '精装修');
INSERT INTO `house_tag` VALUES (24, 8, '集体供暖');
INSERT INTO `house_tag` VALUES (25, 21, '独立阳台');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) UNSIGNED NOT NULL COMMENT '用户id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户角色名',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id_and_name`(`user_id`, `name`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 1, 'USER');
INSERT INTO `role` VALUES (2, 2, 'ADMIN');
INSERT INTO `role` VALUES (3, 3, 'USER');
INSERT INTO `role` VALUES (4, 4, 'USER');
INSERT INTO `role` VALUES (5, 5, 'USER');
INSERT INTO `role` VALUES (6, 6, 'USER');
INSERT INTO `role` VALUES (7, 7, 'USER');
INSERT INTO `role` VALUES (8, 8, 'USER');

-- ----------------------------
-- Table structure for subway
-- ----------------------------
DROP TABLE IF EXISTS `subway`;
CREATE TABLE `subway`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路名',
  `city_en_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属城市英文名缩写',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_on_city`(`city_en_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subway
-- ----------------------------
INSERT INTO `subway` VALUES (1, '13号线', 'bj');
INSERT INTO `subway` VALUES (2, '1号线', 'bj');
INSERT INTO `subway` VALUES (3, '2号线', 'bj');
INSERT INTO `subway` VALUES (4, '10号线', 'bj');
INSERT INTO `subway` VALUES (5, '8号线', 'bj');
INSERT INTO `subway` VALUES (6, '9号线', 'bj');
INSERT INTO `subway` VALUES (7, '7号线', 'bj');

-- ----------------------------
-- Table structure for subway_station
-- ----------------------------
DROP TABLE IF EXISTS `subway_station`;
CREATE TABLE `subway_station`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `subway_id` int(11) NOT NULL COMMENT '所属地铁线id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '站点名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_station`(`subway_id`, `name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subway_station
-- ----------------------------
INSERT INTO `subway_station` VALUES (5, 1, '上地');
INSERT INTO `subway_station` VALUES (16, 1, '东直门');
INSERT INTO `subway_station` VALUES (4, 1, '五道口');
INSERT INTO `subway_station` VALUES (14, 1, '光熙门');
INSERT INTO `subway_station` VALUES (11, 1, '北苑');
INSERT INTO `subway_station` VALUES (8, 1, '回龙观');
INSERT INTO `subway_station` VALUES (2, 1, '大钟寺');
INSERT INTO `subway_station` VALUES (12, 1, '望京西');
INSERT INTO `subway_station` VALUES (15, 1, '柳芳');
INSERT INTO `subway_station` VALUES (3, 1, '知春路');
INSERT INTO `subway_station` VALUES (10, 1, '立水桥');
INSERT INTO `subway_station` VALUES (13, 1, '芍药居');
INSERT INTO `subway_station` VALUES (6, 1, '西二旗');
INSERT INTO `subway_station` VALUES (1, 1, '西直门');
INSERT INTO `subway_station` VALUES (9, 1, '霍营');
INSERT INTO `subway_station` VALUES (7, 1, '龙泽');
INSERT INTO `subway_station` VALUES (33, 4, '三元家庄');
INSERT INTO `subway_station` VALUES (51, 4, '三元桥');
INSERT INTO `subway_station` VALUES (41, 4, '丰台站');
INSERT INTO `subway_station` VALUES (52, 4, '亮马桥');
INSERT INTO `subway_station` VALUES (27, 4, '健德门');
INSERT INTO `subway_station` VALUES (46, 4, '公主坟');
INSERT INTO `subway_station` VALUES (44, 4, '六里桥');
INSERT INTO `subway_station` VALUES (53, 4, '农业展览馆');
INSERT INTO `subway_station` VALUES (62, 4, '分钟寺');
INSERT INTO `subway_station` VALUES (59, 4, '劲松');
INSERT INTO `subway_station` VALUES (28, 4, '北土城');
INSERT INTO `subway_station` VALUES (61, 4, '十里河');
INSERT INTO `subway_station` VALUES (58, 4, '双井');
INSERT INTO `subway_station` VALUES (55, 4, '呼家楼');
INSERT INTO `subway_station` VALUES (54, 4, '团结湖');
INSERT INTO `subway_station` VALUES (57, 4, '国贸');
INSERT INTO `subway_station` VALUES (35, 4, '大红门');
INSERT INTO `subway_station` VALUES (32, 4, '太阳宫');
INSERT INTO `subway_station` VALUES (29, 4, '安贞门');
INSERT INTO `subway_station` VALUES (64, 4, '宋家庄');
INSERT INTO `subway_station` VALUES (20, 4, '巴沟');
INSERT INTO `subway_station` VALUES (30, 4, '惠新西街南口');
INSERT INTO `subway_station` VALUES (48, 4, '慈寿寺');
INSERT INTO `subway_station` VALUES (63, 4, '成寿寺');
INSERT INTO `subway_station` VALUES (42, 4, '泥洼');
INSERT INTO `subway_station` VALUES (22, 4, '海淀黄庄');
INSERT INTO `subway_station` VALUES (60, 4, '潘家园');
INSERT INTO `subway_station` VALUES (19, 4, '火器营');
INSERT INTO `subway_station` VALUES (26, 4, '牡丹园');
INSERT INTO `subway_station` VALUES (24, 4, '知春路');
INSERT INTO `subway_station` VALUES (23, 4, '知春里');
INSERT INTO `subway_station` VALUES (34, 4, '石榴庄');
INSERT INTO `subway_station` VALUES (39, 4, '纪家庙');
INSERT INTO `subway_station` VALUES (31, 4, '芍药居');
INSERT INTO `subway_station` VALUES (21, 4, '苏州街');
INSERT INTO `subway_station` VALUES (38, 4, '草桥');
INSERT INTO `subway_station` VALUES (45, 4, '莲花桥');
INSERT INTO `subway_station` VALUES (25, 4, '西土城');
INSERT INTO `subway_station` VALUES (43, 4, '西局');
INSERT INTO `subway_station` VALUES (47, 4, '西钓鱼台');
INSERT INTO `subway_station` VALUES (36, 4, '角门东');
INSERT INTO `subway_station` VALUES (37, 4, '角门西');
INSERT INTO `subway_station` VALUES (17, 4, '车道沟');
INSERT INTO `subway_station` VALUES (56, 4, '金台夕照');
INSERT INTO `subway_station` VALUES (18, 4, '长春桥');
INSERT INTO `subway_station` VALUES (40, 4, '首经贸');

-- ----------------------------
-- Table structure for support_address
-- ----------------------------
DROP TABLE IF EXISTS `support_address`;
CREATE TABLE `support_address`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `belong_to` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '上一级行政单位名',
  `en_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '行政单位英文名缩写',
  `cn_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '行政单位中文名',
  `level` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '行政级别 市-city 地区-region',
  `baidu_map_lng` double NOT NULL COMMENT '百度地图经度',
  `baidu_map_lat` double NOT NULL COMMENT '百度地图纬度',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_en_name_and_belong_to`(`en_name`, `level`, `belong_to`) USING BTREE COMMENT '每个城市的英文名都是独一无二的'
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of support_address
-- ----------------------------
INSERT INTO `support_address` VALUES (4, 'bj', 'bj', '北京', 'city', 116.395645, 39.929986);
INSERT INTO `support_address` VALUES (5, 'sh', 'sh', '上海', 'city', 121.487899, 31.249162);
INSERT INTO `support_address` VALUES (6, 'hb', 'sjz', '石家庄', 'city', 114.522082, 38.048958);
INSERT INTO `support_address` VALUES (7, 'hb', 'ts', '唐山', 'city', 118.183451, 39.650531);
INSERT INTO `support_address` VALUES (8, 'hb', 'hd', '邯郸', 'city', 114.482694, 36.609308);
INSERT INTO `support_address` VALUES (9, 'bj', 'dcq', '东城区', 'region', 116.42188470126446, 39.93857401298612);
INSERT INTO `support_address` VALUES (10, 'bj', 'xcq', '西城区', 'region', 116.37319010401802, 39.93428014370851);
INSERT INTO `support_address` VALUES (12, 'bj', 'hdq', '海淀区', 'region', 116.23967780102151, 40.03316204507791);
INSERT INTO `support_address` VALUES (13, 'bj', 'cpq', '昌平区', 'region', 116.21645635689414, 40.2217235498323);
INSERT INTO `support_address` VALUES (14, 'sh', 'ptq', '普陀区', 'region', 121.39844294374956, 31.263742929075534);
INSERT INTO `support_address` VALUES (15, 'sjz', 'caq', '长安区', 'region', 114.59262155387033, 38.07687479578663);
INSERT INTO `support_address` VALUES (16, 'sjz', 'qdq', '桥东区', 'region', 114.51078430496142, 38.06338975380927);
INSERT INTO `support_address` VALUES (17, 'sjz', 'qxq', '桥西区', 'region', 114.43813995531943, 38.033364550068136);
INSERT INTO `support_address` VALUES (18, 'sjz', 'xhq', '新华区', 'region', 114.4535014286928, 38.117218640478164);
INSERT INTO `support_address` VALUES (19, 'bj', 'cyq', '朝阳区', 'region', 116.52169489108084, 39.95895316640668);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户唯一id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `email` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `phone_number` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '电话号码',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `status` int(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户状态 0-正常 1-封禁',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '用户账号创建时间',
  `last_login_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '上次登录时间',
  `last_update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '上次更新记录时间',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_on_phone`(`phone_number`) USING BTREE COMMENT '用户手机号',
  UNIQUE INDEX `index_on_username`(`name`) USING BTREE COMMENT '用户名索引',
  UNIQUE INDEX `index_on_email`(`email`) USING BTREE COMMENT '电子邮箱索引'
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户基本信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'waliwali', 'wali@wali.com', '15111111111', '6fd1aad88b038aeecd9adeccc92b0bd1', 1, '2017-08-25 15:18:20', '2017-08-25 12:00:00', '2017-11-26 10:29:02', 'http://7xo6gy.com1.z0.glb.clouddn.com/99ff568bd61c744bf31185aeddf13580.png');
INSERT INTO `user` VALUES (2, 'admin', 'admin@imooc.com', '1388888888', '$2a$10$6xFSOLZ3HWnjUhFq4S3wHeOsdOiY7oMGQclpovZaC/X6oHT/vWdIC', 1, '2017-08-27 09:07:05', '2017-08-27 09:07:07', '2019-06-22 13:11:47', 'http://7xo6gy.com1.z0.glb.clouddn.com/99ff568bd61c744bf31185aeddf13580.png');
INSERT INTO `user` VALUES (5, '138****8888', NULL, '13888888888', NULL, 0, '2017-11-25 17:56:45', '2017-11-25 17:56:45', '2017-11-25 17:56:45', NULL);
INSERT INTO `user` VALUES (8, '151****9677', NULL, '15110059677', NULL, 0, '2017-11-25 18:58:18', '2017-11-25 18:58:18', '2017-11-25 18:58:18', NULL);

SET FOREIGN_KEY_CHECKS = 1;
