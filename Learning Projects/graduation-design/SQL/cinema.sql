/*
 Navicat Premium Data Transfer

 Source Server         : Mysql
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : cinema

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 04/06/2023 22:38:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_actor
-- ----------------------------
DROP TABLE IF EXISTS `tb_actor`;
CREATE TABLE `tb_actor`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名字',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '照片',
  `height` double NULL DEFAULT NULL COMMENT '身高',
  `age` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '年龄',
  `gender` tinyint(1) NULL DEFAULT NULL COMMENT '性别：1为男，0为女',
  `school` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '毕业院校',
  `race` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '民族',
  `blood_type` int NULL DEFAULT NULL COMMENT '血型：0-A 1-B 2-O 3-RH',
  `constellation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '星座',
  `nation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '国籍',
  `information` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '详细信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_actor
-- ----------------------------
INSERT INTO `tb_actor` VALUES (1, ' 新海诚', 'http://8.142.27.217:39000/cinema/a878e3b6-8c07-4f32-b7ae-7220b02cd9f7.jpg', 172, 49, 1, ' 日本中央大学', '大和民族', 2, '水瓶座', ' 日本', '新海诚 （Makoto Shinkai），原名新津诚 （Makoto Niitsu），1973年2月9日出生于日本长野县南佐久郡小海町，日本动画导演、编剧、作家，毕业于日本长野县野泽北高等学校、日本中央大学文学部日本文学系。 2002年，执导了科幻动画短片《 星之声》。2016年，自编自导了动画电影《 你的名字。》，凭借该片获得了 第40届日本电影学院奖最佳编剧奖及第26届日本电影评论家大奖最佳导演奖。', '2023-04-04 19:19:12', '2023-04-04 19:18:20');
INSERT INTO `tb_actor` VALUES (2, ' 原菜乃华', 'http://8.142.27.217:39000/cinema/6bb89a6e-c90d-4491-9015-30a09a6df8cf.jpeg', 155, 20, 0, '日本中央大学', '大和民族', 0, '处女座', '日本', '原菜乃华（Nanoka Hara），2003年8月26日出生于日本东京都，日本女演员，隶属于Tristone Entertainmen事务所。 主要作品有《 晨曦将至》《 心弦为君而鸣 》。', '2023-04-04 19:19:15', '2023-04-04 19:21:49');
INSERT INTO `tb_actor` VALUES (3, '松村北斗', 'http://8.142.27.217:39000/cinema/f2359778-b1a5-4ad1-8049-b35bbc324dc8.jpg', 177, 28, 1, '亚细亚大学', '大和民族', 1, '双子座', '日本', '松村北斗（まつむら ほくと），1995年6月18日出生于日本静冈县岛田市，日本男演员、歌手， 杰尼斯事务所旗下男子组合 SixTONES的成员。 2009年2月15日，进入杰尼斯事务所；3月21日，加入Jr.组合B.I.Shadow活动至2011年。2012年4月14日，参演个人首部电视剧《 私立马鹿兰高校》。2013年，获得“Jr.恋人赏”第一位。2015年5月1日，结成组合SixTONES。2019年，出演纯爱剧《 完美世界》。2020年1月22日，随组合发行首张单曲《 Imitation Rain》正式出道；9月，参演家庭剧《 一亿日元的再见》。2021年2月，主演的爱情喜剧电影《 Liar×Liar》上映；11月，出演晨间剧《 Come Come Everybody》，并凭借剧中角色获得第111届日剧学院赏最佳男配角奖。2022年，参演爱情剧《 恋爱何必认真？》。', '2023-04-04 19:29:10', NULL);
INSERT INTO `tb_actor` VALUES (4, ' 深津绘里', 'http://8.142.27.217:39000/cinema/e74fd8ae-e882-49a5-8bca-38dd812db118.jpeg', 156, 54, 0, ' 堀越高等学校', '大和民族', 0, '摩羯座', '日本', '深津绘里（Eri Fukatsu），1973年1月11日出生于日本 大分县 大分市。日本演员。毕业于 堀越高等学校。 1986年，赢得原宿小姐大奖；1988年，以艺名水原里绘参演了剧情片《 世纪末暑假》，该片为其处女作；1989年，凭借爱情恐怖片《满月之吻》获得 第13届日本电影学院奖最佳新人奖和第9届罗马幻想电影节最佳女主角；1990年，参演了首部电视剧《 高校三侠》；1996年，首次担任电影主角，凭借爱情电影《 春天情书》获得 第20届日本电影学院奖最佳女主角提名；1999年，凭借电视剧《 她们的时代》获得第22回 日剧学院赏最佳女主角；2000年，凭借爱情喜剧《天气预报的恋人》获得第25回日剧学院赏最佳女配角奖；2001年，凭借清新职场剧《 正义代书战士》获得第28回日剧学院赏最佳女配角奖；2002年，凭借爱情电视剧《 爱的力量》而获得第32回日剧学院赏最佳女主角奖；2003年，因主演家庭情感剧《 宛如阿修罗》获得 第27届日本电影学院奖最佳女配角奖；2006年，主演了神话电视剧《 西游记》；2008年，凭借喜剧片《 魔幻时刻》获得 第3届亚洲电影大奖最佳女演员提名；2010年，凭借剧情片《 恶人》获得 第34届日本电影学院奖最佳女主角；2011年，主演了喜剧电影《 了不起的亡灵》；2014年，主演了科幻剧情片《 寄生兽》；2015年，主演了奇幻爱情电影《 岸边之旅》。2021年，主演晨间剧《 Come Come Everybody》。', '2023-04-04 19:30:50', NULL);
INSERT INTO `tb_actor` VALUES (5, '花泽香菜', 'http://8.142.27.217:39000/cinema/12a2830c-489a-4ada-92e1-08f484c69d0d.jpg', 157, 34, 0, '日本中央大学', '大和民族', 1, '双鱼座', '日本', '花泽香菜（はなざわ かな，Hanazawa Kana），1989年2月25日出生于日本东京，日本女性声优、演员、歌手，隶属于大泽事务所。 花泽香菜是儿童演员出身，在幼儿园时期在参演综艺节目《やっぱりさんま大先生》和电视剧《ガッコの先生》。2003年，在动画《 最终流放》出演荷莉·马德赛因一角，从而正式出道。2006年，在动画《 ZEGAPAIN》出演女主角 守凪了子，正式开始声优工作，在随后的几年之内经由对《 化物语》的千石抚子、《 Angel Beats!》的立华奏等角色的演绎而积累了人气，并在2012年以歌手身份出道。2013年2月20日，推出个人首张专辑《claire》，4月17日获得“Fami通大赏 2012”角色声优奖。2015年5月3日，在日本 武道馆举办个人演唱会，成为第八位在武道馆举办个人演唱会的声优；8月，出席第八届 厦门国际动漫节，成为其首次在中国大陆的活动。', '2023-04-04 19:32:18', NULL);
INSERT INTO `tb_actor` VALUES (6, ' 川村元气', 'http://8.142.27.217:39000/cinema/ec1af43b-4d75-4d8f-b1c9-58718aa351c7.jpg', 175, 40, 1, '上智大学', '大和民族', 1, '金牛座', '日本', '川村元气，上智大学文学部新聞学科卒業後、2001年東宝入社。入社当初は大阪の難波南街の劇場でチケットのモギリの仕事をしていたが、社内の企画募集に応募したことでプロデューサーになる[1]。 2005年、26歳で映画『電車男』を企画・プロデュースして興行収入37億円の大ヒットを記録、社会現象になる[1]。 2008年、『デトロイト・メタル・シティ』を企画・プロデュースして興行収入23億円のヒットを記録。 2010年、『告白』『悪人』を企画・プロデュース。 『告白』は興行収入38億円の大ヒットを記録。日本アカデミー賞最優秀作品賞ほか、米アカデミー賞外国語映画賞日本代表に選出される。 『悪人』は興行収入20億円のヒットを記録。キネマ旬報日本映画ベストテン第一位に選出されたほか、モントリオール世界映画祭にて最優秀女優賞を受賞。 同年、米ハリウッド・リポーター誌の「Next Generation Asia 2010」にプロデューサーとして選出された[1]。 2011年、優れた映画製作者に贈られる「藤本賞」を史上最年少で受賞[2]。 同年、映画『モテキ』を企画・プロデュースして興行収入22億円のヒットを記録。 2012年、初小説『世界から猫が消えたなら』で作家デビュー。同作で2013年本屋大賞にノミネートされる。 2013年、佐野研二郎との共著の絵本『ティニー ふうせんいぬのものがたり』を上梓。 2014年、益子悠紀との共著の絵本『ムーム』を上梓。 山田洋次・沢木耕太郎・杉本博司・倉本聰・秋元康・宮崎駿・糸井重里・篠山紀信・谷川俊太郎・鈴木敏夫・横尾忠則・坂本龍一ら12人との対話をまとめた自身初の仕事の本、『仕事。』を上梓。 初小説『世界から猫が消えたなら』の映画化が決定（監督：永井聡 出演：佐藤健、宮崎あおい） BRUTUS誌に連載された小説第二作『億男』を上梓。', '2023-04-04 19:33:58', '2023-04-04 19:34:17');
INSERT INTO `tb_actor` VALUES (7, '徐昂', 'http://8.142.27.217:39000/cinema/60c52d62-10e6-401c-b4e6-7f57501885a6.jpg', 177, 46, 1, '中央戏剧学院', '汉族', 1, '摩羯座', '中国', '徐昂，1977年11月28日出生于北京，毕业于中央戏剧学院导演系1997级本科班，中国内地男导演、编剧、演员。现就职于北京人民艺术剧院。 2001年被选中与陈好共同主演话剧《 第一次的亲密接触》，而后加入北京人民艺术剧院。2004年，首次独立执导剧场话剧《情人》。2006年成立工作室。2007年反串出演话剧《 女仆》。2008年出演北京人艺与日本四季剧团合作的话剧《 哈姆雷特》。2010年执导话剧《小镇畸人》。2011年，执导由三谷幸喜的剧作《笑的大学》改编而成的话剧《 喜剧的忧伤》。2014年，徐昂执导的电影《 十二公民》在罗马国际电影节上摘得“马可·奥雷利奥”奖，该影片也是第一部在罗马国际电影节获奖的中国影片。2015年执导年代剧《 猎人》。2016年执导刑侦网络剧《 法医秦明》。', '2023-04-04 19:41:09', NULL);
INSERT INTO `tb_actor` VALUES (8, '大黄', 'http://8.142.27.217:39000/cinema/3bf56776-4c24-445b-b0f4-3a54091d724d.jpg', 40, 2, 1, '无', '无', 0, '金牛座', '中国', '大黄（中华田园犬），八筒', '2023-04-04 19:42:51', NULL);
INSERT INTO `tb_actor` VALUES (9, ' 冯小刚', 'http://8.142.27.217:39000/cinema/ded0219e-7e0a-45dc-8aa0-06724fc00a7b.jpg', 178, 67, 1, '中国戏曲学院', '汉族', 2, ' 双鱼座', '中国', '冯小刚，毕业于中国戏曲学院。以美术设计身份进入影视行业，1993年与郑晓龙合作执导电视剧《北京人在纽约》开始被大众熟悉，从1997年的《甲方乙方》开始 ，冯小刚开启了自己的贺岁片系列，《不见不散》《没完没了》《大腕》等贺岁电影都获得市场认可，接着以《天下无贼》《夜宴》《唐山大地震》不断刷新票房。2014年冯小刚担任中央电视台春节联欢晚会总导演，2015年担任第六届导演协会副会长。他的作品多次获得金鸡奖和百花奖的最佳影片和最佳导演，华语地区的重要奖项都可见冯小刚作品的身影。2015年因出演电影《老炮儿》还获得金马奖最佳男主角。2016年，冯小刚的电影《我不是潘金莲》获得多项国内外大奖，包括多伦多电影节国际影评人费比西奖、圣塞巴斯蒂安国际电影节金贝壳奖、金马影展最佳导演奖等。', '2023-04-04 19:44:07', NULL);
INSERT INTO `tb_actor` VALUES (10, ' 白举纲', 'http://8.142.27.217:39000/cinema/c7d1185c-5703-4c87-9e26-33c688c5530b.jpg', 178, 30, 1, '四川师范大学', '汉族', 2, '天蝎座', '中国', '白举纲，1993年11月2日出生于四川省绵阳市江油市，中国内地流行乐男歌手、影视演员，毕业于四川师范大学音乐学院声乐系2012级。 2013年，参加湖南卫视选秀娱乐节目《 快乐男声》，获得全国总决赛季军，从而正式进入演艺圈；随后，推出个人原创单曲《 乘着破船回家》；同年，获得“第六届音乐风云榜新人盛典”年度潜力新人奖。2014年，出版首本个人写真画册《 少年白PAX\'S ATTITUDE》；同年，出演剧情电影《 老炮儿》。2015年，获得“第15届音乐风云榜年度盛典”最佳新人奖；同年，推出首张个人音乐专辑《 少年白》。2016年，凭借专辑《 野草》获得“第11届劲歌王全球华人音乐盛典”最佳创作人奖。2017年，与周笔畅一同为电视剧《 择天记》演唱主题曲《 注定》；6月23日，其主演的警匪动作电影《 缉枪》上映。2018年，作为固定嘉宾参加的湖南卫视青春合伙人经营体验节目《 中餐厅第二季》开播；9月，主演的爱情喜剧电影《 说走就走之不说再见》上映；10月，《耳盲》全国巡演正式启动。2019年1月6日，获得Q China 2018年度音乐盛典年度最佳摇滚歌手奖；5月，作为下半区首发唱作人参加爱奇艺华语唱作人生态挑战节目《 我是唱作人》；8月17日，作为乐团领队参加的中国首档乐队成长类音乐综艺《 一起乐队吧》在优酷开播。2021年8月，参加全景音乐竞演节目《 披荆斩棘的哥哥》，最终加入“滚烫唱演家族”。', '2023-04-04 19:45:18', NULL);
INSERT INTO `tb_actor` VALUES (11, '陈冲', 'http://8.142.27.217:39000/cinema/d56fd90e-8e5c-4541-86b1-a33c9abfc05d.jpg', 165, 65, 0, '上海外国语学院', '汉族', 0, '金牛座', '中国', '陈冲（Joan Chen），出生于中国上海市，华语影视女演员 、电影导演 ，奥斯卡金像奖评委，好莱坞编剧家协会会员，毕业于上海外国语学院。 1976年，因出演电影《青春》而崭露头角。 1980年，凭借电影《小花》获得第3届大众电影百花奖最佳女演员奖 。 1988年，主演的电影《末代皇帝》获得第60届奥斯卡金像奖包括最佳影片在内的9项大奖。 1994年，凭借电影《红玫瑰与白玫瑰》获得第31届台湾电影金马奖最佳女主角奖 。 1997年，执导的电影《天浴》入围第48届柏林国际电影节主竞赛单元，获得第35届台湾电影金马奖最佳剧情片奖、最佳导演奖等6项大奖。 2007年，凭借电影《意》获得第44届台湾电影金马奖最佳女主角奖。 2013年，参与中央电视台综艺节目《舞出我人生》的录制。 2014年10月，担任第51届台湾电影金马奖评委会主席。 2016年，参演电影《没有别的爱》 [8] 和古装剧《如懿传》。 2019年10月，担任第三届平遥国际电影展评审团成员。 12月13日，主演的电影《误杀》上映。', '2023-04-04 19:47:00', NULL);
INSERT INTO `tb_actor` VALUES (12, ' 叶如芬', 'http://8.142.27.217:39000/cinema/2397579d-12bb-4e7d-bf6e-a5ffb2b5150c.jpg', 165, 45, 0, '中央戏剧学院', '汉族', 0, '金牛座', '中国', '叶如芬，台湾资深电影人，合作对象囊括各个世代、作品题材各异，享誉中外的优秀导演们。历年作品质量兼具，擅长电影开发投资、资源整合、预算掌控製作，具备丰富的国际合作拍摄经验。2004年开创威像电影公司，以独到眼光，持续製作电影及整合华语区优秀人才及资源。推出不同类型、多元创意的优质影片。深耕电影产业超过二十年，2013年获得第50届金马奖年度台湾杰出电影工作者。现在为华文创股份有限公司担任总监製。历年重要代表电影作品：《蓝色项圈》、《切小金家的旅馆》、《大佛普拉斯》、《健忘村》、《一路顺风》、《销售奇姬》、《我的少女时代》、《白米炸弹客》、《失魂》、《总舖师》、《女朋友。男朋友》等。', '2023-04-04 19:48:27', NULL);
INSERT INTO `tb_actor` VALUES (13, ' 孔大山', 'http://8.142.27.217:39000/cinema/d4e3b2eb-7aec-4292-8757-2ebec88c93ac.jpg', 175, 46, 1, '北京电影学院', '汉族', 1, '金牛座', '中国', '孔大山是一名电影导演。代表作品有《宇宙探索编辑部》。 2022年7月27日，凭借《宇宙探索编辑部》获得第13届青年电影手册盛典青年电影手册2021年度导演。', '2023-04-04 19:55:26', '2023-04-04 19:55:51');
INSERT INTO `tb_actor` VALUES (14, '杨皓宇', 'http://8.142.27.217:39000/cinema/a3e8d8f4-25e8-4899-8f85-aba7afbb51a6.jpg', 180, 35, 1, ' 上海戏剧学院', '汉族', 2, ' 天秤座', '中国', '杨皓宇，毕业于上海戏剧学院97级表演系本科，北京拾捌文化经纪有限公司签约艺人。2001年，搭档陆毅、任泉主演吴天戈执导的青春偶像剧《花样的年华》。2004年，在导演史凤和执导的警匪侦探剧《夜雨霏霏》。2006年，搭档李子雄，侣箫主演爱情悬疑剧《二路电车》。2008年，出演导演尚敬执导的情景喜剧《都市六人行》。2011年，凭借话剧《资本论》、《秀才与刽子手》 在第十五届上海佐临话剧艺术奖上获得最佳男配角；凭借 《我爱桃花》获得第21届上海白玉兰戏剧表演艺术奖最佳男配角。2012年，与袁咏仪、郭京飞、钱芳共同主演古装职场喜剧《龙门镖局》。2014年4月，与包贝尔、魏千翔、海陆共同出演何念经典舞台剧《鹿鼎记》。', '2023-04-04 19:57:14', NULL);
INSERT INTO `tb_actor` VALUES (15, ' 艾丽娅', 'http://8.142.27.217:39000/cinema/ee75cbbf-d5c4-494a-ae2b-7f75a814a46b.jpeg', 167, 58, 0, '北京电影学院', '汉族', 2, '射手座', '中国', '艾丽娅，生于内蒙古自治区呼和浩特市，中国电影演员。毕业于 北京电影学院表演系民族本科班，被分配到 内蒙古电影制片厂当演员。 1986年在影片《 狼迹》中饰演女主角。1991年在《 女绑架者》、《 女囚大队》等影片中扮演角色。1994年在影片《 二嫫》中饰演一个河北农村妇女， 荣获 第1届中国电影华表奖 最佳女主角、 第15届中国电影金鸡奖 最佳女主角。1995年艾丽娅影片《 烟雨长河》中饰演湘西一个女军官。 1999年，主演电影《 一代天骄成吉思汗 》荣获第4届上海国际电影节金爵奖最佳女演员。 2010年，主演电影《 守望天山 》。 2016年，凭电影 《 盛先生的花儿 》在第19届上海国际电影节电影频道传媒关注单元斩获最受传媒关注女配角。2017年，凭借电影《告别》获 第31届中国电影金鸡奖最佳女配角提名。 2019年主演王小帅执导的电影《 地久天长 》饰演李海燕。', '2023-04-04 20:00:14', NULL);
INSERT INTO `tb_actor` VALUES (16, '龚格尔', 'http://8.142.27.217:39000/cinema/ccbdb931-28bd-411d-a438-29e1e4dabcd0.jpg', 175, 42, 1, '北京电影学院', ' 蒙古族', 2, '双鱼座', '中国', '龚格尔，《流浪地球》制片人、编剧。', '2023-04-04 20:01:56', NULL);
INSERT INTO `tb_actor` VALUES (17, '郭帆', 'http://8.142.27.217:39000/cinema/cf9c776d-f89d-4c3b-bbc9-b3f07a053302.jpg', 175, 43, 1, '海南大学、北京电影学院', '汉族', 1, ' 射手座', '中国', '郭帆，电影导演、编剧及监制。本科毕业于海南大学法学院，研究生毕业于北京电影学院管理学院。2003-2007年 中国旅游卫视（现海南卫视）后期包装；2007年担任共和文化传媒（北京）有限公司 执行董事/总经理；2011年自编自导电影处女作《李献计历险记》全国公映，同年影片荣获第十六届韩国富川国际电影节最佳亚洲电影奖；个人荣获2016年全球华语科幻电影星云奖最佳原创剧本奖等奖项；2014年第二部导演作品《同桌的你》全国公映，同年影片荣获第二十一届北京大学生电影节组委会大奖和第十届中美电影节金天使奖等奖项；2015年担任郭帆导演工作室 董事长／总经理；2019年，编剧/导演电影作品《流浪地球》全球公映，取得46.88亿元人民币的票房成绩（全球票房7亿美元），位列中国电影史票房第四位。', '2023-04-04 20:03:09', NULL);
INSERT INTO `tb_actor` VALUES (18, '王一通', 'http://8.142.27.217:39000/cinema/c4861899-93d1-41bf-aa93-4efd13fd36d6.jpg', 175, 32, 1, '西南大学', '汉族', 2, '金牛座', '中国', '郭帆，电影导演、编剧及监制。本科毕业于海南大学法学院，研究生毕业于北京电影学院管理学院。2003-2007年 中国旅游卫视（现海南卫视）后期包装；2007年担任共和文化传媒（北京）有限公司 执行董事/总经理；2011年自编自导电影处女作《李献计历险记》全国公映，同年影片荣获第十六届韩国富川国际电影节最佳亚洲电影奖；个人荣获2016年全球华语科幻电影星云奖最佳原创剧本奖等奖项；2014年第二部导演作品《同桌的你》全国公映，同年影片荣获第二十一届北京大学生电影节组委会大奖和第十届中美电影节金天使奖等奖项；2015年担任郭帆导演工作室 董事长／总经理；2019年，编剧/导演电影作品《流浪地球》全球公映，取得46.88亿元人民币的票房成绩（全球票房7亿美元），位列中国电影史票房第四位。', '2023-04-04 20:04:27', NULL);
INSERT INTO `tb_actor` VALUES (19, '胡树真', 'http://8.142.27.217:39000/cinema/a813ec8f-9fab-4ddc-89fc-301af31c3d00.jpg', 165, 33, 0, '北京电影学院', '汉族', 2, '金牛座', '中国', '胡树真，电影剪辑师，研究生毕业于北京电影学院导演系。第五届青葱计划十强。剪辑指导作品《暴裂无声》获得第13届华语青年影像论坛年度新锐剪辑师提名。剪辑指导作品《不要再见啊，雨花塘》入围第74届洛迦诺国际电影节当代影人单元。', '2023-04-04 20:05:52', NULL);
INSERT INTO `tb_actor` VALUES (20, '乔纳森·戈尔茨坦', 'http://8.142.27.217:39000/cinema/3c402a47-0622-4371-9bf0-286cf42cd9d2.jpg', 188, 55, 1, '美国戏剧艺术大学', '欧裔美国', 2, ' 处女座', '美国', '乔纳森·戈尔茨坦，乔纳森·M·戈尔茨坦，美国编剧、制片人、导演，曾担任《恶老板》等影片的编剧。', '2023-04-04 20:13:05', NULL);
INSERT INTO `tb_actor` VALUES (21, '约翰·弗朗西斯·戴利', 'http://8.142.27.217:39000/cinema/dfa98ff3-2c69-49f1-9e9f-435705ec0f95.jpg', 188, 48, 1, '美国戏剧艺术大学', '欧裔美国', 3, '巨蟹座', '美国', '约翰·弗朗西斯·戴利，约翰·弗朗西斯·达利（John Francis Daley），1985年7月20日生于美国伊利诺伊州威灵，美国演员、导演、编剧。他主演过 国家广播公司（NBC）的电视系列剧《Freaks and Geeks》。凭借在美国电视系列剧《 识骨寻踪》里饰演心理学家Lance Sweets，他为人所广泛熟知。', '2023-04-04 20:14:21', NULL);
INSERT INTO `tb_actor` VALUES (22, ' 克里斯·派恩', 'http://8.142.27.217:39000/cinema/9c8c577c-74f4-4351-933e-ca469ad1e55c.jpg', 183, 43, 1, ' 加州大学伯克利分校', '欧裔美国', 0, ' 加州大学伯克利分校', '美国', '克里斯·派恩 （Chris Pine）1980年8月26日出生于美国加利福尼亚的洛杉矶，他出生在一个演艺世家里，父亲是老牌影星罗伯特·派恩（Robert Pine），母亲是电视明星葛文·基尔福特（Gwynne Gilford），他的外祖母是好莱坞演员Anne Gywnne，外祖父是好莱坞律师Max M. Gliford。姐姐凯瑟琳·派恩也参与过影视演出！2009年在《星际迷航》里扮演寇克船长一角！克里斯在圣费尔南多谷（San Fernando Valley）长大，在加州大学伯利克主修英语专业。', '2023-04-04 20:16:12', NULL);
INSERT INTO `tb_actor` VALUES (23, ' 米歇尔·罗德里格兹', 'http://8.142.27.217:39000/cinema/d7509607-846b-454c-92d3-c29b92547a1c.jpg', 163, 45, 0, '美国戏剧艺术大学', '欧裔美国', 2, '巨蟹座', '美国', '米歇尔·罗德里格兹，拉丁美女米歇尔·罗德里格兹1978年7月12日生于美国德州的贝尔县。母亲是某合唱队的成员，父亲则是大学讲师，均来自波多黎各。 8岁那年，他们举家搬到多米尼加，两年后又搬到波多黎各住了一年。由于父亲后来在纽约大学取得了一个职位，他们又举家搬到了纽约附近的新泽西。父母离异之后，罗德里格兹随管教甚严的母亲及外祖母生活，但可以经常去探望放浪形骸的父亲(他与不同女人共生育了10个子女)。虽然母亲、外祖母以及父亲三人给了她许多混杂甚至相互矛盾的教育和影响，但罗德里格兹从小一副野小子的性格却浑然天成，从未有过改变与动摇。动荡的生活使得她经常换校读书，但似乎哪一所学校也不对她的胃口。因常常与老师顶嘴，她先后曾经被六所学校扫地出门。终于，在17岁那年，当她再次被学校开除之后，她觉得自己也受够了学校的教育，决定不再返回校园。多年之后，她对此解释说：“我不想做一个朝九晚五的上班木偶。我也从来就不是那种只求结婚生子的芭比娃娃式的女孩。我会穿上紧扣的衬衫和牛仔裤，叉腿而坐，灌着啤酒，摆出一股无需男人庇护的架式。我不需要保护，但我(那时)也不知道如何寻找一种不同的生活。” 无人引导的罗德里格兹却认准了电影这条路。她虽然连高中都未读完，但却一直梦想着写电影剧本。为此，她一边在新泽西的一家“玩具反斗城”里打工养活自己，一边尽可能地关注着身边招聘群众演员的电影广告，以求一个的机会。得到出演《女生出拳》的主角是对罗德里格兹的梦想和不懈努力的最终回报。导演卡琳·库莎玛说：“米歇尔似乎有一些不寻常的东西。她有一种很野性的单纯，形象很硬，但却智慧过人。与经验比起来，她的信心、精力与个性给人的印象更强烈。”多亏库莎玛导演慧眼识珠，好来坞才又多了一位硬派女星。 之后罗德里格兹又相继出演了《速度与激情》、《生化危机》、《反恐特警组》及热门美剧《迷失》等，其硬朗又不乏女性魅力的形象日益确立。2009年罗德里格兹出演了《赛车风云》(《速度与激情4》)，并在詹姆斯·卡梅隆的超级大片《阿凡达》中扮演心地善良的女大兵朱迪，2010年上映的由另类导演罗伯特·罗德里格兹导演的《弯刀》中也可见到她的身影。', '2023-04-04 20:17:29', NULL);
INSERT INTO `tb_actor` VALUES (24, '詹姆斯·卡梅隆', 'http://8.142.27.217:39000/cinema/b13d522f-9eed-4130-8648-69b2956c4eec.jpg', 188, 69, 1, '英国戏剧学院', '欧裔美国', 2, '狮子座', '英国', '詹姆斯·卡梅隆，加拿大电影导演，擅长拍摄动作片以及科幻电影。詹姆斯·卡梅隆曾在加州的两年制社区学院学习物理学，但没多久又改主修英文，但在开学前自己休学。他到南加州大学的图书馆找资料自修学习电影特效技术，并用开卡车赚钱的空档写剧本。 1977年，詹姆斯·卡梅隆看到了乔治·卢卡斯的经典科幻影片《星球大战》，他激动地意识到这就是他想要创造的东西。这使得詹姆斯·卡梅隆确立了自己的人生方向并开始为此忙碌起来，从未接受过专业训练的他开始到处寻找机会成为电影人，熟悉从镜头到摄影机导轨的各种电影制作器材，甚至和朋友制定了人生第一个拍摄计划，想要利用手头的设备和自制的模型制作一部10分钟的科幻影片！ 詹姆斯·卡梅隆是幸运的，他的才华很快就得到了好莱坞制片人罗杰·卡曼的赏识，从罗杰·卡曼那里他得到了人生第一份电影方面的工作——为卡曼工作室1980年的影片《星空大战》制作特技模型，第二年他就升职为这个工作室的另一部影片《恐怖星系》的第二小组导演和电影制作设计师。詹姆斯·卡梅隆是少有的以特技设计出身的导演之一，在以后的电影创作中，詹姆斯·卡梅隆一向把特技制作放在一个极其重要的位置，而且还经常亲自参与设计和实施特技的制作。 1981年，詹姆斯·卡梅隆的第一部导演作品问世。这部名叫《食人鱼2：繁殖》的影片完全在意大利拍摄，而拍摄完毕后，制片方出于对这个羽翼未丰的导演的轻视，不让他参与影片的最终剪辑。25岁的詹姆斯·卡梅隆下定决心不再为任何人卖命，一定要制作自己的电影。', '2023-04-05 14:47:06', '2023-04-05 14:51:22');
INSERT INTO `tb_actor` VALUES (25, '莱昂纳多·迪卡普里奥', 'http://8.142.27.217:39000/cinema/1838ca4d-9b61-4fcf-a27e-7b0d638af699.jpg', 180, 49, 1, '英国戏剧学院', '欧裔美国', 3, '天蝎座', '英国', '莱昂纳多·迪卡普里奥（Leonardo DiCaprio），1974年11月11日出生于美国加利福尼亚州洛杉矶，美国影视演员、制作人。1990年，16岁的他参加了电视剧《成长的烦恼》的拍摄。1993年，他凭借《不一样的天空》中的表演获得了第66届奥斯卡金像奖最佳男配角奖和第51届美国电影电视金球奖最佳男配角的提名。1995年，拍摄电影《罗密欧与朱丽叶》，荣膺第47届柏林国际电影节最佳男主角。1997年，莱昂纳多主演了《泰坦尼克号》。2002年，莱昂纳多出演了史蒂文斯皮尔伯格导演的《逍遥法外》，并因此获得了金球奖男主角的提名。2004年，和马丁西科塞斯合作的《飞行家》为莱昂迎来一个美国金球奖最佳男演员奖。2006年，凭借《无间道风云》和《血钻》获得金球奖最佳男主角的双提名。2010，他出演了《盗梦空间》。2013年，他主演了电影《了不起的盖茨比》。2014年1月，他凭借《华尔街之狼》中的表演获得了金球奖最佳男主角奖；9月17日，被联合国授予联合国“和平使者”，关注气候变化。2015年，莱昂纳多·迪卡普里奥收入2900万美元，居福布斯全球演员富豪榜排名第13位。2016年，凭借电影《荒野猎人》获得第73届金球奖最佳男主角奖和第88届奥斯卡金像奖最佳男主角奖。2019年获得2020年第77届金球奖电影类音乐/喜剧片最佳男主角提名。', '2023-04-05 14:48:46', '2023-04-05 14:51:04');
INSERT INTO `tb_actor` VALUES (26, '凯特·温丝莱特', 'http://8.142.27.217:39000/cinema/37e0e5b5-6d95-48a4-9c21-167155100be0.jpg', 169, 48, 0, '英国戏剧学院', '英格兰人', 0, '天秤座', '英国', '凯特·温丝莱特，凯特·温斯莱特，英国著名女演员与歌手。曾获得演员工会奖与英国电影学院奖，并在第66届金球奖中以《革命之路》获戏剧类最佳女主角奖，并同时以《生死朗读》获戏剧类最佳女配角奖。凯特·温斯莱特也曾获得格莱美奖，并6次入围奥斯卡奖与艾美奖，最终以《生死朗读》获得奥斯卡最佳女主角奖。她于22岁时第2次入围奥斯卡奖，成为史上最年轻就获得2次入围的演员。《纽约杂志》称赞凯特·温斯莱特是“她的世代中最杰出的英语电影演员”。 凯特·温斯莱特从电视上开始演员生涯，并在1991年英国广播公司的儿童科幻小说电视系列剧《Dark Season》中演出。然后她在1992年的电视电影《Anglo-Saxon Attitudes》与1993年的电视系列剧《急诊室》中演出。她在电影中的首次演出是彼得·杰克森所执导的《梦幻天堂》，并饰演女主角茱丽叶·休姆，凯特·温斯莱特这次演出受到许多正面的评价。 之后，凯特·温斯莱特与艾玛·汤普逊演出李安执导的《理智与情感》，并且因此成名（尤其在英国）。凯特·温斯莱特也因这次演出获得英国电影学院奖（最佳女配角奖），并首次入围奥斯卡奖。她在1997年卖座电影《泰坦尼克号》中担任女主角萝丝·道森-卡维特，并因此闻名全球。 凯特·温斯莱特也受到影评人的喜爱，每部由她所主演的电影大都得到多正面的评价，此外，凯特·温斯莱特还参与了许多低成本独立电影的演出，如《北非情人》、《圣烟烈火情》等，并且为了演出这些影片甚至拒绝了一些出演大制作影片的机会，如《莎翁情史》。在凯特·温斯莱特的演艺生涯中，她经常拒绝在一些高成本的电影中演出，例如《安娜与国王》与《指环王电影三部曲》。她也参加几部历史电影的演出，例如《鹅毛笔》、《泰坦尼克号》与《寻找梦幻岛》，她也因此得到“紧身衣凯特”的外号。 凯特·温斯莱特在2001年参加李察·艾尔执导的《携手人生》，并因此第3度入围奥斯卡奖。在2004年，她与知名演员金·凯瑞合作演出喜剧《美丽心灵的永恒阳光》，并再度入围奥斯卡最佳女主角奖。凯特·温斯莱特后来以托德·菲尔德执导的《身为人母》第3度入围奥斯卡最佳女主角奖，虽然最后输给海伦·米兰。 凯特·温斯莱特也在2005年时于美国运通的电视广告中出现。凯特·温斯莱特与列奥那多·狄卡皮欧再度于2008年的《革命之路》中合作，饰演一对1950年代的夫妻。这是他们自从《泰坦尼克号》之后再度合作。她也在2008年参加由德国小说家本哈德·施林克所改编的《生死朗读》。凯特·温斯莱特后来分别以《革命之路》及《生死朗读》获得金球奖最佳女主角与最佳女配角奖，也因此次入围奥斯卡最佳女主角奖。 2011年暌违电视圈多年（她童星时以电视剧入行）的凯特演出的五集电视迷你剧《欲海情魔》，获得了不俗的反响。凯特·温斯莱特也凭借本片中的出色表演，最终获得了美国电视最高奖——第63届艾美奖电视电影类最佳女主角。', '2023-04-05 14:50:42', NULL);
INSERT INTO `tb_actor` VALUES (27, ' 罗素·卡朋特', 'http://8.142.27.217:39000/cinema/3b9acc9b-9c28-4eb9-8644-d1b47edec86b.jpg', 175, 73, 1, '美国戏剧学院', '欧裔美国', 1, ' 射手座', '美国', '罗素·卡朋特，Russell Carpenter was born on December 9, 1950 in Van Nuys, California, USA as Russell Paul Carpenter. He is known for his work on Titanic (1997), Ant-Man (2015) and True Lies (1994).', '2023-04-05 14:53:01', NULL);
INSERT INTO `tb_actor` VALUES (28, '儿玉兼嗣', 'http://8.142.27.217:39000/cinema/dbe06ba2-cc31-4159-8d12-8ed00f0c9500.jpg', 170, 74, 1, '东京大学', ' 大和族', 2, ' 射手座', ' 日本', '儿玉兼嗣，1949年出生于 北海道。1970年进入东京MOVIE，经过担任《 巨人之星》、《新怪物Q太郎》、《新罗平三世》的辅助作画导演之后独立。主要导演作品有：《七龙珠》、《名侦探柯南》、《KYATSU AI》（第2期）、《城市猎人》、《我和我——两个洛蒂》等等。', '2023-04-05 14:55:39', NULL);
INSERT INTO `tb_actor` VALUES (29, ' 高山南', 'http://8.142.27.217:39000/cinema/ef3efd26-8d82-40f7-bbc3-fe7f1977bfba.jpg', 156, 59, 0, '日本工学院专门学校', '大和民族', 1, ' 金牛座', '日本', '高山南，1964年5月5日出生于日本 东京都 足立区，日本女性声优。与日本歌手 永野椎菜合组 歌唱组合 TWO-MIX。声优代表作品有《 名侦探柯南》 江户川柯南、《 乱马1/2》 天道靡、《 剑勇传说》 铁剑、《忍者乱太郎》猪名寺乱太郎、《 通灵王》 麻仓好、《 数码兽合体战争》 工藤大器、《 超级弹丸论破2》 日向创、神座出流、《 战姬绝唱Symphogear》 天羽奏、《 仙乐传说》米特斯、《 阴阳师》跳跳弟弟。2005年5月5日，高山南于生日当天与《 名侦探柯南》的作者 青山刚昌结婚，后于2007年12月9日离婚。', '2023-04-05 14:56:56', NULL);
INSERT INTO `tb_actor` VALUES (30, '山崎和佳奈', 'http://8.142.27.217:39000/cinema/45380561-d965-4bc3-9a37-d171e5e2d06f.jpg', 153, 59, 0, ' 青二塾大阪校', '大和民族', 2, ' 白羊座', '日本', '山崎和佳奈，1965年3月21日出生于日本神奈川县横滨市，在京都府长大，日本女性声优，隶属青二Production。代表配音作品有《 名侦探柯南》 毛利兰、《橘子酱男孩》秋月茗子、《 GS美神极乐大作战》玛丽亚、《 格斗美神武龙》毛兰以及《海贼王》诺琪高等。', '2023-04-05 14:58:45', NULL);
INSERT INTO `tb_actor` VALUES (31, ' 神谷明', 'http://8.142.27.217:39000/cinema/a59624c5-cef5-42ff-aceb-07c8e259daa3.jpg', 163, 77, 1, ' 东京都立芝商业高等学校', '大和民族', 0, ' 处女座', '日本', '神谷明，日本资深男性实力派声优，出生于神奈川县横滨市南区，毕业于东京都立芝商业高等学校，原青二Production下属声优，现属于自己创立的冴羽商事。曾为《 盖塔机器人》中的 流龙马等配音。', '2023-04-05 15:00:02', NULL);
INSERT INTO `tb_actor` VALUES (32, '田中秀幸', 'http://8.142.27.217:39000/cinema/e59f0eaf-2ebc-4ae5-8416-436576c7cc45.jpg', 172, 73, 1, '桐朋学园艺术短期大学', '大和民族', 1, ' 天蝎座', '日本', '田中秀幸（たなか ひでゆき，Tanaka Hideyuki），1950年11月12日出生于东京都 大田区，日本男性声优、演员、剧情解说员。 出道作品为《 科学忍者队》中的赫姆拉。代表作品有《 变形金刚-胜利之斗争》皇者之剑 史达、《城市猎人》慎村、《灌篮高手》 木暮公延、《 圣斗士星矢》 艾欧里亚、《间之楔》Katze、《 名侦探柯南》 工藤优作、《魔卡少女樱》 木之本藤隆、《 海贼王》 唐吉诃德·多弗朗明哥等。', '2023-04-05 15:01:15', NULL);
INSERT INTO `tb_actor` VALUES (33, '茶风林', 'http://8.142.27.217:39000/cinema/f07037ab-4031-4576-bd7d-d62924dab3f6.jpg', 165, 61, 1, '东洋大学', '大和民族', 3, ' 射手座', '日本', '茶风林（ 日文：ちゃふうりん、1961年12月4日）是日本的男性声优。 大泽事务所所属。 埼玉县出身。以前曾用本名的岛沢 弘隆（しまざわ ひろたか）的名字活动。 东洋大学毕业。现在的艺名一般是认为由喜剧大师查理卓别林的名字演化而来。一般扮演正义角色，但是在扮演永泽这样的 反面角色也非常出色。在成人游戏也有角色扮演。', '2023-04-05 15:02:28', NULL);
INSERT INTO `tb_actor` VALUES (34, ' 青山刚昌', 'http://8.142.27.217:39000/cinema/5f0bb12e-2b88-44a0-b466-425bfd1440c6.jpg', 169, 59, 1, '东京大学', '大和民族', 1, ' 双子座', '日本', '青山刚昌，日本漫画家，原名“刚昌”（よしまさ），1963年生于大荣町由良宿。在当地由良育英高中毕业后，进入日本大学艺术学院。 1986年冬《约定》（《等我一下》）在《周刊少年Sunday》增刊号初登场，入选第19界小学馆新人漫画大奖，并以该作品正式出道。1992年《剑勇传说》获第38回小学馆漫画奖（儿童漫画部门）。1994年其代表作《名侦探柯南》在《周刊少年Sunday》开始连载，并于2001年获第46回小学馆漫画奖（少年漫画部门）。2005年与柯南的配音高山南结婚（2007年离婚）。', '2023-04-05 15:03:49', NULL);
INSERT INTO `tb_actor` VALUES (35, ' 大野克夫', 'http://8.142.27.217:39000/cinema/222ccdc6-3a3e-4957-812d-a0d611d55313.jpg', 169, 84, 1, '东京大学', '大和民族', 2, ' 处女座', '日本', '大野克夫作为夏威夷吉他手，以关西的爵士咖啡馆为中心的音乐演出是他音乐活动的开端。1962年起至1972年的10年间，大野作为THE SPIDERS乐队成员之一活跃于日本音乐界。 乐队解散后他又与泽田研二、荻原建一等组成演唱组合，此后又作为井上BOND的成员出现在舞台上，此期间为泽田研二创作了大量歌曲，这其中就包括著名的《时の过ぎゆくままに》（任意让时光消逝），这首歌后来成为钟镇涛翻唱的粤语金曲《让一切随风》，后又被伍佰翻唱为国语的《爱你一万年》。 大野克夫接触到影视剧音乐制作是从1972年开始，当年他担任了人气刑事电视剧《拥抱太阳》的音乐制作，首次担纲影视剧音乐的大野克夫竟受到了非常高的评价。 此后的1975年和1977年，大野不断获得各种音乐方面的重量级奖项，那时的他已成为了当时歌谣界的畅销制作人，确立了在日本唱片界具有代表性的地位。 从1996年开始，大野克夫开始为每年都有新作上映的动画电影《名侦探柯南》系列担任幕后音乐制作，电影公映的同时配乐专辑也同时发行。当初接手“柯南”音乐的时候，大野打算把《向太阳怒吼》那样的激情带入到“柯南”中，如果你现在听到《拥抱太阳》的音乐，一定能找到“柯南”的影子。 大野克夫就是用这种对待音乐的认真和耐心创作出了几十首在不经意间就能深深刻在观众脑海中的优美旋律，大野15年如一日的创作激情为《名侦探柯南》锦上添花，他的创作总能抓住时代潮流的涌动并走在业界最前端，这对于一位七十多岁的老人来说，简直是一种神迹。', '2023-04-05 15:04:59', NULL);
INSERT INTO `tb_actor` VALUES (36, '吉田彻', 'http://8.142.27.217:39000/cinema/5cf74590-b740-446a-a198-cfe4392b97aa.jpg', 165, 72, 1, '东京大学', '大和民族', 3, ' 水瓶座', '日本', '擅长摄影', '2023-04-05 15:06:22', NULL);

-- ----------------------------
-- Table structure for tb_age
-- ----------------------------
DROP TABLE IF EXISTS `tb_age`;
CREATE TABLE `tb_age`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '年代名',
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_age
-- ----------------------------
INSERT INTO `tb_age` VALUES (1, '2023', '2023-03-25 09:40:39', NULL);
INSERT INTO `tb_age` VALUES (5, '2022', '2023-04-04 17:24:50', NULL);
INSERT INTO `tb_age` VALUES (6, '2021', '2023-04-04 17:35:58', NULL);
INSERT INTO `tb_age` VALUES (7, '2020', '2023-04-04 17:36:07', NULL);
INSERT INTO `tb_age` VALUES (8, '2019', '2023-04-04 17:36:11', NULL);
INSERT INTO `tb_age` VALUES (9, '2018', '2023-04-04 17:36:14', NULL);
INSERT INTO `tb_age` VALUES (10, '2017', '2023-04-04 17:36:22', NULL);
INSERT INTO `tb_age` VALUES (11, '2016', '2023-04-04 17:36:26', NULL);
INSERT INTO `tb_age` VALUES (12, '2015', '2023-04-04 17:36:29', NULL);
INSERT INTO `tb_age` VALUES (13, '2014', '2023-04-04 17:36:35', NULL);
INSERT INTO `tb_age` VALUES (14, '2013', '2023-04-04 17:36:40', NULL);
INSERT INTO `tb_age` VALUES (15, '2012', '2023-04-04 17:36:44', NULL);
INSERT INTO `tb_age` VALUES (16, '2011', '2023-04-04 17:36:48', NULL);
INSERT INTO `tb_age` VALUES (17, '2000-2010', '2023-04-04 17:36:58', NULL);
INSERT INTO `tb_age` VALUES (18, '90年代', '2023-04-04 17:37:03', NULL);
INSERT INTO `tb_age` VALUES (19, '80年代', '2023-04-04 17:37:07', NULL);
INSERT INTO `tb_age` VALUES (20, '70年代', '2023-04-04 17:37:12', NULL);
INSERT INTO `tb_age` VALUES (21, '更早', '2023-04-04 17:37:23', NULL);

-- ----------------------------
-- Table structure for tb_area
-- ----------------------------
DROP TABLE IF EXISTS `tb_area`;
CREATE TABLE `tb_area`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地区名',
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_area
-- ----------------------------
INSERT INTO `tb_area` VALUES (1, '日本', '2023-03-25 09:40:32', '2023-04-04 16:02:03');
INSERT INTO `tb_area` VALUES (4, '中国大陆', '2023-04-04 17:18:44', NULL);
INSERT INTO `tb_area` VALUES (5, '美国', '2023-04-04 17:32:20', NULL);
INSERT INTO `tb_area` VALUES (6, '韩国', '2023-04-04 17:39:50', NULL);
INSERT INTO `tb_area` VALUES (7, '中国香港', '2023-04-04 17:39:58', NULL);
INSERT INTO `tb_area` VALUES (8, '中国台湾', '2023-04-04 17:40:04', NULL);
INSERT INTO `tb_area` VALUES (9, '泰国', '2023-04-04 17:40:09', NULL);
INSERT INTO `tb_area` VALUES (10, '印度', '2023-04-04 17:40:13', NULL);
INSERT INTO `tb_area` VALUES (11, '法国', '2023-04-04 17:40:19', NULL);
INSERT INTO `tb_area` VALUES (12, '英国', '2023-04-04 17:40:30', NULL);
INSERT INTO `tb_area` VALUES (13, '俄罗斯', '2023-04-04 17:40:38', NULL);
INSERT INTO `tb_area` VALUES (14, '西班牙', '2023-04-04 17:40:44', NULL);
INSERT INTO `tb_area` VALUES (15, '德国', '2023-04-04 17:40:49', NULL);
INSERT INTO `tb_area` VALUES (16, '波兰', '2023-04-04 17:40:52', NULL);
INSERT INTO `tb_area` VALUES (17, '澳大利亚', '2023-04-04 17:40:57', NULL);
INSERT INTO `tb_area` VALUES (18, '伊朗', '2023-04-04 17:41:02', NULL);
INSERT INTO `tb_area` VALUES (19, '其他', '2023-04-04 17:41:06', NULL);

-- ----------------------------
-- Table structure for tb_brand
-- ----------------------------
DROP TABLE IF EXISTS `tb_brand`;
CREATE TABLE `tb_brand`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '品牌名字',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_brand
-- ----------------------------
INSERT INTO `tb_brand` VALUES (1, '太平洋电影城', '2023-03-30 11:00:31', NULL);
INSERT INTO `tb_brand` VALUES (2, '中环影城', '2023-03-30 11:00:56', NULL);
INSERT INTO `tb_brand` VALUES (3, '万达影城', '2023-03-30 11:01:09', NULL);
INSERT INTO `tb_brand` VALUES (4, '保利万和国际影城', '2023-03-30 11:01:18', NULL);
INSERT INTO `tb_brand` VALUES (5, '中影星美国际影城', '2023-03-30 11:01:25', NULL);
INSERT INTO `tb_brand` VALUES (6, '汉鼎宇佑影城', '2023-03-30 11:01:39', NULL);
INSERT INTO `tb_brand` VALUES (7, '横店影视', '2023-03-30 11:01:52', NULL);
INSERT INTO `tb_brand` VALUES (8, '新时代电影院', '2023-03-30 11:01:59', NULL);
INSERT INTO `tb_brand` VALUES (9, '大地影院', '2023-03-30 11:02:12', NULL);
INSERT INTO `tb_brand` VALUES (10, '中影国际影城', '2023-03-30 11:02:23', NULL);
INSERT INTO `tb_brand` VALUES (11, '博纳国际影城 ', '2023-03-30 11:02:32', NULL);
INSERT INTO `tb_brand` VALUES (12, '恒大嘉凯影城', '2023-03-30 11:02:41', NULL);
INSERT INTO `tb_brand` VALUES (13, '星空影城', '2023-03-30 11:02:49', NULL);
INSERT INTO `tb_brand` VALUES (14, 'EVO艺威影院', '2023-03-30 11:03:01', NULL);
INSERT INTO `tb_brand` VALUES (15, '中影泰得影城', '2023-03-30 11:03:14', NULL);
INSERT INTO `tb_brand` VALUES (16, '其他', '2023-03-30 11:03:22', NULL);

-- ----------------------------
-- Table structure for tb_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_category`;
CREATE TABLE `tb_category`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类名',
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_category
-- ----------------------------
INSERT INTO `tb_category` VALUES (1, '爱情', '2023-03-25 09:40:50', NULL);
INSERT INTO `tb_category` VALUES (2, '喜剧', '2023-03-25 09:41:03', NULL);
INSERT INTO `tb_category` VALUES (3, '动画', '2023-03-25 09:51:52', NULL);
INSERT INTO `tb_category` VALUES (4, '剧情', '2023-04-01 14:23:35', NULL);
INSERT INTO `tb_category` VALUES (5, '奇幻', '2023-04-04 15:51:58', NULL);
INSERT INTO `tb_category` VALUES (6, '家庭', '2023-04-04 17:18:57', NULL);
INSERT INTO `tb_category` VALUES (7, '科幻', '2023-04-04 17:27:42', NULL);
INSERT INTO `tb_category` VALUES (8, '动作', '2023-04-04 17:30:12', NULL);
INSERT INTO `tb_category` VALUES (9, '冒险', '2023-04-04 17:30:19', NULL);
INSERT INTO `tb_category` VALUES (10, '灾难', '2023-04-04 17:33:11', NULL);
INSERT INTO `tb_category` VALUES (11, '恐怖', '2023-04-04 17:37:55', NULL);
INSERT INTO `tb_category` VALUES (12, '惊悚', '2023-04-04 17:37:59', NULL);
INSERT INTO `tb_category` VALUES (13, '悬疑', '2023-04-04 17:38:06', NULL);
INSERT INTO `tb_category` VALUES (14, '犯罪', '2023-04-04 17:38:10', NULL);
INSERT INTO `tb_category` VALUES (15, '战争', '2023-04-04 17:38:19', NULL);
INSERT INTO `tb_category` VALUES (16, '运动', '2023-04-04 17:38:27', NULL);
INSERT INTO `tb_category` VALUES (17, '古装', '2023-04-04 17:38:33', NULL);
INSERT INTO `tb_category` VALUES (18, '武侠', '2023-04-04 17:38:38', NULL);
INSERT INTO `tb_category` VALUES (19, '西部', '2023-04-04 17:38:44', NULL);
INSERT INTO `tb_category` VALUES (20, '历史', '2023-04-04 17:38:48', NULL);
INSERT INTO `tb_category` VALUES (21, '传记', '2023-04-04 17:38:52', NULL);
INSERT INTO `tb_category` VALUES (22, '歌舞', '2023-04-04 17:38:57', NULL);
INSERT INTO `tb_category` VALUES (23, '黑色电影', '2023-04-04 17:39:03', NULL);
INSERT INTO `tb_category` VALUES (24, '短片', '2023-04-04 17:39:06', NULL);
INSERT INTO `tb_category` VALUES (25, '纪录片', '2023-04-04 17:39:10', NULL);
INSERT INTO `tb_category` VALUES (26, '戏曲', '2023-04-04 17:39:17', NULL);
INSERT INTO `tb_category` VALUES (27, '音乐', '2023-04-04 17:39:21', NULL);
INSERT INTO `tb_category` VALUES (28, '青春', '2023-04-04 17:39:28', NULL);
INSERT INTO `tb_category` VALUES (29, '儿童', '2023-04-04 17:39:32', NULL);
INSERT INTO `tb_category` VALUES (30, '其他', '2023-04-04 17:39:36', NULL);

-- ----------------------------
-- Table structure for tb_cinema
-- ----------------------------
DROP TABLE IF EXISTS `tb_cinema`;
CREATE TABLE `tb_cinema`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '影院名称',
  `telephone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电话号码',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '影院地址',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '影院封面',
  `brand_id` int NULL DEFAULT NULL COMMENT '品牌Id',
  `district_id` int NULL DEFAULT NULL COMMENT '行政区Id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_cinema
-- ----------------------------
INSERT INTO `tb_cinema` VALUES (1, '万达影城（乐荟城广场XLAND店）', '4009506666', '涪城区剑南路西段323号乐荟城2楼万达影城', 'http://8.142.27.217:39000/cinema/0fc37474-c3de-4a79-8dc9-5633674db9af.png', 3, 2, '2023-03-30 19:12:23', '2023-03-31 13:58:48');
INSERT INTO `tb_cinema` VALUES (2, '\r\nEVO艺威影院（涪城公园路店）', '0816-2533088', '涪城区公园路(兴力达建行对面)瀚威城市中心5楼（周大福旁电梯直达）', 'http://8.142.27.217:39000/cinema/0fc37474-c3de-4a79-8dc9-5633674db9af.png', 14, 2, '2023-03-30 19:13:37', NULL);

-- ----------------------------
-- Table structure for tb_cinema_serve
-- ----------------------------
DROP TABLE IF EXISTS `tb_cinema_serve`;
CREATE TABLE `tb_cinema_serve`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `cinema_id` int NULL DEFAULT NULL COMMENT '影院Id',
  `serve_id` int NULL DEFAULT NULL COMMENT '服务Id',
  `information` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '详细内容',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_cinema_serve
-- ----------------------------
INSERT INTO `tb_cinema_serve` VALUES (1, 1, 1, '未取票用户放映前60分钟可改签', '2023-03-30 19:14:25', NULL);
INSERT INTO `tb_cinema_serve` VALUES (2, 1, 3, '1.3米以下儿童可免费无座观影（VIP厅、IMAX厅除外），一名成人限带一名儿童（仅限1.3米以下，观看3D均有3D眼镜）。', '2023-03-30 19:15:15', NULL);
INSERT INTO `tb_cinema_serve` VALUES (3, 2, 1, '未取票用户放映前10分钟可改签', '2023-03-30 19:15:48', '2023-03-31 13:57:05');
INSERT INTO `tb_cinema_serve` VALUES (4, 2, 2, '未取票用户放映前5分钟可退票', '2023-03-30 19:15:58', NULL);
INSERT INTO `tb_cinema_serve` VALUES (5, 2, 3, '1.3米以下儿童可免费无座观影（VIP厅、IMAX厅除外），一名成人限带一名儿童（仅限1.3米以下，观看3D均有3D眼镜）。', '2023-03-30 19:16:33', NULL);
INSERT INTO `tb_cinema_serve` VALUES (7, 2, 5, '提供收费的地下停车场服务', '2023-03-31 13:55:22', NULL);
INSERT INTO `tb_cinema_serve` VALUES (8, 2, 4, '提供免费WIFI', '2023-03-31 13:55:33', NULL);
INSERT INTO `tb_cinema_serve` VALUES (9, 1, 5, '提供免费停车服务', '2023-03-31 14:05:38', NULL);

-- ----------------------------
-- Table structure for tb_comment
-- ----------------------------
DROP TABLE IF EXISTS `tb_comment`;
CREATE TABLE `tb_comment`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL COMMENT '用户Id',
  `movie_id` int NULL DEFAULT NULL COMMENT '电影Id',
  `content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '评论内容',
  `score` decimal(10, 0) NULL DEFAULT NULL COMMENT '得分',
  `review_flag` tinyint(1) NULL DEFAULT 0 COMMENT '是否审核 0-未审核 1-已审核',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_comment
-- ----------------------------
INSERT INTO `tb_comment` VALUES (1, 1, 1, 'test', 10, 1, '2023-04-12 10:32:17', '2023-06-02 00:00:59');
INSERT INTO `tb_comment` VALUES (2, 1, 1, 'asdasdas', 3, 1, '2023-04-12 10:45:06', '2023-06-02 00:00:59');
INSERT INTO `tb_comment` VALUES (3, 1, 1, 'dasdadasdasdadasd', 4, 1, '2023-04-12 10:45:49', '2023-06-02 00:00:59');
INSERT INTO `tb_comment` VALUES (4, 1, 17, 'sdadsaaaaaaaaaaaaa', 4, 1, '2023-04-12 10:49:31', NULL);
INSERT INTO `tb_comment` VALUES (5, 1, 1, 'asdasdadasdas', 5, 1, '2023-04-14 10:52:42', '2023-06-02 00:00:59');
INSERT INTO `tb_comment` VALUES (6, 3, 1, '很好看', 5, 1, '2023-05-31 20:05:32', '2023-06-02 00:00:59');
INSERT INTO `tb_comment` VALUES (7, 3, 1, 'nice', 5, 1, '2023-05-31 20:10:10', '2023-06-02 00:00:59');
INSERT INTO `tb_comment` VALUES (8, 3, 12, '很好看', 5, 1, '2023-06-01 22:54:18', '2023-06-01 22:54:26');
INSERT INTO `tb_comment` VALUES (9, 3, 12, '真感人', 5, 1, '2023-06-01 22:58:19', '2023-06-01 22:59:24');
INSERT INTO `tb_comment` VALUES (10, 3, 12, '很感人', 5, 1, '2023-06-01 22:58:57', '2023-06-01 22:59:22');
INSERT INTO `tb_comment` VALUES (11, 3, 12, '很感人', 5, 1, '2023-06-01 23:00:58', '2023-06-01 23:02:21');
INSERT INTO `tb_comment` VALUES (12, 3, 12, '很好看的电影', 10, 1, '2023-06-01 23:02:07', '2023-06-01 23:02:20');
INSERT INTO `tb_comment` VALUES (13, 4, 12, '十分感人的电影', 10, 0, '2023-06-02 08:51:43', NULL);
INSERT INTO `tb_comment` VALUES (14, 5, 12, '十分好看', 10, 0, '2023-06-02 09:00:06', NULL);
INSERT INTO `tb_comment` VALUES (15, 7, 15, '非常感人的电影', 10, 1, '2023-06-02 09:11:55', '2023-06-02 09:12:06');

-- ----------------------------
-- Table structure for tb_district
-- ----------------------------
DROP TABLE IF EXISTS `tb_district`;
CREATE TABLE `tb_district`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '行政区名字',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_district
-- ----------------------------
INSERT INTO `tb_district` VALUES (1, '地铁附近 ', '2023-03-30 10:58:46', NULL);
INSERT INTO `tb_district` VALUES (2, '涪城区 ', '2023-03-30 10:58:55', NULL);
INSERT INTO `tb_district` VALUES (3, '江油市', '2023-03-30 10:59:04', NULL);
INSERT INTO `tb_district` VALUES (4, '三台县 ', '2023-03-30 10:59:12', NULL);
INSERT INTO `tb_district` VALUES (5, '安州区', '2023-03-30 10:59:21', NULL);
INSERT INTO `tb_district` VALUES (6, '游仙区', '2023-03-30 10:59:38', NULL);
INSERT INTO `tb_district` VALUES (7, '盐亭县', '2023-03-30 10:59:45', NULL);
INSERT INTO `tb_district` VALUES (8, '梓潼县', '2023-03-30 10:59:53', NULL);
INSERT INTO `tb_district` VALUES (9, '北川羌族自治县', '2023-03-30 11:00:06', NULL);
INSERT INTO `tb_district` VALUES (10, '平武县', '2023-03-30 11:00:13', NULL);

-- ----------------------------
-- Table structure for tb_duty
-- ----------------------------
DROP TABLE IF EXISTS `tb_duty`;
CREATE TABLE `tb_duty`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电影中演员参与的角色如：导演',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_duty
-- ----------------------------
INSERT INTO `tb_duty` VALUES (1, '导演', '2023-03-25 09:41:10', NULL);
INSERT INTO `tb_duty` VALUES (2, '演员', '2023-03-25 16:33:07', NULL);
INSERT INTO `tb_duty` VALUES (3, '编剧', '2023-04-01 14:20:06', NULL);
INSERT INTO `tb_duty` VALUES (4, '制片人', '2023-04-01 14:20:16', NULL);
INSERT INTO `tb_duty` VALUES (5, '美术指导', '2023-04-01 14:20:27', NULL);
INSERT INTO `tb_duty` VALUES (6, '音乐', '2023-04-01 14:20:33', NULL);
INSERT INTO `tb_duty` VALUES (7, '动画师', '2023-04-01 14:20:44', NULL);
INSERT INTO `tb_duty` VALUES (8, '动画指导', '2023-04-01 14:20:56', NULL);
INSERT INTO `tb_duty` VALUES (9, '出品人', '2023-04-01 14:22:02', NULL);
INSERT INTO `tb_duty` VALUES (10, '监制', '2023-04-01 14:22:13', NULL);
INSERT INTO `tb_duty` VALUES (11, '摄影指导', '2023-04-01 14:22:28', NULL);
INSERT INTO `tb_duty` VALUES (12, '剪辑指导', '2023-04-01 14:22:36', NULL);

-- ----------------------------
-- Table structure for tb_hall
-- ----------------------------
DROP TABLE IF EXISTS `tb_hall`;
CREATE TABLE `tb_hall`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `cinema_id` int NULL DEFAULT NULL COMMENT '影院Id',
  `type_id` int NULL DEFAULT NULL COMMENT '影厅类别Id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '影厅名字',
  `seat_row` int NULL DEFAULT NULL COMMENT '座位行数',
  `seat_col` int NULL DEFAULT NULL COMMENT '座位列数',
  `state` tinyint(1) NULL DEFAULT 0 COMMENT '0-禁用 1-启用',
  `seat_json` json NULL COMMENT '影厅座位：0-可用，1-禁用，2-已售出',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_hall
-- ----------------------------
INSERT INTO `tb_hall` VALUES (7, 1, 1, '1号厅', 10, 10, 1, '{\"1\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \"2\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \"3\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \"4\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"5\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"6\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"7\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"8\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \"9\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \"10\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0]}', '2023-03-31 17:23:17', '2023-04-25 10:57:25');
INSERT INTO `tb_hall` VALUES (9, 1, 2, '3号厅', 12, 12, 1, '{\"1\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0], \"2\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0], \"3\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0], \"4\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0], \"5\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0], \"6\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0], \"7\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0], \"8\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0], \"9\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0], \"10\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0], \"11\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0], \"12\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0]}', '2023-04-01 11:04:29', '2023-04-01 14:12:54');
INSERT INTO `tb_hall` VALUES (10, 1, 3, '2号厅', 10, 10, 1, '{\"1\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \"2\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \"3\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \"4\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \"5\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \"6\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \"7\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \"8\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \"9\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \"10\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0]}', '2023-04-25 10:55:05', '2023-04-25 10:55:22');

-- ----------------------------
-- Table structure for tb_lamination
-- ----------------------------
DROP TABLE IF EXISTS `tb_lamination`;
CREATE TABLE `tb_lamination`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `cinema_id` int NULL DEFAULT NULL COMMENT '影院Id',
  `hall_id` int NULL DEFAULT NULL COMMENT '影厅Id',
  `movie_id` int NULL DEFAULT NULL COMMENT '电影Id',
  `lang_version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '语言版本',
  `start_date` date NULL DEFAULT NULL COMMENT '开始日期',
  `start_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '结束时间',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `seat_json` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '座位详情',
  `tips` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '观影提示',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_lamination
-- ----------------------------
INSERT INTO `tb_lamination` VALUES (8, 1, 7, 1, '国语2D', '2023-04-25', '09:00', '11:02', 35.50, '{\"1\":[0,1,0,0,0,0,0,0,1,0],\"2\":[0,1,0,0,0,0,0,0,1,0],\"3\":[0,1,0,0,0,0,0,0,1,0],\"4\":[0,0,0,0,0,0,0,0,0,0],\"5\":[0,0,0,0,0,0,0,0,0,0],\"6\":[0,0,0,0,0,0,0,0,0,0],\"7\":[0,0,0,0,0,0,0,0,0,0],\"8\":[0,1,0,0,0,0,0,0,1,0],\"9\":[0,1,0,0,0,0,0,0,1,0],\"10\":[0,1,0,0,0,0,0,0,1,0]}', '观影请佩戴口罩', '2023-04-25 11:03:10', '2023-04-25 11:11:20');
INSERT INTO `tb_lamination` VALUES (9, 1, 9, 14, '英语2D', '2023-04-27', '00:08', '2:22', 12.27, '{\"1\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0], \"2\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0], \"3\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0], \"4\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0], \"5\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0], \"6\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0], \"7\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0], \"8\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0], \"9\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0], \"10\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0], \"11\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0], \"12\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0]}', 'WWWWWW', '2023-04-26 01:00:17', '2023-04-26 01:02:27');
INSERT INTO `tb_lamination` VALUES (12, 1, 7, 1, '国语2D', '2023-05-03', '00:06', '2:08', 35.50, '{\"1\":[0,1,0,0,0,0,0,0,1,0],\"2\":[0,1,0,0,0,0,0,0,1,0],\"3\":[0,1,0,0,0,0,0,0,1,0],\"4\":[0,0,0,0,0,0,0,0,0,0],\"5\":[0,0,0,0,0,0,0,0,0,0],\"6\":[0,0,0,0,0,0,0,0,0,0],\"7\":[0,0,0,0,0,0,0,0,0,0],\"8\":[0,1,0,0,0,0,0,0,1,0],\"9\":[0,1,0,0,0,0,0,0,1,0],\"10\":[0,1,0,0,0,0,0,0,1,0]}', '观影请佩戴口罩', '2023-05-03 16:56:57', '2023-05-03 16:59:20');
INSERT INTO `tb_lamination` VALUES (13, 1, 7, 1, '国语2D', '2023-05-28', '00:04', '2:06', 35.50, '{\"1\":[0,1,0,0,0,0,0,0,1,0],\"2\":[0,1,0,0,0,0,0,0,1,0],\"3\":[0,1,0,0,0,0,0,0,1,0],\"4\":[0,0,0,0,0,0,0,0,0,0],\"5\":[0,0,0,0,0,0,0,0,0,0],\"6\":[0,0,0,0,0,0,0,0,0,0],\"7\":[0,0,0,0,0,0,0,0,0,0],\"8\":[0,1,0,0,0,0,0,0,1,0],\"9\":[0,1,0,0,0,0,0,0,1,0],\"10\":[0,1,0,0,0,0,0,0,1,0]}', 'test', '2023-05-28 17:24:23', '2023-05-28 17:30:13');
INSERT INTO `tb_lamination` VALUES (14, 1, 7, 1, '国语2D', '2023-05-30', '00:20', '2:22', 35.50, '{\"1\":[0,1,0,3,3,0,0,0,1,0],\"2\":[0,1,0,0,3,0,0,0,1,0],\"3\":[0,1,0,3,3,0,0,0,1,0],\"4\":[0,0,0,0,3,0,0,0,0,0],\"5\":[0,0,0,0,3,0,0,0,0,0],\"6\":[0,0,0,0,3,3,0,0,0,0],\"7\":[0,0,0,0,3,0,0,0,0,0],\"8\":[0,1,0,0,0,0,0,0,1,0],\"9\":[0,1,0,0,0,0,0,0,1,0],\"10\":[0,1,0,0,0,0,0,0,1,0]}', '111111111111', '2023-05-29 21:52:40', '2023-05-29 21:53:12');
INSERT INTO `tb_lamination` VALUES (15, 1, 7, 1, '国语2D', '2023-05-31', '00:27', '2:29', 35.50, '{\"1\":[0,1,0,0,0,0,0,0,1,0],\"2\":[0,1,0,0,0,0,0,0,1,0],\"3\":[0,1,0,0,0,0,0,0,1,0],\"4\":[0,0,0,0,0,0,0,0,0,0],\"5\":[0,0,0,0,3,0,0,0,0,0],\"6\":[0,0,0,0,3,3,0,0,0,0],\"7\":[0,0,0,0,3,3,0,0,0,0],\"8\":[0,1,0,0,0,0,0,0,1,0],\"9\":[0,1,0,0,0,0,0,0,1,0],\"10\":[0,1,0,0,0,0,0,0,1,0]}', '111111111', '2023-05-31 20:04:39', '2023-05-31 20:10:38');
INSERT INTO `tb_lamination` VALUES (16, 1, 7, 1, '国语2D', '2023-06-02', '00:30', '2:32', 35.50, '{\"1\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \"2\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \"3\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \"4\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"5\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"6\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"7\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"8\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \"9\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \"10\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0]}', '观影请佩戴口罩', '2023-06-01 22:51:46', NULL);
INSERT INTO `tb_lamination` VALUES (17, 1, 9, 12, '国语2D', '2023-06-02', '00:08', '2:12', 29.50, '{\"11\":[0,0,1,0,0,0,0,0,0,1,0,0],\"1\":[0,0,1,0,0,0,0,0,0,1,0,0],\"12\":[0,0,1,0,0,0,0,0,0,1,0,0],\"2\":[0,0,1,0,0,0,0,0,0,1,0,0],\"3\":[0,0,1,0,0,0,0,0,0,1,0,0],\"4\":[0,0,1,0,0,0,0,0,0,1,0,0],\"5\":[0,0,1,0,0,3,0,0,0,1,0,0],\"6\":[0,0,1,0,0,3,0,0,0,1,0,0],\"7\":[0,0,1,0,0,3,3,0,0,1,0,0],\"8\":[0,0,1,0,0,3,0,0,0,1,0,0],\"9\":[0,0,1,0,0,0,0,0,0,1,0,0],\"10\":[0,0,1,0,0,0,0,0,0,1,0,0]}', '观影请佩戴口罩', '2023-06-01 22:53:10', '2023-06-01 22:55:39');
INSERT INTO `tb_lamination` VALUES (18, 1, 10, 17, '国语2D', '2023-06-02', '00:15', '2:03', 35.50, '{\"1\":[0,1,0,0,0,0,0,0,1,0],\"2\":[0,1,0,0,0,0,0,0,1,0],\"3\":[0,1,0,0,0,0,0,0,1,0],\"4\":[0,1,0,0,0,0,0,0,1,0],\"5\":[0,1,0,0,3,0,0,0,1,0],\"6\":[0,1,0,0,3,3,0,0,1,0],\"7\":[0,1,0,0,3,3,0,0,1,0],\"8\":[0,1,0,0,0,0,0,0,1,0],\"9\":[0,1,0,0,0,0,0,0,1,0],\"10\":[0,1,0,0,0,0,0,0,1,0]}', '观影请佩戴口罩', '2023-06-01 23:48:03', '2023-06-01 23:49:23');
INSERT INTO `tb_lamination` VALUES (22, 1, 7, 15, '英语2D', '2023-06-03', '09:00', '12:14', 35.70, '{\"1\":[0,1,0,0,0,0,0,0,1,0],\"2\":[0,1,0,0,0,0,0,0,1,0],\"3\":[0,1,0,0,0,0,0,0,1,0],\"4\":[0,0,0,0,0,3,0,0,0,0],\"5\":[0,0,0,0,0,3,3,0,0,0],\"6\":[0,0,0,0,0,3,3,0,0,0],\"7\":[0,0,0,0,0,0,0,0,0,0],\"8\":[0,1,0,0,0,0,0,0,1,0],\"9\":[0,1,0,0,0,0,0,0,1,0],\"10\":[0,1,0,0,0,0,0,0,1,0]}', '观影请佩戴口罩', '2023-06-02 09:10:09', '2023-06-02 09:12:43');

-- ----------------------------
-- Table structure for tb_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_menu`;
CREATE TABLE `tb_menu`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名',
  `path` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单路径',
  `component` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组件',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单icon',
  `order_num` tinyint(1) NOT NULL COMMENT '排序',
  `parent_id` int NULL DEFAULT NULL COMMENT '父id',
  `is_hidden` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否隐藏  0否1是',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 238 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_menu
-- ----------------------------
INSERT INTO `tb_menu` VALUES (1, '首页', '/', '/home/Home.vue', 'el-icon-myshouye', 1, NULL, 0, '2023-03-16 20:14:35', NULL);
INSERT INTO `tb_menu` VALUES (2, '用户列表', '/users', '/user/User.vue', 'el-icon-myyonghuliebiao', 1, 9, 0, '2023-03-16 14:38:09', '2023-03-16 20:22:05');
INSERT INTO `tb_menu` VALUES (3, '角色管理', '/roles', '/role/Role.vue', 'el-icon-myjiaoseliebiao', 2, 10, 0, '2023-03-16 14:39:01', '2021-01-26 14:39:03');
INSERT INTO `tb_menu` VALUES (4, '接口管理', '/resources', '/resource/Resource.vue', 'el-icon-myjiekouguanli', 2, 10, 0, '2023-03-16 14:40:14', '2021-08-07 20:00:28');
INSERT INTO `tb_menu` VALUES (5, '菜单管理', '/menus', '/menu/Menu.vue', 'el-icon-mycaidan', 2, 10, 0, '2023-03-16 14:40:54', '2021-08-07 10:18:49');
INSERT INTO `tb_menu` VALUES (6, '日志管理', '/log-submenu', 'Layout', 'el-icon-myguanyuwo', 8, NULL, 0, '2023-03-16 21:33:56', '2021-01-31 21:33:59');
INSERT INTO `tb_menu` VALUES (7, '操作日志', '/operation/log', '/log/Operation.vue', 'el-icon-myguanyuwo', 1, 6, 0, '2023-03-16 15:53:21', '2021-01-31 15:53:25');
INSERT INTO `tb_menu` VALUES (8, '在线用户', '/online/users', '/user/Online.vue', 'el-icon-myyonghuliebiao', 7, 9, 0, '2023-03-16 14:59:51', '2021-02-05 14:59:53');
INSERT INTO `tb_menu` VALUES (9, '用户管理', '/users-submenu', 'Layout', 'el-icon-myyonghuliebiao', 7, NULL, 0, '2023-03-16 23:44:59', '2021-02-06 23:45:03');
INSERT INTO `tb_menu` VALUES (10, '权限管理', '/permission-submenu', 'Layout', 'el-icon-mydaohanglantubiao_quanxianguanli', 6, NULL, 0, '2023-03-16 19:56:55', '2021-08-07 19:59:40');
INSERT INTO `tb_menu` VALUES (11, '电影管理', '/movie', 'Layout', 'el-icon-video-camera', 2, NULL, 0, '2023-03-18 09:57:18', NULL);
INSERT INTO `tb_menu` VALUES (12, '电影列表', '/movie/detail', '/movie/Movie.vue', 'el-icon-video-camera', 1, 11, 0, '2023-03-18 09:59:47', NULL);
INSERT INTO `tb_menu` VALUES (13, '电影年代', '/movie/age', '/movie/Age.vue', 'el-icon-video-camera', 2, 11, 0, '2023-03-29 14:52:38', NULL);
INSERT INTO `tb_menu` VALUES (14, '电影区域', '/movie/area', '/movie/Area.vue', 'el-icon-video-camera', 3, 11, 0, '2023-03-29 14:53:55', NULL);
INSERT INTO `tb_menu` VALUES (15, '电影类别', '/movie/category', '/movie/Category.vue', 'el-icon-video-camera', 4, 11, 0, '2023-03-29 14:54:58', NULL);
INSERT INTO `tb_menu` VALUES (16, '演员管理', '/actor', 'Layout', 'el-icon-video-camera', 3, NULL, 0, '2023-03-29 14:55:59', NULL);
INSERT INTO `tb_menu` VALUES (17, '演员列表', '/actor/detail', '/actor/Actor.vue', 'el-icon-video-camera', 1, 16, 0, '2023-03-29 14:57:26', NULL);
INSERT INTO `tb_menu` VALUES (18, '演员职务', '/actor/duty', '/actor/Duty.vue', 'el-icon-video-camera', 2, 16, 0, '2023-03-29 14:58:10', NULL);
INSERT INTO `tb_menu` VALUES (19, '影院管理', '/cinema', 'Layout', 'el-icon-video-camera', 4, NULL, 0, '2023-03-30 20:45:08', NULL);
INSERT INTO `tb_menu` VALUES (20, '影院列表', '/cinema/detail', '/cinema/Cinema.vue', 'el-icon-video-camera', 1, 19, 0, '2023-03-30 20:46:17', NULL);
INSERT INTO `tb_menu` VALUES (21, '影院品牌', '/cinema/brand', '/cinema/brand.vue', 'el-icon-video-camera', 2, 19, 0, '2023-03-30 20:46:53', NULL);
INSERT INTO `tb_menu` VALUES (22, '影院区域', '/cinema/district', '/cinema/District.vue', 'el-icon-video-camera', 3, 19, 0, '2023-03-30 20:47:32', NULL);
INSERT INTO `tb_menu` VALUES (23, '影院服务', '/cinema/serve', '/cinema/Serve.vue', 'el-icon-video-camera', 4, 19, 0, '2023-03-30 20:48:08', NULL);
INSERT INTO `tb_menu` VALUES (24, '影厅类别', '/cinema/type', '/cinema/Type.vue', 'el-icon-video-camera', 5, 19, 0, '2023-03-31 15:39:46', NULL);
INSERT INTO `tb_menu` VALUES (25, '电影排片', '/lamination', 'Layout', 'el-icon-video-camera', 5, NULL, 0, '2023-04-04 09:43:07', NULL);
INSERT INTO `tb_menu` VALUES (26, '排片管理', '/lamination/detail', '/lamination/lamination.vue', 'el-icon-video-camera', 1, 25, 0, '2023-04-04 09:44:50', NULL);
INSERT INTO `tb_menu` VALUES (27, '个人中心', '/setting', '/setting/Setting.vue', 'el-icon-video-camera', 9, NULL, 0, '2023-04-26 17:29:45', NULL);

-- ----------------------------
-- Table structure for tb_movie
-- ----------------------------
DROP TABLE IF EXISTS `tb_movie`;
CREATE TABLE `tb_movie`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name_cn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '中文名',
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '英文名',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片',
  `time` int NULL DEFAULT NULL COMMENT '时长',
  `intro` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '简介',
  `area_id` int NULL DEFAULT NULL COMMENT '地区Id',
  `age_id` int NULL DEFAULT NULL COMMENT '年代Id',
  `score` double NULL DEFAULT 0 COMMENT '评分',
  `gross` double NULL DEFAULT 0 COMMENT '总收入',
  `view_count` int NULL DEFAULT 0 COMMENT '访问量',
  `release_time` datetime NULL DEFAULT NULL COMMENT '上映时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '电影信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_movie
-- ----------------------------
INSERT INTO `tb_movie` VALUES (1, '铃芽之旅', 'すずめの戸締まり', 'http://8.142.27.217:39000/cinema/df034b97-3332-4a4a-b853-44ce7c688bc1.jpg', 122, '生活在日本九州田舍的17岁少女・铃芽遇见了为了寻找“门”而踏上旅途的青年。追随着青年的脚步，铃芽来到了山上一片废墟之地，在这里静静伫立着一扇古老的门，仿佛是坍塌中存留的唯一遗迹。铃芽仿佛被什么吸引了一般，将手伸向了那扇门…不久之后，日本各地的门开始一扇一扇地打开。据说，开着的门必须关上，否则灾祸将会从门的那一边降临于现世。星星，夕阳，拂晓，误入之境的天空，仿佛溶解了一切的时间。在神秘之门的引导下，铃芽踏上了关门的旅途。', 1, 1, 5.3, 532.5, 20, '2023-03-24 09:00:00', '2023-03-18 10:00:37', '2023-06-03 12:50:05');
INSERT INTO `tb_movie` VALUES (12, '忠犬八公', 'Hachiko', 'http://8.142.27.217:39000/cinema/aaae8557-76ca-4a61-a743-e7f877cf16bb.jpg', 124, '这是一只小狗感动全球数亿人的故事。八筒是一只可爱的中华田园犬，在茫茫人海中遇到了命中注定的主人陈敬修，成为了陈家的一员。随着时间的推移，曾经美好的家已经不在，但八筒仍在原地等待，它的命运同它的家人紧紧地牵绊在一起。本片改编自新藤兼人原著剧本「ハチ公物語」。', 4, 1, 6, 147.5, 12, '2023-03-31 18:00:00', '2023-04-04 17:20:37', '2023-06-03 12:50:05');
INSERT INTO `tb_movie` VALUES (13, '宇宙探索编辑部', '宇宙探索编辑部', 'http://8.142.27.217:39000/cinema/c4e03470-6331-41d5-b96b-7e2757f0c8bc.jpg', 118, '脑洞大开高分奇片，地球人外星人千里奔现！唐志军是一家诞生于上世纪八十年代的科幻杂志——《宇宙探索》编辑部的主编。现如今的杂志社日渐式微，唐志军也终成落魄潦倒，鳏寡孤独之人。但他却依然几十年如一日的痴迷于寻找地外文明。终于有一天，他接收到了一个疑似来自宇宙深处的异常信号，于是他召集同是天涯沦落人的伙伴们，带着那一个困惑他终生的问题，再一次踏上寻找外星人的未尽之路。', 4, 1, 0, 0, 8, '2023-06-20 09:00:00', '2023-04-04 17:29:39', '2023-06-03 12:50:05');
INSERT INTO `tb_movie` VALUES (14, '龙与地下城：侠盗荣耀', 'Dungeons & Dragons: Honor Among Thieves', 'http://8.142.27.217:39000/cinema/20a55c47-d950-418d-8f4b-29295f1381b4.jpg', 134, '震撼眼界的巨龙怪物，惊心动魄又笑料百出的征途冒险，愚人节电影院最佳拍档——奇幻动作冒险巨制《龙与地下城:侠盗荣耀》来袭！一群最能整活的侠盗小队共同制定了一场惊天盗窃计划，他们要找回遗失已久的圣物，迎战最强恶魔，赢回属于自己的荣耀！', 5, 1, 0, 0, 7, '2023-03-31 09:00:00', '2023-04-04 17:32:05', '2023-06-03 12:50:05');
INSERT INTO `tb_movie` VALUES (15, ' 泰坦尼克号', 'Titanic', 'http://8.142.27.217:39000/cinema/768f874d-c7a1-4f95-8ba1-e23ba1053359.jpg', 194, '1912年4月10日，承载着民众万千希望的豪华游轮泰坦尼克号鸣着震耳欲聋的汽笛，由英国南安普顿驶向了大洋彼岸的纽约。头等舱内，美丽女孩罗丝和她的母亲及未婚夫卡尔相对而坐，可是罗丝从心底反感这样虚华无实的生活。绝望之际，她结识了不名一文的青年画家杰克。杰克靠赌博赢得了下等舱的船票，他带着金丝雀一般的罗丝冲破樊笼，在底下层民众中间尽情享受人生的快乐。短短几日的相处，两人互生好感。然而横在他们中间的不仅有氏族阶层的坚固樊篱，更有一场史无前例的大灾难。罗丝和杰克那幼嫩的爱情之芽面临着生与死的严酷考验……', 5, 18, 10, 178.5, 12, '1997-12-19 09:00:00', '2023-04-04 17:35:14', '2023-06-03 12:50:05');
INSERT INTO `tb_movie` VALUES (16, ' 保你平安', 'Post Truth', 'http://8.142.27.217:39000/cinema/f74ae932-0934-4fef-a5a7-6fe4d591725a.jpg', 112, '落魄中年魏平安以直播带货卖墓地为生，他的客户韩露过世后被造谣抹黑，魏平安路见不平，辟谣跑断腿，笑料频出，反转不断，而他自己也因此陷入到新的谣言和网暴之中。', 4, 1, 0, 0, 5, '2023-03-10 09:00:00', '2023-04-04 17:42:51', '2023-06-03 12:50:05');
INSERT INTO `tb_movie` VALUES (17, '名侦探柯南：贝克街的亡灵', '名探偵コナン ベイカー街の亡霊', 'http://8.142.27.217:39000/cinema/a4ed57c4-fb37-46b8-9678-a798c75fa604.jpg', 108, '在信息技术行业的帝王托马斯·辛德勒的基础上，开发了人工智能程序“ 诺亚方舟”的10岁天才少年弘树离奇自杀。2年后，辛德勒公司发巩雅凶表了使用了最新的虚拟现实技术的前所未有的游戏“茧”。这是可支配五感，体验就像现实中事情的虚拟体感游戏。柯南、小兰和少年侦探团一起，前往发布会。在那里也出现了与这部游戏开发有关系的新一父亲——优作的身影。然而在华丽的聚会开始之后，辛德勒手下“茧”的开发负责人——坚村被杀害了。发现誉腿桨再了坚村留下的信息的柯南，直觉感到优作负责的“茧”的舞台中隐藏着线索。少年侦探团和灰原、小兰、警视颈雅嫌签副总监的孙子·诸星等人一起，向 夏洛克·福尔摩斯和混合了真实存在的杀人犯 开膛手杰克的“古代伦敦”发起挑战。可就在游戏开始的同时，游戏被“诺亚方舟”控制了……', 1, 17, 4, 177.5, 5, '2023-05-20 09:00:00', '2023-04-04 17:45:28', '2023-06-03 12:50:05');
INSERT INTO `tb_movie` VALUES (18, ' 回廊亭', 'REVIVAL', 'http://8.142.27.217:39000/cinema/730fd7b7-79b1-4c4f-8e1d-debfbf15db53.jpg', 100, '根据东野圭吾畅销悬疑小说《长长的回廊》改编。回廊亭大宅中暗藏无数秘密，绝望女人为爱复仇的欲望纷争正在上演！富商病逝，他的亲属们聚集在回廊亭等待数⼗亿遗产将会如何分配，众⼈各怀⿁胎。关键时刻，律师周扬带着遗嘱和一本神秘日记而来，更牵扯出⼀场发⽣在一年前的⽕灾凶杀案，死者是富商流落在外的私⽣⼦，更是全部遗产的第⼀顺位继承⼈！凶⼿，似乎就隐藏在众⼈之中……', 4, 1, 0, 0, 3, '2023-03-10 09:00:00', '2023-04-04 17:47:40', '2023-06-03 12:50:05');
INSERT INTO `tb_movie` VALUES (19, ' 熊出没·伴我“熊芯”', 'Boonie Bears:Guardian Code', 'http://8.142.27.217:39000/cinema/957f7615-ab71-4d57-8169-a2a38975e453.jpg', 96, '一个普通的森林夜晚，对小熊大、小熊二宠爱有加的熊妈妈，在一场大火后离开了他们，两熊伤心不已……转眼多年过去，光头强带熊大熊二前往振兴岛参观机器人研究所，却意外得到了熊妈妈的线索，为此熊大、熊二一路探寻…… 熊妈当年为何不告而别？两熊最终是否能找到妈妈？迷雾重重的背后还有怎样的故事？一切谜团等待揭晓。', 4, 1, 0, 0, 3, '2023-01-22 09:00:00', '2023-04-04 17:49:50', '2023-06-03 12:50:05');
INSERT INTO `tb_movie` VALUES (20, ' 流浪地球2', 'The Wandering Earth Ⅱ', 'http://8.142.27.217:39000/cinema/109861bc-3e64-4110-aa2d-1125bc49f4ef.jpg', 173, '太阳即将毁灭，人类在地球表面建造出巨大的推进器，寻找新的家园，然而宇宙之路危机四伏，为了拯救地球，流浪地球时代的年轻人再次挺身而出，展开争分夺秒的生死之战...', 4, 1, 0, 0, 1, '2023-06-20 09:00:00', '2023-04-04 19:14:19', '2023-06-03 12:50:05');

-- ----------------------------
-- Table structure for tb_movie_actor_duty
-- ----------------------------
DROP TABLE IF EXISTS `tb_movie_actor_duty`;
CREATE TABLE `tb_movie_actor_duty`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `actor_id` int NULL DEFAULT NULL,
  `duty_id` int NULL DEFAULT NULL,
  `movie_id` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_movie_actor_duty
-- ----------------------------
INSERT INTO `tb_movie_actor_duty` VALUES (20, 1, 1, 1, '2023-04-04 19:34:38', NULL);
INSERT INTO `tb_movie_actor_duty` VALUES (21, 2, 2, 1, '2023-04-04 19:34:55', NULL);
INSERT INTO `tb_movie_actor_duty` VALUES (22, 3, 2, 1, '2023-04-04 19:34:55', NULL);
INSERT INTO `tb_movie_actor_duty` VALUES (23, 4, 2, 1, '2023-04-04 19:34:55', NULL);
INSERT INTO `tb_movie_actor_duty` VALUES (24, 5, 2, 1, '2023-04-04 19:34:55', NULL);
INSERT INTO `tb_movie_actor_duty` VALUES (25, 1, 3, 1, '2023-04-04 19:35:13', NULL);
INSERT INTO `tb_movie_actor_duty` VALUES (26, 6, 4, 1, '2023-04-04 19:35:20', NULL);
INSERT INTO `tb_movie_actor_duty` VALUES (27, 7, 1, 12, '2023-04-04 19:48:42', NULL);
INSERT INTO `tb_movie_actor_duty` VALUES (28, 8, 2, 12, '2023-04-04 19:48:56', NULL);
INSERT INTO `tb_movie_actor_duty` VALUES (29, 9, 2, 12, '2023-04-04 19:48:56', NULL);
INSERT INTO `tb_movie_actor_duty` VALUES (30, 10, 2, 12, '2023-04-04 19:48:56', NULL);
INSERT INTO `tb_movie_actor_duty` VALUES (31, 11, 2, 12, '2023-04-04 19:48:56', NULL);
INSERT INTO `tb_movie_actor_duty` VALUES (32, 12, 10, 12, '2023-04-04 19:49:05', NULL);
INSERT INTO `tb_movie_actor_duty` VALUES (33, 7, 3, 12, '2023-04-04 19:49:16', NULL);
INSERT INTO `tb_movie_actor_duty` VALUES (34, 13, 1, 13, '2023-04-04 20:06:25', NULL);
INSERT INTO `tb_movie_actor_duty` VALUES (35, 14, 2, 13, '2023-04-04 20:07:11', NULL);
INSERT INTO `tb_movie_actor_duty` VALUES (36, 15, 2, 13, '2023-04-04 20:07:11', NULL);
INSERT INTO `tb_movie_actor_duty` VALUES (37, 18, 2, 13, '2023-04-04 20:07:11', NULL);
INSERT INTO `tb_movie_actor_duty` VALUES (38, 16, 2, 13, '2023-04-04 20:07:11', NULL);
INSERT INTO `tb_movie_actor_duty` VALUES (39, 17, 2, 13, '2023-04-04 20:07:11', NULL);
INSERT INTO `tb_movie_actor_duty` VALUES (40, 13, 3, 13, '2023-04-04 20:07:25', NULL);
INSERT INTO `tb_movie_actor_duty` VALUES (41, 18, 3, 13, '2023-04-04 20:07:25', NULL);
INSERT INTO `tb_movie_actor_duty` VALUES (42, 17, 9, 13, '2023-04-04 20:07:38', NULL);
INSERT INTO `tb_movie_actor_duty` VALUES (43, 17, 10, 13, '2023-04-04 20:07:53', NULL);
INSERT INTO `tb_movie_actor_duty` VALUES (44, 16, 4, 13, '2023-04-04 20:08:11', NULL);
INSERT INTO `tb_movie_actor_duty` VALUES (45, 19, 12, 13, '2023-04-04 20:08:22', NULL);
INSERT INTO `tb_movie_actor_duty` VALUES (46, 21, 1, 14, '2023-04-04 20:18:00', NULL);
INSERT INTO `tb_movie_actor_duty` VALUES (47, 20, 1, 14, '2023-04-04 20:18:00', NULL);
INSERT INTO `tb_movie_actor_duty` VALUES (48, 21, 2, 14, '2023-04-04 20:18:20', NULL);
INSERT INTO `tb_movie_actor_duty` VALUES (49, 22, 2, 14, '2023-04-04 20:18:20', NULL);
INSERT INTO `tb_movie_actor_duty` VALUES (50, 23, 2, 14, '2023-04-04 20:18:20', NULL);
INSERT INTO `tb_movie_actor_duty` VALUES (51, 21, 3, 14, '2023-04-04 20:18:36', NULL);
INSERT INTO `tb_movie_actor_duty` VALUES (52, 20, 3, 14, '2023-04-04 20:18:36', NULL);
INSERT INTO `tb_movie_actor_duty` VALUES (53, 24, 1, 15, '2023-04-05 14:53:44', NULL);
INSERT INTO `tb_movie_actor_duty` VALUES (54, 24, 3, 15, '2023-04-05 14:53:50', NULL);
INSERT INTO `tb_movie_actor_duty` VALUES (55, 25, 2, 15, '2023-04-05 14:53:58', NULL);
INSERT INTO `tb_movie_actor_duty` VALUES (56, 26, 2, 15, '2023-04-05 14:53:58', NULL);
INSERT INTO `tb_movie_actor_duty` VALUES (57, 27, 11, 15, '2023-04-05 14:54:04', NULL);
INSERT INTO `tb_movie_actor_duty` VALUES (58, 28, 1, 17, '2023-04-05 15:06:58', NULL);
INSERT INTO `tb_movie_actor_duty` VALUES (59, 29, 2, 17, '2023-04-05 15:07:32', NULL);
INSERT INTO `tb_movie_actor_duty` VALUES (60, 30, 2, 17, '2023-04-05 15:07:32', NULL);
INSERT INTO `tb_movie_actor_duty` VALUES (61, 31, 2, 17, '2023-04-05 15:07:32', NULL);
INSERT INTO `tb_movie_actor_duty` VALUES (62, 32, 2, 17, '2023-04-05 15:07:32', NULL);
INSERT INTO `tb_movie_actor_duty` VALUES (63, 33, 2, 17, '2023-04-05 15:07:32', NULL);
INSERT INTO `tb_movie_actor_duty` VALUES (64, 34, 3, 17, '2023-04-05 15:07:48', NULL);
INSERT INTO `tb_movie_actor_duty` VALUES (65, 35, 6, 17, '2023-04-05 15:08:09', NULL);
INSERT INTO `tb_movie_actor_duty` VALUES (66, 36, 7, 17, '2023-04-05 15:08:27', NULL);
INSERT INTO `tb_movie_actor_duty` VALUES (68, 1, 1, 1, '2023-05-03 16:44:32', NULL);

-- ----------------------------
-- Table structure for tb_movie_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_movie_category`;
CREATE TABLE `tb_movie_category`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `movie_id` int NULL DEFAULT NULL COMMENT '电影Id',
  `category_id` int NULL DEFAULT NULL COMMENT '类型Id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 94 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_movie_category
-- ----------------------------
INSERT INTO `tb_movie_category` VALUES (47, 1, 1, '2023-04-04 17:17:01', NULL);
INSERT INTO `tb_movie_category` VALUES (48, 1, 2, '2023-04-04 17:17:01', NULL);
INSERT INTO `tb_movie_category` VALUES (49, 1, 5, '2023-04-04 17:17:01', NULL);
INSERT INTO `tb_movie_category` VALUES (58, 12, 4, '2023-04-04 17:24:30', NULL);
INSERT INTO `tb_movie_category` VALUES (59, 12, 6, '2023-04-04 17:24:30', NULL);
INSERT INTO `tb_movie_category` VALUES (65, 14, 8, '2023-04-04 17:32:37', NULL);
INSERT INTO `tb_movie_category` VALUES (66, 14, 5, '2023-04-04 17:32:37', NULL);
INSERT INTO `tb_movie_category` VALUES (67, 14, 9, '2023-04-04 17:32:37', NULL);
INSERT INTO `tb_movie_category` VALUES (73, 17, 3, '2023-04-04 17:45:28', NULL);
INSERT INTO `tb_movie_category` VALUES (74, 17, 9, '2023-04-04 17:45:28', NULL);
INSERT INTO `tb_movie_category` VALUES (75, 17, 13, '2023-04-04 17:45:28', NULL);
INSERT INTO `tb_movie_category` VALUES (76, 18, 14, '2023-04-04 17:47:40', NULL);
INSERT INTO `tb_movie_category` VALUES (77, 18, 13, '2023-04-04 17:47:40', NULL);
INSERT INTO `tb_movie_category` VALUES (78, 18, 1, '2023-04-04 17:47:40', NULL);
INSERT INTO `tb_movie_category` VALUES (79, 19, 3, '2023-04-04 17:49:50', NULL);
INSERT INTO `tb_movie_category` VALUES (80, 19, 2, '2023-04-04 17:49:50', NULL);
INSERT INTO `tb_movie_category` VALUES (81, 19, 7, '2023-04-04 17:49:50', NULL);
INSERT INTO `tb_movie_category` VALUES (85, 15, 4, '2023-04-04 19:52:41', NULL);
INSERT INTO `tb_movie_category` VALUES (86, 15, 1, '2023-04-04 19:52:41', NULL);
INSERT INTO `tb_movie_category` VALUES (87, 15, 10, '2023-04-04 19:52:41', NULL);
INSERT INTO `tb_movie_category` VALUES (88, 16, 2, '2023-04-04 19:53:22', NULL);
INSERT INTO `tb_movie_category` VALUES (89, 16, 4, '2023-04-04 19:53:22', NULL);
INSERT INTO `tb_movie_category` VALUES (90, 13, 7, '2023-06-02 08:47:55', NULL);
INSERT INTO `tb_movie_category` VALUES (91, 13, 2, '2023-06-02 08:47:55', NULL);
INSERT INTO `tb_movie_category` VALUES (92, 20, 7, '2023-06-02 08:48:12', NULL);
INSERT INTO `tb_movie_category` VALUES (93, 20, 9, '2023-06-02 08:48:12', NULL);
INSERT INTO `tb_movie_category` VALUES (94, 20, 10, '2023-06-02 08:48:12', NULL);

-- ----------------------------
-- Table structure for tb_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_operation_log`;
CREATE TABLE `tb_operation_log`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `opt_module` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作模块',
  `opt_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作类型',
  `opt_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作url',
  `opt_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作方法',
  `opt_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作描述',
  `request_param` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '请求参数',
  `request_method` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '请求方式',
  `response_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '返回数据',
  `user_id` int NOT NULL COMMENT '用户id',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作ip',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 80 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_operation_log
-- ----------------------------
INSERT INTO `tb_operation_log` VALUES (2, '资源模块', '新增或修改', '/resource', 'com.example.cinema.controller.ResourceController.saveOrUpdateResource', '新增或修改资源', '[{\"id\":289,\"isAnonymous\":1,\"requestMethod\":\"GET\",\"resourceName\":\"查看日志\",\"url\":\"/log\"}]', 'POST', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'FakeAmadeus', '127.0.0.1', '2023-04-20 11:14:36', NULL);
INSERT INTO `tb_operation_log` VALUES (3, '资源模块', '新增或修改', '/resource', 'com.example.cinema.controller.ResourceController.saveOrUpdateResource', '新增或修改资源', '[{\"id\":290,\"isAnonymous\":1,\"requestMethod\":\"DELETE\",\"resourceName\":\"删除日志\",\"url\":\"/log\"}]', 'POST', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'FakeAmadeus', '127.0.0.1', '2023-04-20 11:14:37', NULL);
INSERT INTO `tb_operation_log` VALUES (4, '资源模块', '新增或修改', '/resource', 'com.example.cinema.controller.ResourceController.saveOrUpdateResource', '新增或修改资源', '[{\"id\":290,\"isAnonymous\":0,\"requestMethod\":\"DELETE\",\"resourceName\":\"删除日志\",\"url\":\"/log\"}]', 'POST', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'FakeAmadeus', '127.0.0.1', '2023-04-20 11:14:38', NULL);
INSERT INTO `tb_operation_log` VALUES (5, '资源模块', '新增或修改', '/resource', 'com.example.cinema.controller.ResourceController.saveOrUpdateResource', '新增或修改资源', '[{\"id\":289,\"isAnonymous\":0,\"requestMethod\":\"GET\",\"resourceName\":\"查看日志\",\"url\":\"/log\"}]', 'POST', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'FakeAmadeus', '127.0.0.1', '2023-04-20 11:14:39', NULL);
INSERT INTO `tb_operation_log` VALUES (6, '资源模块', '新增或修改', '/resource', 'com.example.cinema.controller.ResourceController.saveOrUpdateResource', '新增或修改资源', '[{\"id\":289,\"isAnonymous\":1,\"requestMethod\":\"GET\",\"resourceName\":\"查看日志\",\"url\":\"/log\"}]', 'POST', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'FakeAmadeus', '127.0.0.1', '2023-04-20 20:10:20', NULL);
INSERT INTO `tb_operation_log` VALUES (7, '资源模块', '新增或修改', '/resource', 'com.example.cinema.controller.ResourceController.saveOrUpdateResource', '新增或修改资源', '[{\"id\":290,\"isAnonymous\":1,\"requestMethod\":\"DELETE\",\"resourceName\":\"删除日志\",\"url\":\"/log\"}]', 'POST', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'FakeAmadeus', '127.0.0.1', '2023-04-20 20:10:22', NULL);
INSERT INTO `tb_operation_log` VALUES (8, '资源模块', '新增或修改', '/resource', 'com.example.cinema.controller.ResourceController.saveOrUpdateResource', '新增或修改资源', '[{\"id\":290,\"isAnonymous\":0,\"requestMethod\":\"DELETE\",\"resourceName\":\"删除日志\",\"url\":\"/log\"}]', 'POST', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'FakeAmadeus', '127.0.0.1', '2023-04-20 20:10:23', NULL);
INSERT INTO `tb_operation_log` VALUES (10, '', '新增或修改', '/lamination', 'com.example.cinema.controller.LaminationController.saveOrUpdateLamination', '新增或修改排片', '[{\"cinemaId\":1,\"createTime\":1685265862545,\"endTime\":\"2:06\",\"hallId\":7,\"id\":13,\"langVersion\":\"国语2D\",\"movieId\":1,\"price\":35.5,\"seatJson\":\"{\\\"1\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \\\"2\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \\\"3\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \\\"4\\\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \\\"5\\\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \\\"6\\\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \\\"7\\\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \\\"8\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \\\"9\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \\\"10\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0]}\",\"startDate\":1685203200000,\"startTime\":\"00:04\",\"tips\":\"test\"}]', 'POST', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'FakeAmadeus', '127.0.0.1', '2023-05-28 17:24:23', NULL);
INSERT INTO `tb_operation_log` VALUES (11, '', '新增或修改', '/lamination', 'com.example.cinema.controller.LaminationController.saveOrUpdateLamination', '新增或修改排片', '[{\"cinemaId\":1,\"createTime\":1685368359665,\"endTime\":\"2:22\",\"hallId\":7,\"id\":14,\"langVersion\":\"国语2D\",\"movieId\":1,\"price\":35.5,\"seatJson\":\"{\\\"1\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \\\"2\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \\\"3\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \\\"4\\\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \\\"5\\\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \\\"6\\\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \\\"7\\\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \\\"8\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \\\"9\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \\\"10\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0]}\",\"startDate\":1685376000000,\"startTime\":\"00:20\",\"tips\":\"111111111111\"}]', 'POST', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'FakeAmadeus', '127.0.0.1', '2023-05-29 21:52:40', NULL);
INSERT INTO `tb_operation_log` VALUES (12, '', '新增或修改', '/role', 'com.example.cinema.controller.RoleController.saveOrUpdateRole', '新增或修改角色', '[{\"label\":\"test\",\"menuIdList\":[1,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,10,3,4,5,9,2,8,6,7,27],\"name\":\"测试\"}]', 'POST', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'FakeAmadeus', '127.0.0.1', '2023-05-31 19:31:18', NULL);
INSERT INTO `tb_operation_log` VALUES (13, '', '修改', '/role/able', 'com.example.cinema.controller.RoleController.updateAbleFlag', '禁用角色', '[{\"ableFlag\":true,\"roleIdList\":[4]}]', 'PUT', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'FakeAmadeus', '127.0.0.1', '2023-05-31 19:31:20', NULL);
INSERT INTO `tb_operation_log` VALUES (14, '', '新增或修改', '/role', 'com.example.cinema.controller.RoleController.saveOrUpdateRole', '新增或修改角色', '[{\"id\":4,\"label\":\"test\",\"name\":\"测试\",\"resourceIdList\":[2,5,6,7,8,10,13,15,18,20,23,25,28,30,33,34,35,36,37,38,42,43,46,47,48,49,50,51,52,54,57,59,62,64,67,71,74,75,76,78,81,84,85,87,88,89,90,92,94,95,96,97,98,99,100,101,102,103,104,112,115,117,120,122,128,129,130,131,133,135,136,139,141]}]', 'POST', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'FakeAmadeus', '127.0.0.1', '2023-05-31 19:40:23', NULL);
INSERT INTO `tb_operation_log` VALUES (15, '', '新增或修改', '/role', 'com.example.cinema.controller.RoleController.saveOrUpdateRole', '新增或修改角色', '[{\"id\":4,\"label\":\"test\",\"name\":\"测试\",\"resourceIdList\":[2,5,6,7,8,10,13,15,18,20,23,25,28,30,33,34,35,36,37,38,42,43,46,47,48,49,50,51,52,54,57,59,62,64,67,71,74,75,76,78,81,84,85,87,88,89,90,92,94,95,96,97,98,99,100,101,102,103,104,106,110,112,115,117,120,122,128,129,130,131,133,135,136,139,141]}]', 'POST', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'FakeAmadeus', '127.0.0.1', '2023-05-31 19:40:48', NULL);
INSERT INTO `tb_operation_log` VALUES (16, '', '新增或修改', '/role', 'com.example.cinema.controller.RoleController.saveOrUpdateRole', '新增或修改角色', '[{\"label\":\"normal\",\"menuIdList\":[],\"name\":\"前台用户\"}]', 'POST', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'FakeAmadeus', '127.0.0.1', '2023-05-31 19:41:26', NULL);
INSERT INTO `tb_operation_log` VALUES (17, '', '修改', '/role/able', 'com.example.cinema.controller.RoleController.updateAbleFlag', '禁用角色', '[{\"ableFlag\":true,\"roleIdList\":[5]}]', 'PUT', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'FakeAmadeus', '127.0.0.1', '2023-05-31 19:41:27', NULL);
INSERT INTO `tb_operation_log` VALUES (18, '', '新增或修改', '/role', 'com.example.cinema.controller.RoleController.saveOrUpdateRole', '新增或修改角色', '[{\"id\":5,\"label\":\"normal\",\"name\":\"前台用户\",\"resourceIdList\":[5,6,7,8,13,18,23,28,33,34,35,36,37,38,43,46,48,50,51,52,57,67,74,75,76,81,84,85,88,89,90,94,95,96,97,98,99,100,101,102,103,104,115,120,127,128,130,131]}]', 'POST', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'FakeAmadeus', '127.0.0.1', '2023-05-31 19:44:49', NULL);
INSERT INTO `tb_operation_log` VALUES (19, '', '修改', '/user/password', 'com.example.cinema.controller.UserController.updatePassword', '修改密码', '[{\"checkPassword\":\"123456\",\"newPassword\":\"123456\",\"oldPassword\":\"123456\",\"userId\":2}]', 'PUT', '{\"code\":200,\"message\":\"操作成功\"}', 2, 'test', '127.0.0.1', '2023-05-31 20:00:23', NULL);
INSERT INTO `tb_operation_log` VALUES (20, '', '新增或修改', '/lamination', 'com.example.cinema.controller.LaminationController.saveOrUpdateLamination', '新增或修改排片', '[{\"cinemaId\":1,\"createTime\":1685534679294,\"endTime\":\"2:29\",\"hallId\":7,\"id\":15,\"langVersion\":\"国语2D\",\"movieId\":1,\"price\":35.5,\"seatJson\":\"{\\\"1\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \\\"2\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \\\"3\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \\\"4\\\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \\\"5\\\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \\\"6\\\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \\\"7\\\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \\\"8\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \\\"9\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \\\"10\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0]}\",\"startDate\":1685462400000,\"startTime\":\"00:27\",\"tips\":\"111111111\"}]', 'POST', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-05-31 20:04:39', NULL);
INSERT INTO `tb_operation_log` VALUES (21, '', '新增', '/comment', 'com.example.cinema.controller.CommentController.saveComment', '新增评论', '[{\"content\":\"很好看\",\"createTime\":1685534732136,\"id\":6,\"movieId\":1,\"reviewFlag\":false,\"score\":5.0,\"userId\":3}]', 'POST', '{\"code\":200,\"message\":\"操作成功\"}', 3, 'FakeAmadeus', '127.0.0.1', '2023-05-31 20:05:32', NULL);
INSERT INTO `tb_operation_log` VALUES (22, '', '修改', '/comment', 'com.example.cinema.controller.CommentController.reviewComment', '审核评论', '[{\"commentIds\":[6],\"reviewFlag\":true}]', 'PUT', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-05-31 20:07:13', NULL);
INSERT INTO `tb_operation_log` VALUES (23, '', '新增', '/comment', 'com.example.cinema.controller.CommentController.saveComment', '新增评论', '[{\"content\":\"nice\",\"createTime\":1685535010257,\"id\":7,\"movieId\":1,\"reviewFlag\":false,\"score\":5.0,\"userId\":3}]', 'POST', '{\"code\":200,\"message\":\"操作成功\"}', 3, 'FakeAmadeus', '127.0.0.1', '2023-05-31 20:10:10', NULL);
INSERT INTO `tb_operation_log` VALUES (24, '', '修改', '/comment', 'com.example.cinema.controller.CommentController.reviewComment', '审核评论', '[{\"commentIds\":[7],\"reviewFlag\":true}]', 'PUT', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-05-31 20:10:19', NULL);
INSERT INTO `tb_operation_log` VALUES (25, '', '删除', '/user/forceLogout', 'com.example.cinema.controller.UserController.removeOnlineUser', '强制下线', '[[3]]', 'DELETE', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-05-31 20:12:40', NULL);
INSERT INTO `tb_operation_log` VALUES (26, '', '删除', '/user/forceLogout', 'com.example.cinema.controller.UserController.removeOnlineUser', '强制下线', '[[1]]', 'DELETE', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-05-31 20:13:01', NULL);
INSERT INTO `tb_operation_log` VALUES (27, '', '修改', '/comment', 'com.example.cinema.controller.CommentController.reviewComment', '审核评论', '[{\"commentIds\":[1],\"reviewFlag\":false}]', 'PUT', '{\"code\":200,\"message\":\"操作成功\"}', 2, 'test', '127.0.0.1', '2023-05-31 20:43:57', NULL);
INSERT INTO `tb_operation_log` VALUES (28, '', '修改', '/comment', 'com.example.cinema.controller.CommentController.reviewComment', '审核评论', '[{\"commentIds\":[1],\"reviewFlag\":true}]', 'PUT', '{\"code\":200,\"message\":\"操作成功\"}', 2, 'test', '127.0.0.1', '2023-05-31 20:43:58', NULL);
INSERT INTO `tb_operation_log` VALUES (29, '', '修改', '/comment', 'com.example.cinema.controller.CommentController.reviewComment', '审核评论', '[{\"commentIds\":[1],\"reviewFlag\":false}]', 'PUT', '{\"code\":200,\"message\":\"操作成功\"}', 2, 'test', '127.0.0.1', '2023-05-31 20:48:23', NULL);
INSERT INTO `tb_operation_log` VALUES (30, '', '修改', '/comment', 'com.example.cinema.controller.CommentController.reviewComment', '审核评论', '[{\"commentIds\":[1],\"reviewFlag\":true}]', 'PUT', '{\"code\":200,\"message\":\"操作成功\"}', 2, 'test', '127.0.0.1', '2023-05-31 20:48:24', NULL);
INSERT INTO `tb_operation_log` VALUES (31, '', '修改', '/comment', 'com.example.cinema.controller.CommentController.reviewComment', '审核评论', '[{\"commentIds\":[1],\"reviewFlag\":false}]', 'PUT', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-05-31 21:01:57', NULL);
INSERT INTO `tb_operation_log` VALUES (32, '', '修改', '/comment', 'com.example.cinema.controller.CommentController.reviewComment', '审核评论', '[{\"commentIds\":[2],\"reviewFlag\":false}]', 'PUT', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-05-31 21:01:59', NULL);
INSERT INTO `tb_operation_log` VALUES (33, '', '修改', '/comment', 'com.example.cinema.controller.CommentController.reviewComment', '审核评论', '[{\"commentIds\":[2],\"reviewFlag\":false}]', 'PUT', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-05-31 21:02:00', NULL);
INSERT INTO `tb_operation_log` VALUES (34, '', '修改', '/comment', 'com.example.cinema.controller.CommentController.reviewComment', '审核评论', '[{\"commentIds\":[3],\"reviewFlag\":false}]', 'PUT', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-05-31 21:02:02', NULL);
INSERT INTO `tb_operation_log` VALUES (35, '', '修改', '/comment', 'com.example.cinema.controller.CommentController.reviewComment', '审核评论', '[{\"commentIds\":[3],\"reviewFlag\":false}]', 'PUT', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-05-31 21:02:03', NULL);
INSERT INTO `tb_operation_log` VALUES (36, '', '修改', '/comment', 'com.example.cinema.controller.CommentController.reviewComment', '审核评论', '[{\"commentIds\":[3],\"reviewFlag\":true}]', 'PUT', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-05-31 21:02:04', NULL);
INSERT INTO `tb_operation_log` VALUES (37, '', '修改', '/comment', 'com.example.cinema.controller.CommentController.reviewComment', '审核评论', '[{\"commentIds\":[3],\"reviewFlag\":true}]', 'PUT', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-05-31 21:02:06', NULL);
INSERT INTO `tb_operation_log` VALUES (38, '', '修改', '/comment', 'com.example.cinema.controller.CommentController.reviewComment', '审核评论', '[{\"commentIds\":[2],\"reviewFlag\":true}]', 'PUT', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-05-31 21:02:08', NULL);
INSERT INTO `tb_operation_log` VALUES (39, '', '修改', '/comment', 'com.example.cinema.controller.CommentController.reviewComment', '审核评论', '[{\"commentIds\":[2],\"reviewFlag\":true}]', 'PUT', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-05-31 21:02:10', NULL);
INSERT INTO `tb_operation_log` VALUES (40, '', '修改', '/comment', 'com.example.cinema.controller.CommentController.reviewComment', '审核评论', '[{\"commentIds\":[1],\"reviewFlag\":true}]', 'PUT', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-05-31 21:02:28', NULL);
INSERT INTO `tb_operation_log` VALUES (41, '', '修改', '/comment', 'com.example.cinema.controller.CommentController.reviewComment', '审核评论', '[{\"commentIds\":[1],\"reviewFlag\":true}]', 'PUT', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-05-31 21:02:29', NULL);
INSERT INTO `tb_operation_log` VALUES (42, '', '修改', '/comment', 'com.example.cinema.controller.CommentController.reviewComment', '审核评论', '[{\"commentIds\":[1],\"reviewFlag\":false}]', 'PUT', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-05-31 21:02:44', NULL);
INSERT INTO `tb_operation_log` VALUES (43, '', '修改', '/comment', 'com.example.cinema.controller.CommentController.reviewComment', '审核评论', '[{\"commentIds\":[2],\"reviewFlag\":false}]', 'PUT', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-05-31 21:02:45', NULL);
INSERT INTO `tb_operation_log` VALUES (44, '', '修改', '/comment', 'com.example.cinema.controller.CommentController.reviewComment', '审核评论', '[{\"commentIds\":[3],\"reviewFlag\":false}]', 'PUT', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-05-31 21:02:46', NULL);
INSERT INTO `tb_operation_log` VALUES (45, '', '修改', '/comment', 'com.example.cinema.controller.CommentController.reviewComment', '审核评论', '[{\"commentIds\":[5],\"reviewFlag\":false}]', 'PUT', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-05-31 21:02:47', NULL);
INSERT INTO `tb_operation_log` VALUES (46, '', '修改', '/comment', 'com.example.cinema.controller.CommentController.reviewComment', '审核评论', '[{\"commentIds\":[1],\"reviewFlag\":true}]', 'PUT', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-05-31 21:02:48', NULL);
INSERT INTO `tb_operation_log` VALUES (47, '', '修改', '/comment', 'com.example.cinema.controller.CommentController.reviewComment', '审核评论', '[{\"commentIds\":[2],\"reviewFlag\":true}]', 'PUT', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-05-31 21:02:49', NULL);
INSERT INTO `tb_operation_log` VALUES (48, '', '修改', '/comment', 'com.example.cinema.controller.CommentController.reviewComment', '审核评论', '[{\"commentIds\":[3],\"reviewFlag\":true}]', 'PUT', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-05-31 21:02:50', NULL);
INSERT INTO `tb_operation_log` VALUES (49, '', '修改', '/comment', 'com.example.cinema.controller.CommentController.reviewComment', '审核评论', '[{\"commentIds\":[5],\"reviewFlag\":true}]', 'PUT', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-05-31 21:02:51', NULL);
INSERT INTO `tb_operation_log` VALUES (50, '', '修改', '/comment', 'com.example.cinema.controller.CommentController.reviewComment', '审核评论', '[{\"commentIds\":[1],\"reviewFlag\":false}]', 'PUT', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-05-31 21:03:05', NULL);
INSERT INTO `tb_operation_log` VALUES (51, '', '修改', '/comment', 'com.example.cinema.controller.CommentController.reviewComment', '审核评论', '[{\"commentIds\":[3],\"reviewFlag\":false}]', 'PUT', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-05-31 21:03:05', NULL);
INSERT INTO `tb_operation_log` VALUES (52, '', '修改', '/comment', 'com.example.cinema.controller.CommentController.reviewComment', '审核评论', '[{\"commentIds\":[2],\"reviewFlag\":false}]', 'PUT', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-05-31 21:03:05', NULL);
INSERT INTO `tb_operation_log` VALUES (53, '', '修改', '/comment', 'com.example.cinema.controller.CommentController.reviewComment', '审核评论', '[{\"commentIds\":[1],\"reviewFlag\":true}]', 'PUT', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-05-31 21:03:06', NULL);
INSERT INTO `tb_operation_log` VALUES (54, '', '修改', '/comment', 'com.example.cinema.controller.CommentController.reviewComment', '审核评论', '[{\"commentIds\":[2],\"reviewFlag\":true}]', 'PUT', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-05-31 21:03:07', NULL);
INSERT INTO `tb_operation_log` VALUES (55, '', '修改', '/comment', 'com.example.cinema.controller.CommentController.reviewComment', '审核评论', '[{\"commentIds\":[3],\"reviewFlag\":true}]', 'PUT', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-05-31 21:03:08', NULL);
INSERT INTO `tb_operation_log` VALUES (56, '', '新增或修改', '/lamination', 'com.example.cinema.controller.LaminationController.saveOrUpdateLamination', '新增或修改排片', '[{\"cinemaId\":1,\"createTime\":1685631105715,\"endTime\":\"2:32\",\"hallId\":7,\"id\":16,\"langVersion\":\"国语2D\",\"movieId\":1,\"price\":35.5,\"seatJson\":\"{\\\"1\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \\\"2\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \\\"3\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \\\"4\\\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \\\"5\\\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \\\"6\\\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \\\"7\\\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \\\"8\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \\\"9\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \\\"10\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0]}\",\"startDate\":1685635200000,\"startTime\":\"00:30\",\"tips\":\"观影请佩戴口罩\"}]', 'POST', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-06-01 22:51:46', NULL);
INSERT INTO `tb_operation_log` VALUES (57, '', '新增或修改', '/lamination', 'com.example.cinema.controller.LaminationController.saveOrUpdateLamination', '新增或修改排片', '[{\"cinemaId\":1,\"createTime\":1685631190459,\"endTime\":\"2:12\",\"hallId\":9,\"id\":17,\"langVersion\":\"国语2D\",\"movieId\":12,\"price\":29.5,\"seatJson\":\"{\\\"1\\\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0], \\\"2\\\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0], \\\"3\\\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0], \\\"4\\\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0], \\\"5\\\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0], \\\"6\\\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0], \\\"7\\\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0], \\\"8\\\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0], \\\"9\\\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0], \\\"10\\\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0], \\\"11\\\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0], \\\"12\\\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0]}\",\"startDate\":1685635200000,\"startTime\":\"00:08\",\"tips\":\"观影请佩戴口罩\"}]', 'POST', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-06-01 22:53:11', NULL);
INSERT INTO `tb_operation_log` VALUES (58, '', '新增', '/comment', 'com.example.cinema.controller.CommentController.saveComment', '新增评论', '[{\"content\":\"很好看\",\"createTime\":1685631257657,\"id\":8,\"movieId\":12,\"reviewFlag\":false,\"score\":5.0,\"userId\":3}]', 'POST', '{\"code\":200,\"message\":\"操作成功\"}', 3, 'FakeAmadeus', '127.0.0.1', '2023-06-01 22:54:18', NULL);
INSERT INTO `tb_operation_log` VALUES (59, '', '修改', '/comment', 'com.example.cinema.controller.CommentController.reviewComment', '审核评论', '[{\"commentIds\":[8],\"reviewFlag\":true}]', 'PUT', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-06-01 22:54:26', NULL);
INSERT INTO `tb_operation_log` VALUES (60, '', '新增', '/comment', 'com.example.cinema.controller.CommentController.saveComment', '新增评论', '[{\"content\":\"很感人\",\"createTime\":1685631537495,\"id\":10,\"movieId\":12,\"reviewFlag\":false,\"score\":5.0,\"userId\":3}]', 'POST', '{\"code\":200,\"message\":\"操作成功\"}', 3, 'FakeAmadeus', '127.0.0.1', '2023-06-01 22:58:58', NULL);
INSERT INTO `tb_operation_log` VALUES (61, '', '修改', '/comment', 'com.example.cinema.controller.CommentController.reviewComment', '审核评论', '[{\"commentIds\":[10],\"reviewFlag\":true}]', 'PUT', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-06-01 22:59:22', NULL);
INSERT INTO `tb_operation_log` VALUES (62, '', '修改', '/comment', 'com.example.cinema.controller.CommentController.reviewComment', '审核评论', '[{\"commentIds\":[9],\"reviewFlag\":true}]', 'PUT', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-06-01 22:59:24', NULL);
INSERT INTO `tb_operation_log` VALUES (63, '', '新增', '/comment', 'com.example.cinema.controller.CommentController.saveComment', '新增评论', '[{\"content\":\"很感人\",\"createTime\":1685631658116,\"id\":11,\"movieId\":12,\"reviewFlag\":false,\"score\":5.0,\"userId\":3}]', 'POST', '{\"code\":200,\"message\":\"操作成功\"}', 3, 'FakeAmadeus', '127.0.0.1', '2023-06-01 23:00:58', NULL);
INSERT INTO `tb_operation_log` VALUES (64, '', '新增', '/comment', 'com.example.cinema.controller.CommentController.saveComment', '新增评论', '[{\"content\":\"很好看的电影\",\"createTime\":1685631727262,\"id\":12,\"movieId\":12,\"reviewFlag\":false,\"score\":10.0,\"userId\":3}]', 'POST', '{\"code\":200,\"message\":\"操作成功\"}', 3, 'FakeAmadeus', '127.0.0.1', '2023-06-01 23:02:07', NULL);
INSERT INTO `tb_operation_log` VALUES (65, '', '修改', '/comment', 'com.example.cinema.controller.CommentController.reviewComment', '审核评论', '[{\"commentIds\":[12],\"reviewFlag\":true}]', 'PUT', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-06-01 23:02:20', NULL);
INSERT INTO `tb_operation_log` VALUES (66, '', '修改', '/comment', 'com.example.cinema.controller.CommentController.reviewComment', '审核评论', '[{\"commentIds\":[11],\"reviewFlag\":true}]', 'PUT', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-06-01 23:02:21', NULL);
INSERT INTO `tb_operation_log` VALUES (67, '', '新增或修改', '/lamination', 'com.example.cinema.controller.LaminationController.saveOrUpdateLamination', '新增或修改排片', '[{\"cinemaId\":1,\"createTime\":1685634482837,\"endTime\":\"2:03\",\"hallId\":10,\"id\":18,\"langVersion\":\"国语2D\",\"movieId\":17,\"price\":35.5,\"seatJson\":\"{\\\"1\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \\\"2\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \\\"3\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \\\"4\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \\\"5\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \\\"6\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \\\"7\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \\\"8\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \\\"9\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \\\"10\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0]}\",\"startDate\":1685635200000,\"startTime\":\"00:15\",\"tips\":\"观影请佩戴口罩\"}]', 'POST', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-06-01 23:48:03', NULL);
INSERT INTO `tb_operation_log` VALUES (68, '', '修改', '/user/password', 'com.example.cinema.controller.UserController.updatePassword', '修改密码', '[{\"checkPassword\":\"123456\",\"newPassword\":\"123456\",\"oldPassword\":\"123456\",\"userId\":2}]', 'PUT', '{\"code\":200,\"message\":\"操作成功\"}', 2, 'test', '127.0.0.1', '2023-06-01 23:56:11', NULL);
INSERT INTO `tb_operation_log` VALUES (69, '评论模块', '修改', '/comment', 'com.example.cinema.controller.CommentController.reviewComment', '审核评论', '[{\"commentIds\":[1,2,3,5,6,7],\"reviewFlag\":true}]', 'PUT', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-06-02 00:00:59', NULL);
INSERT INTO `tb_operation_log` VALUES (70, '影片模块', '新增或修改', '/movie', 'com.example.cinema.controller.MovieController.saveOrUpdateMovie', '新增或修改电影', '[{\"ageId\":1,\"areaId\":4,\"categoryIdList\":[7,2],\"id\":13,\"image\":\"http://8.142.27.217:39000/cinema/c4e03470-6331-41d5-b96b-7e2757f0c8bc.jpg\",\"intro\":\"脑洞大开高分奇片，地球人外星人千里奔现！唐志军是一家诞生于上世纪八十年代的科幻杂志——《宇宙探索》编辑部的主编。现如今的杂志社日渐式微，唐志军也终成落魄潦倒，鳏寡孤独之人。但他却依然几十年如一日的痴迷于寻找地外文明。终于有一天，他接收到了一个疑似来自宇宙深处的异常信号，于是他召集同是天涯沦落人的伙伴们，带着那一个困惑他终生的问题，再一次踏上寻找外星人的未尽之路。\",\"nameCn\":\"宇宙探索编辑部\",\"nameEn\":\"宇宙探索编辑部\",\"releaseTime\":1687222800000,\"time\":118}]', 'POST', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-06-02 08:47:55', NULL);
INSERT INTO `tb_operation_log` VALUES (71, '影片模块', '新增或修改', '/movie', 'com.example.cinema.controller.MovieController.saveOrUpdateMovie', '新增或修改电影', '[{\"ageId\":1,\"areaId\":4,\"categoryIdList\":[7,9,10],\"id\":20,\"image\":\"http://8.142.27.217:39000/cinema/109861bc-3e64-4110-aa2d-1125bc49f4ef.jpg\",\"intro\":\"太阳即将毁灭，人类在地球表面建造出巨大的推进器，寻找新的家园，然而宇宙之路危机四伏，为了拯救地球，流浪地球时代的年轻人再次挺身而出，展开争分夺秒的生死之战...\",\"nameCn\":\" 流浪地球2\",\"nameEn\":\"The Wandering Earth Ⅱ\",\"releaseTime\":1687222800000,\"time\":173}]', 'POST', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-06-02 08:48:12', NULL);
INSERT INTO `tb_operation_log` VALUES (72, '排片模块', '新增或修改', '/lamination', 'com.example.cinema.controller.LaminationController.saveOrUpdateLamination', '新增或修改排片', '[{\"cinemaId\":1,\"createTime\":1685667009064,\"endTime\":\"1:49\",\"hallId\":7,\"id\":19,\"langVersion\":\"国语2D\",\"movieId\":19,\"price\":35.3,\"seatJson\":\"{\\\"1\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \\\"2\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \\\"3\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \\\"4\\\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \\\"5\\\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \\\"6\\\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \\\"7\\\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \\\"8\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \\\"9\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \\\"10\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0]}\",\"startDate\":1685721600000,\"startTime\":\"00:13\",\"tips\":\"观影请佩戴口罩\"}]', 'POST', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-06-02 08:50:09', NULL);
INSERT INTO `tb_operation_log` VALUES (73, '排片模块', '删除', '/lamination', 'com.example.cinema.controller.LaminationController.deleteLamination', '删除排片', '[[19]]', 'DELETE', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-06-02 08:56:42', NULL);
INSERT INTO `tb_operation_log` VALUES (74, '排片模块', '新增或修改', '/lamination', 'com.example.cinema.controller.LaminationController.saveOrUpdateLamination', '新增或修改排片', '[{\"cinemaId\":1,\"createTime\":1685667493985,\"endTime\":\"1:55\",\"hallId\":9,\"id\":20,\"langVersion\":\"国语2D\",\"movieId\":19,\"price\":35.5,\"seatJson\":\"{\\\"1\\\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0], \\\"2\\\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0], \\\"3\\\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0], \\\"4\\\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0], \\\"5\\\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0], \\\"6\\\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0], \\\"7\\\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0], \\\"8\\\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0], \\\"9\\\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0], \\\"10\\\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0], \\\"11\\\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0], \\\"12\\\": [0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0]}\",\"startDate\":1685721600000,\"startTime\":\"00:19\",\"tips\":\"观影请佩戴口罩\"}]', 'POST', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-06-02 08:58:14', NULL);
INSERT INTO `tb_operation_log` VALUES (75, '排片模块', '删除', '/lamination', 'com.example.cinema.controller.LaminationController.deleteLamination', '删除排片', '[[20]]', 'DELETE', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-06-02 09:03:20', NULL);
INSERT INTO `tb_operation_log` VALUES (76, '排片模块', '新增或修改', '/lamination', 'com.example.cinema.controller.LaminationController.saveOrUpdateLamination', '新增或修改排片', '[{\"cinemaId\":1,\"createTime\":1685667931069,\"endTime\":\"10:36\",\"hallId\":7,\"id\":21,\"langVersion\":\"国语2D\",\"movieId\":19,\"price\":35.6,\"seatJson\":\"{\\\"1\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \\\"2\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \\\"3\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \\\"4\\\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \\\"5\\\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \\\"6\\\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \\\"7\\\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \\\"8\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \\\"9\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \\\"10\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0]}\",\"startDate\":1685721600000,\"startTime\":\"09:00\",\"tips\":\"观影请佩戴口罩\"}]', 'POST', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-06-02 09:05:31', NULL);
INSERT INTO `tb_operation_log` VALUES (77, '排片模块', '删除', '/lamination', 'com.example.cinema.controller.LaminationController.deleteLamination', '删除排片', '[[21]]', 'DELETE', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-06-02 09:08:20', NULL);
INSERT INTO `tb_operation_log` VALUES (78, '排片模块', '新增或修改', '/lamination', 'com.example.cinema.controller.LaminationController.saveOrUpdateLamination', '新增或修改排片', '[{\"cinemaId\":1,\"createTime\":1685668208699,\"endTime\":\"12:14\",\"hallId\":7,\"id\":22,\"langVersion\":\"英语2D\",\"movieId\":15,\"price\":35.7,\"seatJson\":\"{\\\"1\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \\\"2\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \\\"3\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \\\"4\\\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \\\"5\\\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \\\"6\\\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \\\"7\\\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \\\"8\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \\\"9\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0], \\\"10\\\": [0, 1, 0, 0, 0, 0, 0, 0, 1, 0]}\",\"startDate\":1685721600000,\"startTime\":\"09:00\",\"tips\":\"观影请佩戴口罩\"}]', 'POST', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-06-02 09:10:09', NULL);
INSERT INTO `tb_operation_log` VALUES (79, '评论模块', '新增', '/comment', 'com.example.cinema.controller.CommentController.saveComment', '新增评论', '[{\"content\":\"非常感人的电影\",\"createTime\":1685668314509,\"id\":15,\"movieId\":15,\"reviewFlag\":false,\"score\":10.0,\"userId\":7}]', 'POST', '{\"code\":200,\"message\":\"操作成功\"}', 7, 'fronted', '127.0.0.1', '2023-06-02 09:11:55', NULL);
INSERT INTO `tb_operation_log` VALUES (80, '评论模块', '修改', '/comment', 'com.example.cinema.controller.CommentController.reviewComment', '审核评论', '[{\"commentIds\":[15],\"reviewFlag\":true}]', 'PUT', '{\"code\":200,\"message\":\"操作成功\"}', 1, 'admin', '127.0.0.1', '2023-06-02 09:12:06', NULL);

-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '订单唯一标识',
  `user_id` int NULL DEFAULT NULL COMMENT '用户Id',
  `lamination_id` int NULL DEFAULT NULL COMMENT '场次Id',
  `seats` json NULL COMMENT '购买的座位信息',
  `total_price` double NULL DEFAULT NULL COMMENT '总价',
  `order_status` tinyint(1) NULL DEFAULT NULL COMMENT '订单状态：0-未支付、1-已支付',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_order
-- ----------------------------
INSERT INTO `tb_order` VALUES (44, '1ecb11ec-dd7d-4b6d-8113-7f560da7ae18', 1, 12, '[\"4排5座\", \"5排5座\", \"6排5座\", \"7排5座\", \"7排6座\"]', 177.5, 2, '2023-05-03 16:59:20', '2023-05-28 18:42:30');
INSERT INTO `tb_order` VALUES (45, '22e93204-1ac3-49bf-a9d4-a5c884521c1e', 1, 13, '[\"4排5座\", \"5排5座\", \"6排5座\", \"6排6座\", \"7排5座\"]', 177.5, 2, '2023-05-28 17:30:13', '2023-05-28 18:42:30');
INSERT INTO `tb_order` VALUES (46, 'd902fcb0-8b1f-4a89-a409-ae37662e7409', 1, 14, '[\"4排5座\", \"5排5座\", \"6排5座\", \"6排6座\", \"7排5座\"]', 177.5, 1, '2023-05-29 21:53:12', '2023-05-29 21:53:51');
INSERT INTO `tb_order` VALUES (47, '3fba63d5-99ed-47fc-bda5-bfec1eb9d03b', 1, 14, '[\"1排4座\", \"1排5座\", \"2排5座\", \"3排5座\", \"3排4座\"]', 177.5, 1, '2023-05-29 23:05:45', '2023-05-29 23:06:13');
INSERT INTO `tb_order` VALUES (48, '660613f6-1dd3-4b84-83e7-0c924f832e55', 3, 15, '[\"5排5座\", \"6排5座\", \"6排6座\", \"7排6座\", \"7排5座\"]', 177.5, 1, '2023-05-31 20:10:38', '2023-05-31 20:11:30');
INSERT INTO `tb_order` VALUES (49, '61c93212-617e-43d3-83d0-a77102470d74', 3, 17, '[\"5排6座\", \"6排6座\", \"8排6座\", \"7排7座\", \"7排6座\"]', 147.5, 1, '2023-06-01 22:55:39', '2023-06-01 22:56:05');
INSERT INTO `tb_order` VALUES (50, '7869171b-bb40-47ac-ba3a-052ff60ee297', 3, 18, '[\"5排5座\", \"6排5座\", \"6排6座\", \"7排6座\", \"7排5座\"]', 177.5, 1, '2023-06-01 23:49:23', '2023-06-01 23:49:55');
INSERT INTO `tb_order` VALUES (51, 'b18bd6a8-09b0-4d47-af59-a7d1020cfa84', 7, 22, '[\"4排6座\", \"5排6座\", \"5排7座\", \"6排7座\", \"6排6座\"]', 178.5, 1, '2023-06-02 09:12:43', '2023-06-02 09:13:23');

-- ----------------------------
-- Table structure for tb_resource
-- ----------------------------
DROP TABLE IF EXISTS `tb_resource`;
CREATE TABLE `tb_resource`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `resource_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '资源名',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限路径',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求方式',
  `parent_id` int NULL DEFAULT NULL COMMENT '父权限id',
  `is_anonymous` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否匿名访问 0否 1是',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 143 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_resource
-- ----------------------------
INSERT INTO `tb_resource` VALUES (1, '演员模块', '', '', NULL, 0, '2023-05-31 18:27:04', NULL);
INSERT INTO `tb_resource` VALUES (2, '查看演员列表', '/actor', 'GET', 1, 0, '2023-05-31 18:28:32', NULL);
INSERT INTO `tb_resource` VALUES (3, '新增或修改演员', '/actor', 'POST', 1, 0, '2023-05-31 18:29:05', NULL);
INSERT INTO `tb_resource` VALUES (4, '删除演员', '/actor', 'DELETE', 1, 0, '2023-05-31 18:29:30', NULL);
INSERT INTO `tb_resource` VALUES (5, '查看演员详情', '/actor/detail', 'GET', 1, 1, '2023-05-31 19:46:09', NULL);
INSERT INTO `tb_resource` VALUES (6, '查看所有演员', '/actor/list', 'GET', 1, 1, '2023-05-31 19:46:06', NULL);
INSERT INTO `tb_resource` VALUES (7, '查看热门影人', '/actor/popular', 'GET', 1, 1, '2023-05-31 19:46:04', NULL);
INSERT INTO `tb_resource` VALUES (8, '搜索演员', '/actor/search', 'GET', 1, 1, '2023-05-31 19:46:03', NULL);
INSERT INTO `tb_resource` VALUES (9, '年代模块', NULL, NULL, NULL, 0, '2023-05-31 18:31:20', NULL);
INSERT INTO `tb_resource` VALUES (10, '查看年代', '/age', 'GET', 9, 0, '2023-05-31 18:31:42', NULL);
INSERT INTO `tb_resource` VALUES (11, '新增或修改年代', '/age', 'POST', 9, 0, '2023-05-31 18:32:07', NULL);
INSERT INTO `tb_resource` VALUES (12, '删除年代', '/age', 'DELETE', 9, 0, '2023-05-31 18:32:34', NULL);
INSERT INTO `tb_resource` VALUES (13, '查看所有年代', '/age/list', 'GET', 9, 1, '2023-05-31 19:46:37', NULL);
INSERT INTO `tb_resource` VALUES (14, '区域模块', NULL, NULL, NULL, 0, '2023-05-31 18:38:36', NULL);
INSERT INTO `tb_resource` VALUES (15, '查看区域列表', '/area', 'GET', 14, 0, '2023-05-31 18:38:56', NULL);
INSERT INTO `tb_resource` VALUES (16, '新增或修改区域', '/area', 'POST', 14, 0, '2023-05-31 18:39:15', NULL);
INSERT INTO `tb_resource` VALUES (17, '删除区域', '/area', 'DELETE', 14, 0, '2023-05-31 18:39:31', NULL);
INSERT INTO `tb_resource` VALUES (18, '查看所有区域', '/area/list', 'GET', 14, 1, '2023-05-31 19:46:39', NULL);
INSERT INTO `tb_resource` VALUES (19, '品牌模块', NULL, NULL, NULL, 0, '2023-05-31 18:40:10', NULL);
INSERT INTO `tb_resource` VALUES (20, '查看品牌列表', '/brand', 'GET', 19, 0, '2023-05-31 18:40:29', NULL);
INSERT INTO `tb_resource` VALUES (21, '新增或修改品牌', '/brand', 'POST', 19, 0, '2023-05-31 18:40:49', NULL);
INSERT INTO `tb_resource` VALUES (22, '删除品牌', '/brand', 'DELETE', 19, 0, '2023-05-31 18:41:03', NULL);
INSERT INTO `tb_resource` VALUES (23, '查看所有品牌', '/brand/list', 'GET', 19, 1, '2023-05-31 19:46:44', NULL);
INSERT INTO `tb_resource` VALUES (24, '分类模块', NULL, NULL, NULL, 0, '2023-05-31 18:41:39', NULL);
INSERT INTO `tb_resource` VALUES (25, '查看分类列表', '/category', 'GET', 24, 0, '2023-05-31 18:42:00', NULL);
INSERT INTO `tb_resource` VALUES (26, '新增或修改分类', '/category', 'POST', 24, 0, '2023-05-31 18:42:19', NULL);
INSERT INTO `tb_resource` VALUES (27, '删除分类', '/category', 'DELETE', 24, 0, '2023-05-31 18:42:35', NULL);
INSERT INTO `tb_resource` VALUES (28, '查看所有分类', '/category/list', 'GET', 24, 1, '2023-05-31 19:46:48', NULL);
INSERT INTO `tb_resource` VALUES (29, '影院模块', NULL, NULL, NULL, 0, '2023-05-31 18:44:21', NULL);
INSERT INTO `tb_resource` VALUES (30, '查看影院列表', '/cinema', 'GET', 29, 0, '2023-05-31 18:45:25', NULL);
INSERT INTO `tb_resource` VALUES (31, '新增或修改影院', '/cinema', 'POST', 29, 0, '2023-05-31 18:46:03', NULL);
INSERT INTO `tb_resource` VALUES (32, '删除影院', '/cinema', 'DELETE', 29, 0, '2023-05-31 18:46:22', NULL);
INSERT INTO `tb_resource` VALUES (33, '查看影院详情', '/cinema/detail', 'GET', 29, 1, '2023-05-31 19:47:37', NULL);
INSERT INTO `tb_resource` VALUES (34, '查看影院影厅', '/cinema/hall', 'GET', 29, 1, '2023-05-31 19:47:34', NULL);
INSERT INTO `tb_resource` VALUES (35, '查看所有影院', '/cinema/list', 'GET', 29, 1, '2023-05-31 19:47:26', NULL);
INSERT INTO `tb_resource` VALUES (36, '影院条件筛选', '/cinema/query', 'GET', 29, 1, '2023-05-31 19:47:23', NULL);
INSERT INTO `tb_resource` VALUES (37, '影院搜索', '/cinema/search', 'GET', 29, 1, '2023-05-31 19:47:22', NULL);
INSERT INTO `tb_resource` VALUES (38, '查看影院服务', '/cinema/serve', 'GET', 29, 1, '2023-05-31 19:47:21', NULL);
INSERT INTO `tb_resource` VALUES (39, '新增或修改影院服务', '/cinema/serve', 'POST', 29, 0, '2023-05-31 18:47:47', NULL);
INSERT INTO `tb_resource` VALUES (40, '删除影院服务', '/cinema/serve', 'DELETE', 29, 0, '2023-05-31 18:47:56', NULL);
INSERT INTO `tb_resource` VALUES (41, '评论模块', NULL, NULL, NULL, 0, '2023-05-31 18:49:32', NULL);
INSERT INTO `tb_resource` VALUES (42, '后后台查看影片评论', '/comment', 'GET', 41, 0, '2023-05-31 20:52:16', NULL);
INSERT INTO `tb_resource` VALUES (43, '\r\n新增评论', '\r\n/comment', 'POST', 41, 1, '2023-05-31 19:47:59', NULL);
INSERT INTO `tb_resource` VALUES (44, '\r\n审核评论', '/comment', 'PUT', 41, 0, '2023-05-31 20:53:37', NULL);
INSERT INTO `tb_resource` VALUES (45, '删除评论', '/comment', 'DELETE', 41, 0, '2023-05-31 20:57:28', NULL);
INSERT INTO `tb_resource` VALUES (46, '前台查看影片评论', '/comment/movieQ', 'GET', 41, 1, '2023-05-31 19:48:02', NULL);
INSERT INTO `tb_resource` VALUES (47, '通用模块', NULL, NULL, NULL, 0, '2023-05-31 18:51:46', NULL);
INSERT INTO `tb_resource` VALUES (48, '获取忘记密码验证码', '/forget/code', 'GET', 47, 1, '2023-05-31 19:48:06', NULL);
INSERT INTO `tb_resource` VALUES (49, '获取后台首页统计数据', '/homePage', 'GET', 47, 0, '2023-05-31 18:54:07', NULL);
INSERT INTO `tb_resource` VALUES (50, '获取注册验证码', '\r\n/register/code', 'GET', 47, 1, '2023-05-31 19:48:08', NULL);
INSERT INTO `tb_resource` VALUES (51, '获取唯一标识', '\r\n/token', 'GET', 47, 1, '2023-05-31 19:48:09', NULL);
INSERT INTO `tb_resource` VALUES (52, '访问量+1', '/view', 'GET', 47, 1, '2023-05-31 19:48:11', NULL);
INSERT INTO `tb_resource` VALUES (53, '行政区模块', NULL, NULL, NULL, 0, '2023-05-31 18:54:21', NULL);
INSERT INTO `tb_resource` VALUES (54, '查看行政区列表', '/district', 'GET', 53, 0, '2023-05-31 18:55:16', NULL);
INSERT INTO `tb_resource` VALUES (55, '新增或修改行政区', '/district', 'POST', 53, 0, '2023-05-31 18:55:19', NULL);
INSERT INTO `tb_resource` VALUES (56, '删除行政区', '/district', 'DELETE', 53, 0, '2023-05-31 18:55:26', NULL);
INSERT INTO `tb_resource` VALUES (57, '查看所有行政区', '/district/list', 'GET', 53, 1, '2023-05-31 19:48:28', NULL);
INSERT INTO `tb_resource` VALUES (58, '职务模块', NULL, NULL, NULL, 0, '2023-05-31 18:55:52', NULL);
INSERT INTO `tb_resource` VALUES (59, '查看职务列表', '/duty', 'GET', 58, 0, '2023-05-31 18:56:47', NULL);
INSERT INTO `tb_resource` VALUES (60, '新增或修改职务', '/duty', 'POST', 58, 0, '2023-05-31 18:56:48', NULL);
INSERT INTO `tb_resource` VALUES (61, '\r\n删除职务', '/duty', 'DELETE', 58, 0, '2023-05-31 18:56:49', NULL);
INSERT INTO `tb_resource` VALUES (62, '获取所有职务', '/duty/list', 'GET', 58, 1, '2023-05-31 19:48:34', NULL);
INSERT INTO `tb_resource` VALUES (63, '影厅模块', NULL, NULL, NULL, 0, '2023-05-31 18:57:03', NULL);
INSERT INTO `tb_resource` VALUES (64, '查看影厅列表', '/hall', 'GET', 63, 0, '2023-05-31 18:58:58', NULL);
INSERT INTO `tb_resource` VALUES (65, '新增或修改影厅', '/hall', 'POST', 63, 0, '2023-05-31 18:58:59', NULL);
INSERT INTO `tb_resource` VALUES (66, '删除影厅', '/hall', 'DELETE', 63, 0, '2023-05-31 18:59:00', NULL);
INSERT INTO `tb_resource` VALUES (67, '查看影院下的所有影厅', '/hall/list', 'GET', 63, 0, '2023-05-31 20:58:21', NULL);
INSERT INTO `tb_resource` VALUES (68, '修改影厅座位', '/hall/seat', 'PUT', 63, 0, '2023-05-31 18:59:01', NULL);
INSERT INTO `tb_resource` VALUES (69, '修改影厅可用状态', '/hall/state', 'PUT', 63, 0, '2023-05-31 18:59:03', NULL);
INSERT INTO `tb_resource` VALUES (70, '排片模块', NULL, NULL, NULL, 0, '2023-05-31 18:59:17', NULL);
INSERT INTO `tb_resource` VALUES (71, '查看排片列表', '/lamination', 'GET', 70, 0, '2023-05-31 20:58:59', NULL);
INSERT INTO `tb_resource` VALUES (72, '新增或修改排片', '/lamination', 'POST', 70, 0, '2023-05-31 20:59:19', NULL);
INSERT INTO `tb_resource` VALUES (73, '删除排片', '/lamination', 'DELETE', 70, 0, '2023-05-31 20:59:22', NULL);
INSERT INTO `tb_resource` VALUES (74, '查看排片详情', '/lamination/detail', 'GET', 70, 1, '2023-05-31 19:49:22', NULL);
INSERT INTO `tb_resource` VALUES (75, '订单页面查看排片详情', '/lamination/order', 'GET', 70, 1, '2023-05-31 19:49:23', NULL);
INSERT INTO `tb_resource` VALUES (76, '查看排片的座位信息', '/lamination/seats', 'GET', 70, 1, '2023-05-31 19:49:24', NULL);
INSERT INTO `tb_resource` VALUES (77, '电影模块', NULL, NULL, NULL, 0, '2023-05-31 19:01:01', NULL);
INSERT INTO `tb_resource` VALUES (78, '查看影片列表', '/movie', 'GET', 77, 0, '2023-05-31 19:05:14', NULL);
INSERT INTO `tb_resource` VALUES (79, '新增或修改电影', '/movie', 'POST', 77, 0, '2023-05-31 19:05:15', NULL);
INSERT INTO `tb_resource` VALUES (80, '删除电影', '/movie', 'DELETE', 77, 0, '2023-05-31 19:05:16', NULL);
INSERT INTO `tb_resource` VALUES (81, '查看影片下的演员详情', '/movie/actor', 'GET', 77, 1, '2023-05-31 19:50:01', NULL);
INSERT INTO `tb_resource` VALUES (82, '新增演员', '/movie/actor', 'POST', 77, 0, '2023-05-31 19:05:18', NULL);
INSERT INTO `tb_resource` VALUES (83, '删除电影下的演员', '/movie/actor', 'DELETE', 77, 0, '2023-05-31 19:05:19', NULL);
INSERT INTO `tb_resource` VALUES (84, '查看经典电影', '/movie/classic', 'GET', 77, 1, '2023-05-31 19:49:53', NULL);
INSERT INTO `tb_resource` VALUES (85, '查看电影详情', '/movie/detail', 'GET', 77, 1, '2023-05-31 19:49:48', NULL);
INSERT INTO `tb_resource` VALUES (86, '上传图片', '/movie/image', 'POST', 77, 0, '2023-05-31 19:05:21', NULL);
INSERT INTO `tb_resource` VALUES (87, '查看所有电影', '/movie/list', 'GET', 77, 0, '2023-05-31 19:05:22', NULL);
INSERT INTO `tb_resource` VALUES (88, '查看正在热映电影', '/movie/ongoing', 'GET', 77, 1, '2023-05-31 19:49:46', NULL);
INSERT INTO `tb_resource` VALUES (89, '查看即将上映电影', '/movie/upcoming', 'GET', 77, 1, '2023-05-31 19:49:37', NULL);
INSERT INTO `tb_resource` VALUES (90, '电影访问量+1', '/movie/view', 'PUT', 77, 1, '2023-05-31 19:49:36', NULL);
INSERT INTO `tb_resource` VALUES (91, '日志模块', NULL, NULL, NULL, 0, '2023-05-31 19:05:53', NULL);
INSERT INTO `tb_resource` VALUES (92, '查看操作日志', '/log', 'GET', 91, 0, '2023-05-31 20:59:33', NULL);
INSERT INTO `tb_resource` VALUES (93, '删除操作日志', '/log', 'DELETE', 91, 0, '2023-05-31 20:59:36', NULL);
INSERT INTO `tb_resource` VALUES (94, '订单模块', NULL, NULL, NULL, 0, '2023-05-31 19:06:35', NULL);
INSERT INTO `tb_resource` VALUES (95, '新增或修改订单', '/order', 'POST', 94, 1, '2023-05-31 19:50:05', NULL);
INSERT INTO `tb_resource` VALUES (96, '查看订单详情', '/order/detail', 'GET', 94, 1, '2023-05-31 19:50:06', NULL);
INSERT INTO `tb_resource` VALUES (97, '订单支付', '/order/pay/*', 'PUT', 94, 1, '2023-05-31 19:50:07', NULL);
INSERT INTO `tb_resource` VALUES (98, '更新订单状态', '/order/status', 'POST', 94, 1, '2023-05-31 19:50:07', NULL);
INSERT INTO `tb_resource` VALUES (99, '查看用户订单', '/order/user', 'GET', 94, 1, '2023-05-31 19:50:09', NULL);
INSERT INTO `tb_resource` VALUES (100, '排行榜模块', NULL, NULL, NULL, 0, '2023-05-31 19:09:42', NULL);
INSERT INTO `tb_resource` VALUES (101, '查看国内票房榜', '/rank/gross', 'GET', 100, 1, '2023-05-31 19:50:17', NULL);
INSERT INTO `tb_resource` VALUES (102, '查看热映口碑榜', '/rank/reputation', 'GET', 100, 1, '2023-05-31 19:50:17', NULL);
INSERT INTO `tb_resource` VALUES (103, '查看今日票房榜', '/rank/today', 'GET', 100, 1, '2023-05-31 19:50:18', NULL);
INSERT INTO `tb_resource` VALUES (104, '查看Top100榜', '/rank/top100', 'GET', 100, 1, '2023-05-31 19:50:19', NULL);
INSERT INTO `tb_resource` VALUES (105, '角色模块', NULL, NULL, NULL, 0, '2023-05-31 19:10:57', NULL);
INSERT INTO `tb_resource` VALUES (106, '查看角色列表', '/role', 'GET', 105, 0, '2023-05-31 19:12:00', NULL);
INSERT INTO `tb_resource` VALUES (107, '新增或修改角色', '/role', 'POST', 105, 0, '2023-05-31 19:12:05', NULL);
INSERT INTO `tb_resource` VALUES (108, '删除角色', '/role', 'DELETE', 105, 0, '2023-05-31 19:12:06', NULL);
INSERT INTO `tb_resource` VALUES (109, '禁用角色', '/role/able', 'PUT', 105, 0, '2023-05-31 19:12:06', NULL);
INSERT INTO `tb_resource` VALUES (110, '查看所有角色', '/role/list', 'GET', 105, 0, '2023-05-31 19:12:07', NULL);
INSERT INTO `tb_resource` VALUES (111, '服务模块', NULL, NULL, NULL, 0, '2023-05-31 19:12:37', NULL);
INSERT INTO `tb_resource` VALUES (112, '查看服务列表', '/serve', 'GET', 111, 0, '2023-05-31 19:13:18', NULL);
INSERT INTO `tb_resource` VALUES (113, '新增或修改服务', '/serve', 'POST', 111, 0, '2023-05-31 19:13:19', NULL);
INSERT INTO `tb_resource` VALUES (114, '删除服务', '/serve', 'DELETE', 111, 0, '2023-05-31 19:13:20', NULL);
INSERT INTO `tb_resource` VALUES (115, '查看所有服务', '/serve/list', 'GET', 111, 1, '2023-05-31 19:50:30', NULL);
INSERT INTO `tb_resource` VALUES (116, '类型模块', NULL, NULL, NULL, 0, '2023-05-31 19:13:32', NULL);
INSERT INTO `tb_resource` VALUES (117, '查看类型列表', '/type', 'GET', 116, 0, '2023-05-31 19:14:18', NULL);
INSERT INTO `tb_resource` VALUES (118, '新增或修改类型', '/type', 'POST', 116, 0, '2023-05-31 19:14:19', NULL);
INSERT INTO `tb_resource` VALUES (119, '删除类型', '/type', 'DELETE', 116, 0, '2023-05-31 19:14:20', NULL);
INSERT INTO `tb_resource` VALUES (120, '查看所有类型', '/type/list', 'GET', 116, 1, '2023-05-31 19:50:34', NULL);
INSERT INTO `tb_resource` VALUES (121, '用户模块', NULL, NULL, NULL, 0, '2023-05-31 19:14:35', NULL);
INSERT INTO `tb_resource` VALUES (122, '查看用户列表', '/user', 'GET', 121, 0, '2023-05-31 19:16:31', NULL);
INSERT INTO `tb_resource` VALUES (123, '新增或修改用户', '/user', 'POST', 121, 0, '2023-05-31 19:16:33', NULL);
INSERT INTO `tb_resource` VALUES (124, '删除用户', '/user', 'DELETE', 121, 0, '2023-05-31 19:16:35', NULL);
INSERT INTO `tb_resource` VALUES (125, '禁用用户', '/user/able', 'PUT', 121, 0, '2023-05-31 19:16:38', NULL);
INSERT INTO `tb_resource` VALUES (126, '强制下线', '/user/forceLogout', 'DELETE', 121, 0, '2023-05-31 19:16:41', NULL);
INSERT INTO `tb_resource` VALUES (127, '忘记密码', '/user/forget', 'PUT', 121, 1, '2023-05-31 19:50:52', NULL);
INSERT INTO `tb_resource` VALUES (128, '查看用户详情', '/user/info', 'GET', 121, 1, '2023-05-31 19:50:49', NULL);
INSERT INTO `tb_resource` VALUES (129, '查看在线用户', '/user/online', 'GET', 121, 0, '2023-05-31 19:16:46', NULL);
INSERT INTO `tb_resource` VALUES (130, '修改密码', '/user/password', 'PUT', 121, 1, '2023-05-31 19:50:47', NULL);
INSERT INTO `tb_resource` VALUES (131, '注册用户', '/user/register', 'POST', 121, 1, '2023-05-31 19:50:45', NULL);
INSERT INTO `tb_resource` VALUES (132, '菜单模块', NULL, NULL, NULL, 0, '2023-05-31 19:17:07', NULL);
INSERT INTO `tb_resource` VALUES (133, '查看菜单列表', '/menu', 'GET', 132, 0, '2023-05-31 19:18:19', NULL);
INSERT INTO `tb_resource` VALUES (134, '新增或修改菜单', '/menu', 'POST', 132, 0, '2023-05-31 19:18:20', NULL);
INSERT INTO `tb_resource` VALUES (135, '查看角色菜单选项', '/menu/role', 'GET', 132, 0, '2023-05-31 19:18:20', NULL);
INSERT INTO `tb_resource` VALUES (136, '查看当前用户菜单', '/menu/user', 'GET', 132, 0, '2023-05-31 19:18:21', NULL);
INSERT INTO `tb_resource` VALUES (137, '删除菜单', '/menu/*', 'DELETE', 132, 0, '2023-05-31 19:18:22', NULL);
INSERT INTO `tb_resource` VALUES (138, '资源模块', NULL, NULL, NULL, 0, '2023-05-31 19:18:36', NULL);
INSERT INTO `tb_resource` VALUES (139, '查看资源列表', '/resource', 'GET', 138, 0, '2023-05-31 19:19:20', NULL);
INSERT INTO `tb_resource` VALUES (140, '新增或修改资源', '/resource', 'POST', 138, 0, '2023-05-31 19:19:20', NULL);
INSERT INTO `tb_resource` VALUES (141, '查看角色资源选项', '/resource/role', 'GET', 138, 0, '2023-05-31 19:35:33', NULL);
INSERT INTO `tb_resource` VALUES (142, '删除资源', '/resource/*', 'DELETE', 138, 0, '2023-05-31 19:19:32', NULL);

-- ----------------------------
-- Table structure for tb_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名',
  `label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色描述',
  `able_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁用  0否 1是',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_role
-- ----------------------------
INSERT INTO `tb_role` VALUES (1, '管理员', 'admin', 1, '2021-03-22 14:10:21', '2023-05-03 17:09:23');
INSERT INTO `tb_role` VALUES (4, '测试', 'test', 1, '2023-05-31 19:31:18', '2023-05-31 19:40:48');

-- ----------------------------
-- Table structure for tb_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_role_menu`;
CREATE TABLE `tb_role_menu`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` int NULL DEFAULT NULL COMMENT '角色id',
  `menu_id` int NULL DEFAULT NULL COMMENT '菜单id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2796 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_role_menu
-- ----------------------------
INSERT INTO `tb_role_menu` VALUES (2742, 1, 1);
INSERT INTO `tb_role_menu` VALUES (2743, 1, 11);
INSERT INTO `tb_role_menu` VALUES (2744, 1, 12);
INSERT INTO `tb_role_menu` VALUES (2745, 1, 13);
INSERT INTO `tb_role_menu` VALUES (2746, 1, 14);
INSERT INTO `tb_role_menu` VALUES (2747, 1, 15);
INSERT INTO `tb_role_menu` VALUES (2748, 1, 16);
INSERT INTO `tb_role_menu` VALUES (2749, 1, 17);
INSERT INTO `tb_role_menu` VALUES (2750, 1, 18);
INSERT INTO `tb_role_menu` VALUES (2751, 1, 19);
INSERT INTO `tb_role_menu` VALUES (2752, 1, 20);
INSERT INTO `tb_role_menu` VALUES (2753, 1, 21);
INSERT INTO `tb_role_menu` VALUES (2754, 1, 22);
INSERT INTO `tb_role_menu` VALUES (2755, 1, 23);
INSERT INTO `tb_role_menu` VALUES (2756, 1, 24);
INSERT INTO `tb_role_menu` VALUES (2757, 1, 25);
INSERT INTO `tb_role_menu` VALUES (2758, 1, 26);
INSERT INTO `tb_role_menu` VALUES (2759, 1, 10);
INSERT INTO `tb_role_menu` VALUES (2760, 1, 3);
INSERT INTO `tb_role_menu` VALUES (2761, 1, 4);
INSERT INTO `tb_role_menu` VALUES (2762, 1, 5);
INSERT INTO `tb_role_menu` VALUES (2763, 1, 9);
INSERT INTO `tb_role_menu` VALUES (2764, 1, 2);
INSERT INTO `tb_role_menu` VALUES (2765, 1, 8);
INSERT INTO `tb_role_menu` VALUES (2766, 1, 6);
INSERT INTO `tb_role_menu` VALUES (2767, 1, 7);
INSERT INTO `tb_role_menu` VALUES (2768, 1, 27);
INSERT INTO `tb_role_menu` VALUES (2769, 4, 1);
INSERT INTO `tb_role_menu` VALUES (2770, 4, 11);
INSERT INTO `tb_role_menu` VALUES (2771, 4, 12);
INSERT INTO `tb_role_menu` VALUES (2772, 4, 13);
INSERT INTO `tb_role_menu` VALUES (2773, 4, 14);
INSERT INTO `tb_role_menu` VALUES (2774, 4, 15);
INSERT INTO `tb_role_menu` VALUES (2775, 4, 16);
INSERT INTO `tb_role_menu` VALUES (2776, 4, 17);
INSERT INTO `tb_role_menu` VALUES (2777, 4, 18);
INSERT INTO `tb_role_menu` VALUES (2778, 4, 19);
INSERT INTO `tb_role_menu` VALUES (2779, 4, 20);
INSERT INTO `tb_role_menu` VALUES (2780, 4, 21);
INSERT INTO `tb_role_menu` VALUES (2781, 4, 22);
INSERT INTO `tb_role_menu` VALUES (2782, 4, 23);
INSERT INTO `tb_role_menu` VALUES (2783, 4, 24);
INSERT INTO `tb_role_menu` VALUES (2784, 4, 25);
INSERT INTO `tb_role_menu` VALUES (2785, 4, 26);
INSERT INTO `tb_role_menu` VALUES (2786, 4, 10);
INSERT INTO `tb_role_menu` VALUES (2787, 4, 3);
INSERT INTO `tb_role_menu` VALUES (2788, 4, 4);
INSERT INTO `tb_role_menu` VALUES (2789, 4, 5);
INSERT INTO `tb_role_menu` VALUES (2790, 4, 9);
INSERT INTO `tb_role_menu` VALUES (2791, 4, 2);
INSERT INTO `tb_role_menu` VALUES (2792, 4, 8);
INSERT INTO `tb_role_menu` VALUES (2793, 4, 6);
INSERT INTO `tb_role_menu` VALUES (2794, 4, 7);
INSERT INTO `tb_role_menu` VALUES (2795, 4, 27);

-- ----------------------------
-- Table structure for tb_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `tb_role_resource`;
CREATE TABLE `tb_role_resource`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NULL DEFAULT NULL COMMENT '角色id',
  `resource_id` int NULL DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 339 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_role_resource
-- ----------------------------
INSERT INTO `tb_role_resource` VALUES (1, 1, 1);
INSERT INTO `tb_role_resource` VALUES (2, 1, 2);
INSERT INTO `tb_role_resource` VALUES (3, 1, 3);
INSERT INTO `tb_role_resource` VALUES (4, 1, 4);
INSERT INTO `tb_role_resource` VALUES (5, 1, 5);
INSERT INTO `tb_role_resource` VALUES (6, 1, 6);
INSERT INTO `tb_role_resource` VALUES (7, 1, 7);
INSERT INTO `tb_role_resource` VALUES (8, 1, 8);
INSERT INTO `tb_role_resource` VALUES (9, 1, 9);
INSERT INTO `tb_role_resource` VALUES (10, 1, 10);
INSERT INTO `tb_role_resource` VALUES (11, 1, 11);
INSERT INTO `tb_role_resource` VALUES (12, 1, 12);
INSERT INTO `tb_role_resource` VALUES (13, 1, 13);
INSERT INTO `tb_role_resource` VALUES (14, 1, 14);
INSERT INTO `tb_role_resource` VALUES (15, 1, 15);
INSERT INTO `tb_role_resource` VALUES (16, 1, 16);
INSERT INTO `tb_role_resource` VALUES (17, 1, 17);
INSERT INTO `tb_role_resource` VALUES (18, 1, 18);
INSERT INTO `tb_role_resource` VALUES (19, 1, 19);
INSERT INTO `tb_role_resource` VALUES (20, 1, 20);
INSERT INTO `tb_role_resource` VALUES (21, 1, 21);
INSERT INTO `tb_role_resource` VALUES (22, 1, 22);
INSERT INTO `tb_role_resource` VALUES (23, 1, 23);
INSERT INTO `tb_role_resource` VALUES (24, 1, 24);
INSERT INTO `tb_role_resource` VALUES (25, 1, 25);
INSERT INTO `tb_role_resource` VALUES (26, 1, 26);
INSERT INTO `tb_role_resource` VALUES (27, 1, 27);
INSERT INTO `tb_role_resource` VALUES (28, 1, 28);
INSERT INTO `tb_role_resource` VALUES (29, 1, 29);
INSERT INTO `tb_role_resource` VALUES (30, 1, 30);
INSERT INTO `tb_role_resource` VALUES (31, 1, 31);
INSERT INTO `tb_role_resource` VALUES (32, 1, 32);
INSERT INTO `tb_role_resource` VALUES (33, 1, 33);
INSERT INTO `tb_role_resource` VALUES (34, 1, 34);
INSERT INTO `tb_role_resource` VALUES (35, 1, 35);
INSERT INTO `tb_role_resource` VALUES (36, 1, 36);
INSERT INTO `tb_role_resource` VALUES (37, 1, 37);
INSERT INTO `tb_role_resource` VALUES (38, 1, 38);
INSERT INTO `tb_role_resource` VALUES (39, 1, 39);
INSERT INTO `tb_role_resource` VALUES (40, 1, 40);
INSERT INTO `tb_role_resource` VALUES (41, 1, 41);
INSERT INTO `tb_role_resource` VALUES (42, 1, 42);
INSERT INTO `tb_role_resource` VALUES (43, 1, 43);
INSERT INTO `tb_role_resource` VALUES (44, 1, 44);
INSERT INTO `tb_role_resource` VALUES (45, 1, 45);
INSERT INTO `tb_role_resource` VALUES (46, 1, 46);
INSERT INTO `tb_role_resource` VALUES (47, 1, 47);
INSERT INTO `tb_role_resource` VALUES (48, 1, 48);
INSERT INTO `tb_role_resource` VALUES (49, 1, 49);
INSERT INTO `tb_role_resource` VALUES (50, 1, 50);
INSERT INTO `tb_role_resource` VALUES (51, 1, 51);
INSERT INTO `tb_role_resource` VALUES (52, 1, 52);
INSERT INTO `tb_role_resource` VALUES (53, 1, 53);
INSERT INTO `tb_role_resource` VALUES (54, 1, 54);
INSERT INTO `tb_role_resource` VALUES (55, 1, 55);
INSERT INTO `tb_role_resource` VALUES (56, 1, 56);
INSERT INTO `tb_role_resource` VALUES (57, 1, 57);
INSERT INTO `tb_role_resource` VALUES (58, 1, 58);
INSERT INTO `tb_role_resource` VALUES (59, 1, 59);
INSERT INTO `tb_role_resource` VALUES (60, 1, 60);
INSERT INTO `tb_role_resource` VALUES (61, 1, 61);
INSERT INTO `tb_role_resource` VALUES (62, 1, 62);
INSERT INTO `tb_role_resource` VALUES (63, 1, 63);
INSERT INTO `tb_role_resource` VALUES (64, 1, 64);
INSERT INTO `tb_role_resource` VALUES (65, 1, 65);
INSERT INTO `tb_role_resource` VALUES (66, 1, 66);
INSERT INTO `tb_role_resource` VALUES (67, 1, 67);
INSERT INTO `tb_role_resource` VALUES (68, 1, 68);
INSERT INTO `tb_role_resource` VALUES (69, 1, 69);
INSERT INTO `tb_role_resource` VALUES (70, 1, 70);
INSERT INTO `tb_role_resource` VALUES (71, 1, 71);
INSERT INTO `tb_role_resource` VALUES (72, 1, 72);
INSERT INTO `tb_role_resource` VALUES (73, 1, 73);
INSERT INTO `tb_role_resource` VALUES (74, 1, 74);
INSERT INTO `tb_role_resource` VALUES (75, 1, 75);
INSERT INTO `tb_role_resource` VALUES (76, 1, 76);
INSERT INTO `tb_role_resource` VALUES (77, 1, 77);
INSERT INTO `tb_role_resource` VALUES (78, 1, 78);
INSERT INTO `tb_role_resource` VALUES (79, 1, 79);
INSERT INTO `tb_role_resource` VALUES (80, 1, 80);
INSERT INTO `tb_role_resource` VALUES (81, 1, 81);
INSERT INTO `tb_role_resource` VALUES (82, 1, 82);
INSERT INTO `tb_role_resource` VALUES (83, 1, 83);
INSERT INTO `tb_role_resource` VALUES (84, 1, 84);
INSERT INTO `tb_role_resource` VALUES (85, 1, 85);
INSERT INTO `tb_role_resource` VALUES (86, 1, 86);
INSERT INTO `tb_role_resource` VALUES (87, 1, 87);
INSERT INTO `tb_role_resource` VALUES (88, 1, 88);
INSERT INTO `tb_role_resource` VALUES (89, 1, 89);
INSERT INTO `tb_role_resource` VALUES (90, 1, 90);
INSERT INTO `tb_role_resource` VALUES (91, 1, 91);
INSERT INTO `tb_role_resource` VALUES (92, 1, 92);
INSERT INTO `tb_role_resource` VALUES (93, 1, 93);
INSERT INTO `tb_role_resource` VALUES (94, 1, 94);
INSERT INTO `tb_role_resource` VALUES (95, 1, 95);
INSERT INTO `tb_role_resource` VALUES (96, 1, 96);
INSERT INTO `tb_role_resource` VALUES (97, 1, 97);
INSERT INTO `tb_role_resource` VALUES (98, 1, 98);
INSERT INTO `tb_role_resource` VALUES (99, 1, 99);
INSERT INTO `tb_role_resource` VALUES (100, 1, 100);
INSERT INTO `tb_role_resource` VALUES (101, 1, 101);
INSERT INTO `tb_role_resource` VALUES (102, 1, 102);
INSERT INTO `tb_role_resource` VALUES (103, 1, 103);
INSERT INTO `tb_role_resource` VALUES (104, 1, 104);
INSERT INTO `tb_role_resource` VALUES (105, 1, 105);
INSERT INTO `tb_role_resource` VALUES (106, 1, 106);
INSERT INTO `tb_role_resource` VALUES (107, 1, 107);
INSERT INTO `tb_role_resource` VALUES (108, 1, 108);
INSERT INTO `tb_role_resource` VALUES (109, 1, 109);
INSERT INTO `tb_role_resource` VALUES (110, 1, 110);
INSERT INTO `tb_role_resource` VALUES (111, 1, 111);
INSERT INTO `tb_role_resource` VALUES (112, 1, 112);
INSERT INTO `tb_role_resource` VALUES (113, 1, 113);
INSERT INTO `tb_role_resource` VALUES (114, 1, 114);
INSERT INTO `tb_role_resource` VALUES (115, 1, 115);
INSERT INTO `tb_role_resource` VALUES (116, 1, 116);
INSERT INTO `tb_role_resource` VALUES (117, 1, 117);
INSERT INTO `tb_role_resource` VALUES (118, 1, 118);
INSERT INTO `tb_role_resource` VALUES (119, 1, 119);
INSERT INTO `tb_role_resource` VALUES (120, 1, 120);
INSERT INTO `tb_role_resource` VALUES (121, 1, 121);
INSERT INTO `tb_role_resource` VALUES (122, 1, 122);
INSERT INTO `tb_role_resource` VALUES (123, 1, 123);
INSERT INTO `tb_role_resource` VALUES (124, 1, 124);
INSERT INTO `tb_role_resource` VALUES (125, 1, 125);
INSERT INTO `tb_role_resource` VALUES (126, 1, 126);
INSERT INTO `tb_role_resource` VALUES (127, 1, 127);
INSERT INTO `tb_role_resource` VALUES (128, 1, 128);
INSERT INTO `tb_role_resource` VALUES (129, 1, 129);
INSERT INTO `tb_role_resource` VALUES (130, 1, 130);
INSERT INTO `tb_role_resource` VALUES (131, 1, 131);
INSERT INTO `tb_role_resource` VALUES (132, 1, 132);
INSERT INTO `tb_role_resource` VALUES (133, 1, 133);
INSERT INTO `tb_role_resource` VALUES (134, 1, 134);
INSERT INTO `tb_role_resource` VALUES (135, 1, 135);
INSERT INTO `tb_role_resource` VALUES (136, 1, 136);
INSERT INTO `tb_role_resource` VALUES (137, 1, 137);
INSERT INTO `tb_role_resource` VALUES (138, 1, 138);
INSERT INTO `tb_role_resource` VALUES (139, 1, 139);
INSERT INTO `tb_role_resource` VALUES (140, 1, 140);
INSERT INTO `tb_role_resource` VALUES (141, 1, 141);
INSERT INTO `tb_role_resource` VALUES (142, 1, 142);
INSERT INTO `tb_role_resource` VALUES (216, 4, 2);
INSERT INTO `tb_role_resource` VALUES (217, 4, 5);
INSERT INTO `tb_role_resource` VALUES (218, 4, 6);
INSERT INTO `tb_role_resource` VALUES (219, 4, 7);
INSERT INTO `tb_role_resource` VALUES (220, 4, 8);
INSERT INTO `tb_role_resource` VALUES (221, 4, 10);
INSERT INTO `tb_role_resource` VALUES (222, 4, 13);
INSERT INTO `tb_role_resource` VALUES (223, 4, 15);
INSERT INTO `tb_role_resource` VALUES (224, 4, 18);
INSERT INTO `tb_role_resource` VALUES (225, 4, 20);
INSERT INTO `tb_role_resource` VALUES (226, 4, 23);
INSERT INTO `tb_role_resource` VALUES (227, 4, 25);
INSERT INTO `tb_role_resource` VALUES (228, 4, 28);
INSERT INTO `tb_role_resource` VALUES (229, 4, 30);
INSERT INTO `tb_role_resource` VALUES (230, 4, 33);
INSERT INTO `tb_role_resource` VALUES (231, 4, 34);
INSERT INTO `tb_role_resource` VALUES (232, 4, 35);
INSERT INTO `tb_role_resource` VALUES (233, 4, 36);
INSERT INTO `tb_role_resource` VALUES (234, 4, 37);
INSERT INTO `tb_role_resource` VALUES (235, 4, 38);
INSERT INTO `tb_role_resource` VALUES (236, 4, 42);
INSERT INTO `tb_role_resource` VALUES (237, 4, 43);
INSERT INTO `tb_role_resource` VALUES (238, 4, 46);
INSERT INTO `tb_role_resource` VALUES (239, 4, 47);
INSERT INTO `tb_role_resource` VALUES (240, 4, 48);
INSERT INTO `tb_role_resource` VALUES (241, 4, 49);
INSERT INTO `tb_role_resource` VALUES (242, 4, 50);
INSERT INTO `tb_role_resource` VALUES (243, 4, 51);
INSERT INTO `tb_role_resource` VALUES (244, 4, 52);
INSERT INTO `tb_role_resource` VALUES (245, 4, 54);
INSERT INTO `tb_role_resource` VALUES (246, 4, 57);
INSERT INTO `tb_role_resource` VALUES (247, 4, 59);
INSERT INTO `tb_role_resource` VALUES (248, 4, 62);
INSERT INTO `tb_role_resource` VALUES (249, 4, 64);
INSERT INTO `tb_role_resource` VALUES (250, 4, 67);
INSERT INTO `tb_role_resource` VALUES (251, 4, 71);
INSERT INTO `tb_role_resource` VALUES (252, 4, 74);
INSERT INTO `tb_role_resource` VALUES (253, 4, 75);
INSERT INTO `tb_role_resource` VALUES (254, 4, 76);
INSERT INTO `tb_role_resource` VALUES (255, 4, 78);
INSERT INTO `tb_role_resource` VALUES (256, 4, 81);
INSERT INTO `tb_role_resource` VALUES (257, 4, 84);
INSERT INTO `tb_role_resource` VALUES (258, 4, 85);
INSERT INTO `tb_role_resource` VALUES (259, 4, 87);
INSERT INTO `tb_role_resource` VALUES (260, 4, 88);
INSERT INTO `tb_role_resource` VALUES (261, 4, 89);
INSERT INTO `tb_role_resource` VALUES (262, 4, 90);
INSERT INTO `tb_role_resource` VALUES (263, 4, 92);
INSERT INTO `tb_role_resource` VALUES (264, 4, 94);
INSERT INTO `tb_role_resource` VALUES (265, 4, 95);
INSERT INTO `tb_role_resource` VALUES (266, 4, 96);
INSERT INTO `tb_role_resource` VALUES (267, 4, 97);
INSERT INTO `tb_role_resource` VALUES (268, 4, 98);
INSERT INTO `tb_role_resource` VALUES (269, 4, 99);
INSERT INTO `tb_role_resource` VALUES (270, 4, 100);
INSERT INTO `tb_role_resource` VALUES (271, 4, 101);
INSERT INTO `tb_role_resource` VALUES (272, 4, 102);
INSERT INTO `tb_role_resource` VALUES (273, 4, 103);
INSERT INTO `tb_role_resource` VALUES (274, 4, 104);
INSERT INTO `tb_role_resource` VALUES (275, 4, 106);
INSERT INTO `tb_role_resource` VALUES (276, 4, 110);
INSERT INTO `tb_role_resource` VALUES (277, 4, 112);
INSERT INTO `tb_role_resource` VALUES (278, 4, 115);
INSERT INTO `tb_role_resource` VALUES (279, 4, 117);
INSERT INTO `tb_role_resource` VALUES (280, 4, 120);
INSERT INTO `tb_role_resource` VALUES (281, 4, 122);
INSERT INTO `tb_role_resource` VALUES (282, 4, 128);
INSERT INTO `tb_role_resource` VALUES (283, 4, 129);
INSERT INTO `tb_role_resource` VALUES (284, 4, 130);
INSERT INTO `tb_role_resource` VALUES (285, 4, 131);
INSERT INTO `tb_role_resource` VALUES (286, 4, 133);
INSERT INTO `tb_role_resource` VALUES (287, 4, 135);
INSERT INTO `tb_role_resource` VALUES (288, 4, 136);
INSERT INTO `tb_role_resource` VALUES (289, 4, 139);
INSERT INTO `tb_role_resource` VALUES (290, 4, 141);

-- ----------------------------
-- Table structure for tb_serve
-- ----------------------------
DROP TABLE IF EXISTS `tb_serve`;
CREATE TABLE `tb_serve`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '服务名字',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_serve
-- ----------------------------
INSERT INTO `tb_serve` VALUES (1, '可改签', '2023-03-30 11:03:47', NULL);
INSERT INTO `tb_serve` VALUES (2, '可退票', '2023-03-30 11:03:56', NULL);
INSERT INTO `tb_serve` VALUES (3, '儿童优惠', '2023-03-30 11:04:27', NULL);
INSERT INTO `tb_serve` VALUES (4, 'WiFi', '2023-03-30 11:04:40', NULL);
INSERT INTO `tb_serve` VALUES (5, '可停车', '2023-03-30 11:04:54', NULL);

-- ----------------------------
-- Table structure for tb_type
-- ----------------------------
DROP TABLE IF EXISTS `tb_type`;
CREATE TABLE `tb_type`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '影厅类型名字',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_type
-- ----------------------------
INSERT INTO `tb_type` VALUES (1, 'IMAX厅', '2023-03-30 10:56:34', NULL);
INSERT INTO `tb_type` VALUES (2, 'CGS中国巨幕厅', '2023-03-30 10:56:49', NULL);
INSERT INTO `tb_type` VALUES (3, '杜比全景声厅', '2023-03-30 10:57:00', NULL);
INSERT INTO `tb_type` VALUES (4, 'RealD厅', '2023-03-30 10:57:15', NULL);
INSERT INTO `tb_type` VALUES (5, 'DTS:X 临境音厅', '2023-03-30 10:57:28', NULL);
INSERT INTO `tb_type` VALUES (6, '儿童厅 ', '2023-03-30 10:57:40', NULL);
INSERT INTO `tb_type` VALUES (7, '4K厅 ', '2023-03-30 10:57:49', NULL);
INSERT INTO `tb_type` VALUES (8, '4D厅', '2023-03-30 10:57:57', NULL);
INSERT INTO `tb_type` VALUES (9, '60帧厅', '2023-03-30 10:58:04', NULL);
INSERT INTO `tb_type` VALUES (10, '巨幕厅', '2023-03-30 10:58:10', NULL);
INSERT INTO `tb_type` VALUES (11, 'MX4D厅', '2023-03-30 10:58:25', NULL);
INSERT INTO `tb_type` VALUES (12, '激光厅', '2023-03-30 10:58:34', NULL);

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像',
  `gender` tinyint(1) NULL DEFAULT NULL COMMENT '性别',
  `able_flag` tinyint(1) NULL DEFAULT NULL COMMENT '是否禁用 0-是 1-否',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `telephone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电话号码',
  `intro` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '签名',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, 'admin', '$2a$10$9ArMSvB6udwc7.gZQyrmBuN8tbo.XEgPnU88Cgg.V8gkjHFmoYT3O', 'admin', 'http://8.142.27.217:39000/cinema/09388d33-06fc-4f70-b356-e3b7872e9c23.jpg', 1, 1, '1363343@qq.com', '12345678910', 'test', '2023-04-20 09:18:39', '2023-04-26 17:38:37');
INSERT INTO `tb_user` VALUES (2, 'test', '$2a$10$Xg0QICf1Ylhi6wRdzu8KfuOIV7G2wQHZ8MUAVzhQKsZJqlAA7wlKu', 'test', 'http://8.142.27.217:39000/cinema/09388d33-06fc-4f70-b356-e3b7872e9c23.jpg', 1, 1, '136334391@qq.com', '12345678910', '这个人很懒，什么都没有留下。', '2023-05-17 21:46:42', '2023-05-31 20:00:23');
INSERT INTO `tb_user` VALUES (3, 'FakeAmadeus', '$2a$10$dgWwlSRFTcEg8OnHMdUaV.CeT81kWn.5fLR0M0.fGpvMbPf.91G6S', 'FakeAmadeus', 'http://8.142.27.217:39000/cinema/09388d33-06fc-4f70-b356-e3b7872e9c23.jpg', 1, 1, '13633439@qq.com', '12345678910', '这个人很懒，什么都没有留下。', '2023-05-24 22:04:12', NULL);
INSERT INTO `tb_user` VALUES (7, 'fronted', '$2a$10$StekQn.ecHKWyI0w7Jk49OXMfYC3VEcamp5vCCKKefOXclseyqVFy', 'fronted', 'http://8.142.27.217:39000/cinema/09388d33-06fc-4f70-b356-e3b7872e9c23.jpg', NULL, 1, '1363343919@qq.com', NULL, '这个人很懒，什么都没有留下。', '2023-06-02 09:11:28', NULL);

-- ----------------------------
-- Table structure for tb_user_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_role`;
CREATE TABLE `tb_user_role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL COMMENT '用户id',
  `role_id` int NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1006 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user_role
-- ----------------------------
INSERT INTO `tb_user_role` VALUES (1004, 1, 1);
INSERT INTO `tb_user_role` VALUES (1005, 2, 4);

SET FOREIGN_KEY_CHECKS = 1;
