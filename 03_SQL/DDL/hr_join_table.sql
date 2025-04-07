-- CREATE DATABASE hr_join;
USE  hr_join;

-- set foreign_key_checks=0;

-- ------------------------------------------------------
-- DDL FOR DEPT
-- 부서 테이블
-- ------------------------------------------------------
DROP TABLE IF EXISTS dept;
CREATE TABLE dept(
    dept_id 	INT PRIMARY KEY,
    dept_name 	VARCHAR(100) NOT NULL,
    loc 		VARCHAR(100) NOT NULL
);
INSERT INTO dept (dept_id,dept_name,loc) VALUES (10,'Administration','Seattle');
INSERT INTO dept (dept_id,dept_name,loc) VALUES (20,'Marketing','New York');
INSERT INTO dept (dept_id,dept_name,loc) VALUES (30,'Purchasing','Seattle');
INSERT INTO dept (dept_id,dept_name,loc) VALUES (40,'Human Resources','New York');
INSERT INTO dept (dept_id,dept_name,loc) VALUES (50,'Shipping','San Francisco');
INSERT INTO dept (dept_id,dept_name,loc) VALUES (60,'IT','San Francisco');
INSERT INTO dept (dept_id,dept_name,loc) VALUES (70,'Public Relations','New York');
INSERT INTO dept (dept_id,dept_name,loc) VALUES (80,'Sales','New York');
INSERT INTO dept (dept_id,dept_name,loc) VALUES (90,'Executive','Seattle');
INSERT INTO dept (dept_id,dept_name,loc) VALUES (100,'Finance','Seattle');
INSERT INTO dept (dept_id,dept_name,loc) VALUES (110,'Accounting','Seattle');
INSERT INTO dept (dept_id,dept_name,loc) VALUES (120,'Treasury','Seattle');
INSERT INTO dept (dept_id,dept_name,loc) VALUES (130,'Corporate Tax','Seattle');
INSERT INTO dept (dept_id,dept_name,loc) VALUES (140,'Control And Credit','Seattle');
INSERT INTO dept (dept_id,dept_name,loc) VALUES (150,'Shareholder Services','Seattle');
INSERT INTO dept (dept_id,dept_name,loc) VALUES (160,'Benefits','Seattle');
INSERT INTO dept (dept_id,dept_name,loc) VALUES (170,'Manufacturing','Seattle');
INSERT INTO dept (dept_id,dept_name,loc) VALUES (180,'Construction','Seattle');
INSERT INTO dept (dept_id,dept_name,loc) VALUES (190,'Contracting','Seattle');
INSERT INTO dept (dept_id,dept_name,loc) VALUES (200,'Operations','Seattle');
INSERT INTO dept (dept_id,dept_name,loc) VALUES (210,'IT Support','Seattle');
INSERT INTO dept (dept_id,dept_name,loc) VALUES (220,'NOC','Seattle');
INSERT INTO dept (dept_id,dept_name,loc) VALUES (230,'IT Helpdesk','Seattle');
INSERT INTO dept (dept_id,dept_name,loc) VALUES (240,'Government Sales','Seattle');
INSERT INTO dept (dept_id,dept_name,loc) VALUES (250,'Retail Sales','Seattle');
INSERT INTO dept (dept_id,dept_name,loc) VALUES (260,'Recruiting','Seattle');
INSERT INTO dept (dept_id,dept_name,loc) VALUES (270,'Payroll','Seattle');




-- ------------------------------------------------------
--  DDL for Table JOB
--  직원 업무 테이블
-- ------------------------------------------------------
DROP TABLE IF EXISTS job;
CREATE TABLE job(
    job_id 		VARCHAR(30) PRIMARY KEY,
    job_title 	VARCHAR(100) NOT NULL,
    min_salary 	DECIMAL(6) NOT NULL,
    max_salary 	DECIMAL(6) NOT NULL
);


