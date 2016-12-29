

create table address(
 no			number			not null, 
 name		varchar(10)		not null, 
 phone		varchar(20)		not null, 
 zipcode	varchar(7)		not null, 
 address1	varchar(200)	not null,
 address2	varchar(200)	not null,
 wdate 		date 			not null,
 primary key(no)
)



select nvl(max(no),0)+1  from address


insert into address(no,name,phone,zipcode,address1,address2,wdate)
values((select nvl(max(no),0)+1 from address), '홍길동', '010-1111-1111', '12345', '서울시 마포구 ', '123456', sysdate)


select * from address
select count(*) from address
where name like '%길%'




delete from address



select no, name, phone, wdate from address
order by no desc

