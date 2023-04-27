create table members(
	ID varchar2(10),
	NAME varchar2(15),
	PWD varchar2(20),
	PHONE varchar2(15)
);

insert into members values('SOMI', '이소미', '1234', '010-1234-1234');
insert into members values('SANG', '전상오', '1234', '010-5555-6666');
insert into members values('LIGHT', '김빛나', '1234', '010-2222-3333');

select * from members;

commit

delete from members where id is null;