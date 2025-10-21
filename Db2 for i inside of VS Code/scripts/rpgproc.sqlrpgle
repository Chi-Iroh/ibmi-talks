**free

ctl-opt nomain;

dcl-ds employee_t qualified template;
  empno char(6);
  name varchar(50);
  netincome packed(9:2);
end-ds;

dcl-proc getEmployee export;
  dcl-pi *n like(employee_t);
    empno char(6) const;
  end-pi;

  dcl-ds employee likeds(employee_t);

  exec sql
    select
      empno,
      rtrim(firstnme) || ' ' || rtrim(midinit) || ' ' || rtrim(lastname),
      salary + bonus + comm
    into
      :employee.empno,
      :employee.name,
      :employee.netincome
    from
      toystore3.employee
    where
      empno = :empno;

  return employee;
end-proc;