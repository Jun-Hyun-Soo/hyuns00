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
NOPARALLEL
COMPUTE STATISTICS
ONLINE;


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
NOPARALLEL
COMPUTE STATISTICS
ONLINE;


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
NOPARALLEL
COMPUTE STATISTICS
ONLINE;


/*------------------------------------------------------------------------------
-- 개체 이름 : HYUNS00.PK_BBS
-- 만든 날짜 : 2016-06-27 오후 3:53:29
-- 마지막으로 수정한 날짜 : 2016-06-27 오후 3:53:29
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
NOPARALLEL
COMPUTE STATISTICS
ONLINE;


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
NOPARALLEL
COMPUTE STATISTICS
ONLINE;


/*------------------------------------------------------------------------------
-- 개체 이름 : HYUNS00.PK_LOGIN_FILE
-- 만든 날짜 : 2016-07-19 오후 3:22:29
-- 마지막으로 수정한 날짜 : 2016-07-19 오후 3:22:29
-- 상태 : VALID
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
-- 개체 이름 : HYUNS00.PK_NO
-- 만든 날짜 : 2016-07-19 오후 3:20:37
-- 마지막으로 수정한 날짜 : 2016-07-19 오후 3:20:37
-- 상태 : VALID
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

