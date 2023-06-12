CREATE TABLE MEMBER (
    id VARCHAR2(10) PRIMARY KEY,
    pass VARCHAR2(10) NOT NULL,
    name VARCHAR2(30) NOT NULL,
    regidate DATE DEFAULT SYSDATE NOT NULL
    
);

COMMENT ON TABLE MEMBER is '회원';
COMMENT ON COLUMN MEMBER.id IS '아이디';
COMMENT ON COLUMN MEMBER.pass IS '패스워드';
COMMENT ON COLUMN MEMBER.name IS '이름';
COMMENT ON COLUMN MEMBER.regidate IS '가입날짜';


CREATE TABLE board (
    num number not null primary key,
    title VARCHAR2(200) NOT NULL,
    content VARCHAR2(2000) NOT NULL,
    id varchar2(10) not null ,
    postdate date default sysdate not null,
    visitcount number(6)
);

alter table board 
    add constraint board_mem_fk foreign key(id)
    references member(id);
    
    
create sequence seq_board_num
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue 
    nocycle
    nocache;
    

insert into board (num, title, content, id, postdate, visitcount)
    values (seq_board_num.nextval, '제목1입니다', '내용1입니다', 'musthave',
sysdate, 0);

insert into member (id, pass, name) values ('musthave', '1234', '머스트해브');

commit;

COMMENT ON TABLE board is '게시판';
COMMENT ON COLUMN board.num IS '일련번호';
COMMENT ON COLUMN board.title IS '제목';
COMMENT ON COLUMN board.content IS '내용';
COMMENT ON COLUMN board.id IS '작성자 아이디';
COMMENT ON COLUMN board.postdate IS '작성일';
COMMENT ON COLUMN board.visitcount IS '조회수';

