create database demo;
use demo;

drop table EMPLOYEES;
drop table BRANCH;
drop table TRANSACTIONS;
drop table ACCOUNTS;
drop table CUSTOMERS;


CREATE TABLE BRANCH
(
	BRANCH_NAME	 	varchar(50),
	BRANCH_CODE		varchar(10) unique
);
insert into BRANCH values ('Bangalore', 'BR1');
insert into BRANCH values ('Mumbai', 'BR2');
insert into BRANCH values ('Delhi', 'BR3');



CREATE TABLE CUSTOMERS
(
	CUSTOMER_ID		varchar(20) primary key,
	FIRST_NAME		varchar(50) not null,
	LAST_NAME		varchar(50) not null,
	PHONE_NO		bigint,
	ADDRESS			varchar(50),
	DOB				date,
	IS_ACTIVE		VARCHAR(5)
);
insert into CUSTOMERS (customer_id, first_name, last_name, phone_no, address, dob, is_active) values ('C1', 'Lek', 'Toon'				, null, '77 Lien Park', str_to_date('19-09-1984','%d-%m-%Y'), 'true');
insert into CUSTOMERS (customer_id, first_name, last_name, phone_no, address, dob, is_active) values ('C2', 'Sumner', 'Pattisson'		, null, '795 Pleasure Parkway', str_to_date('12-02-1993','%d-%m-%Y'), 'false');
insert into CUSTOMERS (customer_id, first_name, last_name, phone_no, address, dob, is_active) values ('C3', 'Davis', 'Pendall'			, null, '3 Crowley Circle', str_to_date('30-12-2003','%d-%m-%Y'), 'false');
insert into CUSTOMERS (customer_id, first_name, last_name, phone_no, address, dob, is_active) values ('C4', 'Giustino', 'Fitzpatrick'	, 9367362391, '60976 Brentwood Court', str_to_date('14-10-1996','%d-%m-%Y'), 'true');
insert into CUSTOMERS (customer_id, first_name, last_name, phone_no, address, dob, is_active) values ('C5', 'Kristina', 'Klass'			, 8522356084, '6 Kinsman Parkway', str_to_date('20-03-1987','%d-%m-%Y'), 'true');
insert into CUSTOMERS (customer_id, first_name, last_name, phone_no, address, dob, is_active) values ('C6', 'Catlaina', 'Mickleburgh'	, 3008875730, '21 Del Sol Street', str_to_date('11-06-2005','%d-%m-%Y'), 'false');
insert into CUSTOMERS (customer_id, first_name, last_name, phone_no, address, dob, is_active) values ('C7', 'Rici', 'Mennithorp'		, 2374344413, '85855 Armistice Plaza', str_to_date('24-03-1979','%d-%m-%Y'), 'false');
insert into CUSTOMERS (customer_id, first_name, last_name, phone_no, address, dob, is_active) values ('C8', 'Ange', 'Grima'				, 6127010594, '5 Dovetail Alley', str_to_date('16-03-1977','%d-%m-%Y'), 'true');
insert into CUSTOMERS (customer_id, first_name, last_name, phone_no, address, dob, is_active) values ('C9', 'Dorothee', 'Bartaletti'	, 1727371190, '24 Old Gate Parkway', str_to_date('23-09-1990','%d-%m-%Y'), 'true');
insert into CUSTOMERS (customer_id, first_name, last_name, phone_no, address, dob, is_active) values ('C10', 'Valerye', 'Beevers'		, 7363360961, '337 Westend Park', str_to_date('14-08-2009','%d-%m-%Y'), 'true');
insert into CUSTOMERS (customer_id, first_name, last_name, phone_no, address, dob, is_active) values ('C11', 'Jerrie', 'Dinsdale'		, 9887254066, '33126 Westport Court', str_to_date('15-10-1976','%d-%m-%Y'), 'true');
insert into CUSTOMERS (customer_id, first_name, last_name, phone_no, address, dob, is_active) values ('C12', 'Hildegarde', 'Haversum'	, 6854737765, '53445 Merrick Park', str_to_date('27-09-1993','%d-%m-%Y'), 'false');
insert into CUSTOMERS (customer_id, first_name, last_name, phone_no, address, dob, is_active) values ('C13', 'Bert', 'Imrie'			, 6199165811, '9 Troy Plaza', str_to_date('30-06-2001','%d-%m-%Y'), 'false');
insert into CUSTOMERS (customer_id, first_name, last_name, phone_no, address, dob, is_active) values ('C14', 'Thadeus', 'Tomlins'		, 1206368475, '59397 Park Meadow Crossing', str_to_date('30-08-1985','%d-%m-%Y'), 'false');
insert into CUSTOMERS (customer_id, first_name, last_name, phone_no, address, dob, is_active) values ('C15', 'Nye', 'Scough'			, 2517795795, '423 Barnett Avenue', str_to_date('07-05-1995','%d-%m-%Y'), 'true');
insert into CUSTOMERS (customer_id, first_name, last_name, phone_no, address, dob, is_active) values ('C16', 'Celina', 'Dunsford'		, 6278068010, '51 Onsgard Alley', str_to_date('02-04-2006','%d-%m-%Y'), 'false');
insert into CUSTOMERS (customer_id, first_name, last_name, phone_no, address, dob, is_active) values ('C17', 'Isahella', 'Sieb'			, 4978614436, '97 Leroy Junction', str_to_date('19-10-2004','%d-%m-%Y'), 'true');
insert into CUSTOMERS (customer_id, first_name, last_name, phone_no, address, dob, is_active) values ('C18', 'Donni', 'O''Geaney'		, 3602688299, '828 Elgar Circle', str_to_date('21-08-2009','%d-%m-%Y'), 'false');
insert into CUSTOMERS (customer_id, first_name, last_name, phone_no, address, dob, is_active) values ('C19', 'Eal', 'Darracott'			, 8448973419, null, str_to_date('10-01-1983','%d-%m-%Y'), 'true');
insert into CUSTOMERS (customer_id, first_name, last_name, phone_no, address, dob, is_active) values ('C20', 'Sheridan', 'McLauchlin'	, 8196363516, null, str_to_date('23-10-2002','%d-%m-%Y'), 'true');



