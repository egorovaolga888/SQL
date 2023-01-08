select * from employees;
select *  from employee_salary;
select * from msalary;
select * from r_roles;
select * from roles_employee;

-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select employees.employee_name, msalary.monthly_salary from employees
join employee_salary on employees.id=employee_salary.employee_id
join msalary on employee_salary.salary_id=msalary.id;

-- 2. Вывести всех работников у которых ЗП меньше 2000.
select employees.employee_name, msalary.monthly_salary from employees
join employee_salary on employees.id=employee_salary.employee_id
join msalary on employee_salary.salary_id=msalary.id
where monthly_salary < 2000;

--  3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select employees.employee_name, msalary.monthly_salary from employees
right join employee_salary on employees.id=employee_salary.employee_id
join msalary on employee_salary.salary_id=msalary.id
where employee_name is null;

--  4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select employees.employee_name, msalary.monthly_salary from employees
right join employee_salary on employees.id=employee_salary.employee_id
join msalary on employee_salary.salary_id=msalary.id
where employee_name is null and monthly_salary < 2000;

-- 5. Найти всех работников кому не начислена ЗП.
select employees.employee_name, msalary.monthly_salary from employees
full join employee_salary on employees.id=employee_salary.employee_id
full join msalary on employee_salary.salary_id=msalary.id
where monthly_salary is null;

--  6. Вывести всех работников с названиями их должности.
select employees.employee_name, r_roles.role_name from employees
join roles_employee on employees.id=roles_employee.employee_id
join r_roles on roles_employee.role_id=r_roles.id;

--- 7. Вывести имена и должность только Java разработчиков.
select employees.employee_name, r_roles.role_name from employees
join roles_employee on employees.id=roles_employee.employee_id
join r_roles on roles_employee.role_id=r_roles.id
where role_name like '%_ava__eveloper%';

--- 8. Вывести имена и должность только Python разработчиков.
select employees.employee_name, r_roles.role_name from employees
join roles_employee on employees.id=roles_employee.employee_id
join r_roles on roles_employee.role_id=r_roles.id
where role_name like '%_ython__eveloper%';

--- 9. Вывести имена и должность всех QA инженеров.
select employees.employee_name, r_roles.role_name from employees
join roles_employee on employees.id=roles_employee.employee_id
join r_roles on roles_employee.role_id=r_roles.id
where role_name like '%QA__ngineer%';

--- 10. Вывести имена и должность ручных QA инженеров.
select employees.employee_name, r_roles.role_name from employees
join roles_employee on employees.id=roles_employee.employee_id
join r_roles on roles_employee.role_id=r_roles.id
where role_name like '%_anual_QA__ngineer%';

--- 11. Вывести имена и должность автоматизаторов QA
select employees.employee_name, r_roles.role_name from employees
join roles_employee on employees.id=roles_employee.employee_id
join r_roles on roles_employee.role_id=r_roles.id
where role_name like '%_utomation_QA__ngineer%';

--- 12. Вывести имена и зарплаты Junior специалистов
select employees.employee_name, r_roles.role_name, msalary.monthly_salary from employees
join roles_employee on employees.id=roles_employee.employee_id
join r_roles on roles_employee.role_id=r_roles.id
join employee_salary on employee_salary.employee_id=roles_employee.employee_id
join msalary on msalary.id=employee_salary.salary_id
where role_name like 'Junior%';

--- 13. Вывести имена и зарплаты Middle специалистов
select employees.employee_name, r_roles.role_name, msalary.monthly_salary from employees
join roles_employee on employees.id=roles_employee.employee_id
join r_roles on roles_employee.role_id=r_roles.id
join employee_salary on employee_salary.employee_id=roles_employee.employee_id
join msalary on msalary.id=employee_salary.salary_id
where role_name like 'Middle%';

---  14. Вывести имена и зарплаты Senior специалистов
select employees.employee_name, r_roles.role_name, msalary.monthly_salary from employees
join roles_employee on employees.id=roles_employee.employee_id
join r_roles on roles_employee.role_id=r_roles.id
join employee_salary on employee_salary.employee_id=roles_employee.employee_id
join msalary on msalary.id=employee_salary.salary_id
where role_name like 'Senior%';

---  15. Вывести зарплаты Java разработчиков
select monthly_salary from msalary
join employee_salary on msalary.id=employee_salary.salary_id
join roles_employee on roles_employee.employee_id=employee_salary.employee_id
where role_id in (4, 5 ,6);

select monthly_salary from msalary
join employee_salary on msalary.id=employee_salary.salary_id
join roles_employee on roles_employee.employee_id=employee_salary.employee_id
where role_id in (select id from r_roles where role_name like '%Java _eveloper%');

---16. Вывести зарплаты Python разработчиков
select monthly_salary from msalary
join employee_salary on msalary.id=employee_salary.salary_id
join roles_employee on roles_employee.employee_id=employee_salary.employee_id
where role_id in (select id from r_roles where role_name like '%Python _eveloper%');

