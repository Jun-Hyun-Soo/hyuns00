/*------------------------------------------------------------------------------
-- ��ü �̸� : HYUNS00.BBS
-- ���� ��¥ : 2016-06-27 ���� 3:53:12
-- ���������� ������ ��¥ : 2016-07-20 ���� 9:20:04
-- ���� : VALID
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

COMMENT ON TABLE HYUNS00.BBS IS '�Խ�';

COMMENT ON COLUMN HYUNS00.BBS.CONTENT IS '����';

COMMENT ON COLUMN HYUNS00.BBS.NO IS '�۹�ȣ';

COMMENT ON COLUMN HYUNS00.BBS.PRE_NO IS '���۹�ȣ';

COMMENT ON COLUMN HYUNS00.BBS.SUB_NO IS '������';

COMMENT ON COLUMN HYUNS00.BBS.DEP_NO IS '�۴ܰ�';

COMMENT ON COLUMN HYUNS00.BBS.COM_COUNT IS '��۰���';

COMMENT ON COLUMN HYUNS00.BBS.VIEW_COUNT IS '��������';

COMMENT ON COLUMN HYUNS00.BBS.BBS_NAME IS '�Խ��Ǹ�';

COMMENT ON COLUMN HYUNS00.BBS.USER_ID IS '����ID';

COMMENT ON COLUMN HYUNS00.BBS.USER_PW IS '��й�ȣ';

COMMENT ON COLUMN HYUNS00.BBS.USER_NAME IS '�۾���';

COMMENT ON COLUMN HYUNS00.BBS.USER_EMAIL IS '�̸���';

COMMENT ON COLUMN HYUNS00.BBS.SUBJECT IS '����';

COMMENT ON COLUMN HYUNS00.BBS.USER_IP IS '����IP';

COMMENT ON COLUMN HYUNS00.BBS.NOTICE_YN IS '������';

COMMENT ON COLUMN HYUNS00.BBS.REG_DATE IS '�������';

/*------------------------------------------------------------------------------
-- ��ü �̸� : HYUNS00.IX_BOARD_NO
-- ���� ��¥ : 2016-06-27 ���� 3:53:24
-- ���������� ������ ��¥ : 2016-06-27 ���� 3:53:24
-- ���� : VALID
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
-- ��ü �̸� : HYUNS00.IX_BOARD_NOTICE_YN
-- ���� ��¥ : 2016-06-27 ���� 3:53:27
-- ���������� ������ ��¥ : 2016-07-20 ���� 9:29:39
-- ���� : VALID
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
-- ��ü �̸� : HYUNS00.IX_BOARD_REG_DATE
-- ���� ��¥ : 2016-06-27 ���� 3:53:29
-- ���������� ������ ��¥ : 2016-07-20 ���� 9:29:46
-- ���� : VALID
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
-- ��ü �̸� : HYUNS00.BBS_COMMENT
-- ���� ��¥ : 2016-06-27 ���� 3:42:01
-- ���������� ������ ��¥ : 2016-07-20 ���� 10:55:23
-- ���� : VALID
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

COMMENT ON TABLE HYUNS00.BBS_COMMENT IS '����';

COMMENT ON COLUMN HYUNS00.BBS_COMMENT.NO IS '���۹�ȣ';

COMMENT ON COLUMN HYUNS00.BBS_COMMENT.PNO IS '�θ�۹�ȣ';

COMMENT ON COLUMN HYUNS00.BBS_COMMENT.PRE_NO IS '�����۹�ȣ';

COMMENT ON COLUMN HYUNS00.BBS_COMMENT.SUB_NO IS '��������';

COMMENT ON COLUMN HYUNS00.BBS_COMMENT.DEP_NO IS '���۴ܰ�';

COMMENT ON COLUMN HYUNS00.BBS_COMMENT.BBS_NAME IS '�Խ��Ǹ�';

COMMENT ON COLUMN HYUNS00.BBS_COMMENT.USER_ID IS '����ID';

COMMENT ON COLUMN HYUNS00.BBS_COMMENT.USER_PW IS '��й�ȣ';

COMMENT ON COLUMN HYUNS00.BBS_COMMENT.USER_NAME IS '�۾���';

COMMENT ON COLUMN HYUNS00.BBS_COMMENT.USER_IP IS '����IP';

COMMENT ON COLUMN HYUNS00.BBS_COMMENT.REG_DATE IS '�������';

COMMENT ON COLUMN HYUNS00.BBS_COMMENT.CONTENT IS '����';

/*------------------------------------------------------------------------------
-- ��ü �̸� : HYUNS00.PK_BBS_COMMENT
-- ���� ��¥ : 2016-06-27 ���� 3:42:01
-- ���������� ������ ��¥ : 2016-07-20 ���� 9:29:53
-- ���� : VALID
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
-- ��ü �̸� : HYUNS00.BBS_FILE
-- ���� ��¥ : 2016-05-19 ���� 3:32:32
-- ���������� ������ ��¥ : 2016-07-20 ���� 9:22:58
-- ���� : VALID
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

COMMENT ON TABLE HYUNS00.BBS_FILE IS '����';

/*------------------------------------------------------------------------------
-- ��ü �̸� : HYUNS00.PK_BBS_FILE
-- ���� ��¥ : 2016-05-19 ���� 3:32:32
-- ���������� ������ ��¥ : 2016-07-20 ���� 9:30:00
-- ���� : VALID
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
-- ��ü �̸� : HYUNS00.LOGIN
-- ���� ��¥ : 2016-07-19 ���� 3:20:36
-- ���������� ������ ��¥ : 2016-07-19 ���� 3:20:37
-- ���� : VALID
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

COMMENT ON TABLE HYUNS00.LOGIN IS '�α���';

COMMENT ON COLUMN HYUNS00.LOGIN.NO IS '��ȣ';

COMMENT ON COLUMN HYUNS00.LOGIN.USER_ID IS '����ID';

COMMENT ON COLUMN HYUNS00.LOGIN.USER_PW IS '��й�ȣ';

COMMENT ON COLUMN HYUNS00.LOGIN.USER_NAME IS '������';

COMMENT ON COLUMN HYUNS00.LOGIN.USER_ROLE IS '����';

COMMENT ON COLUMN HYUNS00.LOGIN.USER_EMAIL IS '�̸���';

COMMENT ON COLUMN HYUNS00.LOGIN.NICK_NAME IS '�г���';

COMMENT ON COLUMN HYUNS00.LOGIN.QUESTION IS '��������';

COMMENT ON COLUMN HYUNS00.LOGIN.ANSWER IS '���ȴ��';

COMMENT ON COLUMN HYUNS00.LOGIN.JOIN_DATE IS '�����Ͻ�';

COMMENT ON COLUMN HYUNS00.LOGIN.LAST_DATE IS '�����Ͻ�';

COMMENT ON COLUMN HYUNS00.LOGIN.EXIT_DATE IS 'Ż���Ͻ�';

COMMENT ON COLUMN HYUNS00.LOGIN.EXIT_YN IS 'Ż������';

COMMENT ON COLUMN HYUNS00.LOGIN.VISIT_COUNT IS '�湮Ƚ��';

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
-- ��ü �̸� : HYUNS00.LOGIN_FILE
-- ���� ��¥ : 2016-07-19 ���� 3:22:29
-- ���������� ������ ��¥ : 2016-07-19 ���� 3:22:29
-- ���� : VALID
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

COMMENT ON TABLE HYUNS00.LOGIN_FILE IS '����';

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

