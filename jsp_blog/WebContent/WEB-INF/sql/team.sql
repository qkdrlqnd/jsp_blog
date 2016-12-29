drop table team;


create table team(

	no 			number		not null,
	name 		varchar(20) not null,
	gender		varchar(5)	not null,
	phone		varchar(20)	not null,
	zipcode		varchar(6)	not null,
	address1 	varchar(200)	not null,
	address2 	varchar(200)	not null,
	skill		varchar(100)	not null,
	hobby		varchar(100)	not null,
	filename	varchar(50)		default 'member.jpg',
	primary key(no)

)


select nvl(max(no),0)+1 from team



insert into team(no, name, gender, phone, zipcode, address1, address2, skill, hobby,filename)
values((select nvl(max(no),0)+1 from team), '이길동', '남','010-1111-1111', '12345', '서울시 종로구 관천동','코아빌딩 5층,10층', 'java,jsp,mvc', '기술서적읽기' ,'member.jpg');



update team set
phone = '010-2222-1111',
zipcode = '00000',
address1 = '서울시 강남구 역삼동',
address2 = '테헤란로',
skill = 'JAVA,Jsp,Mvc,Spring',
hobby = '사진감상'
where no = 1




delete from team
where no = 2


select no, name, phone, skill, filename
from team
order by no desc



select * from team

update TEAM
set
filename='member.jpg'
where no = 1



	select no, name, phone, skill, filename, r from(
		select  no, name, phone, skill, filename, rownum r from(
			select no, name, phone, skill, filename from team
			where name like '%길%'
			order by no desc
		)
	)where r >= 1 and r <=7




 select count(*)
 from team
 
 where name like '%길%'




