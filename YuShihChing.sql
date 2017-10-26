﻿MEMBER = 會員
REALESTATE = 房仲公司
REALTOR = 房仲
SELLER = 廠商
PRD_CATEGORY = 商品類別
PRODUCT = 商品
PRDIMG = 商品照片
PRD_COLLECTION = 收藏商品
ReportProduct = 檢舉商品案件
ReportRealtor = 檢舉房仲案件

---------有參照別人的要先DROP---------------------

DROP TABLE REPORTPRODUCT;
DROP TABLE REPORTREALTOR;
DROP TABLE PRDIMG;
DROP TABLE REALTOR;
DROP TABLE REALESTATE;
DROP TABLE PRD_COLLECTION;
DROP TABLE PRODUCT;
DROP TABLE MEMBER;
DROP TABLE SELLER;
DROP TABLE PRD_CATEGORY;


DROP SEQUENCE MEM_SEQ;
DROP SEQUENCE RE_SEQ;
DROP SEQUENCE RTR_SEQ;
DROP SEQUENCE SLR_SEQ;
DROP SEQUENCE PRDT_CATE_SEQ;
DROP SEQUENCE PD_SEQ;
DROP SEQUENCE PRDIMG_SEQ;
DROP SEQUENCE RP_SEQ;
DROP SEQUENCE RR_SEQ;


----------- 會員 ---------------------
CREATE TABLE MEMBER (
MEM_NO         VARCHAR2(10) NOT NULL,
MEM_ID         VARCHAR2(40) NOT NULL,
MEM_PSW        VARCHAR2(40) NOT NULL,
MEM_NAME       VARCHAR2(12),
MEM_ADDR       VARCHAR2(100),
SEARCH_STATE   VARCHAR2(10),
LOCK_STATE     VARCHAR2(10),
MEM_GAME       NUMBER(10),
CONSTRAINT MEMBER_PK PRIMARY KEY(MEM_NO) );

CREATE SEQUENCE MEM_SEQ 
INCREMENT BY 1 
START WITH 1 
NOCACHE;

INSERT INTO MEMBER VALUES ('MB'||(LPAD(to_char(MEM_SEQ.NEXTVAL),8,'0')),'SteveJobs@gmail.com','123456','賈伯斯','新北市萬里區一條路9號','ON','ON',0);
INSERT INTO MEMBER VALUES ('MB'||(LPAD(to_char(MEM_SEQ.NEXTVAL),8,'0')),'MichaelJordan@gmail.com','123456','喬丹','台北市內湖區灌籃路168號','ON','ON',0);
INSERT INTO MEMBER VALUES ('MB'||(LPAD(to_char(MEM_SEQ.NEXTVAL),8,'0')),'PeterWu@gmail.com','123456','彼得吳','台北市大安區中大路8號','ON','ON',0);
INSERT INTO MEMBER VALUES ('MB'||(LPAD(to_char(MEM_SEQ.NEXTVAL),8,'0')),'BillGates@gmail.com','123456','比爾蓋茲','桃園市中壢區中大路300號','ON','ON',0);


------------ 房仲公司 --------------
CREATE TABLE RealEstate (
RE_NO         VARCHAR2(10) NOT NULL,
RE_NAME       VARCHAR2(40) NOT NULL,
CONSTRAINT RE_PK PRIMARY KEY(RE_NO) );

CREATE SEQUENCE RE_SEQ 
INCREMENT BY 1 
START WITH 1 
NOCACHE;

INSERT INTO REALESTATE VALUES ('RE'||(LPAD(to_char(RE_SEQ.NEXTVAL),6,'0')),'信義房屋');
INSERT INTO REALESTATE VALUES ('RE'||(LPAD(to_char(RE_SEQ.NEXTVAL),6,'0')),'永慶房屋');
INSERT INTO REALESTATE VALUES ('RE'||(LPAD(to_char(RE_SEQ.NEXTVAL),6,'0')),'東森房屋');


