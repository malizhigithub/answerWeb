-- 创建数据库
drop database if exists answerWeb;
create database answerWeb;
use answerWeb;

drop table if exists options;
drop table if exists records;
drop table if exists question;
drop table if exists questiontype;
drop table if exists wechatuser;
drop table if exists user;
drop table if exists admins;

-- 创建用户表
create table user(
	userno int auto_increment primary key, -- 自增主键id
	username varchar(20),	-- 用户名
	password varchar(40) not null,	-- 用户密码
	email varchar(50) UNIQUE KEY not null,	-- 用户邮箱
	sex varchar(4),		-- 用户性别
	status int default 0, -- 用户是否通过邮箱验证 , 0未通过, 1通过
	newdate varchar(15)
);

-- 创建题目类型表
create table questiontype(
	typeno int auto_increment primary key,	-- 自增主键id
	typename varchar(30) not null,		-- 题目类型Id
	belongtypeno int,		-- 属于哪个题目类型id
	imageurl varchar(200) default 'book.jpg',
	constraint fk_questiontype_belongtypeno foreign key(belongtypeno) 
		references questiontype(typeno) on delete cascade
);

-- 创建题目表
create table question(
	questionno int auto_increment primary key,	-- 自增主键id
	content varchar(200) not null,	-- 题目内容,可能是文本或链接
	description varchar(200),		-- 题目涉及知识描述,用于答题后, 文本或链接
	constatus int not null,	-- 内容类型, 1文本, 2图片, 3视频, 4音乐
	desstatus int,	-- 描述类型, 1文本, 2图片
	typeno int not null,		-- 题目类型id
	constraint fk_question_typeno foreign key(typeno)
		references questiontype(typeno) on delete cascade
);

-- 创建题目选项表
create table options(
	optionsno int auto_increment primary key, -- 自增主键id
	questionno int not null, -- 题目id
	content varchar(200) not null, -- 选项内容
	status int,	-- 选项对错, 1对 0错
	constraint fk_options_questionno foreign key(questionno)
		references question(questionno) on delete cascade
);

-- 创建微信用户表
create table wechatuser(
	wechatuserno int auto_increment primary key,
	openid varchar(50) not null UNIQUE KEY,
	nickname varchar(50),
	sex varchar(2),
	province varchar(20),
	city varchar(20),
	country varchar(20),
	headimgurl varchar(200),
	userno int,
	constraint fk_wechatuser_userno foreign key(userno)
		references user(userno) on delete cascade
);

-- 创建记录表
create table records(
	recordsno int auto_increment primary key, -- 自增主键id
	userno int , -- 用户id
	typeno int not null, -- 类型id
	acnumber int default 0,	-- 答对题数
	erunmber int default 0, -- 答错题数
 	wechatuserno int,	-- 微信用户id
	constraint fk_records_userno foreign key(userno)
		references user(userno) on delete cascade,
	constraint fk_records_typeno foreign key(typeno)
		references questiontype(typeno) on delete cascade,
	constraint fk_records_wechatuserno foreign key(wechatuserno)
		references wechatuser(wechatuserno) on delete cascade
);

-- 创建管理员表
create table admins(
	adminid int auto_increment primary key, -- 自增主键id
	adminname varchar(30) not null,	-- 管理员名称
	password varchar(40) not null,	-- 管理员密码
	adminflag int default 1	-- 管理员权限, 1普通 2超级
);

create table tempUrl(
	tempUrlID int auto_increment primary key,
	fileUrl varchar(200),
	newdate varchar(15)
);


-- 插入数据
insert into user(username,password,email,sex,status) values('yuan','yuan','15017391266@163.com','男',1);

insert into questiontype(typename) values('计算机');
insert into questiontype(typename) values('高中');
insert into questiontype(typename,imageurl) values('测试刷新','book.jpg');
insert into questiontype(typename,imageurl) values('测试刷新2','book.jpg');

insert into questiontype(typename,belongtypeno) values('JAVA',1);
insert into questiontype(typename,belongtypeno) values('C++',1);
insert into questiontype(typename,belongtypeno) values('计算机网络',1);
insert into questiontype(typename,belongtypeno) values('计算机操作系统',1);
insert into questiontype(typename,belongtypeno) values('数据挖掘',1);
insert into questiontype(typename,belongtypeno) values('大数据',1);

insert into questiontype(typename,belongtypeno,imageurl) values('理科政治',2,'book.jpg');
insert into questiontype(typename,belongtypeno,imageurl) values('理科地理',2,'book.jpg');
insert into questiontype(typename,belongtypeno,imageurl) values('理科历史',2,'book.jpg');
insert into questiontype(typename,belongtypeno,imageurl) values('文科物理',2,'book.jpg');
insert into questiontype(typename,belongtypeno,imageurl) values('文科化学',2,'book.jpg');
insert into questiontype(typename,belongtypeno,imageurl) values('文科生物',2,'book.jpg');

insert into questiontype(typename,belongtypeno,imageurl) values
	('JAVA基础',3,'book.jpg'),
	('JAVA进阶',3,'book.jpg'),
	('JAVA高级',3,'book.jpg'),
	('C++基础',4,'book.jpg'),
	('C++高级',4,'book.jpg');

insert into question(content,description,constatus,desstatus,typeno)
	 values('第一题','测试题',1,1,15),
	 ('第二题','测试2',1,1,15),
	 ('第3题','测试3',1,1,15),
	 ('第4题','测试4',1,1,15),
	 ('第5题','测试5',1,1,15),
	 ('第6题','测试6',1,1,15),
	 ('第7题','测试7',1,1,15),
	 ('第8题','测试8',1,1,15);
	 
insert into options(questionno,content,status) values
	(1,'1',1),(1,'2',0),(1,'3',0),(1,'4',0),
	(2,'1',1),(2,'2',0),(2,'3',0),(2,'4',0),
	(3,'1',1),(3,'2',0),(3,'3',0),(3,'4',0),
	(4,'1',1),(4,'2',0),(4,'3',0),(4,'4',0),
	(5,'1',1),(5,'2',0),(5,'3',0),(5,'4',0),
	(6,'1',1),(6,'2',0),(6,'3',0),(6,'4',0),
	(7,'1',1),(7,'2',0),(7,'3',0),(7,'4',0),
	(8,'1',1),(8,'2',1),(8,'3',0),(8,'4',0);
