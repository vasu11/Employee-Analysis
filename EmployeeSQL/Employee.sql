
--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT E.empno,E.lastname,E.firstname,E.sex,S.salary
FROM EMPLOYEES AS E 
INNER JOIN SALARY S ON
E.empno = S.empno;

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT E.firstname,E.lastname,E.hiredate FROM EMPLOYEES E
WHERE E.hiredate between '1986-01-01' and '1986-12-31';

--List the manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, first name.
SELECT DM.deptno,D.deptname,DM.empno,E.lastname,E.firstname
FROM departmentmanager DM
INNER JOIN department D
ON DM.deptno = D.deptno
INNER JOIN employees E
ON E.empno = DM.empno;

--List first name, last name, and sex for employees whose first name is "Hercules" 
--and last names begin with "B."
SELECT E.firstname, E.lastname, E.sex 
FROM employees E
WHERE E.firstname = 'Hercules'
AND SUBSTR(E.lastname,1,1) = 'B';

--List all employees in the Sales department, including their employee number,
--last name, first name, and department name.
SELECT E.empno, E.lastname, E.firstname, D.deptname
FROM department D
INNER JOIN departmentemp DE
ON D.deptno = DE.deptno
INNER JOIN employees E
ON E.empno = DE.empno
WHERE D.deptname = 'Sales';

SELECT * FROM departmentemp
where empno = '10050';

SELECT * FROM department
WHERE deptno = 'd007';

--List all employees in the Sales and Development departments, including their 
--employee number, last name, first name, and department name.
SELECT E.empno, E.lastname, E.firstname, D.deptname
FROM department D
INNER JOIN departmentemp DE
ON D.deptno = DE.deptno
INNER JOIN employees E
ON E.empno = DE.empno
WHERE D.deptname IN ('Sales','Development');

--In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
