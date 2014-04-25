create or replace function PreReqsFor(int, REFCURSOR) returns REFCURSOR as
$$
declare
  current_class    int		:= $1;
  immediateprereq  REFCURSOR	:= $2;
begin
  open immediateprereq for
      select preReqNum
      from Prerequisites
      where courseNum = current_class;
  return immediateprereq;
end;
$$
language plpgsql;

select PreReqsFor(221, 'results');
Fetch all from results;




create or replace function IsPreReqFor(int, REFCURSOR) returns REFCURSOR as
$$
declare
  immediateprereq   int		:= $1;
  successorcourse   REFCURSOR	:= $2;
begin
  open successorcourse for
    select coursenum
    from Prerequisites
    where prereqnum = immediateprereq;
  return successorcourse;
end;
$$
language plpgsql;

select IsPreReqFor(220, 'results');
fetch all from results;