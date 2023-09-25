--use of nested programs


-- set serveroutput on;

-- accept num_1 prompt 'Enter the first number: ';
-- accept num_2 prompt 'Enter the second number: ';
-- accept signOp prompt 'Enter + for adding or - for subtration: ';

-- DECLARE
--      num_1 number := &num_1;
--      num_2 number := &num_2;
--      signOp char := '&signOp';

--      PROCEDURE add_print (num1 number, num2 number) IS
--           numOut number;
--      BEGIN     
--                numOut := num_1 + num_2;
--                dbms_output.put_line('The sum of the number entered is: ' || numOut);
--      end add_print;

--      procedure subtract_print (num1 number, num2 number) IS
--           numOut number;
--           BEGIN
--                if num1 < num2 THEN 
--                     numOut := num2 - num1;
--                     dbms_output.put_line('The difference is '|| num2 || ' - ' || num1 || ' = ' || numOut);
--                ELSE
--                     numOut := num1 - num2;
--                     dbms_output.put_line('The difference is '|| num1 || ' - ' || num2 || ' = ' || numOut);
--                end if;
--      end subtract_print;
               
     
--      BEGIN
--           if signOp = '+' THEN     
--                add_print(num_1,  num_2);
--           else if signOp = '-' THEN
--                subtract_print(num_1, num_2);
--           ELSE 
--                dbms_output.put_line('Please enter a valid operator for our program.');
--           end if;
--           end if;
--      end;
-- /


-- checking if the input is a character or number;

-- set serveroutput on;

-- accept userin prompt 'Enter any character on your keyboard: ';
-- declare 
--      i char := '&userin';
--      char_detected_exception exception;
--      num_detected_exception exception;
--      begin
--                if (i >= 'A' and i <= 'Z') or (i >= 'a' and i <= 'z') THEN
--                     raise char_detected_exception;
--                else if i BETWEEN '0' AND '9' then
--                     raise num_detected_exception;
--                else
--                     dbms_output.put_line(' neither a character nor a number');
--                end if;
--                end if;
--      EXCEPTION
--      when char_detected_exception THEN
--           dbms_output.put_line('character detected');
--      when num_detected_exception THEN
--           dbms_output.put_line('number detected');

--      END;
-- /




-- detecting the divide by zero exception

-- set serveroutput ON;

-- DECLARE   
--      n1 NUMBER := &n1;
--      n2 NUMBER := &n2;
--      n3 NUMBER(5,3);
-- BEGIN
--      n3 := n2 / n1;
--      dbms_output.put_line('the division is successful and result is: ' || n3);
-- EXCEPTION 
-- when zero_divide THEN
--      dbms_output.put_line('you cannot divide by zero please');
-- end;
-- /


-- row type mismatch error

set serveroutput ON

accept code prompt 'Enter the id: ';

DECLARE
     stu_info students%rowtype;
     -- u_id number:= &u_id;
     name number;
BEGIN
     stu_info.id := to_number('&code');
     -- select * into stu_info from students where id = u_id OR id = 2;
     -- dbms_output.put_line('the student name is '|| stu_info.name);
EXCEPTION
     when value_error THEN 
          dbms_output.put_line('value not matching');
     when rowtype_mismatch THEN
          dbms_output.put_line('row type mismatch raised');
     when too_many_rows THEN
          dbms_output.put_line('there are many rows associated with you condition');
END;
/