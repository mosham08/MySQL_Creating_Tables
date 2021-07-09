-- /* Enter a department name, and retrieve all the names and salaries of all employees who work in
--    that department */
-- SELECT 
--     Fname, Minit, Lname, Salary
-- FROM
--     EMPLOYEE
--         NATURAL JOIN
--     DEPARTMENT
-- WHERE
--     Name = 'Research';

-- /* Enter an employee last name and first name and retrieve a list of projects names/hours per week
--    that the employee works on. */
-- SELECT 
--     P.Name 'proj name', W.Hours 'hrs/week'
-- FROM
--     EMPLOYEE AS E
--         NATURAL JOIN
--     WORKS_ON AS W
--         JOIN
--     PROJECT AS P ON P.Number = W.Project_Number
-- WHERE
--     E.Fname = 'John' AND E.Lname = 'Smith';

-- /* Enter a department name and retrieve the total of all employee salaries who work in the department. */
-- SELECT 
--     SUM(E.Salary)
-- FROM
--     EMPLOYEE AS E,
--     DEPARTMENT AS D
-- WHERE
--     D.Name = 'Research';

-- /* For each department, retrieve the department name and the number (count) of employees who work in
--    that department. Order the result by number of employees in descending order. */
-- SELECT 
--     D.Name 'department name', COUNT(E.Ssn) 'no of employees'
-- FROM
--     DEPARTMENT AS D
--         JOIN
--     EMPLOYEE AS E ON D.Depart_num = E.Depart_num
-- GROUP BY D.Name
-- ORDER BY COUNT(E.Ssn) DESC;

/* For each employee who is a supervisor, retrieve the employee first and last name and the number
   (count) of employees that are supervised. Order the result in descending order. */
SELECT 
    S.Fname 'first name',
    S.Lname 'last name',
    COUNT(E.Supervisor) 'no. employees supervised'
FROM
    EMPLOYEE AS S,
    EMPLOYEE AS E
WHERE
    S.Ssn = E.Supervisor
GROUP BY S.Ssn
ORDER BY COUNT(E.Supervisor) DESC;