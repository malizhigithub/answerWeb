/*
Navicat MySQL Data Transfer

Source Server         : CentOs_mysql
Source Server Version : 50560
Source Host           : xxx.xxx.xxx.xxx:3306
Source Database       : answerWeb

Target Server Type    : MYSQL
Target Server Version : 50560
File Encoding         : 65001

Date: 2018-07-18 20:10:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `adminid` int(11) NOT NULL AUTO_INCREMENT,
  `adminname` varchar(30) NOT NULL,
  `password` varchar(40) NOT NULL,
  `adminflag` int(11) DEFAULT '1',  	-- 管理员权限, 1普通 2超级
  PRIMARY KEY (`adminid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('1', 'root', 'root', '2');

-- ----------------------------
-- Table structure for options
-- ----------------------------
DROP TABLE IF EXISTS `options`;
CREATE TABLE `options` (
  `optionsno` int(11) NOT NULL AUTO_INCREMENT,  -- 自增主键id
  `questionno` int(11) NOT NULL,  -- 题目id
  `content` varchar(200) NOT NULL,  -- 选项内容
  `status` int(11) DEFAULT NULL,   -- 选项对错, 1对 0错
  PRIMARY KEY (`optionsno`),
  KEY `fk_options_questionno` (`questionno`),
  CONSTRAINT `fk_options_questionno` FOREIGN KEY (`questionno`) REFERENCES `question` (`questionno`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of options
-- ----------------------------
INSERT INTO `options` VALUES ('1', '1', '人民通过各种途径直接行使立法、执法和司法的权力', '1');
INSERT INTO `options` VALUES ('2', '1', '法律既是保障人民自身权利的有力武器，也是人民必须遵守的行为规范', '0');
INSERT INTO `options` VALUES ('3', '1', '人民依法享有广泛的权利和自由，同时也承担应尽的义务', '0');
INSERT INTO `options` VALUES ('4', '1', '人民根本权益是法治建设的出发点和落脚点，法律要为人民所掌握、所遵守、所运用', '0');
INSERT INTO `options` VALUES ('5', '2', '乙公司必须确定损失发生的区段，并只能向该区段的承运人索赔', '0');
INSERT INTO `options` VALUES ('6', '2', '铁路运单是物权凭证，乙公司可通过转让运单转让货物', '0');
INSERT INTO `options` VALUES ('7', '2', '甲公司在指定目的地运输终端将仍处于运输工具上的货物交由乙公司处置时，即完成交货', '1');
INSERT INTO `options` VALUES ('8', '2', '各铁路区段的承运人应承担连带责任', '1');
INSERT INTO `options` VALUES ('17', '5', '测试正确1', '1');
INSERT INTO `options` VALUES ('18', '5', '测试错误1', '0');
INSERT INTO `options` VALUES ('19', '5', '测试错误1', '0');
INSERT INTO `options` VALUES ('20', '5', '测试正确2', '1');
INSERT INTO `options` VALUES ('29', '8', '测试正确1', '1');
INSERT INTO `options` VALUES ('30', '8', '测试正确2', '1');
INSERT INTO `options` VALUES ('31', '8', '测试错误1', '0');
INSERT INTO `options` VALUES ('32', '8', '测试错误1', '0');
INSERT INTO `options` VALUES ('33', '9', '测试正确1', '1');
INSERT INTO `options` VALUES ('34', '9', '测试正确2', '1');
INSERT INTO `options` VALUES ('35', '9', '测试错误1', '0');
INSERT INTO `options` VALUES ('36', '9', '测试错误2', '0');
INSERT INTO `options` VALUES ('37', '10', '简单放散', '0');
INSERT INTO `options` VALUES ('38', '10', '胞饮和吞噬', '1');
INSERT INTO `options` VALUES ('39', '10', '滤过', '0');
INSERT INTO `options` VALUES ('40', '10', '载体扩散', '0');
INSERT INTO `options` VALUES ('41', '11', '婚前医学检查、遗传病诊断和产前诊断', '0');
INSERT INTO `options` VALUES ('42', '11', '旅行结扎手术和终止妊娠手术', '0');
INSERT INTO `options` VALUES ('43', '11', '婚前医学检查、母婴保健指导和计划生育手术', '0');
INSERT INTO `options` VALUES ('44', '11', '婚前医学检查、遗传病诊断、产前诊断以及施行结扎手术和终止妊娠手术', '1');
INSERT INTO `options` VALUES ('45', '12', '发病率为20/10万', '0');
INSERT INTO `options` VALUES ('46', '12', '罹患率为20/10万', '0');
INSERT INTO `options` VALUES ('47', '12', '患病率为20/10万', '1');
INSERT INTO `options` VALUES ('48', '12', '生存率为20/10万', '0');
INSERT INTO `options` VALUES ('49', '13', '≤10μg/kg', '0');
INSERT INTO `options` VALUES ('50', '13', '≤20μg/kg', '1');
INSERT INTO `options` VALUES ('51', '13', '≤5μg/kg', '0');
INSERT INTO `options` VALUES ('52', '13', '不得检出', '0');
INSERT INTO `options` VALUES ('53', '14', '炭疽杆菌', '0');
INSERT INTO `options` VALUES ('54', '14', '产气荚膜杆菌', '1');
INSERT INTO `options` VALUES ('55', '14', 'A族链球菌', '0');
INSERT INTO `options` VALUES ('56', '14', '葡萄球菌', '0');
INSERT INTO `options` VALUES ('57', '15', '自然自动免疫', '0');
INSERT INTO `options` VALUES ('58', '15', '自然被动免疫', '0');
INSERT INTO `options` VALUES ('59', '15', '人工自动免疫', '1');
INSERT INTO `options` VALUES ('60', '15', '人工被动免疫', '0');
INSERT INTO `options` VALUES ('61', '16', '在流行病学三角模型中，环境因素不变，病因比重增加', '0');
INSERT INTO `options` VALUES ('62', '16', '宿主因素发生变化，宿主比重增加', '0');
INSERT INTO `options` VALUES ('63', '16', '病因、宿主、环境三要素保持动态平衡', '0');
INSERT INTO `options` VALUES ('64', '16', '环境因素发生变化，导致病因比重增加', '1');
INSERT INTO `options` VALUES ('65', '17', '吸氧+消心痛含', '1');
INSERT INTO `options` VALUES ('66', '17', '普萘洛尔口服', '0');
INSERT INTO `options` VALUES ('67', '17', '吸氧+输液', '0');
INSERT INTO `options` VALUES ('68', '17', '消心痛舌下含服', '0');
INSERT INTO `options` VALUES ('69', '18', '肾血浆流量/肾血流量', '0');
INSERT INTO `options` VALUES ('70', '18', '肾小球滤过率/肾血浆流量', '1');
INSERT INTO `options` VALUES ('71', '18', '肾血流量/肾血浆流量', '0');
INSERT INTO `options` VALUES ('72', '18', '肾小球滤过率/肾血流量', '0');
INSERT INTO `options` VALUES ('73', '19', '灭活疫苗', '1');
INSERT INTO `options` VALUES ('74', '19', '内毒素疫苗', '0');
INSERT INTO `options` VALUES ('75', '19', '类毒素疫苗', '0');
INSERT INTO `options` VALUES ('76', '19', '病毒疫苗', '0');
INSERT INTO `options` VALUES ('77', '20', '延长寿命', '0');
INSERT INTO `options` VALUES ('78', '20', '预防疾病', '0');
INSERT INTO `options` VALUES ('79', '20', '增进健康', '1');
INSERT INTO `options` VALUES ('80', '20', '以上都不是', '0');
INSERT INTO `options` VALUES ('81', '21', '角膜的热损伤', '0');
INSERT INTO `options` VALUES ('82', '21', '急性角膜结膜炎', '1');
INSERT INTO `options` VALUES ('83', '21', '热性白内障', '0');
INSERT INTO `options` VALUES ('84', '21', '视网膜灼伤', '0');
INSERT INTO `options` VALUES ('85', '22', '联系的强度和联系的特异性', '0');
INSERT INTO `options` VALUES ('86', '22', '剂量反应关系与现代科学知识协调', '0');
INSERT INTO `options` VALUES ('87', '22', '时间顺序，即暴露于疾病发生之前', '0');
INSERT INTO `options` VALUES ('88', '22', '对联系进行统计学检验所得P值大小', '1');
INSERT INTO `options` VALUES ('89', '23', '频率', '0');
INSERT INTO `options` VALUES ('90', '23', '频数', '0');
INSERT INTO `options` VALUES ('91', '23', '相对比', '1');
INSERT INTO `options` VALUES ('92', '23', '以上都不是', '0');
INSERT INTO `options` VALUES ('93', '24', '心血管疾病', '0');
INSERT INTO `options` VALUES ('94', '24', '脑血管疾病', '0');
INSERT INTO `options` VALUES ('95', '24', '车祸', '1');
INSERT INTO `options` VALUES ('96', '24', '自杀', '0');
INSERT INTO `options` VALUES ('97', '25', '选择性兴奋子宫平滑肌', '1');
INSERT INTO `options` VALUES ('98', '25', '未孕子宫较妊娠子宫对麦角碱类更敏感', '0');
INSERT INTO `options` VALUES ('99', '25', '兴奋子宫平滑肌作用较弱', '0');
INSERT INTO `options` VALUES ('100', '25', '大剂量不易引起强直性收缩', '0');
INSERT INTO `options` VALUES ('101', '26', '可以不受限制', '0');
INSERT INTO `options` VALUES ('102', '26', '注销注册', '1');
INSERT INTO `options` VALUES ('103', '26', '在监管部门规定范围内执业', '0');
INSERT INTO `options` VALUES ('104', '26', '服刑期间不允许执业，服刑期满可再执业', '0');
INSERT INTO `options` VALUES ('105', '27', '在较浅的小河采集水样时，要注意避免搅动沉积物而使水样受污染', '1');
INSERT INTO `options` VALUES ('106', '27', '采样时，将处理干净的适当容器充满即可', '0');
INSERT INTO `options` VALUES ('107', '27', '采集水样时，采集量一定要准确达到分析测定所需的水样量', '0');
INSERT INTO `options` VALUES ('108', '27', '采集表层水时，漂浮于水面上的物质对测定结果不会有影响', '0');
INSERT INTO `options` VALUES ('109', '28', '10~80', '0');
INSERT INTO `options` VALUES ('110', '28', '10~90', '1');
INSERT INTO `options` VALUES ('111', '28', '20~80', '0');
INSERT INTO `options` VALUES ('112', '28', '20~90', '0');
INSERT INTO `options` VALUES ('113', '29', '肺组织的弹性回缩力', '0');
INSERT INTO `options` VALUES ('114', '29', '气道阻力', '0');
INSERT INTO `options` VALUES ('115', '29', '粘滞力', '0');
INSERT INTO `options` VALUES ('116', '29', '肺泡表面张力', '1');
INSERT INTO `options` VALUES ('117', '30', '普萘洛尔', '0');
INSERT INTO `options` VALUES ('118', '30', '利多卡因', '1');
INSERT INTO `options` VALUES ('119', '30', '奎尼丁', '0');
INSERT INTO `options` VALUES ('120', '30', '胺碘酮', '0');
INSERT INTO `options` VALUES ('121', '31', '区别于外分泌腺的系统', '0');
INSERT INTO `options` VALUES ('122', '31', '分泌物经血液传递信息的系统', '0');
INSERT INTO `options` VALUES ('123', '31', '分泌物经体液传递信念的系统', '0');
INSERT INTO `options` VALUES ('124', '31', '包括内分腺和散在的内分泌细胞的总系统', '1');
INSERT INTO `options` VALUES ('125', '32', '碘缺乏病等地方病的发病原因、治疗和预防方法提供医学意见', '1');
INSERT INTO `options` VALUES ('126', '32', '对产妇提供营养方面的咨询和指导', '0');
INSERT INTO `options` VALUES ('127', '32', '为胎儿生长发育进行监护', '0');
INSERT INTO `options` VALUES ('128', '32', '为新生儿护理提供医疗保健服务', '0');
INSERT INTO `options` VALUES ('129', '33', '婴儿死亡率', '0');
INSERT INTO `options` VALUES ('130', '33', '新生儿死亡率', '0');
INSERT INTO `options` VALUES ('131', '33', '死因构成', '0');
INSERT INTO `options` VALUES ('132', '33', '粗出生率', '1');
INSERT INTO `options` VALUES ('133', '34', '又称工作有关疾病', '0');
INSERT INTO `options` VALUES ('134', '34', '是由职业有害因素所致的职业性疾患', '0');
INSERT INTO `options` VALUES ('135', '34', '与职业性有害因素有直接因果关系', '1');
INSERT INTO `options` VALUES ('136', '34', '职业性有害因素是造成该病的许多因素之一', '0');
INSERT INTO `options` VALUES ('137', '35', '人民依法享有广泛的权利和自由，同时也承担应尽的义务', '0');
INSERT INTO `options` VALUES ('138', '35', '法律既是保障人民自身权利的有力武器，也是人民必须遵守的行为规范', '0');
INSERT INTO `options` VALUES ('139', '35', '人民通过各种途径直接行使立法、执法和司法的权力', '1');
INSERT INTO `options` VALUES ('140', '35', '人民根本权益是法治建设的出发点和落脚点，法律要为人民所掌握、所遵守、所运用', '0');
INSERT INTO `options` VALUES ('141', '36', '在法治国家，道德通过内在信念影响外部行为，法律的有效实施总是依赖于道德', '0');
INSERT INTO `options` VALUES ('142', '36', '以德治国应大力弘扬“和为贵、忍为高”的传统美德，不应借诉讼对利益斤斤计较', '0');
INSERT INTO `options` VALUES ('143', '36', '道德能够令人知廉耻、懂礼让、有底线，良好的道德氛围是依法治国的重要基础', '1');
INSERT INTO `options` VALUES ('144', '36', '通过立法将“礼让为先”、“勤俭节约”、“见义勇为”等道德义务全部转化为法律义务，有助于发挥道德在依法治国中的作用', '0');
INSERT INTO `options` VALUES ('145', '37', '改进法律起草机制，重要的法律草案由有关部门组织全国人大专门委员会、全国人大常委会法工委起草', '1');
INSERT INTO `options` VALUES ('146', '37', '完善立法协调沟通机制，对于部门间争议较大的重要立法事项，引入第三方评估', '0');
INSERT INTO `options` VALUES ('147', '37', '完善法规、规章制定程序和公众参与政府立法机制', '0');
INSERT INTO `options` VALUES ('148', '37', '加强法律解释工作，及时明确法律规定含义和适用法律依据', '0');
INSERT INTO `options` VALUES ('149', '38', '甲省推行“重大决策风险评估”制度，将风险评估作为省政府决策的法定程序', '0');
INSERT INTO `options` VALUES ('150', '38', '乙市聘请当地知名律师担任政府法律顾问，对重大决策进行事前合法性审查', '0');
INSERT INTO `options` VALUES ('151', '38', '丙区因发改局长立下“军令状”保证某重大项目不出问题，遂直接批准项目上马', '1');
INSERT INTO `options` VALUES ('152', '38', '丁县教育局网上征求对学区调整、学校撤并等与群众切身利益相关事项的意见', '0');
INSERT INTO `options` VALUES ('153', '39', '应避免陪审员选任的过度“精英化”', '0');
INSERT INTO `options` VALUES ('154', '39', '若少数陪审员成为常驻法院的“专审员”，将影响人民陪审员制度的公信力', '0');
INSERT INTO `options` VALUES ('155', '39', '完善人民陪审员制度的主要目的是让人民群众通过参与司法养成守法习惯', '1');
INSERT INTO `options` VALUES ('156', '39', '陪审员的大众思维和朴素观念能够弥补法官职业思维的局限性', '0');
INSERT INTO `options` VALUES ('157', '40', '相比古代而言，法律在现代社会中对保障人们的权利具有更重要的作用', '0');
INSERT INTO `options` VALUES ('158', '40', '从理论上讲，当诉讼成本高于诉讼可能带来的收益时，更易形成“厌讼”的传统', '0');
INSERT INTO `options` VALUES ('159', '40', '案件激增从一个侧面说明人民群众已逐渐树立起遇事找法、解决问题靠法的观念', '0');
INSERT INTO `options` VALUES ('160', '40', '在法治社会，诉讼是解决纠纷的唯一合法途径', '1');
INSERT INTO `options` VALUES ('161', '41', '甲市将信访纳入法治轨道，承诺对合理合法的诉求依法及时处理', '0');
INSERT INTO `options` VALUES ('162', '41', '乙区通过举办“群众吐槽会”建立群众利益沟通机制', '0');
INSERT INTO `options` VALUES ('163', '41', '丙县通过地方戏等形式普及“即使有理也要守法”观念', '0');
INSERT INTO `options` VALUES ('164', '41', '丁市律协要求律师不得代理群体性纠纷案件', '1');
INSERT INTO `options` VALUES ('165', '42', '表达的是禁止性规则', '0');
INSERT INTO `options` VALUES ('166', '42', '表达的是强行性规则', '1');
INSERT INTO `options` VALUES ('167', '42', '表达的是程序性原则', '0');
INSERT INTO `options` VALUES ('168', '42', '表达了法律规则中的法律后果', '0');
INSERT INTO `options` VALUES ('169', '43', '诚实信用原则一般不通过“法律语句”的语句形式表达出来', '1');
INSERT INTO `options` VALUES ('170', '43', '与法律规则相比，法律原则能最大限度实现法的确定性和可预测性', '1');
INSERT INTO `options` VALUES ('171', '43', '法律原则的着眼点不仅限于行为及条件的共性，而且关注它们的个别性和特殊性', '1');
INSERT INTO `options` VALUES ('172', '43', '法律原则是以“全有或全无”的方式适用于个案当中', '1');
INSERT INTO `options` VALUES ('173', '44', '判决是规范性法律文件', '0');
INSERT INTO `options` VALUES ('174', '44', '甲和乙对小琳的抚养义务是相对义务', '1');
INSERT INTO `options` VALUES ('175', '44', '判决在原被告间不形成法律权利和义务关系', '0');
INSERT INTO `options` VALUES ('176', '44', '小琳是民事诉讼法律关系的主体之一', '0');
INSERT INTO `options` VALUES ('177', '45', '法律的内容规定总是超前的，法官的判决根据总是滞后的', '1');
INSERT INTO `options` VALUES ('178', '45', '法官只考虑已经发生的事实，故判案时一律选择适用旧法', '0');
INSERT INTO `options` VALUES ('179', '45', '法律绝对禁止溯及既往', '0');
INSERT INTO `options` VALUES ('180', '45', '即使案件事实发生在过去，但“为未来作规定”的法律仍然可以作为其认定的根据', '1');
INSERT INTO `options` VALUES ('181', '46', '话本小说《错斩崔宁》可视为一种法的非正式渊源', '0');
INSERT INTO `options` VALUES ('182', '46', '邻居运用设证推理方法断定崔宁为凶手', '1');
INSERT INTO `options` VALUES ('183', '46', '“盗贼自刘贵家盗走15贯钱并杀死刘贵”所表述的是法律规则中的假定条件', '0');
INSERT INTO `options` VALUES ('184', '46', '从生活事实向法律事实转化需要一个证成过程，从法治的角度看，官府的行为符合证成标准', '0');
INSERT INTO `options` VALUES ('185', '47', '在我国，政策与法律具有共同的指导思想和社会目标', '1');
INSERT INTO `options` VALUES ('186', '47', '立法在实践中总是滞后的，只能“亡羊补牢”而无法适度超越和引领社会发展', '0');
INSERT INTO `options` VALUES ('187', '47', '越强调法治，越要提高立法质量，通过立法解决改革发展中的问题', '1');
INSERT INTO `options` VALUES ('188', '47', '修改《人口与计划生育法》有助于缓解人口老龄化对我国社会发展的压力', '1');
INSERT INTO `options` VALUES ('189', '48', '某省政府统筹全省基本公共服务均等化职能，破除地方保护主义', '1');
INSERT INTO `options` VALUES ('190', '48', '某市要求行政审批部门与中介服务机构脱钩，放宽中介服务机构准入条件', '1');
INSERT INTO `options` VALUES ('191', '48', '某区依法纠正行政不作为、乱作为，坚决惩处失职、渎职人员', '1');
INSERT INTO `options` VALUES ('192', '48', '某县注重提高行政效能，缩短行政审批流程，减少行政审批环节', '1');
INSERT INTO `options` VALUES ('193', '49', '最高法院、公安部规定在押刑事被告人、上诉人应穿着正装或便装出庭受审', '1');
INSERT INTO `options` VALUES ('194', '49', '某省扩大法律援助的覆盖面，将与民生密切相关的事项纳入援助范围', '1');
INSERT INTO `options` VALUES ('195', '49', '某中级法院加大对生效判决的执行力度，确保当事人的胜诉权益及时兑现', '1');
INSERT INTO `options` VALUES ('196', '49', '某基层法院设立“少年法庭”，对开庭审理时不满16周岁的未成年人刑事案件一律不公开审理', '1');
INSERT INTO `options` VALUES ('197', '50', '是完善村民自治、建设基层法治社会的有力抓手', '1');
INSERT INTO `options` VALUES ('198', '50', '是乡村普法宣传教育的重要媒介，有助于在村民中培育规则意识', '1');
INSERT INTO `options` VALUES ('199', '50', '具有“移风易俗”功能，既传承老传统，也创造新风尚', '1');
INSERT INTO `options` VALUES ('200', '50', '可直接作为法院裁判上门女婿的村民待遇纠纷案件的法律依据', '0');
INSERT INTO `options` VALUES ('201', '51', '人民调解员不属于法治工作队伍，但仍然在法治建设中起着重要作用', '0');
INSERT INTO `options` VALUES ('202', '51', '法院应当重视已确认效力的调解协议的执行，防止调解过的纠纷再次涌入法院', '1');
INSERT INTO `options` VALUES ('203', '51', '人民调解制度能够缓解群众日益增长的司法需求与国家司法资源不足之间的矛盾', '1');
INSERT INTO `options` VALUES ('204', '51', '人民调解组织化解纠纷的主要优势是不拘泥于法律规定，不依赖专业法律知识', '0');
INSERT INTO `options` VALUES ('205', '52', '反映了法的自由价值和秩序价值之间的冲突', '1');
INSERT INTO `options` VALUES ('206', '52', '若法无明文规定，则法官自由裁量不受任何限制', '0');
INSERT INTO `options` VALUES ('207', '52', '我国缔结或参加的国际条约是正式的法的渊源', '1');
INSERT INTO `options` VALUES ('208', '52', '不违反法律的行业惯例可作为裁判依据', '1');
INSERT INTO `options` VALUES ('209', '53', '《危险化学品安全管理条例》与《安全生产法》的效力位阶相同', '0');
INSERT INTO `options` VALUES ('210', '53', '《安全生产法》中有关行政处罚的法律规范属于公法', '1');
INSERT INTO `options` VALUES ('211', '53', '应适用《安全生产法》判断行政处罚的合法性', '1');
INSERT INTO `options` VALUES ('212', '53', '法院可在判决中撤销《危险化学品安全管理条例》中与上位法相抵触的条款', '0');
INSERT INTO `options` VALUES ('213', '54', '同一机关制定的特别规定相对于同时施行或在前施行的一般规定优先适用', '1');
INSERT INTO `options` VALUES ('214', '54', '同一法律内部的规则规定相对于原则规定优先适用', '1');
INSERT INTO `options` VALUES ('215', '54', '同一法律内部的分则规定相对于总则规定优先适用', '1');
INSERT INTO `options` VALUES ('216', '54', '同一法律内部的具体规定相对于一般规定优先适用', '1');
INSERT INTO `options` VALUES ('217', '55', '若李某罪名成立，则出现民事责任和刑事责任的竞合', '0');
INSERT INTO `options` VALUES ('218', '55', '李某与王某间的借款合同法律关系属于调整性法律关系', '1');
INSERT INTO `options` VALUES ('219', '55', '王某的起诉是引起民事诉讼法律关系产生的唯一法律事实', '0');
INSERT INTO `options` VALUES ('220', '55', '王某可以免除李某的部分民事责任', '1');
INSERT INTO `options` VALUES ('221', '56', '王某申请信息公开属于守法行为', '1');
INSERT INTO `options` VALUES ('222', '56', '判决环保局败诉体现了法的强制作用', '1');
INSERT INTO `options` VALUES ('223', '56', '王某起诉环保局的行为属于社会监督', '1');
INSERT INTO `options` VALUES ('224', '56', '王某的诉权属于绝对权利', '0');
INSERT INTO `options` VALUES ('225', '57', '该制度的建立有助于树立宪法的权威', '1');
INSERT INTO `options` VALUES ('226', '57', '宣誓场所应当悬挂中华人民共和国国旗或者国徽', '1');
INSERT INTO `options` VALUES ('227', '57', '宣誓主体限于各级政府、法院和检察院任命的国家工作人员', '0');
INSERT INTO `options` VALUES ('228', '57', '最高法院副院长、审判委员会委员进行宣誓的仪式由最高法院组织', '1');
INSERT INTO `options` VALUES ('229', '58', '我国的基本社会制度是国家的根本制度', '0');
INSERT INTO `options` VALUES ('230', '58', '社会保障制度是我国基本社会制度的核心内容', '1');
INSERT INTO `options` VALUES ('231', '58', '职工的工作时间和休假制度是我国基本社会制度的重要内容', '1');
INSERT INTO `options` VALUES ('232', '58', '加强社会法的实施是发展与完善我国基本社会制度的重要途径', '1');
INSERT INTO `options` VALUES ('253', '64', '123', '1');
INSERT INTO `options` VALUES ('254', '64', '12', '1');
INSERT INTO `options` VALUES ('255', '64', '123', '0');
INSERT INTO `options` VALUES ('256', '64', '123', '1');
INSERT INTO `options` VALUES ('257', '65', '123', '1');
INSERT INTO `options` VALUES ('258', '65', '123', '1');
INSERT INTO `options` VALUES ('259', '65', '123', '1');
INSERT INTO `options` VALUES ('260', '65', '123', '1');

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `questionno` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(200) NOT NULL,            -- 题目内容,可能是文本或链接
  `description` varchar(200) DEFAULT NULL,    -- 题目涉及知识描述,用于答题后, 文本或链接
  `constatus` int(11) NOT NULL,               -- 内容类型, 1文本, 2图片, 3视频, 4音乐
  `desstatus` int(11) DEFAULT NULL,           -- 描述类型, 1文本, 2图片
  `typeno` int(11) NOT NULL,                  -- 题目类型id
  PRIMARY KEY (`questionno`),
  KEY `fk_question_typeno` (`typeno`),
  CONSTRAINT `fk_question_typeno` FOREIGN KEY (`typeno`) REFERENCES `questiontype` (`typeno`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('1', '全面依法治国，必须坚持人民的主体地位。对此，下列哪一理解是错误的？', '人民通过各种途径直接行使立法、执法和司法的权力', '1', '1', '15');
INSERT INTO `question` VALUES ('2', '中国甲公司向波兰乙公司出口一批电器，采用DAP术语，通过几个区段的国际铁路运输，承运人签发了铁路运单，货到目的地后发现有部分损坏。依相关国际惯例及《国际铁路货物联运协定》，下列哪些选项是正确的？', '没有详解，用于测试', '1', '1', '15');
INSERT INTO `question` VALUES ('5', '472-1531899387197视频试题1.mp4', '123', '3', '1', '16');
INSERT INTO `question` VALUES ('8', '949-1531897321343编程语言.png', '532-1531897324389牛顿第一定律.png', '2', '2', '16');
INSERT INTO `question` VALUES ('9', '855-1531897354087语音试题.mp3', '测试用例', '4', '1', '16');
INSERT INTO `question` VALUES ('10', '凡是液滴或大颗粒的物质透过生物膜的方式（    ）。', '胞饮和吞噬', '1', '1', '10');
INSERT INTO `question` VALUES ('11', '医疗保健机构必须经县级以上地方人民政府卫生行政许可，才能开始以下母婴保健技术服务（    ）。', '婚前医学检查、遗传病诊断、产前诊断以及施行结扎手术和终止妊娠手术', '1', '1', '10');
INSERT INTO `question` VALUES ('12', '某县卫生局组织人员对全县麻风进行普查，在一个月内查毕全县40万人口，共查出麻风患者80人，因此，得出该病在该时期麻风的（    ）。', '患病率为20/10万', '1', '1', '10');
INSERT INTO `question` VALUES ('13', '我国食品中的黄曲霉毒素B1允许量规定玉米、花生仁、花生油（    ）。', '≤20μg/kg', '1', '1', '10');
INSERT INTO `question` VALUES ('14', '引起气性坏疽的主要病原体是（    ）。', '产气荚膜杆菌', '1', '1', '10');
INSERT INTO `question` VALUES ('15', '接种卡介苗属于（    ）。', '人工自动免疫', '1', '1', '10');
INSERT INTO `question` VALUES ('16', '夏季气温高、雨量多，蚊媒密度升高，因而引起蚊媒传染病的流行属于（    ）。', '环境因素发生变化，导致病因比重增加', '1', '1', '10');
INSERT INTO `question` VALUES ('17', '冠心病患者，出现胸骨后疼痛、心悸、出汗，血压90/65mmHg。应即刻给予（    ）。', '吸氧+消心痛含', '1', '1', '10');
INSERT INTO `question` VALUES ('18', '滤过分数是指（    ）。', '肾小球滤过率/肾血浆流量', '1', '1', '10');
INSERT INTO `question` VALUES ('19', '狂犬病的潜伏期较长，如及早接种疫苗，可以预防发病。目前使用的狂犬疫苗属于（    ）。', '灭活疫苗', '1', '1', '10');
INSERT INTO `question` VALUES ('20', '现代医学的目的突出强调了（    ）。', '增进健康', '1', '1', '10');
INSERT INTO `question` VALUES ('21', '红外线对眼睛的损伤不包括（    ）。', '急性角膜结膜炎', '1', '1', '10');
INSERT INTO `question` VALUES ('22', '确定暴露于某因素与某病发生因果关系时，下列哪一条不加考虑（    ）。', '对联系进行统计学检验所得P值大小', '1', '1', '10');
INSERT INTO `question` VALUES ('23', '某年某地出生男婴数除以出生女婴数是（    ）。', '相对比', '1', '1', '10');
INSERT INTO `question` VALUES ('24', '从寿命损失率指标分析，对人类寿命影响较大的疾病因素是（    ）。', '车祸', '1', '1', '10');
INSERT INTO `question` VALUES ('25', '麦角碱类对子宫作用是（    ）。', '选择性兴奋子宫平滑肌', '1', '1', '10');
INSERT INTO `question` VALUES ('26', '医生白某因挪用公款用于个人经营，被判别有期徒刑一年。白某被判刑后其执业（    ）。', '注销注册', '1', '1', '10');
INSERT INTO `question` VALUES ('27', '怎样才能采到真正反映水体情况的有代表性的水样（    ）。', '在较浅的小河采集水样时，要注意避免搅动沉积物而使水样受污染', '1', '1', '10');
INSERT INTO `question` VALUES ('28', '适于胎龄儿指出生体重在同胎龄体重第多少百分位数之间（    ）。', '10~90', '1', '1', '10');
INSERT INTO `question` VALUES ('29', '肺泡表面活性物质增加时，主要使哪项减小（    ）。', '肺泡表面张力', '1', '1', '10');
INSERT INTO `question` VALUES ('30', '治疗室性快速性心律失常首选的抗心律失常药物是（    ）。', '利多卡因', '1', '1', '10');
INSERT INTO `question` VALUES ('31', '内分泌系统最佳描述是（    ）。', '包括内分腺和散在的内分泌细胞的总系统', '1', '1', '10');
INSERT INTO `question` VALUES ('32', '属于医疗保健机构提供母婴保健指导服务的是（    ）。', '碘缺乏病等地方病的发病原因、治疗和预防方法提供医学意见', '1', '1', '10');
INSERT INTO `question` VALUES ('33', '反映某时某地某人群的生育水平是（    ）。', '粗出生率', '1', '1', '10');
INSERT INTO `question` VALUES ('34', '下列有关职业性多发病论述错误的是（    ）。', '与职业性有害因素有直接因果关系', '1', '1', '10');
INSERT INTO `question` VALUES ('35', '全面依法治国，必须坚持人民的主体地位。对此，下列哪一理解是错误的？', '人民通过各种途径直接行使立法、执法和司法的权力', '1', '1', '6');
INSERT INTO `question` VALUES ('36', '相传，清朝大学士张英的族人与邻人争宅基，两家因之成讼。族人驰书求助，张英却回诗一首：“一纸书来只为墙，让他三尺又何妨？万里长城今犹在，不见当年秦始皇。”族人大惭，遂后移宅基三尺。邻人见状亦将宅基后移三尺，两家重归于好。根据上述故事，关于依法治国和以德治国的关系，下列哪一理解是正确的？', '道德能够令人知廉耻、懂礼让、有底线，良好的道德氛围是依法治国的重要基础', '1', '1', '6');
INSERT INTO `question` VALUES ('37', '全面依法治国要求加强和改进立法工作，完善立法体制。下列哪一做法不符合上述要求？', '改进法律起草机制，重要的法律草案由有关部门组织全国人大专门委员会、全国人大常委会法工委起草', '1', '1', '6');
INSERT INTO `question` VALUES ('38', '深入推进依法行政，要求健全依法决策机制。下列哪一做法不符合上述要求？', '丙区因发改局长立下“军令状”保证某重大项目不出问题，遂直接批准项目上马', '1', '1', '6');
INSERT INTO `question` VALUES ('39', '.某法院完善人民陪审员选任方式，在增加陪审员数量的基础上建立“陪审员库”，随机抽选陪审员参与案件审理。关于人民陪审员制度，下列哪一说法是错误的？', '完善人民陪审员制度的主要目的是让人民群众通过参与司法养成守法习惯', '1', '1', '6');
INSERT INTO `question` VALUES ('40', '中国古代有“厌讼”传统，老百姓万不得已才打官司。但随着经济社会发展，我国司法领域却出现了诉讼案件激增的现象。对此，下列哪一说法是错误的？', '在法治社会，诉讼是解决纠纷的唯一合法途径', '1', '1', '6');
INSERT INTO `question` VALUES ('41', '法治社会建设要求健全依法维权和化解纠纷机制，杜绝“大闹大解决、小闹小解决、不闹不解决”现象。下列哪一做法无助于消除此现象？', '丁市律协要求律师不得代理群体性纠纷案件', '1', '1', '6');
INSERT INTO `question` VALUES ('42', '《治安管理处罚法》第115条规定：“公安机关依法实施罚款处罚，应当依照有关法律、行政法规的规定，实行罚款决定与罚款收缴分离；收缴的罚款应当全部上缴国库。”关于该条文，下列哪一说法是正确的？', '表达的是强行性规则', '1', '1', '6');
INSERT INTO `question` VALUES ('43', '全兆公司利用提供互联网接入服务的便利，在搜索引擎讯集公司网站的搜索结果页面上强行增加广告，被讯集公司诉至法院。法院认为，全兆公司行为违反诚实信用原则和公认的商业道德，构成不正当竞争。关于该案，下列哪一说法是正确的？', '法律原则的着眼点不仅限于行为及条件的共性，而且关注它们的个别性和特殊性', '1', '1', '6');
INSERT INTO `question` VALUES ('44', '甲和乙系夫妻，因外出打工将女儿小琳交由甲母照顾两年，但从未支付过抚养费。后甲与乙闹离婚且均不愿抚养小琳。甲母将甲和乙告上法庭，要求支付抚养费2万元。法院认为，甲母对孙女无法定或约定的抚养义务，判决甲和乙支付甲母抚养费。关于该案，下列哪一选项是正确的？', '甲和乙对小琳的抚养义务是相对义务', '1', '1', '6');
INSERT INTO `question` VALUES ('45', '有法谚云：“法律为未来作规定，法官为过去作判决”。关于该法谚，下列哪一说法是正确的？', '即使案件事实发生在过去，但“为未来作规定”的法律仍然可以作为其认定的根据', '1', '1', '6');
INSERT INTO `question` VALUES ('46', '在宋代话本小说《错斩崔宁》中，刘贵之妾陈二姐因轻信刘贵欲将她休弃的戏言连夜回娘家，路遇年轻后生崔宁并与之结伴同行。当夜盗贼自刘贵家盗走15贯钱并杀死刘贵，邻居追赶盗贼遇到陈、崔二人，因见崔宁刚好携带15贯钱，遂将二人作为凶手捉拿送官。官府当庭拷讯二人，陈、崔屈打成招，后被处斩。关于该案，下列哪一说法是正确的？', '邻居运用设证推理方法断定崔宁为凶手', '1', '1', '6');
INSERT INTO `question` VALUES ('47', '我国于2015年公布了全面实施一对夫妇可生育两个孩子的政策，《人口与计划生育法》随即作出修改。对此，下列哪些说法是正确的？', '在我国，政策与法律具有共同的指导思想和社会目标\r\n越强调法治，越要提高立法质量，通过立法解决改革发展中的问题\r\n修改《人口与计划生育法》有助于缓解人口老龄化对我国社会发展的压力', '1', '1', '6');
INSERT INTO `question` VALUES ('48', '法治政府建设要求行政部门不得任意扩权、与民争利，避免造成“有利争着管、无利都不管”的现象。下列哪些做法有助于避免此现象的发生？', '某省政府统筹全省基本公共服务均等化职能，破除地方保护主义\r\n某市要求行政审批部门与中介服务机构脱钩，放宽中介服务机构准入条件\r\n某区依法纠正行政不作为、乱作为，坚决惩处失职、渎职人员\r\n某县注重提高行政效能，缩短行政审批流程，减少行政审批环节', '1', '1', '6');
INSERT INTO `question` VALUES ('49', '全面依法治国要求加强人权的司法保障，下列哪些做法体现了这一要求？', '最高法院、公安部规定在押刑事被告人、上诉人应穿着正装或便装出庭受审\r\n某省扩大法律援助的覆盖面，将与民生密切相关的事项纳入援助范围\r\n某中级法院加大对生效判决的执行力度，确保当事人的胜诉权益及时兑现', '1', '1', '6');
INSERT INTO `question` VALUES ('50', '某村通过修订村规民约改变“男尊女卑”、“男娶女嫁”的老习惯、老传统，创造出“女娶男”的婚礼形式，以解决上门女婿的村民待遇问题。关于村规民约，下列哪些说法是正确的？', '是完善村民自治、建设基层法治社会的有力抓手\r\n是乡村普法宣传教育的重要媒介，有助于在村民中培育规则意识\r\n具有“移风易俗”功能，既传承老传统，也创造新风尚', '1', '1', '6');
INSERT INTO `question` VALUES ('51', '人民调解制度是我国的创举，被西方国家誉为法治的“东方经验”。关于人民调解，下列哪些说法是正确的？', '法院应当重视已确认效力的调解协议的执行，防止调解过的纠纷再次涌入法院\r\n人民调解制度能够缓解群众日益增长的司法需求与国家司法资源不足之间的矛盾', '1', '1', '6');
INSERT INTO `question` VALUES ('52', '林某与所就职的鹏翔航空公司发生劳动争议，解决争议中曾言语威胁将来乘坐鹏翔公司航班时采取报复措施。林某离职后在选乘鹏翔公司航班时被拒载，遂诉至法院。法院认为，航空公司依《合同法》负有强制缔约义务，依《民用航空法》有保障飞行安全义务。尽管相关国际条约和我国法律对此类拒载无明确规定，但依航空业惯例航空公司有权基于飞行安全事由拒载乘客。关于该案，下列哪些说法是正确的？', '反映了法的自由价值和秩序价值之间的冲突\r\n我国缔结或参加的国际条约是正式的法的渊源\r\n不违反法律的行业惯例可作为裁判依据', '1', '1', '6');
INSERT INTO `question` VALUES ('53', '耀亚公司未经依法批准经营危险化学品，2003年7月14日被区工商分局依据《危险化学品安全管理条例》罚款40万元。耀亚公司以处罚违法为由诉至法院。法院查明，《安全生产法》规定对该种行为的罚款不得超过10万元。关于该案，下列哪些说法是正确的？', '《安全生产法》中有关行政处罚的法律规范属于公法\r\n应适用《安全生产法》判断行政处罚的合法性', '1', '1', '6');
INSERT INTO `question` VALUES ('54', '特别法优先原则是解决同位阶的法的渊源冲突时所依凭的一项原则。关于该原则，下列哪些选项是正确的？', '同一机关制定的特别规定相对于同时施行或在前施行的一般规定优先适用\r\n同一法律内部的规则规定相对于原则规定优先适用\r\n同一法律内部的分则规定相对于总则规定优先适用\r\n同一法律内部的具体规定相对于一般规定优先适用', '1', '1', '6');
INSERT INTO `question` VALUES ('55', '李某向王某借款200万元，由赵某担保。后李某因涉嫌非法吸收公众存款罪被立案。王某将李某和赵某诉至法院，要求偿还借款。赵某认为，若李某罪名成立，则借款合同因违反法律的强制性规定而无效，赵某无需承担担保责任。法院认为，借款合同并不因李某犯罪而无效，判决李某和赵某承担还款和担保责任。关于该案，下列哪些说法是正确的？', '李某与王某间的借款合同法律关系属于调整性法律关系\r\n王某可以免除李某的部分民事责任', '1', '1', '6');
INSERT INTO `question` VALUES ('56', '王某向市环保局提出信息公开申请，但未在法定期限内获得答复，遂诉至法院，法院判决环保局败诉。关于该案，下列哪些说法是正确的？', '王某申请信息公开属于守法行为\r\n判决环保局败诉体现了法的强制作用\r\n王某起诉环保局的行为属于社会监督', '1', '1', '6');
INSERT INTO `question` VALUES ('57', '《全国人民代表大会常务委员会关于实行宪法宣誓制度的决定》于2016年1月1日起实施。关于宪法宣誓制度的表述，下列哪些选项是正确的？', '该制度的建立有助于树立宪法的权威\r\n宣誓场所应当悬挂中华人民共和国国旗或者国徽\r\n最高法院副院长、审判委员会委员进行宣誓的仪式由最高法院组织', '1', '1', '6');
INSERT INTO `question` VALUES ('58', '我国的基本社会制度是基于经济、政治、文化、社会、生态文明五位一体的社会主义建设的需要，在社会领域所建构的制度体系。关于国家的基本社会制度，下列哪些选项是正确的？', '社会保障制度是我国基本社会制度的核心内容\r\n职工的工作时间和休假制度是我国基本社会制度的重要内容\r\n加强社会法的实施是发展与完善我国基本社会制度的重要途径', '1', '1', '6');
INSERT INTO `question` VALUES ('64', '118-1523778043554编程语言.png', '833-1523777899086编程语言.png', '2', '2', '19');
INSERT INTO `question` VALUES ('65', '280-1531897393239视频试题1.mp4', '492-1531897407555图片试题.png', '3', '2', '6');

-- ----------------------------
-- Table structure for questiontype
-- ----------------------------
DROP TABLE IF EXISTS `questiontype`;
CREATE TABLE `questiontype` (
  `typeno` int(11) NOT NULL AUTO_INCREMENT,  -- 自增主键id
  `typename` varchar(30) NOT NULL,       -- 题目类型名称
  `belongtypeno` int(11) DEFAULT NULL,   -- 属于哪个题目类型id
  `imageurl` varchar(200) DEFAULT 'book.jpg',
  PRIMARY KEY (`typeno`),
  KEY `fk_questiontype_belongtypeno` (`belongtypeno`),
  CONSTRAINT `fk_questiontype_belongtypeno` FOREIGN KEY (`belongtypeno`) REFERENCES `questiontype` (`typeno`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of questiontype
-- ----------------------------
INSERT INTO `questiontype` VALUES ('4', '法学', null, '64200-1531897166806-法学.png');
INSERT INTO `questiontype` VALUES ('5', '2016司考真题', '4', '70653-1531897216648-法学.png');
INSERT INTO `questiontype` VALUES ('6', '真题1', '5', '84721-1523713433798-法律.png');
INSERT INTO `questiontype` VALUES ('8', '医学', null, '53636-1531897185596-医学.png');
INSERT INTO `questiontype` VALUES ('9', '执业医师资格考试', '8', '97510-1531897239960-医学.png');
INSERT INTO `questiontype` VALUES ('10', '题目1', '9', '19172-1523713545282-医生.png');
INSERT INTO `questiontype` VALUES ('11', '用于测试', null, '42165-1531897203474-upload.jpg');
INSERT INTO `questiontype` VALUES ('14', '用于测试', '11', '94017-1523714422632-测试.png');
INSERT INTO `questiontype` VALUES ('15', '测试用例1', '14', '63578-1523778502284-编程语言.png');
INSERT INTO `questiontype` VALUES ('16', '测试用例5', '14', '30195-1523772743525-编程语言.png');
INSERT INTO `questiontype` VALUES ('19', '123', '14', '10888-1523777451470-小学.png');

-- ----------------------------
-- Table structure for records
-- ----------------------------
DROP TABLE IF EXISTS `records`;
CREATE TABLE `records` (
  `recordsno` int(11) NOT NULL AUTO_INCREMENT,
  `userno` int(11) DEFAULT NULL,                  -- 用户id
  `typeno` int(11) NOT NULL,                      -- 类型id
  `acnumber` int(11) DEFAULT '0',                 -- 答对题数
  `erunmber` int(11) DEFAULT '0',                 -- 答错题数
  `wechatuserno` int(11) DEFAULT NULL,            -- 微信用户id
  PRIMARY KEY (`recordsno`),
  KEY `fk_records_userno` (`userno`),
  KEY `fk_records_typeno` (`typeno`),
  KEY `fk_records_wechatuserno` (`wechatuserno`),
  CONSTRAINT `fk_records_userno` FOREIGN KEY (`userno`) REFERENCES `user` (`userno`) ON DELETE CASCADE,
  CONSTRAINT `fk_records_typeno` FOREIGN KEY (`typeno`) REFERENCES `questiontype` (`typeno`) ON DELETE CASCADE,
  CONSTRAINT `fk_records_wechatuserno` FOREIGN KEY (`wechatuserno`) REFERENCES `wechatuser` (`wechatuserno`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of records
-- ----------------------------
INSERT INTO `records` VALUES ('6', '4', '16', '0', '14', null);
INSERT INTO `records` VALUES ('7', '4', '6', '0', '22', null);
INSERT INTO `records` VALUES ('8', '4', '15', '0', '4', null);
INSERT INTO `records` VALUES ('9', '4', '10', '0', '3', null);

-- ----------------------------
-- Table structure for tempurl
-- ----------------------------
DROP TABLE IF EXISTS `tempurl`;
CREATE TABLE `tempurl` (
  `tempUrlID` int(11) NOT NULL AUTO_INCREMENT,   --临时图片id
  `fileUrl` varchar(200) DEFAULT NULL,
  `newdate` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`tempUrlID`)
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tempurl
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userno` int(11) NOT NULL AUTO_INCREMENT,        -- 自增主键id
  `username` varchar(20) DEFAULT NULL,             -- 用户名
  `password` varchar(40) NOT NULL,                 -- 用户密码
  `email` varchar(50) NOT NULL,                    -- 用户邮箱
  `sex` varchar(4) DEFAULT NULL,                   -- 用户性别
  `status` int(11) DEFAULT '0',                    -- 用户是否通过邮箱验证 , 0未通过, 1通过
  `newdate` varchar(15) NOT NULL,                  -- 注册时间
  PRIMARY KEY (`userno`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('3', 'xxx', 'xxx', 'xxxxx@qq.com', '男', '0', '20180414092742');


-- ----------------------------
-- Table structure for wechatuser
-- ----------------------------
DROP TABLE IF EXISTS `wechatuser`;
CREATE TABLE `wechatuser` (
  `wechatuserno` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(50) NOT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `province` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `headimgurl` varchar(200) DEFAULT NULL,
  `userno` int(11) DEFAULT NULL,
  PRIMARY KEY (`wechatuserno`),
  UNIQUE KEY `openid` (`openid`),
  KEY `fk_wechatuser_userno` (`userno`),
  CONSTRAINT `fk_wechatuser_userno` FOREIGN KEY (`userno`) REFERENCES `user` (`userno`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wechatuser
-- ----------------------------
