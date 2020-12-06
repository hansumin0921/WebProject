create table if not exists product(
	p_id varchar(10) not null,
	p_name varchar(30),
	p_fixedPrice INTEGER,
	p_description TEXT,
	p_brand varchar(20),
	p_category varchar(20),
	p_unitsInStock LONG,
	p_disCount INTEGER,
	p_fileName varchar(20),
	primary key (p_id)
)default charset=utf8;
	
insert into product values('P0000','뉴트리나 건강백서 2kg',20000,'뉴트리나 건강백서 건강한 관절은 반려견의 건강한 관절을 위한 사료입니다. 반려동물의 관절건강을 위협하는 요소는 나이, 비만, 선천적 요소 (소형견 슬개골 탈구나 대형견 고관절 이상)등 
다양합니다.','뉴트리나','food',100,5000,'P0000.jpg');
insert into product values('S0001','네츄럴코어 하루유산균',5000,'네츄럴코어 하루유산균은 살아있는 생 유산균과 신선한 생과일을 사용한 껌 간식으로 장이 약한 아이 또는 일시적인 설사 증상 호전에 도움을 주며, 
건강한 비타민 및 영양소를 제공합니다.','네츄럴코어','snack',100,1000,'S0001.jpg');
insert into product values('C0002','후리스 맨투맨 브라운',17500,'투스투스 후리스 맨투맨은 양면 보아털 원단으로 제작하여 따뜻하고 
포근한 느낌을 주는 원단입니다.','투스투스','clothes',100,0,'C0002.jpg');

select * from product;
drop table product;
select count(*) from product;
alter table product modify(p_description varchar(100));

delete from product where p_id="S0008";

create table member(
	id varchar(10) not null,
	password varchar(10) not null,
	name varchar(10) not null,
	gender varchar(4),
	birth varchar(10),
	mail varchar(30),
	phone varchar(20),
	address varchar(90),
	regist_day varchar(50),
	point integer,
	primary key(id)
)default charset=utf8;

delete from member where id="suminhan";
update member set point=0 where id="suminhan";
select * from member;

create table orderlist(
	ordercode varchar(20) not null,
	sessionid varchar(10) not null,
	name varchar(50) not null,
	filename varchar(20),
	quantity integer,
	price integer,
	primary key(ordercode),
	constraint fk foreign key (sessionid) references member(id) on delete cascade
)default charset=utf8;
alter table orderlist add constraint fk foreign key (sessionid) references member(id) on delete cascade;
drop table orderlist;

select  * from orderlist;

create table event1(
	id varchar(20) not null,
	win varchar(10) not null,
	primary key(id),
	constraint event1_fk foreign key (id) references member(id) on delete cascade
)default charset=utf8;

drop table event1;
alter table event1 add constraint event1_fk foreign key (id) references member(id) on delete cascade;
select * from event1;
delete from event1 where id='suminhan';




