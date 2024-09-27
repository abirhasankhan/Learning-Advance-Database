/* basic 01 */

DECLARE 
    mess VARCHAR2(20) := 'Hello World!';
    nam VARCHAR2(20) := 'Abir Khan';
    age NUMBER := 24;
    earn NUMBER(10,2) := 10005.655574646;
BEGIN
    --dbms_output.put_line(mess ||' '|| nam);
    dbms_output.put_line(mess);
    dbms_output.put_line(nam);
    dbms_output.put_line(age);
    dbms_output.put_line(earn);
END;
/


/* basic 02 */

DECLARE
    a NUMBER(3,1) :=:a;
    x NUMBER := 20;
    y NUMBER := 11;
    c NUMBER;
    d NUMBER;
    mess VARCHAR2(20) :=:mess;
BEGIN
    c := x+y;
    d := MOD(x,y);
    dbms_output.put_line('sum ' || c);
    dbms_output.put_line('mod ' || d);
    dbms_output.put_line(a);
    dbms_output.put_line(mess);
END;
/


/* basic if else */

DECLARE 
    a NUMBER := 20;
    b NUMBER := 11;
    c NUMBER;
BEGIN
    c := MOD(b,2);
    IF(c=0) THEN
        dbms_output.put_line(b || ' is even');
    ELSE
        dbms_output.put_line(b || ' is odd');
    END IF;

END;
/


/* basic for loop 01 */
DECLARE
    i NUMBER := 1;
    j NUMBER := 1;
BEGIN
    FOR i IN 1..3 LOOP
        FOR j IN 1..3 LOOP
            dbms_output.put_line('i is ' || i || ' ' || 'j is '|| j);
        END LOOP;
    END LOOP;
END;
/


/* basic for loop 02 */
-- n number input and print the odd number.  example n = 10. print-> 1,3,5,7,9 

DECLARE
    n NUMBER :=:n;
    --i NUMBER := 1;
BEGIN
    FOR i IN 1..n LOOP
        IF(MOD(i,2)!=0) THEN
            dbms_output.put_line('number ' || i);
        END IF;
    END LOOP;
END;
/


/* basic WHILE LOOP */

DECLARE
    a NUMBER := 10;
BEGIN
    WHILE a<=20 LOOP
        dbms_output.put_line(a);
        a := a+1;
    END LOOP;
    dbms_output.put_line('After Exit x is: ' || a);
END;
/


/* basic loop */

DECLARE
x number := 10;
BEGIN
LOOP
dbms_output.put_line(x);
x := x + 10;
IF x > 50 THEN
exit;
END IF;
END LOOP;
-- after exit, control resumes here
dbms_output.put_line('After Exit x is: ' || x);
END;
/

-- You can use the EXIT WHEN statement instead of the EXIT statement –

DECLARE
x number := 10;
BEGIN
LOOP
dbms_output.put_line(x);
x := x + 10;
exit WHEN x > 50;
END LOOP;
-- after exit, control resumes here
dbms_output.put_line('After Exit x is: ' || x);
END;
/


/* basic array 01 */
DECLARE
    type namearray IS VARRAY(5) OF VARCHAR2(10);
    names namearray;
    total NUMBER;
BEGIN
    names := namearray('abir','khan');
    total := names.count;
    FOR i IN 1..total LOOP
        dbms_output.put_line(names(i));
    END LOOP;
END;
/

 
/* basic array 02 */

DECLARE
    type namesarr IS VARRAY(5) OF VARCHAR2(10);
    type grade IS VARRAY(5) OF NUMBER;
    names namesarr;
    marks grade;
    total NUMBER;
BEGIN
    names := namesarr('Abir','Hasan','Abid','Hossain','Eva');
    marks := grade(90,88,55,70,81);
    total := names.count;
    dbms_output.put_line('Total student is '|| total);

    FOR i IN 1..total LOOP
        dbms_output.put_line('Name '|| names(i) || ' Mark '|| marks(i));
    END LOOP;
END;
/


/* Procedure */

-- create PROCEDURE and use it any where
CREATE OR REPLACE PROCEDURE greetings
AS
BEGIN
dbms_output.put_line('Hello World!');
END;
/
-- calling PROCEDURE
BEGIN
    greetings;
END;
/
-- DROP PROCEDURE
DROP PROCEDURE greetings;