INSERT INTO job (job_id,job_title,min_salary,max_salary) VALUES ('AD_PRES','President',20080,40000);
INSERT INTO job (job_id,job_title,min_salary,max_salary) VALUES ('AD_VP','Administration Vice President',15000,30000);
INSERT INTO job (job_id,job_title,min_salary,max_salary) VALUES ('AD_ASST','Administration Assistant',3000,6000);
INSERT INTO job (job_id,job_title,min_salary,max_salary) VALUES ('FI_MGR','Finance Manager',8200,16000);
INSERT INTO job (job_id,job_title,min_salary,max_salary) VALUES ('FI_ACCOUNT','Accountant',4200,9000);
INSERT INTO job (job_id,job_title,min_salary,max_salary) VALUES ('AC_MGR','Accounting Manager',8200,16000);
INSERT INTO job (job_id,job_title,min_salary,max_salary) VALUES ('AC_ACCOUNT','Public Accountant',4200,9000);
INSERT INTO job (job_id,job_title,min_salary,max_salary) VALUES ('SA_MAN','Sales Manager',10000,20080);
INSERT INTO job (job_id,job_title,min_salary,max_salary) VALUES ('SA_REP','Sales Representative',6000,12008);
INSERT INTO job (job_id,job_title,min_salary,max_salary) VALUES ('PU_MAN','Purchasing Manager',8000,15000);
INSERT INTO job (job_id,job_title,min_salary,max_salary) VALUES ('PU_CLERK','Purchasing Clerk',2500,5500);
INSERT INTO job (job_id,job_title,min_salary,max_salary) VALUES ('ST_MAN','Stock Manager',5500,8500);
INSERT INTO job (job_id,job_title,min_salary,max_salary) VALUES ('ST_CLERK','Stock Clerk',2008,5000);
INSERT INTO job (job_id,job_title,min_salary,max_salary) VALUES ('SH_CLERK','Shipping Clerk',2500,5500);
INSERT INTO job (job_id,job_title,min_salary,max_salary) VALUES ('IT_PROG','Programmer',4000,10000);
INSERT INTO job (job_id,job_title,min_salary,max_salary) VALUES ('MK_MAN','Marketing Manager',9000,15000);
INSERT INTO job (job_id,job_title,min_salary,max_salary) VALUES ('MK_REP','Marketing Representative',4000,9000);
INSERT INTO job (job_id,job_title,min_salary,max_salary) VALUES ('HR_REP','Human Resources Representative',4000,9000);
INSERT INTO job (job_id,job_title,min_salary,max_salary) VALUES ('PR_REP','Public Relations Representative',4500,10500);



-- ------------------------------------------------------
--  DDL for Table EMP 
--  직원 테이블
-- ------------------------------------------------------
DROP TABLE IF EXISTS emp;
CREATE TABLE emp(
    emp_id 	  INT PRIMARY KEY,
    emp_name  VARCHAR(20) NOT NULL,
    job_id 	  VARCHAR(30),
    mgr_id 	  INT,
    hire_date DATE NOT NULL,
    salary 	  DECIMAL(7,2) NOT NULL,
    comm_pct  DECIMAL(2,2),
    dept_id   INT,
    CONSTRAINT fk_emp_dept FOREIGN KEY(dept_id) REFERENCES dept(dept_id) ON DELETE SET NULL,
    CONSTRAINT fk_emp_job FOREIGN KEY(job_id) REFERENCES job(job_id) ON DELETE CASCADE,
    CONSTRAINT fk_emp_mgr FOREIGN KEY(mgr_id) REFERENCES emp(emp_id) ON DELETE SET NULL
);

INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (100,'Steven','AD_PRES',null,CAST('03-06-17' AS DATE),24000,null,90);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (101,'Neena','AD_VP',100,CAST('05-09-21' AS DATE),17000,null,90);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (102,'Lex','AD_VP',100,CAST('01-01-13' AS DATE),17000,null,90);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (103,'Alexander','IT_PROG',102,CAST('06-01-03' AS DATE),9000,null,60);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (104,'Bruce','IT_PROG',103,CAST('07-05-21' AS DATE),6000,null,60);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (105,'David','IT_PROG',103,CAST('05-06-25' AS DATE),4800,null,60);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (106,'Valli','IT_PROG',103,CAST('06-02-05' AS DATE),4800,null,60);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (107,'Diana','IT_PROG',103,CAST('07-02-07' AS DATE),4200,null,60);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (108,'Nancy','FI_MGR',101,CAST('02-08-17' AS DATE),12008,null,100);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (109,'Daniel','FI_ACCOUNT',108,CAST('02-08-16' AS DATE),9000,null,100);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (110,'John','FI_ACCOUNT',108,CAST('05-09-28' AS DATE),8200,null,100);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (111,'Ismael','FI_ACCOUNT',108,CAST('05-09-30' AS DATE),7700,null,100);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (112,'Jose Manuel','FI_ACCOUNT',108,CAST('06-03-07' AS DATE),7800,null,100);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (113,'Luis','FI_ACCOUNT',108,CAST('07-12-07' AS DATE),6900,null,100);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (114,'Den','PU_MAN',100,CAST('02-12-07' AS DATE),11000,null,30);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (115,'Alexander','PU_MAN',100,CAST('03-05-18' AS DATE),9100,null,30);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (116,'Shelli','PU_CLERK',114,CAST('05-12-24' AS DATE),2900,null,30);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (117,'Sigal','PU_CLERK',114,CAST('05-07-24' AS DATE),2800,null,30);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (118,'Guy','PU_CLERK',114,CAST('06-11-15' AS DATE),2600,null,30);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (119,'Karen','PU_CLERK',114,CAST('07-08-10' AS DATE),2500,null,30);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (120,'Matthew','ST_MAN',100,CAST('04-07-18' AS DATE),8000,null,50);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (121,'Adam','ST_MAN',100,CAST('04-07-18' AS DATE),8200,null,50);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (122,'Payam','ST_MAN',100,CAST('03-05-01' AS DATE),7900,null,50);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (123,'Shanta','ST_MAN',100,CAST('05-10-10' AS DATE),6500,null,50);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (124,'Kevin','ST_MAN',100,CAST('07-11-16' AS DATE),5800,null,50);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (125,'Julia','ST_CLERK',120,CAST('05-07-16' AS DATE),3200,null,50);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (126,'Irene','ST_CLERK',120,CAST('06-09-28' AS DATE),2700,null,50);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (127,'James','ST_CLERK',120,CAST('07-01-14' AS DATE),2400,null,50);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (128,'Steven','ST_CLERK',120,CAST('08-03-08' AS DATE),2200,null,50);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (129,'Laura','ST_CLERK',121,CAST('05-07-16' AS DATE),3300,null,50);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (130,'Mozhe',null,121,CAST('05-07-16' AS DATE),2800,null,50);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (131,'James',null,121,CAST('05-02-16' AS DATE),2500,null,50);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (132,'TJ','ST_CLERK',121,CAST('07-04-10' AS DATE),2100,null,50);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (133,'Jason','ST_CLERK',122,CAST('04-06-14' AS DATE),3300,null,50);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (134,'Michael','ST_CLERK',122,CAST('06-08-26' AS DATE),2900,null,50);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (135,'Ki','ST_CLERK',122,CAST('07-12-12' AS DATE),2400,null,50);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (136,'Hazel','ST_CLERK',122,CAST('08-02-06' AS DATE),2200,null,50);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (137,'Renske','ST_CLERK',123,CAST('03-07-14' AS DATE),3600,null,50);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (138,'Stephen','ST_CLERK',123,CAST('05-10-26' AS DATE),3200,null,50);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (139,'John','ST_CLERK',123,CAST('08-02-06' AS DATE),2700,null,50);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (140,'Joshua',null,123,CAST('08-02-06' AS DATE),2500,null,50);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (141,'Trenna','ST_CLERK',124,CAST('03-10-17' AS DATE),3500,null,50);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (142,'Curtis','ST_CLERK',124,CAST('05-01-29' AS DATE),3100,null,50);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (143,'Randall','ST_CLERK',124,CAST('06-03-15' AS DATE),2600,null,50);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (144,'Peter','ST_CLERK',124,CAST('06-07-09' AS DATE),2500,null,50);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (145,'John','SA_MAN',100,CAST('04-10-01' AS DATE),14000,0.4,80);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (146,'Karen','SA_MAN',100,CAST('04-10-01' AS DATE),13500,0.3,80);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (147,'Alberto','SA_MAN',100,CAST('05-03-10' AS DATE),12000,0.3,80);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (148,'Gerald','SA_MAN',100,CAST('07-10-15' AS DATE),11000,0.3,80);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (149,'Eleni','SA_MAN',100,CAST('07-10-15' AS DATE),10500,0.2,80);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (150,'Peter','SA_REP',145,CAST('07-10-15' AS DATE),10000,0.3,80);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (151,'David','SA_REP',145,CAST('05-03-24' AS DATE),9500,0.25,80);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (152,'Peter','SA_REP',145,CAST('05-08-20' AS DATE),9000,0.25,80);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (153,'Christopher','SA_REP',145,CAST('06-03-30' AS DATE),8000,0.2,80);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (154,'Nanette','SA_REP',145,CAST('06-12-09' AS DATE),7500,0.2,80);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (155,'Oliver','SA_REP',145,CAST('07-11-23' AS DATE),7000,0.15,80);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (156,'Janette','SA_REP',146,CAST('04-01-30' AS DATE),10000,0.35,80);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (157,'Patrick','SA_REP',146,CAST('04-03-04' AS DATE),9500,0.35,80);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (158,'Allan','SA_REP',146,CAST('04-08-01' AS DATE),9000,0.35,80);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (159,'Lindsey','SA_REP',146,CAST('05-03-10' AS DATE),8000,0.3,80);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (160,'Louise','SA_REP',146,CAST('05-12-15' AS DATE),7500,0.3,80);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (161,'Sarath','SA_REP',146,CAST('06-11-03' AS DATE),7000,0.25,80);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (162,'Clara','SA_REP',147,CAST('05-11-11' AS DATE),10500,0.25,80);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (163,'Danielle','SA_REP',147,CAST('07-03-19' AS DATE),9500,0.15,80);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (164,'Mattea','SA_REP',147,CAST('08-01-24' AS DATE),7200,0.1,80);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (165,'David','SA_REP',147,CAST('08-02-23' AS DATE),6800,0.1,80);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (166,'Sundar','SA_REP',147,CAST('08-03-24' AS DATE),6400,0.1,80);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (167,'Amit','SA_REP',147,CAST('08-04-21' AS DATE),6200,0.1,80);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (168,'Lisa','SA_REP',148,CAST('05-03-11' AS DATE),11500,0.25,80);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (169,'Harrison','SA_REP',148,CAST('06-03-23' AS DATE),10000,0.2,80);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (170,'Tayler','SA_REP',148,CAST('06-01-24' AS DATE),9600,0.2,80);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (171,'William','SA_REP',148,CAST('07-02-23' AS DATE),7400,0.15,80);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (172,'Elizabeth','SA_REP',148,CAST('07-03-24' AS DATE),7300,0.15,80);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (173,'Sundita','SA_REP',148,CAST('08-04-21' AS DATE),6100,0.1,80);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (174,'Ellen','SA_REP',149,CAST('04-05-11' AS DATE),11000,0.3,80);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (175,'Alyssa','SA_REP',149,CAST('05-03-19' AS DATE),8800,0.25,null);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (176,'Jonathon','SA_REP',149,CAST('06-03-24' AS DATE),8600,0.2,80);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (177,'Jack','SA_REP',149,CAST('06-04-23' AS DATE),8400,0.2,80);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (178,'Kimberely','SA_REP',149,CAST('07-05-24' AS DATE),7000,0.15,null);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (179,'Charles','SA_REP',149,CAST('08-01-04' AS DATE),6200,0.1,80);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (180,'Winston','SH_CLERK',120,CAST('06-01-24' AS DATE),3200,null,50);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (181,'Jean','SH_CLERK',120,CAST('06-02-23' AS DATE),3100,null,50);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (182,'Martha','SH_CLERK',120,CAST('07-06-21' AS DATE),2500,null,50);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (183,'Girard','SH_CLERK',120,CAST('08-02-03' AS DATE),2800,null,null);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (184,'Nandita','SH_CLERK',121,CAST('04-01-27' AS DATE),4200,null,null);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (185,'Alexis','SH_CLERK',121,CAST('05-02-20' AS DATE),4100,null,null);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (186,'Julia','SH_CLERK',121,CAST('06-06-24' AS DATE),3400,null,50);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (187,'Anthony',null,121,CAST('07-02-07' AS DATE),3000,null,50);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (188,'Kelly','SH_CLERK',122,CAST('05-06-14' AS DATE),3800,null,50);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (189,'Jennifer','SH_CLERK',122,CAST('05-08-13' AS DATE),3600,null,50);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (190,'Timothy',null,122,CAST('06-07-11' AS DATE),2900,null,50);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (191,'Randall',null,122,CAST('07-06-21' AS DATE),2500,null,50);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (192,'Sarah','SH_CLERK',123,CAST('04-02-04' AS DATE),4000,null,50);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (193,'Britney','SH_CLERK',123,CAST('05-03-03' AS DATE),3900,null,50);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (194,'Samuel','SH_CLERK',123,CAST('07-06-21' AS DATE),3200,null,50);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (195,'Vance','SH_CLERK',123,CAST('07-06-21' AS DATE),2800,null,50);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (196,'Alana','SH_CLERK',124,CAST('06-04-24' AS DATE),3100,null,50);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (197,'Kevin','SH_CLERK',124,CAST('06-05-23' AS DATE),3000,null,50);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (198,'Donald','SH_CLERK',124,CAST('07-06-21' AS DATE),2600,null,50);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (199,'Douglas','SH_CLERK',124,CAST('07-06-21' AS DATE),2600,null,50);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (200,'Jennifer','AD_ASST',101,CAST('03-09-17' AS DATE),4400,null,10);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (201,'Michael','MK_MAN',100,CAST('04-02-17' AS DATE),13000,null,20);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (202,'Pat','MK_REP',201,CAST('05-08-17' AS DATE),6000,null,20);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (203,'Susan','HR_REP',101,CAST('02-06-07' AS DATE),6500,null,40);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (204,'Hermann','PR_REP',101,CAST('02-06-07' AS DATE),10000,null,70);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (205,'Shelley','AC_MGR',101,CAST('02-06-07' AS DATE),12008,null,110);
INSERT INTO emp (emp_id,emp_name,job_id,mgr_id,hire_date,salary,comm_pct,dept_id) VALUES (206,'William','AC_ACCOUNT',205,CAST('02-06-07' AS DATE),8300,null,110);


-- ------------------------------------------------------
--  DDL for Table SALARY_GRADE 
--  급여 등급 테이블
-- ------------------------------------------------------
DROP TABLE  IF EXISTS salary_grade;
CREATE TABLE salary_grade(
    grade 	 TINYINT,
    low_sal  DECIMAL(7,2),
    high_sal DECIMAL(7,2)
);

INSERT INTO salary_grade (grade,low_sal,high_sal) VALUES (1, 0, 5000);
INSERT INTO salary_grade (grade,low_sal,high_sal) VALUES (2, 5001, 10000);
INSERT INTO salary_grade (grade,low_sal,high_sal) VALUES (3, 10001, 15000);
INSERT INTO salary_grade (grade,low_sal,high_sal) VALUES (4, 15001, 20000);
INSERT INTO salary_grade (grade,low_sal,high_sal) VALUES (5, 20001, 99999);

COMMIT;

show databases;
use hr_join;
show tables;


