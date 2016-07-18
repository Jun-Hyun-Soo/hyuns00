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
NOPARALLEL
COMPUTE STATISTICS
ONLINE;


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
NOPARALLEL
COMPUTE STATISTICS
ONLINE;


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
NOPARALLEL
COMPUTE STATISTICS
ONLINE;


/*------------------------------------------------------------------------------
-- ��ü �̸� : HYUNS00.PK_BBS
-- ���� ��¥ : 2016-02-25 ���� 11:07:38
-- ���������� ������ ��¥ : 2016-02-25 ���� 11:07:38
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

