--
-- VS Code4i - Database Extension - LUG
-- Last updated: October 12, 2025
--
-- Authors:
-- Scott Forstie
-- Sanjula Ganepola
--

--
-- Simple query, show content assist
--
SELECT * FROM TOYSTORE3.ITEM_FACT limit 3;
stop;

--
-- Hover
-- 
select * from table(qsys2.object_statistics());
stop;

-- 
-- Syntax Checking
-- 
-- Intentional SQL syntax problem, to show mini-map and syntax checking
-- Suggestion: Install the "Error Lens" extension to see errors inline
select * from table(qsys2.ifs_object_statistics('/home/scottf/')));
stop;

--
-- SQL prefixes
--
json: select * from toystore3.item_fact limit 3;
csv:  select * from toystore3.item_fact limit 3;
sql:  select * from toystore3.item_fact limit 3;
rpg:  select * from toystore3.item_fact limit 3;
stop;

-- 
-- Generate Insert From File
-- 
-- Generate inserts for JSON/CSV generated on line 19 - 20
stop;

--
-- Editable cells
--
update: select * from toystore.sales;
select * from toystore.sales;
update: select * from toystore.employee;
stop;

--
-- Binding parameters
-- 
select * from table(qsys2.object_statistics(?,?));
bind: 'COOLSTUFF', '*PGM'; 
select * from table(qsys2.object_statistics(:h,:h)) order by objtype;
bind: 'COOLSTUFF', '*ALL';
stop;

-- 
-- Coming soon - More SQL prefixes
-- 
udtf: select * from toystore.staff;
rpgproc: select empno,
       rtrim(firstnme) || ' ' || rtrim(midinit) || ' ' || rtrim(lastname),
       salary + bonus + comm
    from toystore3.employee
    where empno = ?;
stop;

-- 
-- Schema Browser
-- 
-- Browse objects, view contents, generate SQL, etc
-- Coming soon - New database object types:
--     • Column Masks
--     • Constraints
--     • Journal Receivers
--     • Journals
--     • Sequences
--     • SQL Packages
stop;
-- Add TOYSTORE3 schema
-- Look for MTI's under TOYSTORE3
stop;

-- 
-- Statement History
-- 
-- Search and star statements
stop;

-- 
-- Examples
-- 
-- Browse 'IBM i (SQL) Services' folder under Examples
-- New: Custom Examples
stop;

--
-- Jupyter Notebooks
--
-- Choose 'Authority Failures review' under Examples
stop;

-- 
-- Visual Explain
-- 
-- Run and example, Explain without running
-- Coming soon - Graph based Visual Explain
select days_commit_to_receipt
    from toystore3.item_facth
    where extendedprice > 1.1
    order by CUSTKEY desc
    limit 1;
stop;

--
-- Procedures
--
-- What spooled files are older than our retention period?
--
CALL SYSTOOLS.DELETE_OLD_SPOOLED_FILES(DELETE_OLDER_THAN => CURRENT DATE - 30 DAYS,   
                                       PREVIEW => 'YES');
stop;