-------------- 房仲 --------------
CREATE TABLE REALTOR (
RTR_NO          VARCHAR2(10) NOT NULL,
RTR_ID          VARCHAR2(40) NOT NULL,
RTR_PSW         VARCHAR2(40) NOT NULL,
RTR_NAME        VARCHAR2(40),
RTR_PHOTO       BLOB,
RTR_AREA        VARCHAR2(40),
RTR_INTRO       CLOB,
RTR_IDNO        VARCHAR2(10),
RE_NO           VARCHAR2(10),
RTR_STATE       VARCHAR2(10),
CONSTRAINT RTR_ESTATE_FK FOREIGN KEY(RE_NO) REFERENCES REALESTATE(RE_NO),
CONSTRAINT RTR_PK PRIMARY KEY(RTR_NO) );

CREATE SEQUENCE RTR_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;

INSERT INTO REALTOR(RTR_NO, RTR_ID, RTR_PSW, RTR_NAME, RTR_AREA, RTR_IDNO, RE_NO, RTR_STATE)
VALUES('RT'||(LPAD(to_char(RTR_SEQ.NEXTVAL),8,'0')), 'BA104_RLTR01@GMAIL.COM', '123456', '葦小寶', '北投區', 'A108064497', 'RE000001', 'ON');
INSERT INTO REALTOR(RTR_NO, RTR_ID, RTR_PSW, RTR_NAME, RTR_AREA, RTR_IDNO, RE_NO, RTR_STATE)
VALUES('RT'||(LPAD(to_char(RTR_SEQ.NEXTVAL),8,'0')), 'BA104_RLTR02@GMAIL.COM', '123456', '王建民', '中正區', 'B123456789', 'RE000002', 'ON');
INSERT INTO REALTOR(RTR_NO, RTR_ID, RTR_PSW, RTR_NAME, RTR_AREA, RTR_IDNO, RE_NO, RTR_STATE)
VALUES('RT'||(LPAD(to_char(RTR_SEQ.NEXTVAL),8,'0')), 'BA104_RLTR03@GMAIL.COM', '123456', '林志玲', '士林區', 'X298765432', 'RE000002', 'ON');
INSERT INTO REALTOR(RTR_NO, RTR_ID, RTR_PSW, RTR_NAME, RTR_AREA, RTR_IDNO, RE_NO, RTR_STATE)
VALUES('RT'||(LPAD(to_char(RTR_SEQ.NEXTVAL),8,'0')), 'BA104_RLTR04@GMAIL.COM', '123456', '張三豐', '內湖區', 'D165432178', 'RE000001', 'ON');
INSERT INTO REALTOR(RTR_NO, RTR_ID, RTR_PSW, RTR_NAME, RTR_AREA, RTR_IDNO, RE_NO, RTR_STATE)
VALUES('RT'||(LPAD(to_char(RTR_SEQ.NEXTVAL),8,'0')), 'BA104_RLTR05@GMAIL.COM', '123456', '林大偉', '大安區', 'C132165491', 'RE000002', 'ON');
INSERT INTO REALTOR(RTR_NO, RTR_ID, RTR_PSW, RTR_NAME, RTR_AREA, RTR_IDNO, RE_NO, RTR_STATE)
VALUES('RT'||(LPAD(to_char(RTR_SEQ.NEXTVAL),8,'0')), 'BA104_RLTR06@GMAIL.COM', '123456', '李進財', '信義區', 'A198765432', 'RE000001', 'ON');
INSERT INTO REALTOR(RTR_NO, RTR_ID, RTR_PSW, RTR_NAME, RTR_AREA, RTR_IDNO, RE_NO, RTR_STATE)
VALUES('RT'||(LPAD(to_char(RTR_SEQ.NEXTVAL),8,'0')), 'BA104_RLTR07@GMAIL.COM', '123456', '趙德助', '萬華區', 'H147258369', 'RE000002', 'ON');
INSERT INTO REALTOR(RTR_NO, RTR_ID, RTR_PSW, RTR_NAME, RTR_AREA, RTR_IDNO, RE_NO, RTR_STATE)
VALUES('RT'||(LPAD(to_char(RTR_SEQ.NEXTVAL),8,'0')), 'BA104_RLTR08@GMAIL.COM', '123456', '張鈞甯', '中山區', 'X265432155', 'RE000001', 'ON');
INSERT INTO REALTOR(RTR_NO, RTR_ID, RTR_PSW, RTR_NAME, RTR_AREA, RTR_IDNO, RE_NO, RTR_STATE)
VALUES('RT'||(LPAD(to_char(RTR_SEQ.NEXTVAL),8,'0')), 'BA104_RLTR09@GMAIL.COM', '123456', '王小明', '大同區', 'A123466593', 'RE000002', 'ON');
INSERT INTO REALTOR(RTR_NO, RTR_ID, RTR_PSW, RTR_NAME, RTR_AREA, RTR_IDNO, RE_NO, RTR_STATE)
VALUES('RT'||(LPAD(to_char(RTR_SEQ.NEXTVAL),8,'0')), 'BA104_RLTR10@GMAIL.COM', '123456', '陳金鋒', '大安區', 'F136925874', 'RE000003', 'ON');
INSERT INTO REALTOR(RTR_NO, RTR_ID, RTR_PSW, RTR_NAME, RTR_AREA, RTR_IDNO, RE_NO, RTR_STATE)
VALUES('RT'||(LPAD(to_char(RTR_SEQ.NEXTVAL),8,'0')), 'BA104_RLTR11@GMAIL.COM', '123456', '連天邊', '信義區', 'H118754326', 'RE000001', 'ON');
INSERT INTO REALTOR(RTR_NO, RTR_ID, RTR_PSW, RTR_NAME, RTR_AREA, RTR_IDNO, RE_NO, RTR_STATE)
VALUES('RT'||(LPAD(to_char(RTR_SEQ.NEXTVAL),8,'0')), 'BA104_RLTR12@GMAIL.COM', '123456', '楊美麗', '中正區', 'B213456789', 'RE000001', 'ON');


