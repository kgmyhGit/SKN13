-- create database hr;
use hr;


DROP TABLE IF EXISTS emp;
CREATE TABLE emp(
    emp_id 		INT PRIMARY KEY,
    emp_name 	VARCHAR(20) NOT NULL,
    job 		VARCHAR(35) NOT NULL,
    mgr_id 		INT,
    hire_date 	DATE NOT NULL,
    salary 		DECIMAL(7,2),    
    comm_pct 	DECIMAL(2,2),
    dept_name 	VARCHAR(30)
);


INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (100,'Steven','AD_PRES',null,CAST('03-06-17' AS DATE),24000,null,'Executive');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (101,'Neena','AD_VP',100,CAST('05-09-21' AS DATE),17000,null,'Executive');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (102,'Lex','AD_VP',100,CAST('01-01-13' AS DATE),17000,null,'Executive');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (103,'Alexander','IT_PROG',102,CAST('06-01-03' AS DATE),9000,null,'IT');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (104,'Bruce','IT_PROG',103,CAST('07-05-21' AS DATE),6000,null,'IT');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (105,'David','IT_PROG',103,CAST('05-06-25' AS DATE),4800,null,'IT');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (106,'Valli','IT_PROG',103,CAST('06-02-05' AS DATE),4800,null,'IT');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (107,'Diana','IT_PROG',103,CAST('07-02-07' AS DATE),4200,null,'IT');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (108,'Nancy','FI_MGR',101,CAST('02-08-17' AS DATE),12008,null,'Finance');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (109,'Daniel','FI_ACCOUNT',108,CAST('02-08-16' AS DATE),9000,null,'Finance');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (110,'John','FI_ACCOUNT',108,CAST('05-09-28' AS DATE),8200,null,'Finance');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (111,'Ismael','FI_ACCOUNT',108,CAST('05-09-30' AS DATE),7700,null,'Finance');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (112,'Jose Manuel','FI_ACCOUNT',108,CAST('06-03-07' AS DATE),7800,null,'Finance');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (113,'Luis','FI_ACCOUNT',108,CAST('07-12-07' AS DATE),6900,null,'Finance');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (114,'Den','PU_MAN',100,CAST('02-12-07' AS DATE),11000,null,'Purchasing');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (115,'Alexander','PU_MAN',100,CAST('03-05-18' AS DATE),7100,null,'Purchasing');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (116,'Shelli','PU_CLERK',114,CAST('05-12-24' AS DATE),2900,null,'Purchasing');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (117,'Sigal','PU_CLERK',115,CAST('05-07-24' AS DATE),2800,null,'Purchasing');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (118,'Guy','PU_CLERK',115,CAST('06-11-15' AS DATE),2600,null,'Purchasing');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (119,'Karen','PU_CLERK',114,CAST('07-08-10' AS DATE),2500,null,'Purchasing');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (120,'Matthew','ST_MAN',100,CAST('04-07-18' AS DATE),8000,null,'Shipping');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (121,'Adam','ST_MAN',100,CAST('05-04-10' AS DATE),8200,null,'Shipping');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (122,'Payam','ST_MAN',100,CAST('03-05-01' AS DATE),7900,null,'Shipping');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (123,'Shanta','ST_MAN',100,CAST('05-10-10' AS DATE),6500,null,'Shipping');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (124,'Kevin','ST_MAN',100,CAST('07-11-16' AS DATE),5800,null,'Shipping');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (125,'Julia','ST_CLERK',120,CAST('05-07-16' AS DATE),3200,null,'Shipping');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (126,'Irene','ST_CLERK',120,CAST('06-09-28' AS DATE),2700,null,'Shipping');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (127,'James','ST_CLERK',120,CAST('07-01-14' AS DATE),2400,null,'Shipping');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (128,'Steven','ST_CLERK',120,CAST('08-03-08' AS DATE),2200,null,'Shipping');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (129,'Laura','ST_CLERK',121,CAST('05-08-20' AS DATE),3300,null,'Shipping');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (130,'Mozhe','ST_CLERK',121,CAST('05-10-30' AS DATE),2800,null,'Shipping');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (131,'James','ST_CLERK',121,CAST('05-02-16' AS DATE),2500,null,'Shipping');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (132,'TJ','ST_CLERK',121,CAST('07-04-10' AS DATE),2100,null,'Shipping');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (133,'Jason','ST_CLERK',122,CAST('04-06-14' AS DATE),3300,null,'Shipping');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (134,'Michael','ST_CLERK',122,CAST('06-08-26' AS DATE),2900,null,'Shipping');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (135,'Ki','ST_CLERK',122,CAST('07-12-12' AS DATE),2400,null,'Shipping');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (136,'Hazel','ST_CLERK',122,CAST('08-02-06' AS DATE),2200,null,'Shipping');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (137,'Renske','ST_CLERK',123,CAST('03-07-14' AS DATE),3600,null,'Shipping');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (138,'Stephen','ST_CLERK',123,CAST('05-10-26' AS DATE),3200,null,'Shipping');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (139,'John','ST_CLERK',123,CAST('06-02-12' AS DATE),2700,null,'Shipping');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (140,'Joshua','ST_CLERK',123,CAST('06-04-06' AS DATE),2500,null,'Shipping');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (141,'Trenna','ST_CLERK',124,CAST('03-10-17' AS DATE),3500,null,'Shipping');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (142,'Curtis','ST_CLERK',124,CAST('05-01-29' AS DATE),3100,null,'Shipping');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (143,'Randall','ST_CLERK',124,CAST('06-03-15' AS DATE),2600,null,'Shipping');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (144,'Peter','ST_CLERK',124,CAST('06-07-09' AS DATE),2500,null,'Shipping');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (145,'John','SA_MAN',100,CAST('04-10-01' AS DATE),14000,0.4,'Sales');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (146,'Karen','SA_MAN',100,CAST('05-01-05' AS DATE),13500,0.3,'Sales');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (147,'Alberto','SA_MAN',100,CAST('05-03-10' AS DATE),12000,0.3, null);
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (148,'Gerald','SA_MAN',100,CAST('07-10-15' AS DATE),11000,0.3,'Sales');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (149,'Eleni','SA_MAN',100,CAST('08-01-29' AS DATE),10500,0.2,'Sales');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (150,'Peter','SA_REP',145,CAST('05-01-30' AS DATE),10000,0.3,'Sales');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (151,'David','SA_REP',145,CAST('05-03-24' AS DATE),9500,0.25,'Sales');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (152,'Peter','SA_REP',145,CAST('05-08-20' AS DATE),9000,0.25,'Sales');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (153,'Christopher','SA_REP',145,CAST('06-03-30' AS DATE),8000,0.2,'Sales');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (154,'Nanette','SA_REP',145,CAST('06-12-09' AS DATE),7500,0.2,'Sales');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (155,'Oliver','SA_REP',145,CAST('07-11-23' AS DATE),7000,0.15,'Sales');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (156,'Janette','SA_REP',146,CAST('04-01-30' AS DATE),10000,0.35,'Sales');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (157,'Patrick','SA_REP',146,CAST('04-03-04' AS DATE),9500,0.35,'Sales');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (158,'Allan','SA_REP',146,CAST('04-08-01' AS DATE),9000,0.35,'Sales');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (159,'Lindsey','SA_REP',146,CAST('05-03-10' AS DATE),8000,0.3,'Sales');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (160,'Louise','SA_REP',146,CAST('05-12-15' AS DATE),7500,0.3,'Sales');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (161,'Sarath','SA_REP',146,CAST('06-11-03' AS DATE),7000,0.25,'Sales');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (162,'Clara','SA_REP',147,CAST('05-11-11' AS DATE),10500,0.25,'Sales');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (163,'Danielle','SA_REP',147,CAST('07-03-19' AS DATE),9500,0.15,'Sales');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (164,'Mattea','SA_REP',147,CAST('08-01-24' AS DATE),7200,0.1,'Sales');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (165,'David','SA_REP',147,CAST('08-02-23' AS DATE),6800,0.1,'Sales');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (166,'Sundar','SA_REP',147,CAST('08-03-24' AS DATE),6400,0.1,'Sales');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (167,'Amit','SA_REP',147,CAST('08-04-21' AS DATE),6200,0.1,'Sales');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (168,'Lisa','SA_REP',148,CAST('05-03-11' AS DATE),11500,0.25,'Sales');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (169,'Harrison','SA_REP',148,CAST('06-03-23' AS DATE),10000,0.2,'Sales');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (170,'Tayler','SA_REP',148,CAST('06-01-24' AS DATE),9600,0.2,'Sales');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (171,'William','SA_REP',148,CAST('07-02-23' AS DATE),7400,0.15,'Sales');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (172,'Elizabeth','SA_REP',148,CAST('07-03-24' AS DATE),7300,0.15,'Sales');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (173,'Sundita','SA_REP',148,CAST('08-04-21' AS DATE),6100,0.1,'Sales');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (174,'Ellen','SA_REP',149,CAST('04-05-11' AS DATE),11000,0.3,'Sales');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (175,'Alyssa','SA_REP',149,CAST('05-03-19' AS DATE),8800,0.25,'Sales');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (176,'Jonathon','SA_REP',149,CAST('06-03-24' AS DATE),8600,0.2,'Sales');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (177,'Jack','SA_REP',149,CAST('06-04-23' AS DATE),8400,0.2,'Sales');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (178,'Kimberely','SA_REP',149,CAST('07-05-24' AS DATE),7000,0.15,null);
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (179,'Charles','SA_REP',149,CAST('08-01-04' AS DATE),6200,0.1,'Sales');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (180,'Winston','SH_CLERK',120,CAST('06-01-24' AS DATE),3200,null,'Shipping');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (181,'Jean','SH_CLERK',120,CAST('06-02-23' AS DATE),3100,null,'Shipping');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (182,'Martha','SH_CLERK',120,CAST('07-06-21' AS DATE),2500,null,'Shipping');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (183,'Girard','SH_CLERK',120,CAST('08-02-03' AS DATE),2800,null,'Shipping');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (184,'Nandita','SH_CLERK',121,CAST('04-01-27' AS DATE),4200,null,'Shipping');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (185,'Alexis','SH_CLERK',121,CAST('05-02-20' AS DATE),4100,null,'Shipping');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (186,'Julia','SH_CLERK',121,CAST('06-06-24' AS DATE),3400,null,'Shipping');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (187,'Anthony','SH_CLERK',121,CAST('07-02-07' AS DATE),3000,null,'Shipping');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (188,'Kelly','SH_CLERK',122,CAST('05-06-14' AS DATE),3800,null,'Shipping');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (189,'Jennifer','SH_CLERK',122,CAST('05-08-13' AS DATE),3600,null,'Shipping');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (190,'Timothy','SH_CLERK',122,CAST('06-07-11' AS DATE),2900,null,'Shipping');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (191,'Randall','SH_CLERK',122,CAST('07-12-19' AS DATE),2500,null,'Shipping');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (192,'Sarah','SH_CLERK',123,CAST('04-02-04' AS DATE),4000,null,'Shipping');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (193,'Britney','SH_CLERK',123,CAST('05-03-03' AS DATE),3900,null,'Shipping');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (194,'Samuel','SH_CLERK',123,CAST('06-07-01' AS DATE),3200,null,'Shipping');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (195,'Vance','SH_CLERK',123,CAST('07-03-17' AS DATE),2800,null,'Shipping');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (196,'Alana','SH_CLERK',124,CAST('06-04-24' AS DATE),3100,null, null);
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (197,'Kevin','SH_CLERK',124,CAST('06-05-23' AS DATE),3000,null,'Shipping');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (198,'Donald','SH_CLERK',124,CAST('07-06-21' AS DATE),2600,null,'Shipping');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (199,'Douglas','SH_CLERK',124,CAST('08-01-13' AS DATE),2600,null,'Shipping');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (200,'Jenni%fer','AD_ASST',101,CAST('03-09-17' AS DATE),4400,null,'Administration');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (201,'Michael','MK_MAN',100,CAST('04-02-17' AS DATE),13000,null,'Marketing');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (202,'Pat','MK_REP',201,CAST('05-08-17' AS DATE),6000,null,'Marketing');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (203,'Susan','HR_REP',101,CAST('02-06-07' AS DATE),6500,null,'Human Resources');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (204,'Hermann','PR_REP',101,CAST('02-06-07' AS DATE),10000,null,'Public Relations');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (205,'Shelley','AC_MGR',101,CAST('02-06-07' AS DATE),12008,null,'Accounting');
INSERT INTO emp (emp_id,emp_name,job,mgr_id,hire_date,salary,comm_pct,dept_name) VALUES (206,'William','AC_ACCOUNT',205,CAST('02-06-07' AS DATE),8300,null,'Accounting');
commit;