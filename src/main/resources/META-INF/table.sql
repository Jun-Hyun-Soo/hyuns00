/*------------------------------------------------------------------------------
-- 개체 이름 : HYUNS00.BBS
-- 만든 날짜 : 2016-06-27 오후 3:53:12
-- 마지막으로 수정한 날짜 : 2016-07-20 오전 9:20:04
-- 상태 : VALID
------------------------------------------------------------------------------*/
DROP TABLE HYUNS00.BBS CASCADE CONSTRAINTS;

CREATE TABLE HYUNS00.BBS (
  NO            NUMBER             NOT NULL,
  PRE_NO        NUMBER             NOT NULL,
  SUB_NO        NUMBER             NOT NULL,
  DEP_NO        NUMBER             NOT NULL,
  COM_COUNT     NUMBER             NOT NULL,
  VIEW_COUNT    NUMBER             NOT NULL,
  BBS_NAME      NVARCHAR2(200)     NOT NULL,
  USER_ID       NVARCHAR2(200)         NULL,
  USER_PW       NVARCHAR2(200)     NOT NULL,
  USER_NAME     NVARCHAR2(200)     NOT NULL,
  USER_EMAIL    NVARCHAR2(200)         NULL,
  SUBJECT       NVARCHAR2(200)     NOT NULL,
  USER_IP       NVARCHAR2(200)     NOT NULL,
  NOTICE_YN     CHAR(1)            NOT NULL,
  REG_DATE      DATE               NOT NULL,
  CONTENT       CLOB               NOT NULL
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

COMMENT ON TABLE HYUNS00.BBS IS '게시';

COMMENT ON COLUMN HYUNS00.BBS.CONTENT IS '내용';

COMMENT ON COLUMN HYUNS00.BBS.NO IS '글번호';

COMMENT ON COLUMN HYUNS00.BBS.PRE_NO IS '위글번호';

COMMENT ON COLUMN HYUNS00.BBS.SUB_NO IS '글정렬';

COMMENT ON COLUMN HYUNS00.BBS.DEP_NO IS '글단계';

COMMENT ON COLUMN HYUNS00.BBS.COM_COUNT IS '댓글개수';

COMMENT ON COLUMN HYUNS00.BBS.VIEW_COUNT IS '읽은숫자';

COMMENT ON COLUMN HYUNS00.BBS.BBS_NAME IS '게시판명';

COMMENT ON COLUMN HYUNS00.BBS.USER_ID IS '유저ID';

COMMENT ON COLUMN HYUNS00.BBS.USER_PW IS '비밀번호';

COMMENT ON COLUMN HYUNS00.BBS.USER_NAME IS '글쓴이';

COMMENT ON COLUMN HYUNS00.BBS.USER_EMAIL IS '이메일';

COMMENT ON COLUMN HYUNS00.BBS.SUBJECT IS '제목';

COMMENT ON COLUMN HYUNS00.BBS.USER_IP IS '유저IP';

COMMENT ON COLUMN HYUNS00.BBS.NOTICE_YN IS '공지글';

COMMENT ON COLUMN HYUNS00.BBS.REG_DATE IS '등록일자';

/*------------------------------------------------------------------------------
-- 개체 이름 : HYUNS00.IX_BOARD_NO
-- 만든 날짜 : 2016-06-27 오후 3:53:24
-- 마지막으로 수정한 날짜 : 2016-06-27 오후 3:53:24
-- 상태 : VALID
------------------------------------------------------------------------------*/
DROP INDEX HYUNS00.IX_BOARD_NO;

CREATE INDEX HYUNS00.IX_BOARD_NO
ON HYUNS00.BBS (BBS_NAME, NO)
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
-- 개체 이름 : HYUNS00.IX_BOARD_NOTICE_YN
-- 만든 날짜 : 2016-06-27 오후 3:53:27
-- 마지막으로 수정한 날짜 : 2016-07-20 오전 9:29:39
-- 상태 : VALID
------------------------------------------------------------------------------*/
DROP INDEX HYUNS00.IX_BOARD_NOTICE_YN;

CREATE INDEX HYUNS00.IX_BOARD_NOTICE_YN
ON HYUNS00.BBS (BBS_NAME, NOTICE_YN)
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
-- 개체 이름 : HYUNS00.IX_BOARD_REG_DATE
-- 만든 날짜 : 2016-06-27 오후 3:53:29
-- 마지막으로 수정한 날짜 : 2016-07-20 오전 9:29:46
-- 상태 : VALID
------------------------------------------------------------------------------*/
DROP INDEX HYUNS00.IX_BOARD_REG_DATE;

CREATE INDEX HYUNS00.IX_BOARD_REG_DATE
ON HYUNS00.BBS (BBS_NAME, REG_DATE)
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


/*------------------------------------------------------------------------------
-- 개체 이름 : HYUNS00.BBS_COMMENT
-- 만든 날짜 : 2016-06-27 오후 3:42:01
-- 마지막으로 수정한 날짜 : 2016-07-20 오전 10:55:23
-- 상태 : VALID
------------------------------------------------------------------------------*/
DROP TABLE HYUNS00.BBS_COMMENT CASCADE CONSTRAINTS;

CREATE TABLE HYUNS00.BBS_COMMENT (
  NO           NUMBER             NOT NULL,
  PNO          NUMBER             NOT NULL,
  PRE_NO       NUMBER             NOT NULL,
  SUB_NO       NUMBER             NOT NULL,
  DEP_NO       NUMBER             NOT NULL,
  BBS_NAME     NVARCHAR2(200)     NOT NULL,
  USER_ID      NVARCHAR2(200)         NULL,
  USER_PW      NVARCHAR2(200)     NOT NULL,
  USER_NAME    NVARCHAR2(200)     NOT NULL,
  USER_IP      NVARCHAR2(200)     NOT NULL,
  REG_DATE     DATE               NOT NULL,
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

COMMENT ON TABLE HYUNS00.BBS_COMMENT IS '덧글';

COMMENT ON COLUMN HYUNS00.BBS_COMMENT.NO IS '덧글번호';

COMMENT ON COLUMN HYUNS00.BBS_COMMENT.PNO IS '부모글번호';

COMMENT ON COLUMN HYUNS00.BBS_COMMENT.PRE_NO IS '위덧글번호';

COMMENT ON COLUMN HYUNS00.BBS_COMMENT.SUB_NO IS '덧글정렬';

COMMENT ON COLUMN HYUNS00.BBS_COMMENT.DEP_NO IS '덧글단계';

COMMENT ON COLUMN HYUNS00.BBS_COMMENT.BBS_NAME IS '게시판명';

COMMENT ON COLUMN HYUNS00.BBS_COMMENT.USER_ID IS '유저ID';

COMMENT ON COLUMN HYUNS00.BBS_COMMENT.USER_PW IS '비밀번호';

COMMENT ON COLUMN HYUNS00.BBS_COMMENT.USER_NAME IS '글쓴이';

COMMENT ON COLUMN HYUNS00.BBS_COMMENT.USER_IP IS '유저IP';

COMMENT ON COLUMN HYUNS00.BBS_COMMENT.REG_DATE IS '등록일자';

COMMENT ON COLUMN HYUNS00.BBS_COMMENT.CONTENT IS '내용';

/*------------------------------------------------------------------------------
-- 개체 이름 : HYUNS00.PK_BBS_COMMENT
-- 만든 날짜 : 2016-06-27 오후 3:42:01
-- 마지막으로 수정한 날짜 : 2016-07-20 오전 9:29:53
-- 상태 : VALID
------------------------------------------------------------------------------*/
DROP INDEX HYUNS00.PK_BBS_COMMENT;

CREATE UNIQUE INDEX HYUNS00.PK_BBS_COMMENT
ON HYUNS00.BBS_COMMENT (NO)
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

ALTER TABLE HYUNS00.BBS_COMMENT ADD
(
    CONSTRAINT PK_BBSCOMMENT
    PRIMARY KEY ( NO )
);


/*------------------------------------------------------------------------------
-- 개체 이름 : HYUNS00.BBS_FILE
-- 만든 날짜 : 2016-05-19 오후 3:32:32
-- 마지막으로 수정한 날짜 : 2016-07-20 오전 9:22:58
-- 상태 : VALID
------------------------------------------------------------------------------*/
DROP TABLE HYUNS00.BBS_FILE CASCADE CONSTRAINTS;

CREATE TABLE HYUNS00.BBS_FILE (
  NO            NUMBER            NOT NULL,
  PNO           NUMBER                NULL,
  FILE_PATH     VARCHAR2(200)         NULL,
  FILE_NAME     VARCHAR2(200)         NULL,
  SAVE_NAME     VARCHAR2(200)         NULL,
  FILE_SIZE     NUMBER                NULL,
  DOWN_COUNT    NUMBER                NULL
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

COMMENT ON TABLE HYUNS00.BBS_FILE IS '파일';

/*------------------------------------------------------------------------------
-- 개체 이름 : HYUNS00.PK_BBS_FILE
-- 만든 날짜 : 2016-05-19 오후 3:32:32
-- 마지막으로 수정한 날짜 : 2016-07-20 오전 9:30:00
-- 상태 : VALID
------------------------------------------------------------------------------*/
DROP INDEX HYUNS00.PK_BBS_FILE;

CREATE UNIQUE INDEX HYUNS00.PK_BBS_FILE
ON HYUNS00.BBS_FILE (NO)
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

ALTER TABLE HYUNS00.BBS_FILE ADD
(
    CONSTRAINT PK_BBSFILE
    PRIMARY KEY ( NO )
);


/*------------------------------------------------------------------------------
-- 개체 이름 : HYUNS00.LOGIN
-- 만든 날짜 : 2016-07-19 오후 3:20:36
-- 마지막으로 수정한 날짜 : 2016-07-19 오후 3:20:37
-- 상태 : VALID
------------------------------------------------------------------------------*/
DROP TABLE HYUNS00.LOGIN CASCADE CONSTRAINTS;

CREATE TABLE HYUNS00.LOGIN (
  NO             NUMBER            NOT NULL,
  USER_ID        VARCHAR2(100)     NOT NULL,
  USER_PW        VARCHAR2(100)     NOT NULL,
  USER_NAME      VARCHAR2(101)     NOT NULL,
  USER_ROLE      VARCHAR2(200)     NOT NULL,
  USER_EMAIL     VARCHAR2(200)     NOT NULL,
  NICK_NAME      VARCHAR2(100)         NULL,
  QUESTION       VARCHAR2(200)     NOT NULL,
  ANSWER         VARCHAR2(200)     NOT NULL,
  JOIN_DATE      DATE              NOT NULL,
  LAST_DATE      DATE                  NULL,
  EXIT_DATE      DATE                  NULL,
  EXIT_YN        VARCHAR2(1)       NOT NULL,
  VISIT_COUNT    NUMBER            NOT NULL
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

COMMENT ON TABLE HYUNS00.LOGIN IS '로그인';

COMMENT ON COLUMN HYUNS00.LOGIN.NO IS '번호';

COMMENT ON COLUMN HYUNS00.LOGIN.USER_ID IS '유저ID';

COMMENT ON COLUMN HYUNS00.LOGIN.USER_PW IS '비밀번호';

COMMENT ON COLUMN HYUNS00.LOGIN.USER_NAME IS '유저명';

COMMENT ON COLUMN HYUNS00.LOGIN.USER_ROLE IS '권한';

COMMENT ON COLUMN HYUNS00.LOGIN.USER_EMAIL IS '이메일';

COMMENT ON COLUMN HYUNS00.LOGIN.NICK_NAME IS '닉네임';

COMMENT ON COLUMN HYUNS00.LOGIN.QUESTION IS '보안질문';

COMMENT ON COLUMN HYUNS00.LOGIN.ANSWER IS '보안대답';

COMMENT ON COLUMN HYUNS00.LOGIN.JOIN_DATE IS '가입일시';

COMMENT ON COLUMN HYUNS00.LOGIN.LAST_DATE IS '접속일시';

COMMENT ON COLUMN HYUNS00.LOGIN.EXIT_DATE IS '탈퇴일시';

COMMENT ON COLUMN HYUNS00.LOGIN.EXIT_YN IS '탈퇴유무';

COMMENT ON COLUMN HYUNS00.LOGIN.VISIT_COUNT IS '방문횟수';

ALTER TABLE HYUNS00.LOGIN ADD
(
    CONSTRAINT PK_NO
    PRIMARY KEY ( USER_ID )
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


/*------------------------------------------------------------------------------
-- 개체 이름 : HYUNS00.LOGIN_FILE
-- 만든 날짜 : 2016-07-19 오후 3:22:29
-- 마지막으로 수정한 날짜 : 2016-07-19 오후 3:22:29
-- 상태 : VALID
------------------------------------------------------------------------------*/
DROP TABLE HYUNS00.LOGIN_FILE CASCADE CONSTRAINTS;

CREATE TABLE HYUNS00.LOGIN_FILE (
  NO            NUMBER            NOT NULL,
  PNO           NUMBER                NULL,
  FILE_PATH     VARCHAR2(200)         NULL,
  FILE_NAME     VARCHAR2(200)         NULL,
  SAVE_NAME     VARCHAR2(200)         NULL,
  FILE_SIZE     NUMBER                NULL,
  DOWN_COUNT    NUMBER                NULL
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

COMMENT ON TABLE HYUNS00.LOGIN_FILE IS '파일';

ALTER TABLE HYUNS00.LOGIN_FILE ADD
(
    CONSTRAINT PK_LOGIN_FILE
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