<<<<<<< HEAD
-------------- 廠商 --------------
=======
===== 廠商 =====
>>>>>>> 0d48e39ed67857664fad4e3cc770b0e16aa0ce74
CREATE TABLE SELLER (
SLR_NO           VARCHAR2(10) NOT NULL,
SLR_Name         VARCHAR2(40),
SLR_TAXID        VARCHAR2(10),
SLR_ID           VARCHAR2(40) NOT NULL,
SLR_PSW          VARCHAR2(40) NOT NULL,
SLR_CONTACT      VARCHAR2(40),
SLR_PHONE        VARCHAR2(10),
SLR_STATE        VARCHAR2(10),
SLR_INTRO        CLOB,
CONSTRAINT SLR_PK PRIMARY KEY(SLR_NO) );

CREATE SEQUENCE SLR_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;

INSERT INTO SELLER(SLR_NO, SLR_Name, SLR_TAXID, SLR_ID, SLR_PSW, SLR_CONTACT, SLR_PHONE, SLR_STATE)
VALUES('SL'||(LPAD(to_char(SLR_SEQ.NEXTVAL),6,'0')), '宜家家居', '84309586', 'SALES@IKEA.COM', '123456', '李協達', '84128869', 'ON');
INSERT INTO SELLER(SLR_NO, SLR_Name, SLR_TAXID, SLR_ID, SLR_PSW, SLR_CONTACT, SLR_PHONE, SLR_STATE)
VALUES('SL'||(LPAD(to_char(SLR_SEQ.NEXTVAL),6,'0')), '歐德傢俱', '70394175', 'SALES@ORDER.COM', '123456', '陳國都', '0800033988', 'ON');
INSERT INTO SELLER(SLR_NO, SLR_Name, SLR_TAXID, SLR_ID, SLR_PSW, SLR_CONTACT, SLR_PHONE, SLR_STATE)
VALUES('SL'||(LPAD(to_char(SLR_SEQ.NEXTVAL),6,'0')), '特力屋', '89390488', 'SALES@HOLA.COM.TW', '123456', '何湯雄', '87915566', 'ON');
INSERT INTO SELLER(SLR_NO, SLR_Name, SLR_TAXID, SLR_ID, SLR_PSW, SLR_CONTACT, SLR_PHONE, SLR_STATE)
VALUES('SL'||(LPAD(to_char(SLR_SEQ.NEXTVAL),6,'0')), '詩肯柚木', '89403884', 'SALES@SCANTEAK .COM.TW', '123456', '林福勤', '03-3180555', 'ON');


