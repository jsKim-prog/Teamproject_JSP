--author테이블  --24.07.30수정. 권한 숫자를 pk로 변경
CREATE TABLE author(
	alevel NUMBER(2) PRIMARY KEY, 
	authorname NVARCHAR2(10) NOT NULL
);

select * from author;

--author테이블 : 데이터 입력(고정값)=enum 데이터
insert into author values(0,'GUEST');
insert into author values(1,'USER');
insert into author values(2,'MANAGER');
insert into author values(3,'ADMIN');

--member 테이블
CREATE table member(
	mno NUMBER(5) ,
	id NVARCHAR2(10) CONSTRAINT MT_ID_UQ UNIQUE,
	pw NVARCHAR2(15) CONSTRAINT MT_PW_NN NOT NULL,
	name NVARCHAR2(10) CONSTRAINT MT_NAME_NN NOT NULL,
	nickName NVARCHAR2(10) CONSTRAINT MT_NICK_PK PRIMARY KEY, --24.07.30수정. 닉네임을 pk로 수정
	birth Date,
	sex NVARCHAR2(2),
	phone NVARCHAR2(20),
	mail NVARCHAR2(50),
	ath NUMBER(2) );    --24.07.30수정. 숫자입력을 위해 권한 번호로 입력
	
alter table member add constraint MT_AT_FK foreign key (ath) REFERENCES author(alevel);	--외래키 제약조건 추가
alter table member modify name NVARCHAR2(10);
alter table member rename column author to ath;

--member 테이블 : mno 시퀀스 생성	
CREATE SEQUENCE member_seq
	INCREMENT BY 1
	START WITH 1
	NOCYCLE
	NOCACHE;
	
select * from MEMBER;	

delete from member where id ='jjj';
drop sequence member_seq;
drop table member;

--더미데이터
insert into member (mno, id, pw, name, nickName, birth, sex, phone, mail, ath) 
VALUES (member_seq.nextval, 'aaa1', 'aaa1', 'anam1', 'anick', TO_DATE('2020/01/01','YYYY/MM/DD'),'여','010-123-4567','aaa@mail.com',2);
insert into MEMBER (mno, id, pw, name, nickName, birth, sex, phone, mail, ath) 
VALUES (member_seq.nextval, 'bbb', 'bbb', 'bname', 'bnick', TO_DATE('1999/12/31','YYYY/MM/DD'),'남','010-123-4567','bbb@mail.com',1);
insert into MEMBER (mno, id, pw, name, nickName, birth, sex, phone, mail, ath) 
VALUES (member_seq.nextval, 'kkk', '1234', '김지선', 'admin', TO_DATE('1977/10/17','YYYY/MM/DD'),'여','010-123-4567','admin@mail.com',3);
insert into member (mno, id, pw, name, nickName, birth, sex, phone, mail, ath) 
VALUES (member_seq.nextval, 'ccc', 'ccc', 'ccc', 'ccc', TO_DATE('2000/02/28','YYYY/MM/DD'), '남', '010-123-4567', 'ccc@mail.com', 1);
insert into member (mno, id, pw, name, nickName, birth, sex, phone, mail, ath) 
VALUES (member_seq.nextval, 'DDD', 'DDD', 'DDD', 'DDD', TO_DATE('2000/02/28','YYYY/MM/DD'), '남', '010-123-4567', 'ccc@mail.com', 1);

insert into member (mno, id, pw, name, nickName, birth, sex, phone, mail, ath) values (mem_seq.nextval, ?, ?, ?, ?, TO_DATE(?,'YYYY/MM/DD'), ?, ?, ?, ?)

-----탈퇴회원용 백업테이블 & 트리거
CREATE table del_member AS select * from member where 1<>1; --백업용 테이블 생성
Alter table del_member add deldate Date;--삭제일 컬럼 추가

CREATE OR REPLACE TRIGGER del_backup 
AFTER
DELETE ON member
FOR EACH ROW 
BEGIN 
    IF DELETING THEN
    INSERT INTO del_member 
    VALUES (:old.mno, :old.id, :old.pw, :old.name, :old.nickName, :old.birth, :old.sex, :old.phone, :old.mail, :old.author, sysdate) ;
    END IF;
 END;



 
 
 
 
 

select * from show.board;
grant select on member to show;
select id from member where name = 'aname' and birth = '2020/01/01' and sex = '여';
select * from member where id ='aaa' and birth='2020/01/01' and phone = '010-123-4567';
update member set nickName = 'newnick' , phone='010-123-4567', mail='aaa@mail.com' where id='aaa';
delete from member where id='bbb' and pw='bbb';
--변경하지 않은 값은 예전 값으로 넣으면 알아서 들어감



--alter table author RENAME column alevel TO level; //level은 필드명 생성 안됨


select * from author;

--동의어 만들기
CREATE public SYNONYM M for member; 
CREATE public SYNONYM A for author;



 
select *from member; 

-- 뷰 테이블 생성(member+author)->조인검색용
CREATE VIEW member_view As select M.mno, M.id, M.pw, M.name, M.nickName, M.birth, M.sex, M.phone, M.mail, A.alevel from member M, author A where M.author = A.authorname;
select * from member_view;

select * from member_view where id='aaa' and birth='2020/01/01' and phone='010-123-4567';
select * from (select M.mno, M.id, M.pw, M.name, M.nickName, M.birth, M.sex, M.phone, M.mail, A.alevel from member M, author A where M.author = A.authorname) where id ='aaa' and birth='2020/01/01' and phone = '010-123-4567';

update member set pw='aa' where id='aaa' and nickname='anick';
update member set pw='15587' where id='aaa' and phone='010-123-4567';

insert into member (mno, id, pw, name, nickName, birth, sex, phone, mail)
VALUES (mem_seq.nextval, 'ccc', 'ccc', 'cname', 'cnick', TO_DATE('1998/12/31','YYYY/MM/DD'),'여','0101234567','ccc@mail.com');

update member set author=(select authorname from author where alevel=1) where id='ccc' and nickname='cnick';


drop table member;
drop table author;
drop sequence mem_seq;