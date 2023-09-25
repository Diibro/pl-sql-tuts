set serveroutput ON;
accept code prompt 'Enter the employee code: ';

DECLARE
     code number;
     emp_salary employees.salary%type;
     average_salary FLOAT;
     new_salary FLOAT;
     low_salary_exception EXCEPTION;
     pragma exception_init(low_salary_exception, -20002);

BEGIN
     code := TO_NUMBER('&code');
     select avg(salary) into average_salary from employees;
     select  salary into emp_salary from employees where emp_code = code;
     if emp_salary <= average_salary THEN     
          raise low_salary_exception;
     else
          new_salary := emp_salary - ((emp_salary * 5)/100);
          dbms_output.put_line('The initial salary of the employee was: '|| emp_salary);
          dbms_output.put_line('The new salary of the employee is: '|| new_salary);
     end if;


EXCEPTION
     when low_salary_exception THEN     
          dbms_output.put_line('Error code: ' || SQLCODE);
          dbms_output.put_line('   The employee salary is within the normal range.');
     when no_data_found then
          dbms_output.put_line('Error code: ' || SQLCODE);
          dbms_output.put_line('   No data for the searched employee, please try with a different employee code ');
     when value_error then
          dbms_output.put_line('Error code: '|| SQLCODE);
          dbms_output.put_line('   The entered value for the employee code is invalid.');

END;
/