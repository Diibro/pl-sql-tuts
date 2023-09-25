set serveroutput on;

accept code prompt 'Enter the employee code: ';

declare 
     employee_info employees%rowtype;
     code number;
     new_code VARCHAR(20);
     emp_bonus FLOAT;

BEGIN
     code := to_number('&code');

     select * into employee_info from employees where emp_code = code;

     emp_bonus := (employee_info.salary * 1.5)/100;

     if code < 10 then
          new_code := 'E00' || code;
     ELSE if code >= 10 and code < 100 THEN
          new_code := 'E0'||code;
     else if code >= 100 and code < 1000 THEN
          new_code := 'E'|| code;
     end if;
     end if;
     end if;
      
     dbms_output.put_line(' ');
     dbms_output.put_line('Employee code: ' || new_code);
     dbms_output.put_line('Employee name: '|| employee_info.emp_first_name|| ' ' || employee_info.emp_last_name );
     dbms_output.put_line('Employee Sal: USD '|| employee_info.salary);
     dbms_output.put_line('The employee additional bonus is 1.5% of their actual salary');
     dbms_output.put_line('Employee Bonus: USD ' || emp_bonus);




EXCEPTION
     when value_error THEN
          dbms_output.put_line('Erro no: ' || SQLCODE);
          dbms_output.put_line('- The entered employee code is invalid.');
     when too_many_rows then 
          dbms_output.put_line('Erro no: ' || SQLCODE);
          dbms_output.put_line ('There more than one employees with that code!');    
     when rowtype_mismatch THEN 
          dbms_output.put_line('Erro no: ' || SQLCODE);
          dbms_output.put_line('There is a mismatch in the data being fetched.');
     when no_data_found THEN
          dbms_output.put_line('Erro no: '|| SQLCODE);
          dbms_output.put_line('No data for the searched employee.');

end;
/
