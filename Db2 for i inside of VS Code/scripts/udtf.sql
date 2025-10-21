-- statement:
-- select * from toystore.staff

-- User-defined table function
CREATE OR REPLACE FUNCTION MyFunction()
  RETURNS TABLE (
    ID INTEGER,
    NAME VARCHAR(9),
    DEPT INTEGER,
    JOB CHAR(5),
    YEARS INTEGER,
    SALARY DECIMAL(7,2),
    COMM DECIMAL(7,2)
  )
  NOT DETERMINISTIC
  NO EXTERNAL ACTION
  READS SQL DATA
  SET OPTION COMMIT = *NONE,
             DYNUSRPRF = *USER,
             USRPRF = *USER
  BEGIN
    RETURN select * from toystore.staff;
  END;