-------------- 商品類別 --------------
CREATE TABLE PRD_CATEGORY (
CATE_NO      VARCHAR2(10) NOT NULL,
CATE_NAME    VARCHAR2(100) NOT NULL,
CONSTRAINT PRDT_CATE_PK PRIMARY KEY(CATE_NO) );

CREATE SEQUENCE PRDT_CATE_SEQ 
INCREMENT BY 1 
START WITH 1 
NOCACHE;

INSERT INTO PRD_CATEGORY VALUES ('PC'||(LPAD(to_char(PRDT_CATE_SEQ.NEXTVAL),6,'0')),'桌子');
INSERT INTO PRD_CATEGORY VALUES ('PC'||(LPAD(to_char(PRDT_CATE_SEQ.NEXTVAL),6,'0')),'椅子');
INSERT INTO PRD_CATEGORY VALUES ('PC'||(LPAD(to_char(PRDT_CATE_SEQ.NEXTVAL),6,'0')),'櫃子');


-------------- 商品 --------------
CREATE TABLE PRODUCT (
PRD_NO          VARCHAR2(10) NOT NULL,
SLR_NO          VARCHAR2(10) NOT NULL,
CATE_NO         VARCHAR2(10) NOT NULL,
<<<<<<< HEAD
PRD_NAME        VARCHAR2(100) NOT NULL,
=======
PRD_NAME        VARCHAR2(50) NOT NULL,
>>>>>>> 0d48e39ed67857664fad4e3cc770b0e16aa0ce74
PRD_DESC        CLOB,
PRD_STOCK       NUMBER(6),
PRD_PRICE       NUMBER(10) NOT NULL,
PRD_STATE       VARCHAR2(10),
CONSTRAINT PRD_PK PRIMARY KEY(PRD_NO),
CONSTRAINT PRD_SL_FK FOREIGN KEY(SLR_NO) REFERENCES SELLER(SLR_NO),
CONSTRAINT PRD_CG_FK FOREIGN KEY(CATE_NO) REFERENCES PRD_CATEGORY(CATE_NO) );

CREATE SEQUENCE PD_SEQ
INCREMENT BY 1 
START WITH 1 
NOCACHE;
<<<<<<< HEAD
=======
################################
商品還沒 INSERT 假資料
INSERT INTO PRODUCT(PRD_NO,SLR_NO,CATE_NO,PRD_NAME,PRD_STOCK,PRD_PRICE,PRD_STATE) VALUES('PRD'||(LPAD(to_char(PRD_SEQ.NEXTVAL),6,'0')),'SL00000001','PDCG000001','KLIMPEN桌子, 灰色 淺灰色',62,8780,'On');
################################
>>>>>>> 0d48e39ed67857664fad4e3cc770b0e16aa0ce74

