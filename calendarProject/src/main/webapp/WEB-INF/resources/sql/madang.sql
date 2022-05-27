drop table diary;

create TABLE diary(
user_id varchar2(50),
no  number PRIMARY KEY not null,
title varchar2(300) not null,
content varchar2(3000) not null,
textColor varchar2(50) not null,
color varchar2(50) not null,
reg_date date not null,
CONSTRAINT fk_user_id FOREIGN KEY(user_id)
REFERENCES member(userId)
ON DELETE CASCADE
);

create table member(
userId varchar2(50) PRIMARY KEY not null,
userPassword varchar2(50) not null,
userName varchar2(20) not null,
userTel varchar2(20) not null
);

ALTER INDEX SYS_C008346 
RENAME TO index_diary;

create sequence diary_seq
start with 1
increment by 1
maxvalue 99999;

insert into member(userId, userPassword, userName,userTel)
VALUES ('aaa@aaa.com','1234','apple','000-0000-0000');
insert into member(userId, userPassword, userName,userTel)
VALUES ('bbb@bbb.com','4321','banana','000-0000-0000');

insert into diary(user_id, no, title, content, textColor, color, reg_date)
values('aaa@aaa.com', diary_seq.nextval, 'title12', 'content12', '#e66465', '#f6b73c', sysdate);

SELECT user_id, no, title, content, reg_date 
		FROM (
				select /*+ INDEX_DESC(diary SYS_C008340)*/ rownum rn, user_id, no, title, content, reg_date
				from diary
                --index name, not pk name
				where user_id = 'aaa@aaa.com'
			  )
		WHERE rn > 0 and rn <= 4;
        
SELECT user_id, no, title, content, reg_date
FROM diary
WHERE no = 11;

DELETE diary
WHERE no = 10;

UPDATE diary
SET    user_id = 'bbb@bbb.com' ,
       title = 'title title', 
       content = 'content content'
WHERE  no = 11;