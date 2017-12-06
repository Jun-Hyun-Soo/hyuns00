/*------------------------------------------------------------------------------
-- 개체 이름: HYUNS00.IX_BBS_ID_NOTICE_YN
-- 만든 날짜: 2017-05-23 오후 2:30:12
-- 마지막으로 수정한 날짜: 2017-05-23 오후 2:30:12
-- 상태: VALID
------------------------------------------------------------------------------*/
DROP INDEX HYUNS00.IX_BBS_ID_NOTICE_YN;

CREATE INDEX HYUNS00.IX_BBS_ID_NOTICE_YN
ON HYUNS00.BBS (BBS_ID, NOTICE_YN)
PCTFREE 10
INITRANS 2
MAXTRANS 255
STORAGE (
    INITIAL 64K
    NEXT 1M
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
-- 개체 이름: HYUNS00.PK_BBS
-- 만든 날짜: 2017-02-27 오후 11:48:05
-- 마지막으로 수정한 날짜: 2017-02-27 오후 11:48:05
-- 상태: VALID
------------------------------------------------------------------------------*/
DROP INDEX HYUNS00.PK_BBS;

CREATE UNIQUE INDEX HYUNS00.PK_BBS
ON HYUNS00.BBS (NO)
PCTFREE 10
INITRANS 2
MAXTRANS 255
STORAGE (
    INITIAL 64K
    NEXT 1M
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
-- 개체 이름: HYUNS00.PK_BBS_CATE
-- 만든 날짜: 2017-05-18 오후 5:52:33
-- 마지막으로 수정한 날짜: 2017-05-18 오후 5:52:33
-- 상태: VALID
------------------------------------------------------------------------------*/
DROP INDEX HYUNS00.PK_BBS_CATE;

CREATE UNIQUE INDEX HYUNS00.PK_BBS_CATE
ON HYUNS00.BBS_CATE (NO)
PCTFREE 10
INITRANS 2
MAXTRANS 255
STORAGE (
    INITIAL 64K
    NEXT 1M
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
-- 개체 이름: HYUNS00.PK_BBS_COMMENT
-- 만든 날짜: 2017-02-27 오후 11:48:07
-- 마지막으로 수정한 날짜: 2017-02-27 오후 11:48:07
-- 상태: VALID
------------------------------------------------------------------------------*/
DROP INDEX HYUNS00.PK_BBS_COMMENT;

CREATE UNIQUE INDEX HYUNS00.PK_BBS_COMMENT
ON HYUNS00.BBS_COMMENT (NO)
PCTFREE 10
INITRANS 2
MAXTRANS 255
STORAGE (
    INITIAL 64K
    NEXT 1M
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
-- 개체 이름: HYUNS00.PK_BBS_FILE
-- 만든 날짜: 2017-03-22 오후 11:53:24
-- 마지막으로 수정한 날짜: 2017-03-22 오후 11:53:24
-- 상태: VALID
------------------------------------------------------------------------------*/
DROP INDEX HYUNS00.PK_BBS_FILE;

CREATE UNIQUE INDEX HYUNS00.PK_BBS_FILE
ON HYUNS00.BBS_FILE (NO)
PCTFREE 10
INITRANS 2
MAXTRANS 255
STORAGE (
    INITIAL 64K
    NEXT 1M
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
-- 개체 이름: HYUNS00.PK_BBS_GROUP
-- 만든 날짜: 2017-05-19 오후 1:56:05
-- 마지막으로 수정한 날짜: 2017-05-19 오후 1:56:05
-- 상태: VALID
------------------------------------------------------------------------------*/
DROP INDEX HYUNS00.PK_BBS_GROUP;

CREATE UNIQUE INDEX HYUNS00.PK_BBS_GROUP
ON HYUNS00.MENU (NO)
PCTFREE 10
INITRANS 2
MAXTRANS 255
STORAGE (
    INITIAL 64K
    NEXT 1M
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
-- 개체 이름: HYUNS00.PK_BBS_SCRAP
-- 만든 날짜: 2017-04-11 오후 9:50:38
-- 마지막으로 수정한 날짜: 2017-04-11 오후 9:50:38
-- 상태: VALID
------------------------------------------------------------------------------*/
DROP INDEX HYUNS00.PK_BBS_SCRAP;

CREATE UNIQUE INDEX HYUNS00.PK_BBS_SCRAP
ON HYUNS00.BBS_SCRAP (NO)
PCTFREE 10
INITRANS 2
MAXTRANS 255
STORAGE (
    INITIAL 64K
    NEXT 1M
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
-- 개체 이름: HYUNS00.PK_LOGIN
-- 만든 날짜: 2017-03-22 오후 11:59:39
-- 마지막으로 수정한 날짜: 2017-03-22 오후 11:59:39
-- 상태: VALID
------------------------------------------------------------------------------*/
DROP INDEX HYUNS00.PK_LOGIN;

CREATE UNIQUE INDEX HYUNS00.PK_LOGIN
ON HYUNS00.LOGIN (USER_NO)
PCTFREE 10
INITRANS 2
MAXTRANS 255
STORAGE (
    INITIAL 64K
    NEXT 1M
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
-- 개체 이름: HYUNS00.PK_MESSAGE
-- 만든 날짜: 2017-05-19 오후 1:44:04
-- 마지막으로 수정한 날짜: 2017-05-19 오후 1:44:04
-- 상태: VALID
------------------------------------------------------------------------------*/
DROP INDEX HYUNS00.PK_MESSAGE;

CREATE UNIQUE INDEX HYUNS00.PK_MESSAGE
ON HYUNS00.MESSAGE (NO)
PCTFREE 10
INITRANS 2
MAXTRANS 255
STORAGE (
    INITIAL 64K
    NEXT 1M
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
-- 개체 이름: HYUNS00.UNI_BBS_CATE
-- 만든 날짜: 2017-05-19 오전 11:33:05
-- 마지막으로 수정한 날짜: 2017-05-19 오전 11:33:05
-- 상태: VALID
------------------------------------------------------------------------------*/
DROP INDEX HYUNS00.UNI_BBS_CATE;

CREATE UNIQUE INDEX HYUNS00.UNI_BBS_CATE
ON HYUNS00.BBS_CATE (BBS_ID)
PCTFREE 10
INITRANS 2
MAXTRANS 255
STORAGE (
    INITIAL 64K
    NEXT 1M
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
-- 개체 이름: HYUNS00.UNI_BBS_GROUP
-- 만든 날짜: 2017-05-19 오후 1:55:44
-- 마지막으로 수정한 날짜: 2017-05-19 오후 1:55:44
-- 상태: VALID
------------------------------------------------------------------------------*/
DROP INDEX HYUNS00.UNI_BBS_GROUP;

CREATE UNIQUE INDEX HYUNS00.UNI_BBS_GROUP
ON HYUNS00.MENU (MENU_ID)
PCTFREE 10
INITRANS 2
MAXTRANS 255
STORAGE (
    INITIAL 64K
    NEXT 1M
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
-- 개체 이름: HYUNS00.UNI_LOGIN
-- 만든 날짜: 2017-05-19 오전 11:35:08
-- 마지막으로 수정한 날짜: 2017-05-19 오전 11:35:08
-- 상태: VALID
------------------------------------------------------------------------------*/
DROP INDEX HYUNS00.UNI_LOGIN;

CREATE UNIQUE INDEX HYUNS00.UNI_LOGIN
ON HYUNS00.LOGIN (USER_ID, USER_EMAIL, USER_NICK)
PCTFREE 10
INITRANS 2
MAXTRANS 255
STORAGE (
    INITIAL 64K
    NEXT 1M
    MINEXTENTS 1
    MAXEXTENTS UNLIMITED
    PCTINCREASE 0
)
TABLESPACE USERS
LOGGING
NOPARALLEL
COMPUTE STATISTICS
ONLINE;