CREATE TABLE ACCOUNTS
(
	ACCOUNT_NUMBER	bigint,
	ACC_TYPE		varchar(30) check ( ACC_TYPE in ('Loan', 'Saving')),
	CUST_ID			varchar(20),
	BALANCE			float,
	constraint pk_acc primary key (account_number),
	constraint fk_acc foreign key (CUST_ID) references CUSTOMERS(CUSTOMER_ID)
);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('6289453270', 'Loan', 'C1', 2874.58);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('8255785809', 'Loan', 'C2', 2532.78);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('1383070946', 'Loan', 'C3', 8009.54);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('2267654474', 'Loan', 'C4', 9814.26);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('5400385133', 'Loan', 'C5', 9396.81);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('3974889965', 'Loan', 'C6', 2349.63);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('6403346954', 'Loan', 'C7', 1371.6);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('8708549982', 'Loan', 'C8', 8189.96);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('6299090537', 'Loan', 'C9', 2972.0);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('1491662867', 'Loan', 'C10', 4260.04);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('1521706867', 'Loan', 'C11', 3080.0);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('6587734839', 'Saving', 'C1', 1346.96);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('2092817094', 'Saving', 'C2', 2031.2);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('2580199705', 'Saving', 'C3', 1055.77);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('7862023358', 'Saving', 'C4', 2069.9);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('4638491936', 'Saving', 'C5', 9818.11);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('6733916576', 'Loan'  , 'C6', 8316.07);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('8486955106', 'Loan'  , 'C7', 1582.88);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('9387408280', 'Saving', 'C8', 1115.21);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('1863261443', 'Saving', 'C9', 4359.38);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('1382248490', 'Saving', 'C10', 9461.36);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('8008321776', 'Saving', 'C11', 5942.79);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('9764163009', 'Saving', 'C1', 3938.61);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('9440547588', 'Saving', 'C2', 8232.14);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('2714833160', 'Saving', 'C3', 5652.45);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('5135729496', 'Saving', 'C4', 2293.91);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('9412312938', 'Saving', 'C5', 8635.89);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('7615996074', 'Saving', 'C6', 2885.43);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('1550162470', 'Saving', 'C7', 5080.78);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('2073094945', 'Saving', 'C8', 3728.21);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('7744898974', 'Saving', 'C9', 8018.71);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('7064909391', 'Saving', 'C10', 5063.15);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('0952859211', 'Saving', 'C11', 2207.28);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('4493404558', 'Saving', 'C1', 4696.83);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('5061290097', 'Saving', 'C2', 4282.88);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('2469964156', 'Saving', 'C3', 1582.04);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('9606564320', 'Saving', 'C4', 7133.19);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('3758428041', 'Saving', 'C5', 5192.14);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('9916580456', 'Saving', 'C6', 8949.27);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('1451748736', 'Saving', 'C7', 5328.45);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('2219666972', 'Saving', 'C8', 7482.08);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('5772879480', 'Saving', 'C9', 9026.88);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('9045383136', 'Saving', 'C10', 9909.49);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('4407102047', 'Saving', 'C11', 7084.61);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('5363706210', 'Loan', 'C12', 3297.18);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('3397963672', 'Loan', 'C13', 6486.43);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('7438544044', 'Loan', 'C14', 2847.38);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('0074134418', 'Loan', 'C15', 3782.35);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('9446194067', 'Loan', 'C16', 1690.48);
insert into ACCOUNTS (account_number, acc_type, cust_id, balance) values ('0527351539', 'Loan', 'C17', 9190.9);



