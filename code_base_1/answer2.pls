set serveroutput ON;

accept code prompt 'Enter the employee code: ';
DECLARE   
     code number ;
     emp_salary employees.salary%type;
     average_salary float;
     low_salary_exception exception;
     PRAGMA EXCEPTION_INIT(low_salary_exception, -20001);

     BEGIN
          code := TO_NUMBER('&code');
          select AVG(salary) into average_salary from employees;
          select salary into emp_salary from employees where emp_code = code;
          if emp_salary < average_salary THEN     
               raise low_salary_exception;
          ELSE 
               dbms_output.put_line('The salary of the employee searched is above the average salary which is ' || average_salary);
          end if;

     EXCEPTION
          when low_salary_exception THEN
               dbms_output.put_line('Error code: ' || SQLCODE ||' - The employee salary is below the average salary');
          when value_error THEN
               dbms_output.put_line('Error code: '|| SQLCODE || ' - please enter a valid employee code.');
          when no_data_found THEN
               dbms_output.put_line('Error code: ' || SQLCODE || ' - No record found for the searched employee code. please try again with a different code.');
          
end;
/