INSERT INTO PRODUCT(PRD_NO,SLR_NO,CATE_NO,PRD_NAME,PRD_STOCK,PRD_PRICE,PRD_STATE) VALUES('PD'||(LPAD(to_char(PD_SEQ.NEXTVAL),8,'0')),'SL000001','PC000001','KLIMPEN桌子, 灰色 淺灰色',62,8780,'On');
INSERT INTO PRODUCT(PRD_NO,SLR_NO,CATE_NO,PRD_NAME,PRD_STOCK,PRD_PRICE,PRD_STATE) VALUES('PD'||(LPAD(to_char(PD_SEQ.NEXTVAL),8,'0')),'SL000001','PC000001','LINNMON/ALEX 桌子, 幾何圖案 藍色, 白色',73,3890,'On');
INSERT INTO PRODUCT(PRD_NO,SLR_NO,CATE_NO,PRD_NAME,PRD_STOCK,PRD_PRICE,PRD_STATE) VALUES('PD'||(LPAD(to_char(PD_SEQ.NEXTVAL),8,'0')),'SL000001','PC000001','MALM 書桌/工作桌, 白色',87,3990,'On');
INSERT INTO PRODUCT(PRD_NO,SLR_NO,CATE_NO,PRD_NAME,PRD_STOCK,PRD_PRICE,PRD_STATE) VALUES('PD'||(LPAD(to_char(PD_SEQ.NEXTVAL),8,'0')),'SL000001','PC000001','MALM L型書桌/工作桌, 棕色 實木貼皮, 梣木',46,3990,'On');
INSERT INTO PRODUCT(PRD_NO,SLR_NO,CATE_NO,PRD_NAME,PRD_STOCK,PRD_PRICE,PRD_STATE) VALUES('PD'||(LPAD(to_char(PD_SEQ.NEXTVAL),8,'0')),'SL000001','PC000001','PAHL 書桌/工作桌附延伸層架, 白色, 粉紅色',59,3390,'On');
INSERT INTO PRODUCT(PRD_NO,SLR_NO,CATE_NO,PRD_NAME,PRD_STOCK,PRD_PRICE,PRD_STATE) VALUES('PD'||(LPAD(to_char(PD_SEQ.NEXTVAL),8,'0')),'SL000001','PC000001','PAHL 書桌/工作桌附層架, 白色, 綠色',61,3390,'On');
INSERT INTO PRODUCT(PRD_NO,SLR_NO,CATE_NO,PRD_NAME,PRD_STOCK,PRD_PRICE,PRD_STATE) VALUES('PD'||(LPAD(to_char(PD_SEQ.NEXTVAL),8,'0')),'SL000001','PC000002','EKEBOL 三人座沙發, Katorp 自然色',12,15900,'On');
INSERT INTO PRODUCT(PRD_NO,SLR_NO,CATE_NO,PRD_NAME,PRD_STOCK,PRD_PRICE,PRD_STATE) VALUES('PD'||(LPAD(to_char(PD_SEQ.NEXTVAL),8,'0')),'SL000001','PC000002','EKTORP 三人座沙發, Nordvalla 深米',7,13900,'On');
INSERT INTO PRODUCT(PRD_NO,SLR_NO,CATE_NO,PRD_NAME,PRD_STOCK,PRD_PRICE,PRD_STATE) VALUES('PD'||(LPAD(to_char(PD_SEQ.NEXTVAL),8,'0')),'SL000001','PC000002','LANGFJALL 旋轉椅, Gunnared 米色, 白色',28,4999,'On');
INSERT INTO PRODUCT(PRD_NO,SLR_NO,CATE_NO,PRD_NAME,PRD_STOCK,PRD_PRICE,PRD_STATE) VALUES('PD'||(LPAD(to_char(PD_SEQ.NEXTVAL),8,'0')),'SL000001','PC000002','LANGFJALL 旋轉椅, Gunnared 棕紅色, 白色',16,4999,'On');
INSERT INTO PRODUCT(PRD_NO,SLR_NO,CATE_NO,PRD_NAME,PRD_STOCK,PRD_PRICE,PRD_STATE) VALUES('PD'||(LPAD(to_char(PD_SEQ.NEXTVAL),8,'0')),'SL000001','PC000002','MARKUS 旋轉椅, Glose 黑色 Robust 黑色',15,4990,'On');
INSERT INTO PRODUCT(PRD_NO,SLR_NO,CATE_NO,PRD_NAME,PRD_STOCK,PRD_PRICE,PRD_STATE) VALUES('PD'||(LPAD(to_char(PD_SEQ.NEXTVAL),8,'0')),'SL000001','PC000002','SPORREN 旋轉椅, 白色, Vissle 淺藍色',23,1799,'On');
INSERT INTO PRODUCT(PRD_NO,SLR_NO,CATE_NO,PRD_NAME,PRD_STOCK,PRD_PRICE,PRD_STATE) VALUES('PD'||(LPAD(to_char(PD_SEQ.NEXTVAL),8,'0')),'SL000001','PC000003','HURDAL 寢具櫃, 綠色',4,11900,'On');
INSERT INTO PRODUCT(PRD_NO,SLR_NO,CATE_NO,PRD_NAME,PRD_STOCK,PRD_PRICE,PRD_STATE) VALUES('PD'||(LPAD(to_char(PD_SEQ.NEXTVAL),8,'0')),'SL000001','PC000003','KALLAX 層架組, 灰色, 木紋',19,2695,'On');
INSERT INTO PRODUCT(PRD_NO,SLR_NO,CATE_NO,PRD_NAME,PRD_STOCK,PRD_PRICE,PRD_STATE) VALUES('PD'||(LPAD(to_char(PD_SEQ.NEXTVAL),8,'0')),'SL000001','PC000003','KALLAX-黑棕色 層架組附門片',26,2895,'On');
INSERT INTO PRODUCT(PRD_NO,SLR_NO,CATE_NO,PRD_NAME,PRD_STOCK,PRD_PRICE,PRD_STATE) VALUES('PD'||(LPAD(to_char(PD_SEQ.NEXTVAL),8,'0')),'SL000001','PC000003','LIXHULT 收納組合, 紅色, 藍色',23,11900,'On');
INSERT INTO PRODUCT(PRD_NO,SLR_NO,CATE_NO,PRD_NAME,PRD_STOCK,PRD_PRICE,PRD_STATE) VALUES('PD'||(LPAD(to_char(PD_SEQ.NEXTVAL),8,'0')),'SL000001','PC000003','PAX 衣櫃/衣櫥, 染白橡木紋, Farvik 白色玻璃',3,30600,'On');
INSERT INTO PRODUCT(PRD_NO,SLR_NO,CATE_NO,PRD_NAME,PRD_STOCK,PRD_PRICE,PRD_STATE) VALUES('PD'||(LPAD(to_char(PD_SEQ.NEXTVAL),8,'0')),'SL000001','PC000003','STUVA 衣櫃/衣櫥, 白色, 藍色',10,5690,'On');
INSERT INTO PRODUCT(PRD_NO,SLR_NO,CATE_NO,PRD_NAME,PRD_STOCK,PRD_PRICE,PRD_STATE) VALUES('PD'||(LPAD(to_char(PD_SEQ.NEXTVAL),8,'0')),'SL000001','PC000003','STUVA 衣櫃/衣櫥, 白色, 粉紅色',14,5690,'On');


