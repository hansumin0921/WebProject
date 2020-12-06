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
	
insert into product values('P0000','��Ʈ���� �ǰ��鼭 2kg',20000,'��Ʈ���� �ǰ��鼭 �ǰ��� ������ �ݷ����� �ǰ��� ������ ���� ����Դϴ�. �ݷ������� �����ǰ��� �����ϴ� ��Ҵ� ����, ��, ��õ�� ��� (������ ������ Ż���� ������ ����� �̻�)�� 
�پ��մϴ�.','��Ʈ����','food',100,5000,'P0000.jpg');
insert into product values('S0001','�����ھ� �Ϸ������',5000,'�����ھ� �Ϸ�������� ����ִ� �� ����հ� �ż��� �������� ����� �� �������� ���� ���� ���� �Ǵ� �Ͻ����� ���� ���� ȣ���� ������ �ָ�, 
�ǰ��� ��Ÿ�� �� ����Ҹ� �����մϴ�.','�����ھ�','snack',100,1000,'S0001.jpg');
insert into product values('C0002','�ĸ��� ������ ����',17500,'�������� �ĸ��� �������� ��� ������ �������� �����Ͽ� �����ϰ� 
������ ������ �ִ� �����Դϴ�.','��������','clothes',100,0,'C0002.jpg');

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




