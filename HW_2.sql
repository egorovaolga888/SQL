create table employees (
id serial primary key,
employee_name varchar (50) not null
);

insert into employees (employee_name)
values ('Olga_1'),('Olga_2'),('Olga_3'),('Olga_4'),('Olga_5'),('Olga_6'),('Olga_7'),('Olga_8'),('Olga_9'),('Olga_10'),
('Olga_11'),('Olga_12'),('Olga_13'),('Olga_14'),('Olga_15'),('Olga_16'),('Olga_17'),('Olga_18'),('Olga_19'),('Olga_20'),
('Olga_21'),('Olga_22'),('Olga_23'),('Olga_24'),('Olga_25'),('Olga_26'),('Olga_27'),('Olga_28'),('Olga_29'),('Olga_30'),
('Olga_31'),('Olga_32'),('Olga_33'),('Olga_34'),('Olga_35'),('Olga_36'),('Olga_37'),('Olga_38'),('Olga_39'),('Olga_40'),
('Olga_41'),('Olga_42'),('Olga_43'),('Olga_44'),('Olga_45'),('Olga_46'),('Olga_47'),('Olga_48'),('Olga_49'),('Olga_50'),
('Olga_51'),('Olga_52'),('Olga_53'),('Olga_54'),('Olga_55'),('Olga_56'),('Olga_57'),('Olga_58'),('Olga_59'),('Olga_60'),
('Olga_61'),('Olga_62'),('Olga_63'),('Olga_64'),('Olga_65'),('Olga_66'),('Olga_67'),('Olga_68'),('Olga_69'),('Olga_70');

create table msalary (
id serial primary key,
monthly_salary int not null
);

insert into msalary (monthly_salary)
values (1000),(1100),(1200),(1300),(1400),(1500),(1600),(1700),
       (1800),(1900),(2000),(2100),(2200),(2300),(2400),(2500);

create table employee_salary(
id serial primary key,
employee_id int unique not null,
salary_id int not null
);


insert into employee_salary (employee_id, salary_id) /* заполнить таблицу существующими значениямии */
values (3, 7), (1, 4),(5, 9),(40, 13),(23, 4),(11, 2),(52, 10),(15, 13),(26, 4),(16, 1),(33, 7),(2, 1),
(4, 16),(6, 2),(7, 15),(8, 3),(9, 14),(10, 4),(12, 13),(13, 5),(14, 12),(17, 6),(18, 11),(19, 7),(20, 10),
(21, 8),(22, 9),(27, 13),(24, 16),(25, 1);
insert into employee_salary (employee_id, salary_id)/* заполнить таблицу несуществующими employee_id */
values (101, 1),(102, 16),(103, 2),(104, 15),(105, 3),(106, 14),(107, 4),(108, 13),(109, 5),(110, 12);

create table r_roles (
id serial primary key,
role_name int not null unique
);

alter table r_roles
alter column role_name type varchar(30);

insert into r_roles (role_name)
values ('Junior Python developer'),('Middle Python developer'),('Senior Python developer'),('Junior Java developer'),
('Middle Java developer'),('Senior Java developer'),('Junior JavaScript developer'),('Middle JavaScript developer'),
('Senior JavaScript developer'),('Junior Manual QA engineer'),('Middle Manual QA engineer'),('Senior Manual QA engineer'),
('Project Manager'),('Designer'),('HR'),('CEO'),('Sales manager'),('Junior Automation QA engineer'),('Middle Automation QA engineer'),
('Senior Automation QA engineer');

create table roles_employee (
id serial primary key,
employee_id int not null unique,
role_id int not null,
foreign key (employee_id)
	references employees (id),
foreign key (role_id)
	references r_roles (id)
);


insert into roles_employee (employee_id, role_id)
values (7,2),(20,4),(3,9),(5,13),(23,4),(11,2),(10,9),(22,13),(21,3),(34,4),(6,7),(1,20),(2,1),(4,19),(8,2),(9,18),
(12,3),(13,17),(14,4),(70,16),(60,5),(50,15),(40,6),(30,14),(54,7),(61,13),(51,8),(41,12),(31,9),(59,11),(62,10),
(52,13),(42,8),(32,20),(58,19),(63,3),(53,8),(43,4),(33,16),(48,13);



select * from employees;
select * from msalary;
select * from employee_salary;
select * from r_roles;
select * from roles_employee;