------------ 商品照片 --------------
CREATE TABLE PRDIMG (
PRD_IMGNO    NUMBER(10) NOT NULL,
PRD_NO       VARCHAR2(10) NOT NULL,
PRD_IMG      BLOB,
CONSTRAINT PRDIMG_PK PRIMARY KEY(PRD_IMGNO),
CONSTRAINT PRDIMG_PD_FK FOREIGN KEY(PRD_NO) REFERENCES PRODUCT(PRD_NO) );

CREATE SEQUENCE PRDIMG_SEQ
INCREMENT BY 1 
START WITH 1 
NOCACHE;
------------------------------
--商品圖片尚未 INSERT 假資料
------------------------------


<<<<<<< HEAD
-------- 收藏商品 (外來鍵 MEM_NO、PRD_NO 作為雙主鍵)-----------
=======
===== 收藏商品 (外來鍵 MEM_NO、PRD_NO 作為雙主鍵)=====
>>>>>>> 0d48e39ed67857664fad4e3cc770b0e16aa0ce74
CREATE TABLE PRD_COLLECTION (
MEM_NO        VARCHAR2(10) NOT NULL,
PRD_NO        VARCHAR2(10) NOT NULL,
PCTIME        TIMESTAMP,
CONSTRAINT MEM_PRD_PK PRIMARY KEY (MEM_NO,PRD_NO),
CONSTRAINT PC_MEM_FK FOREIGN KEY(MEM_NO) REFERENCES MEMBER(MEM_NO),
CONSTRAINT PC_PRD_FK FOREIGN KEY(PRD_NO) REFERENCES PRODUCT(PRD_NO) );
<<<<<<< HEAD
------------------------------
--收藏商品尚未 INSERT 假資料
------------------------------
=======
##############################
收藏商品尚未 INSERT 假資料
##############################
>>>>>>> 0d48e39ed67857664fad4e3cc770b0e16aa0ce74



