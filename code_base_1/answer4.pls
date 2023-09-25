set serveroutput ON;

accept code prompt 'Enter an employee code: ';

DECLARE
     code number;
     emp_salary employees.salary%type;
     salary_outof_range exception;
     pragma exception_init(salary_outof_range, -20004);
BEGIN
     code := TO_NUMBER('&code');
     select salary into emp_salary from employees where emp_code = code;
     if emp_salary BETWEEN 2500 AND 5000 THEN
          raise salary_outof_range;
     ELSE 
          dbms_output.put_line('The bonus should be added.');
     end if;
EXCEPTION
     when salary_outof_range THEN
          dbms_output.put_line('Error code: '|| SQLCODE);
          dbms_output.put_line('- The employee salary is out of range.');
     when value_error THEN    
          dbms_output.put_line('Error code: '|| SQLCODE);
          dbms_output.put_line('- The entered employee code is invalid.');
     when no_data_found then 
          dbms_output.put_line('Error code: ' || SQLCODE);
          dbms_output.put_line('- No results for the searched employee code.');
END;
/
