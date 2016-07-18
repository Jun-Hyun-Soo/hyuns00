/*------------------------------------------------------------------------------
-- 개체 이름 : HYUNS00.BBS
-- 만든 날짜 : 2016-02-25 오전 11:07:26
-- 마지막으로 수정한 날짜 : 2016-02-25 오후 4:24:25
-- 상태 : VALID
------------------------------------------------------------------------------*/
DROP TABLE HYUNS00.BBS CASCADE CONSTRAINTS;

CREATE TABLE HYUNS00.BBS (
  NO           NUMBER             NOT NULL,
  COMCOUNT     NUMBER             NOT NULL,
  VIEWCOUNT    NUMBER             NOT NULL,
  BOARD        NVARCHAR2(200)     NOT NULL,
  USERID       NVARCHAR2(200)         NULL,
  PASSWD       NVARCHAR2(200)         NULL,
  WRITER       NVARCHAR2(200)     NOT NULL,
  EMAIL        NVARCHAR2(200)         NULL,
  SUBJECT      NVARCHAR2(200)     NOT NULL,
  USERIP       NVARCHAR2(200)     NOT NULL,
  NOTICEYN     CHAR(1)            NOT NULL,
  REGDATE      DATE               NOT NULL,
  CONTENT      CLOB               NOT NULL
)
TABLESPACE USERS
PCTFREE 10
PCTUSED 0
INITRANS 1
MAXTRANS 255
STORAGE (
    INITIAL 64 K
    NEXT 1024 K
    MINEXTENTS 1
    MAXEXTENTS UNLIMITED
)
LOGGING
NOCACHE
MONITORING
NOPARALLEL
;

COMMENT ON COLUMN HYUNS00.BBS.NO IS '글번호';

COMMENT ON COLUMN HYUNS00.BBS.COMCOUNT IS '댓글개수';

COMMENT ON COLUMN HYUNS00.BBS.VIEWCOUNT IS '읽은숫자';

COMMENT ON COLUMN HYUNS00.BBS.BOARD IS '게시판명';

COMMENT ON COLUMN HYUNS00.BBS.USERID IS '유저ID';

COMMENT ON COLUMN HYUNS00.BBS.PASSWD IS '비밀번호';

COMMENT ON COLUMN HYUNS00.BBS.WRITER IS '글쓴이';

COMMENT ON COLUMN HYUNS00.BBS.EMAIL IS '이메일';

COMMENT ON COLUMN HYUNS00.BBS.SUBJECT IS '제목';

COMMENT ON COLUMN HYUNS00.BBS.USERIP IS '유저IP';

COMMENT ON COLUMN HYUNS00.BBS.NOTICEYN IS '공지글';

COMMENT ON COLUMN HYUNS00.BBS.REGDATE IS '등록일자';

COMMENT ON COLUMN HYUNS00.BBS.CONTENT IS '내용';

/*------------------------------------------------------------------------------
-- 개체 이름 : HYUNS00.IX_BOARD_NO
-- 만든 날짜 : 2016-02-25 오전 11:07:36
-- 마지막으로 수정한 날짜 : 2016-02-25 오전 11:07:36
-- 상태 : VALID
------------------------------------------------------------------------------*/
DROP INDEX HYUNS00.IX_BOARD_NO;

CREATE INDEX HYUNS00.IX_BOARD_NO
ON HYUNS00.BBS (BOARD, NO)
PCTFREE 10
INITRANS 2
MAXTRANS 255
STORAGE (
    INITIAL 64 K
    NEXT 1024 K
    MINEXTENTS 1
    MAXEXTENTS UNLIMITED
    PCTINCREASE 0
)
TABLESPACE USERS
LOGGING
NOPARALLEL;

/*------------------------------------------------------------------------------
-- 개체 이름 : HYUNS00.IX_BOARD_NOTICEYN
-- 만든 날짜 : 2016-02-25 오후 4:23:53
-- 마지막으로 수정한 날짜 : 2016-02-25 오후 4:24:25
-- 상태 : VALID
------------------------------------------------------------------------------*/
DROP INDEX HYUNS00.IX_BOARD_NOTICEYN;

CREATE INDEX HYUNS00.IX_BOARD_NOTICEYN
ON HYUNS00.BBS (BOARD, NOTICEYN)
PCTFREE 10
INITRANS 2
MAXTRANS 255
STORAGE (
    INITIAL 64 K
    NEXT 1024 K
    MINEXTENTS 1
    MAXEXTENTS UNLIMITED
    PCTINCREASE 0
)
TABLESPACE USERS
LOGGING
NOPARALLEL;

/*------------------------------------------------------------------------------
-- 개체 이름 : HYUNS00.IX_BOARD_REGDATE
-- 만든 날짜 : 2016-02-25 오전 11:07:38
-- 마지막으로 수정한 날짜 : 2016-02-25 오전 11:07:38
-- 상태 : VALID
------------------------------------------------------------------------------*/
DROP INDEX HYUNS00.IX_BOARD_REGDATE;

CREATE INDEX HYUNS00.IX_BOARD_REGDATE
ON HYUNS00.BBS (BOARD, REGDATE)
PCTFREE 10
INITRANS 2
MAXTRANS 255
STORAGE (
    INITIAL 64 K
    NEXT 1024 K
    MINEXTENTS 1
    MAXEXTENTS UNLIMITED
    PCTINCREASE 0
)
TABLESPACE USERS
LOGGING
NOPARALLEL;

ALTER TABLE HYUNS00.BBS ADD
(
    CONSTRAINT PK_BBS
    PRIMARY KEY ( NO )
        USING INDEX
        TABLESPACE USERS
        PCTFREE 10
        INITRANS 2
        MAXTRANS 255
        STORAGE (
            INITIAL 64 K
            NEXT 1024 K
            MINEXTENTS 1
            MAXEXTENTS UNLIMITED
        )
);