-------------- 檢舉商品案件 (要先建 EMPLOYEE 表格) --------------
CREATE TABLE ReportProduct (
RP_NO          VARCHAR2(10) NOT NULL,
MEM_NO         VARCHAR2(10) NOT NULL,
PRD_NO         VARCHAR2(10) NOT NULL,
EMP_NO         VARCHAR2(10),
RP_REASON      VARCHAR2(200),
RP_RESULT      VARCHAR2(200),
RP_STATE       VARCHAR2(10),
RP_TIME        TIMESTAMP,
CONSTRAINT RP_PK PRIMARY KEY(RP_NO),
CONSTRAINT RP_MEM_FK FOREIGN KEY(MEM_NO) REFERENCES MEMBER(MEM_NO),
CONSTRAINT RP_PRDT_FK FOREIGN KEY(PRD_NO) REFERENCES PRODUCT(PRD_NO),
CONSTRAINT RP_EMP_FK FOREIGN KEY(EMP_NO) REFERENCES EMPLOYEE(EMP_NO) );

CREATE SEQUENCE RP_SEQ
INCREMENT BY 1 
START WITH 1 
NOCACHE;
--------------------------------
--檢舉商品案件尚未 INSERT 假資料
--------------------------------


-------- 檢舉房仲案件 (要先建 EMPLOYEE 表格) --------
CREATE TABLE ReportRealtor (
RR_NO         VARCHAR2(10) NOT NULL,
MEM_NO        VARCHAR2(10) NOT NULL,
RTR_NO        VARCHAR2(10) NOT NULL,
EMP_NO        VARCHAR2(10),
RR_REASON     VARCHAR2(200),
RR_RESULT     VARCHAR2(200),
RR_STATE      VARCHAR2(10),
RR_TIME       TIMESTAMP,
CONSTRAINT RR_PK PRIMARY KEY(RR_NO),
CONSTRAINT RR_MEM_FK FOREIGN KEY(MEM_NO) REFERENCES MEMBER(MEM_NO),
CONSTRAINT RR_RTR_FK FOREIGN KEY(RTR_NO) REFERENCES REALTOR(RTR_NO),
CONSTRAINT RR_EMP_FK FOREIGN KEY(EMP_NO) REFERENCES EMPLOYEE(EMP_NO) );

CREATE SEQUENCE RR_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;
--------------------------------
--檢舉房仲案件尚未 INSERT 假資料
--------------------------------
COMMIT;