--- 17. Вывести имена и зарплаты Junior Python разработчиков
select employee_name, monthly_salary from msalary
join employee_salary on msalary.id=employee_salary.salary_id
join roles_employee on roles_employee.employee_id=employee_salary.employee_id
join employees on employees.id=employee_salary.employee_id
where role_id in (select id from r_roles where role_name='Junior Python developer');

--- 18. Вывести имена и зарплаты Middle JS разработчиков
select employee_name, monthly_salary from msalary
join employee_salary on msalary.id=employee_salary.salary_id
join roles_employee on roles_employee.employee_id=employee_salary.employee_id
join employees on employees.id=employee_salary.employee_id
where role_id in (select id from r_roles where role_name='Middle JavaScript developer');

--- 19. Вывести имена и зарплаты Senior Java разработчиков
select employee_name, monthly_salary from msalary
join employee_salary on msalary.id=employee_salary.salary_id
join roles_employee on roles_employee.employee_id=employee_salary.employee_id
join employees on employees.id=employee_salary.employee_id
where role_id in (select id from r_roles where role_name='Senior Java developer');

--- 20. Вывести зарплаты Junior QA инженеров
select monthly_salary from msalary
join employee_salary on msalary.id=employee_salary.salary_id
join roles_employee on roles_employee.employee_id=employee_salary.employee_id
where role_id in (select id from r_roles where role_name like '%Junior%QA%');

--- 21. Вывести среднюю зарплату всех Junior специалистов
select avg(monthly_salary) from msalary
join employee_salary on msalary.id=employee_salary.salary_id
join roles_employee on roles_employee.employee_id=employee_salary.employee_id
where role_id in (select id from r_roles where role_name like '%Junior%');

select avg(monthly_salary) from msalary
join employee_salary on msalary.id=employee_salary.salary_id
join roles_employee on roles_employee.employee_id=employee_salary.employee_id
join r_roles on r_roles.id=roles_employee.role_id 
where role_name like '%Junior%';

---  22. Вывести сумму зарплат JS разработчиков
select sum(monthly_salary) from msalary
join employee_salary on msalary.id=employee_salary.salary_id
join roles_employee on roles_employee.employee_id=employee_salary.employee_id
where role_id in (select id from r_roles where role_name like '%JavaScript developer');

--- 23. Вывести минимальную ЗП QA инженеров
select min(monthly_salary) from msalary
join employee_salary on msalary.id=employee_salary.salary_id
join roles_employee on roles_employee.employee_id=employee_salary.employee_id
where role_id in (select id from r_roles where role_name like '%QA engineer');

--- 24. Вывести максимальную ЗП QA инженеров
select max(monthly_salary) from msalary
join employee_salary on msalary.id=employee_salary.salary_id
join roles_employee on roles_employee.employee_id=employee_salary.employee_id
where role_id in (select id from r_roles where role_name like '%QA engineer');

--- 25. Вывести количество QA инженеров
select count(role_name) from r_roles
join roles_employee on roles_employee.role_id=r_roles.id 
where role_name like '%QA engineer';

---  26. Вывести количество Middle специалистов.
select count(role_name) from r_roles
join roles_employee on roles_employee.role_id=r_roles.id 
where role_name like 'Middle%';

--- 27. Вывести количество разработчиков
select count(role_name) from r_roles
join roles_employee on roles_employee.role_id=r_roles.id 
where role_name like '%developer';

--- 28. Вывести фонд (сумму) зарплаты разработчиков.
select sum(monthly_salary) from msalary
join employee_salary on msalary.id=employee_salary.salary_id
join roles_employee on roles_employee.employee_id=employee_salary.employee_id
where role_id in (select id from r_roles where role_name like '%developer');

--- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select employee_name, role_name, monthly_salary from employees
join roles_employee on roles_employee.employee_id=employees.id 
join r_roles on r_roles.id=roles_employee.role_id 
join employee_salary on employee_salary.employee_id=roles_employee.employee_id 
join msalary on msalary.id=employee_salary.salary_id 
order by 3;

--- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select employee_name, role_name, monthly_salary from employees
join roles_employee on roles_employee.employee_id=employees.id 
join r_roles on r_roles.id=roles_employee.role_id 
join employee_salary on employee_salary.employee_id=roles_employee.employee_id 
join msalary on msalary.id=employee_salary.salary_id 
where monthly_salary between 1700 and 2300
order by 3;

---  31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select employee_name, role_name, monthly_salary from employees
join roles_employee on roles_employee.employee_id=employees.id 
join r_roles on r_roles.id=roles_employee.role_id 
join employee_salary on employee_salary.employee_id=roles_employee.employee_id 
join msalary on msalary.id=employee_salary.salary_id 
where monthly_salary<2300
order by 3;

---  32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select employee_name, role_name, monthly_salary from employees
join roles_employee on roles_employee.employee_id=employees.id 
join r_roles on r_roles.id=roles_employee.role_id 
join employee_salary on employee_salary.employee_id=roles_employee.employee_id 
join msalary on msalary.id=employee_salary.salary_id 
where monthly_salary in (1100, 1500, 2000)
order by 3;


select * from msalary; 
select * from r_roles;
select * from employee_salary;
select * from roles_employee;
select * from employees;