-- Example 1
DECLARE
PROCEDURE greetings IS
BEGIN
    dbms_output.put_line('Hello World!');
END;
BEGIN
    greetings;
END;
/

-- Example 2 find Minimun number
DECLARE 
    a NUMBER;
    b NUMBER;
    c NUMBER;
PROCEDURE findMin(x IN NUMBER, y IN NUMBER, z OUT NUMBER) AS
BEGIN
    IF(x<y) THEN
        z := x;
    ELSE 
        z := y;
    END IF;
END;
BEGIN
    a :=:a; --21
    b :=:b; --23
    findMin(a,b,c);
    dbms_output.put_line('Minimun number is: ' || c);
END;
/


-- Example 3 find square number
DECLARE 
    a NUMBER;
PROCEDURE sqnumber(z IN OUT NUMBER) AS
BEGIN
    z := z*z;
END;
BEGIN
    a := 5;
    sqNumber(a);
    dbms_output.put_line(a);
END;
/


/* Procedure */

-- Example 1 find Max number
DECLARE
    a NUMBER;
    b NUMBER;
    c NUMBER;
FUNCTION findMax(x IN NUMBER, y IN NUMBER)
RETURN NUMBER AS
z NUMBER;
BEGIN
    IF(x>y) THEN
        z := x;
    ELSE
        z := y;
    END IF;
    RETURN z;
END;
BEGIN
    a := 30;
    b := 21;
    c := findMax(a,b);
    dbms_output.put_line(a);
END;
/

-- Example 2 find square number
DECLARE
    a NUMBER;
    b NUMBER;
FUNCTION sqNumber(x IN NUMBER)
RETURN NUMBER AS
z NUMBER;
BEGIN
    z := x*x;
    RETURN z;
END;
BEGIN
    a := 9;
    b := sqNumber(a);
    dbms_output.put_line(b);
END;
/

/* CURSOR */
-- 01

DECLARE
    p_id Parts.pid%type;
    p_name Parts.pname%type;
    p_color Parts.color%type;
    p_price Parts.price%type;
    CURSOR p_Parts IS
        SELECT *
        FROM Parts
        WHERE color = 'Green' AND price = (SELECT max(price) FROM Parts);
BEGIN
    OPEN p_Parts;
    LOOP
        FETCH p_Parts INTO p_id, p_name, p_color, p_price;
        EXIT WHEN p_Parts%notfound;
        dbms_output.put_line('ID: ' || p_id || ' Name ' || p_name || ' Color ' || p_color || ' Price ' || p_price);
    END LOOP;
    CLOSE p_Parts;
END;
/


-- 02

DECLARE
    p_name Parts.pname%type;
    p_price Parts.price%type;
    s_id Suppliers.sid%type;
    s_name Suppliers.sname%type;
    s_city Suppliers.city%type;

    CURSOR mostCost IS
        SELECT P.pname, P.price, S.sid, S.sname, S.city
        FROM Shipments Sp INNER JOIN Parts P ON Sp.pid = P.pid
            INNER JOIN Suppliers S ON Sp.sid = S.sid
        WHERE P.price = (SELECT max(price) FROM Parts);

     CURSOR cheapCost IS
        SELECT P.pname, P.price, S.sid, S.sname, S.city
        FROM Shipments Sp INNER JOIN Parts P ON Sp.pid = P.pid
            INNER JOIN Suppliers S ON Sp.sid = S.sid
        WHERE P.price = (SELECT min(price) FROM Parts);

    
BEGIN
    OPEN mostCost;
    LOOP 
        FETCH mostCost INTO p_name, p_price, s_id, s_name, s_city;
        EXIT WHEN mostCost%notfound;
        dbms_output.put_line('parts name: ' || p_name || ' price: ' || p_price || ' supplier id: ' || s_id || ' supplier name: ' || s_name || ' city: ' || s_city);
    END LOOP;
    CLOSE mostCost;

    OPEN cheapCost;
    LOOP 
        FETCH cheapCost INTO p_name, p_price, s_id, s_name, s_city;
        EXIT WHEN cheapCost%notfound;
        dbms_output.put_line('parts name: ' || p_name || ' price: ' || p_price || ' supplier id: ' || s_id || ' supplier name: ' || s_name || ' city: ' || s_city);
    END LOOP;
    CLOSE cheapCost;
END;
/