CREATE TABLE TRANSACTIONS
(
	TRNS_ID			int primary key,
	TRNS_TYPE		varchar(20) check (TRNS_TYPE in ('wire transfer', 'card transaction', 'net banking')),
	TRNS_DATE		date,
	ACC_NUMBER		bigint references ACCOUNTS(account_number),
	AMOUNT			float,
	STATUS			varchar(10)
);
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (1, 'wire transfer', str_to_date('14-07-2018','%d-%m-%Y'), '6289453270', 7347.05, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (2, 'wire transfer', str_to_date('23-01-2019','%d-%m-%Y'), '8255785809', 7631.67, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (3, 'wire transfer', str_to_date('22-07-2019','%d-%m-%Y'), '1383070946', 5789.49, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (4, 'wire transfer', str_to_date('06-03-2020','%d-%m-%Y'), '2267654474', 8133.63, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (5, 'wire transfer', str_to_date('04-12-2020','%d-%m-%Y'), '5400385133', 1964.31, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (6, 'wire transfer', str_to_date('20-05-2019','%d-%m-%Y'), '3974889965', 5526.74, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (7, 'wire transfer', str_to_date('11-06-2021','%d-%m-%Y'), '6403346954', 2676.6, 'Failure');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (8, 'wire transfer', str_to_date('21-01-2022','%d-%m-%Y'), '8708549982', 7019.54, 'Failure');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (9, 'wire transfer', str_to_date('17-08-2019','%d-%m-%Y'), '6299090537', 5510.16, 'Failure');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (10, 'wire transfer', str_to_date('14-06-2018','%d-%m-%Y'), '6289453270', 5025.17, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (11, 'wire transfer', str_to_date('24-06-2021','%d-%m-%Y'), '8255785809', 3348.28, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (12, 'wire transfer', str_to_date('28-09-2020','%d-%m-%Y'), '1383070946', 1102.01, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (13, 'wire transfer', str_to_date('06-09-2019','%d-%m-%Y'), '2267654474', 7147.56, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (14, 'wire transfer', str_to_date('23-10-2020','%d-%m-%Y'), '5400385133', 8319.93, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (15, 'wire transfer', str_to_date('03-03-2021','%d-%m-%Y'), '3974889965', 5251.65, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (16, 'wire transfer', str_to_date('18-07-2021','%d-%m-%Y'), '6403346954', 990.44, 'Failure');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (17, 'wire transfer', str_to_date('07-02-2022','%d-%m-%Y'), '8708549982', 9968.53, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (18, 'wire transfer', str_to_date('23-12-2020','%d-%m-%Y'), '6299090537', 5185.95, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (19, 'wire transfer', str_to_date('27-05-2018','%d-%m-%Y'), '6289453270', 4905.59, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (20, 'wire transfer', str_to_date('11-09-2021','%d-%m-%Y'), '8255785809', 5724.57, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (21, 'wire transfer', str_to_date('09-09-2018','%d-%m-%Y'), '1383070946', 6758.14, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (22, 'wire transfer', str_to_date('29-06-2021','%d-%m-%Y'), '2267654474', 1580.35, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (23, 'wire transfer', str_to_date('16-04-2019','%d-%m-%Y'), '5400385133', 9257.56, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (24, 'wire transfer', str_to_date('16-01-2021','%d-%m-%Y'), '3974889965', 3052.79, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (25, 'wire transfer', str_to_date('26-02-2021','%d-%m-%Y'), '6403346954', 3979.84, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (26, 'wire transfer', str_to_date('07-11-2018','%d-%m-%Y'), '8708549982', 3523.26, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (27, 'wire transfer', str_to_date('24-04-2021','%d-%m-%Y'), '6299090537', 5251.33, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (28, 'wire transfer', str_to_date('22-01-2022','%d-%m-%Y'), '6403346954', 9831.74, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (29, 'wire transfer', str_to_date('13-04-2022','%d-%m-%Y'), '8708549982', 1820.21, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (30, 'wire transfer', str_to_date('26-09-2021','%d-%m-%Y'), '6299090537', 2350.93, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (31, 'card transaction', str_to_date('14-01-2020','%d-%m-%Y'), '6289453270', 5843.31, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (32, 'card transaction', str_to_date('24-11-2018','%d-%m-%Y'), '8255785809', 6985.34, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (33, 'card transaction', str_to_date('05-04-2020','%d-%m-%Y'), '1383070946', 4616.93, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (34, 'card transaction', str_to_date('25-02-2021','%d-%m-%Y'), '2267654474', 3795.26, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (35, 'card transaction', str_to_date('18-07-2018','%d-%m-%Y'), '5400385133', 3840.74, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (36, 'card transaction', str_to_date('17-05-2018','%d-%m-%Y'), '3974889965', 7291.23, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (37, 'card transaction', str_to_date('03-01-2019','%d-%m-%Y'), '6403346954', 8070.38, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (38, 'card transaction', str_to_date('22-09-2020','%d-%m-%Y'), '8708549982', 4298.85, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (39, 'card transaction', str_to_date('23-12-2019','%d-%m-%Y'), '6299090537', 112.95, 'Failure');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (40, 'card transaction', str_to_date('14-07-2021','%d-%m-%Y'), '6289453270', 8730.59, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (41, 'card transaction', str_to_date('18-10-2020','%d-%m-%Y'), '8255785809', 4571.77, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (42, 'card transaction', str_to_date('29-11-2019','%d-%m-%Y'), '1383070946', 4069.17, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (43, 'card transaction', str_to_date('30-09-2020','%d-%m-%Y'), '2267654474', 6894.14, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (44, 'card transaction', str_to_date('17-10-2021','%d-%m-%Y'), '5400385133', 5855.87, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (45, 'card transaction', str_to_date('23-08-2021','%d-%m-%Y'), '3974889965', 1733.8, 'Failure');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (46, 'card transaction', str_to_date('02-06-2019','%d-%m-%Y'), '6403346954', 1705.12, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (47, 'card transaction', str_to_date('20-11-2021','%d-%m-%Y'), '8708549982', 4803.62, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (48, 'card transaction', str_to_date('28-05-2019','%d-%m-%Y'), '6299090537', 575.7, 'Failure');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (49, 'card transaction', str_to_date('03-04-2022','%d-%m-%Y'), '6403346954', 9118.6, 'Failure');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (50, 'card transaction', str_to_date('16-01-2021','%d-%m-%Y'), '8708549982', 4363.44, 'Failure');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (51, 'card transaction', str_to_date('15-12-2021','%d-%m-%Y'), '6299090537', 7068.97, 'Failure');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (52, 'card transaction', str_to_date('31-05-2021','%d-%m-%Y'), '8708549982', 225.78, 'Failure');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (53, 'card transaction', str_to_date('17-10-2020','%d-%m-%Y'), '6299090537', 7451.67, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (54, 'card transaction', str_to_date('10-10-2018','%d-%m-%Y'), '6289453270', 7579.92, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (55, 'card transaction', str_to_date('11-01-2020','%d-%m-%Y'), '8255785809', 7724.39, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (56, 'card transaction', str_to_date('21-09-2018','%d-%m-%Y'), '1383070946', 487.45, 'Failure');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (57, 'card transaction', str_to_date('04-09-2020','%d-%m-%Y'), '2267654474', 9891.71, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (58, 'card transaction', str_to_date('22-10-2020','%d-%m-%Y'), '5400385133', 9687.76, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (59, 'card transaction', str_to_date('16-12-2021','%d-%m-%Y'), '3974889965', 691.44, 'Failure');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (60, 'card transaction', str_to_date('03-11-2018','%d-%m-%Y'), '6403346954', 8110.8, 'Failure');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (61, 'card transaction', str_to_date('22-01-2021','%d-%m-%Y'), '8708549982', 423.92, 'Failure');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (62, 'card transaction', str_to_date('30-10-2018','%d-%m-%Y'), '6299090537', 4218.41, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (63, 'card transaction', str_to_date('03-12-2018','%d-%m-%Y'), '6403346954', 1554.54, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (64, 'card transaction', str_to_date('03-03-2019','%d-%m-%Y'), '8708549982', 9285.01, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (65, 'card transaction', str_to_date('26-05-2020','%d-%m-%Y'), '6299090537', 8526.63, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (66, 'net banking', str_to_date('22-09-2018','%d-%m-%Y'), '8708549982', 4439.75, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (67, 'net banking', str_to_date('27-06-2019','%d-%m-%Y'), '6299090537', 2798.49, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (68, 'net banking', str_to_date('05-04-2022','%d-%m-%Y'), '6289453270', 257.85, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (69, 'net banking', str_to_date('02-06-2019','%d-%m-%Y'), '8255785809', 1987.21, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (70, 'net banking', str_to_date('20-12-2021','%d-%m-%Y'), '1383070946', 2606.75, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (71, 'net banking', str_to_date('19-09-2019','%d-%m-%Y'), '2267654474', 8421.81, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (72, 'net banking', str_to_date('30-01-2022','%d-%m-%Y'), '5400385133', 6534.39, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (73, 'net banking', str_to_date('12-11-2021','%d-%m-%Y'), '3974889965', 314.66, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (74, 'net banking', str_to_date('20-11-2019','%d-%m-%Y'), '6403346954', 5745.87, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (75, 'net banking', str_to_date('20-06-2019','%d-%m-%Y'), '8708549982', 2326.79, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (76, 'net banking', str_to_date('03-06-2019','%d-%m-%Y'), '6299090537', 8429.95, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (77, 'net banking', str_to_date('21-09-2018','%d-%m-%Y'), '6403346954', 4997.55, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (78, 'net banking', str_to_date('14-01-2020','%d-%m-%Y'), '8708549982', 7981.15, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (79, 'net banking', str_to_date('01-07-2018','%d-%m-%Y'), '6299090537', 3087.72, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (80, 'net banking', str_to_date('10-05-2018','%d-%m-%Y'), '8708549982', 846.52, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (81, 'net banking', str_to_date('09-09-2019','%d-%m-%Y'), '6299090537', 261.76, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (82, 'net banking', str_to_date('15-06-2019','%d-%m-%Y'), '6289453270', 2462.37, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (83, 'net banking', str_to_date('29-07-2019','%d-%m-%Y'), '8255785809', 2269.8, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (84, 'net banking', str_to_date('29-01-2022','%d-%m-%Y'), '1383070946', 6421.11, 'Failure');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (85, 'net banking', str_to_date('13-07-2021','%d-%m-%Y'), '2267654474', 1175.51, 'Failure');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (86, 'net banking', str_to_date('12-10-2019','%d-%m-%Y'), '5400385133', 3911.67, 'Failure');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (87, 'net banking', str_to_date('09-09-2021','%d-%m-%Y'), '3974889965', 9162.73, 'Failure');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (88, 'net banking', str_to_date('21-10-2018','%d-%m-%Y'), '6403346954', 8920.94, 'Failure');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (89, 'net banking', str_to_date('20-07-2020','%d-%m-%Y'), '8708549982', 2594.83, 'Failure');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (90, 'net banking', str_to_date('25-04-2020','%d-%m-%Y'), '6299090537', 532.14, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (91, 'net banking', str_to_date('09-05-2018','%d-%m-%Y'), '6403346954', 4121.73, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (92, 'net banking', str_to_date('11-04-2022','%d-%m-%Y'), '8708549982', 6430.8, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (93, 'net banking', str_to_date('31-08-2019','%d-%m-%Y'), '6299090537', 7620.84, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (94, 'net banking', str_to_date('27-11-2018','%d-%m-%Y'), '6403346954', 9879.47, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (95, 'net banking', str_to_date('19-07-2018','%d-%m-%Y'), '8708549982', 6154.39, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (96, 'net banking', str_to_date('03-03-2020','%d-%m-%Y'), '6299090537', 9359.08, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (97, 'net banking', str_to_date('24-09-2018','%d-%m-%Y'), '6403346954', 3313.84, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (98, 'net banking', str_to_date('02-01-2020','%d-%m-%Y'), '8708549982', 3514.75, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (99, 'net banking', str_to_date('23-01-2021','%d-%m-%Y'), '6299090537', 1873.3, 'Success');
insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_number, amount, status) values (100, 'net banking', str_to_date('28-05-2019','%d-%m-%Y'), '6299090537', 7601.38, 'Success');



CREATE TABLE EMPLOYEES
(
	EMP_ID			varchar(20) primary key,
	FIRST_NAME		varchar(50) not null,
	LAST_NAME		varchar(50) not null,
	SALARY			float ,
	BRANCH_CODE		varchar(10) references BRANCH(branch_code)
);

insert into EMPLOYEES (emp_id, first_name, last_name, salary, BRANCH_code) values ('E1', 'Jelene', 'Diggin', 39000, 'BR1');
insert into EMPLOYEES (emp_id, first_name, last_name, salary, BRANCH_code) values ('E2', 'Nettle', 'Crofts', 66000, 'BR1');
insert into EMPLOYEES (emp_id, first_name, last_name, salary, BRANCH_code) values ('E3', 'Bobbie', 'Fenby', 65000, 'BR1');
insert into EMPLOYEES (emp_id, first_name, last_name, salary, BRANCH_code) values ('E4', 'Magdalene', 'Ashelford', 88000, 'BR1');
insert into EMPLOYEES (emp_id, first_name, last_name, salary, BRANCH_code) values ('E5', 'Raleigh', 'McGiffie', 91000, 'BR1');
insert into EMPLOYEES (emp_id, first_name, last_name, salary, BRANCH_code) values ('E6', 'Corina', 'McNuff', 30000, 'BR1');
insert into EMPLOYEES (emp_id, first_name, last_name, salary, BRANCH_code) values ('E7', 'Carlotta', 'McWard', 26000, 'BR2');
insert into EMPLOYEES (emp_id, first_name, last_name, salary, BRANCH_code) values ('E8', 'Kiah', 'Devoy', 70000, 'BR2');
insert into EMPLOYEES (emp_id, first_name, last_name, salary, BRANCH_code) values ('E9', 'Theodor', 'Yegorov', 83000, 'BR1');
insert into EMPLOYEES (emp_id, first_name, last_name, salary, BRANCH_code) values ('E10', 'Meredith', 'Raincin', 92000, 'BR1');

commit;

