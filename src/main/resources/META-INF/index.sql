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
NOPARALLEL
COMPUTE STATISTICS
ONLINE;


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
NOPARALLEL
COMPUTE STATISTICS
ONLINE;


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
NOPARALLEL
COMPUTE STATISTICS
ONLINE;


/*------------------------------------------------------------------------------
-- ��ü �̸� : HYUNS00.PK_BBS
-- ���� ��¥ : 2016-06-27 ���� 3:53:29
-- ���������� ������ ��¥ : 2016-06-27 ���� 3:53:29
-- ���� : VALID
------------------------------------------------------------------------------*/
DROP INDEX HYUNS00.PK_BBS;

CREATE UNIQUE INDEX HYUNS00.PK_BBS
ON HYUNS00.BBS (NO)
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
NOPARALLEL
COMPUTE STATISTICS
ONLINE;


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
NOPARALLEL
COMPUTE STATISTICS
ONLINE;


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
NOPARALLEL
COMPUTE STATISTICS
ONLINE;


/*------------------------------------------------------------------------------
-- ��ü �̸� : HYUNS00.PK_LOGIN_FILE
-- ���� ��¥ : 2016-07-19 ���� 3:22:29
-- ���������� ������ ��¥ : 2016-07-19 ���� 3:22:29
-- ���� : VALID
------------------------------------------------------------------------------*/
DROP INDEX HYUNS00.PK_LOGIN_FILE;

CREATE UNIQUE INDEX HYUNS00.PK_LOGIN_FILE
ON HYUNS00.LOGIN_FILE (NO)
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
NOPARALLEL
COMPUTE STATISTICS
ONLINE;


/*------------------------------------------------------------------------------
-- ��ü �̸� : HYUNS00.PK_NO
-- ���� ��¥ : 2016-07-19 ���� 3:20:37
-- ���������� ������ ��¥ : 2016-07-19 ���� 3:20:37
-- ���� : VALID
------------------------------------------------------------------------------*/
DROP INDEX HYUNS00.PK_NO;

CREATE UNIQUE INDEX HYUNS00.PK_NO
ON HYUNS00.LOGIN (USER_ID)
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
NOPARALLEL
COMPUTE STATISTICS
ONLINE;

