-- String id,ssn,name,regdate;
SELECT * from MEMBER;
INSERT INTO MEMBER(id,name,password,ssn,regdate)
VALUES('JOJO','조조','1','570619-1336491',SYSDATE);
SELECT COUNT(*) AS COUNT FROM MEMBER;
SELECT * from BOARD;
SELECT * FROM Member WHERE id='dsd';
INSERT INTO Board(article_seq,id,title,content,hitcount,regdate) VALUES(article_seq.nextval,'kia','날씨가 좋다',
'무한한 가슴이 기쁘며, 힘있다..',57,SYSDATE);

INSERT INTO Member(id,name,password,birth,phone,gender,major,subject,email,addr,regdate)
VALUES('hong','홍길동','1','000102-1234562',SYSDATE);
INSERT INTO Member(id,name,password,birth,phone,gender,major,subject,email,addr,regdate)
VALUES('kim','김씨','1','010000-1231230',SYSDATE);
INSERT INTO Member(id,name,password,birth,phone,gender,major,subject,email,addr,regdate)
VALUES('ki','기성용','1','091101-1252120',SYSDATE);
INSERT INTO Member(id,name,password,birth,phone,gender,major,subject,email,addr,regdate)
VALUES('lee','이청용','1','870414-1395142',SYSDATE);
INSERT INTO Member(id,name,password,birth,phone,gender,major,subject,email,addr,regdate)
VALUES('kia','김기태','1','070817-1221010',SYSDATE);
INSERT INTO Member(id,name,password,birth,phone,gender,major,subject,email,addr,regdate)
VALUES('tiger','김선빈','1','071719-2213612',SYSDATE);
INSERT INTO Member(id,name,password,birth,phone,gender,major,subject,email,addr,regdate)
VALUES('sun','선동열','1','851104-2213410',SYSDATE);
INSERT INTO Member(id,name,password,birth,phone,gender,major,subject,email,addr,regdate)
VALUES('ki01','기성용','1','931231-2333333',SYSDATE);
INSERT INTO Member(id,name,password,birth,phone,gender,major,subject,email,addr,regdate)
VALUES('youn','이청용','1','790315-2334741',SYSDATE);
INSERT INTO Member(id,name,password,birth,phone,gender,major,subject,email,addr,regdate)
VALUES('na','나성범','1','710108-2111111',SYSDATE);
INSERT INTO Member(id,name,password,birth,phone,gender,major,subject,email,addr,regdate)
VALUES('dsd','선동열','1','536050-253200',SYSDATE);
INSERT INTO Member(id,name,password,birth,phone,gender,major,subject,email,addr,regdate)
VALUES('admin','관리자','admin','1985-11-04','010-0000-0000','남성','컴퓨터학과','java c','kkk@nate.com','서울특별시 강북구 미아동',SYSDATE);
SELECT * FROM Member ORDER BY ssn,name;

INSERT INTO Member(%s%s%s%s%s%s%s%s,regdate)
VALUES(?,?,?,?,?,?,?,?,SYSDATE);
INSERT INTO Member(id,name,password,birth,phone,gender,major,subject,email,addr,regdate)
VALUES('1','1','1','1985-11-04','010-0000-0000','남성','컴퓨터학과','java c','kkk@nate.com','서울특별시 강북구 미아동',SYSDATE);
UPDATE MEMBER
SET password='1'
WHERE id='dsd';

DELETE FROM Member WHERE id='admin';

SELECT * FROM BOARD;

SELECT * FROM all_tables;

SELECT * FROM GRADE;
SELECT * FROM MAJOR;
SELECT * FROM SUBJECT;
SELECT * FROM TAB;
DELETE FROM Subject;

INSERT INTO Major(major_id,title)
VALUES ('art','미술학');
INSERT INTO Major(major_id,title)
VALUES ('computer','컴공');
INSERT INTO Major(major_id,title)
VALUES ('economics','경제학');
INSERT INTO Major(major_id,title)
VALUES ('tourism','관광학');


INSERT INTO Subject(subj_id,title,major_id)
VALUES ('자바','자바','computer');
INSERT INTO Subject(subj_id,title,major_id)
VALUES ('HTML','HTML','computer');
INSERT INTO Subject(subj_id,title,major_id)
VALUES ('SQL','SQL','computer');
INSERT INTO Subject(subj_id,title,major_id)
VALUES ('CSS','CSS','computer');
INSERT INTO Subject(subj_id,title,major_id)
VALUES ('C언어','C언어','computer');
INSERT INTO Subject(subj_id,title,major_id)
VALUES ('javascript','자스','computer');

UPDATE Member SET major_id='computer'; 
UPDATE Member SET profile='defaultimg.jpg';

SELECT id FROM Board WHERE title LIKE '%o%';

SELECT * FROM Member m,Board b WHERE m.id=b.id;