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
NOPARALLEL
COMPUTE STATISTICS
ONLINE;


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
NOPARALLEL
COMPUTE STATISTICS
ONLINE;


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
NOPARALLEL
COMPUTE STATISTICS
ONLINE;


/*------------------------------------------------------------------------------
-- 개체 이름 : HYUNS00.PK_BBS
-- 만든 날짜 : 2016-02-25 오전 11:07:38
-- 마지막으로 수정한 날짜 : 2016-02-25 오전 11:07:38
-- 상태 : VALID
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

