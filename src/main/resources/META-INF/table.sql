/*------------------------------------------------------------------------------
-- ��ü �̸� : HYUNS00.BBS
-- ���� ��¥ : 2016-02-25 ���� 11:07:26
-- ���������� ������ ��¥ : 2016-02-25 ���� 4:24:25
-- ���� : VALID
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

COMMENT ON COLUMN HYUNS00.BBS.NO IS '�۹�ȣ';

COMMENT ON COLUMN HYUNS00.BBS.COMCOUNT IS '��۰���';

COMMENT ON COLUMN HYUNS00.BBS.VIEWCOUNT IS '��������';

COMMENT ON COLUMN HYUNS00.BBS.BOARD IS '�Խ��Ǹ�';

COMMENT ON COLUMN HYUNS00.BBS.USERID IS '����ID';

COMMENT ON COLUMN HYUNS00.BBS.PASSWD IS '��й�ȣ';

COMMENT ON COLUMN HYUNS00.BBS.WRITER IS '�۾���';

COMMENT ON COLUMN HYUNS00.BBS.EMAIL IS '�̸���';

COMMENT ON COLUMN HYUNS00.BBS.SUBJECT IS '����';

COMMENT ON COLUMN HYUNS00.BBS.USERIP IS '����IP';

COMMENT ON COLUMN HYUNS00.BBS.NOTICEYN IS '������';

COMMENT ON COLUMN HYUNS00.BBS.REGDATE IS '�������';

COMMENT ON COLUMN HYUNS00.BBS.CONTENT IS '����';

/*------------------------------------------------------------------------------
-- ��ü �̸� : HYUNS00.IX_BOARD_NO
-- ���� ��¥ : 2016-02-25 ���� 11:07:36
-- ���������� ������ ��¥ : 2016-02-25 ���� 11:07:36
-- ���� : VALID
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
-- ��ü �̸� : HYUNS00.IX_BOARD_NOTICEYN
-- ���� ��¥ : 2016-02-25 ���� 4:23:53
-- ���������� ������ ��¥ : 2016-02-25 ���� 4:24:25
-- ���� : VALID
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
-- ��ü �̸� : HYUNS00.IX_BOARD_REGDATE
-- ���� ��¥ : 2016-02-25 ���� 11:07:38
-- ���������� ������ ��¥ : 2016-02-25 ���� 11:07:38
-- ���� : VALID
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

