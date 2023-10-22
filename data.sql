insert into activitytype(
        activitytypeid,
        name,
        sysname
)
select d.*
from (
    values(1,'Программа','Program')
    ,(2,'Подпрограмма','SubProgram')
    ,(3,'Проект','Project')
    ,(4,'Контракт','Contract')
    ,(5,'КТ','Point')
) d(activitytypeid, name, sysname)
where not exists(
    select 1 from activitytype t
    where t.activitytypeid = d.activitytypeid
);

--fill area table

insert into area(
        areaid,
        name
)
select *
from (
    values(1,'Евразия'),
          (2,'Африка'),
          (3,'Австралия'),
          (4,'Антарктида'),
          (5,'Северная Америка'),
          (6,'Южная Америка')
) as d(
    areaid,
    name
)
where not exists(
    select 1 from area as t
    where t.areaid = d.areaid
);

--fill activity area

insert into activity(
        activityid,
        activitytypeid,
        code,
        name,
        parentid
)
select *
from (
    values (1, 1, '1', 'Программа Alpha', null),
           (2, 1, '2', 'Программа Bravo', null),
           (3, 1, '3', 'Программа Delta', null),
           (4, 2, '1.1', 'Подпрограмма Alpha-One', 1),
           (5, 2, '2.1', 'Подпрограмма Bravo-Two', 2),
           (6, 2, '3.1', 'Подпрограмма Delta-One', 3),
           (7, 2, '3.2', 'Подпрограмма Delta-Two', 3),
           (8, 3, '1.1.1', 'Проект Alpha-One-One', 4),
           (9, 3, '2.1.1', 'Проект Bravo-Two-Six', 5),
           (10,3, '3.1.1', 'Проект Delta-One-One', 6),
           (11, 3, '3.2.1', 'Проект Delta-Two-One', 7),
           (12, 4, '1.1.1.1', 'Контракт Alpha-One-One-1', 8),
           (13, 4, '2.1.1.1', 'Контракт Bravo-Two-Six-1', 9),
           (14, 4, '3.1.1.1', 'Контракт Delta-One-One-1', 10),
           (15, 4, '3.2.1.1', 'Контракт Delta-Two-One-1', 11),
           (16, 4, '3.2.1.2', 'Контракт Delta-Two-One-2', 11),
           (17, 5, 'P1.1.1', 'КТ Alpha-One-One', 8),
           (18, 5, 'P2.1.1', 'КТ Bravo-Two-Six', 9),
           (19, 5, 'P3.1.1', 'КТ Delta-One-One', 10),
           (20, 5, 'P3.2.1', 'КТ Delta-Two-One', 11),
           (21, 5, 'P1.1.1.1', 'КТ Alpha-One-One-1', 12),
           (22, 5, 'P2.1.1.1', 'КТ Bravo-Two-Six-1', 13),
           (23, 5, 'P3.1.1.1', 'КТ Delta-One-One-1', 14),
           (24, 5, 'P3.2.1.1', 'КТ Delta-Two-One-1', 15),
           (25, 5, 'P3.2.1.2', 'КТ Delta-Two-One-2', 16)
) as d(
    activityid,
    activitytypeid,
    code,
    name,
    parentid
)
where not exists(
    select 1 from activity as t
    where t.activityid = d.activityid
);

--fill program table

insert into program(
        programid,
        indexnum,
        yearstart,
        yearfinish
)
select *
from (
    values(1, null, 2013, 2018),
          (2, 2, 2016, 2020),
          (3, 3, 2022, null)
) as d(
    programid,
    indexnum,
    yearstart,
    yearfinish
)
where not exists(
    select 1 from program as t
    where t.programid = d.programid
);

--fill subprogram table

insert into subprogram(
        subprogramid,
        indexnum
)
select *
from (
    values(4, null),
          (5, 7),
          (6, null),
          (7, 19)
) as d(
    subprogramid,
    indexnum
)
where not exists(
    select 1 from subprogram as t
    where t.subprogramid = d.subprogramid
);

--fill project table

insert into project(
        projectid,
        targetdescr
)
select *
from (
    values(8, 'Escaflowne'),
          (9, 'Verona'),
          (10, 'Hellcat'),
          (11, null)
) as d(
    projectid,
    targetdescr
)
where not exists(
    select 1 from project as t
    where t.projectid = d.projectid
);

--fill contract table

insert into contract(
        contractid,
        areaid
)
select *
from (
    values(12, 1),
          (13, 1),
          (14, 4),
          (15, 5),
          (16, 6)
) as d(
    contractid,
    areaid
)
where not exists(
    select 1 from contract as t
    where t.contractid = d.contractid
);

--fill point table

insert into point(
        pointid,
        plandate,
        factdate
)
select *
from (
    values(17, to_date('01-07-2017', 'DD-MM-YYYY'), to_date('01-07-2018', 'DD-MM-YYYY')),
          (18, to_date('01-08-2018', 'DD-MM-YYYY'), to_date('01-08-2019', 'DD-MM-YYYY')),
          (19, to_date('01-09-2019', 'DD-MM-YYYY'), to_date('01-09-2020', 'DD-MM-YYYY')),
          (20, to_date('20-02-2020', 'DD-MM-YYYY'), to_date('20-02-2021', 'DD-MM-YYYY')),
          (21, to_date('21-02-2021', 'DD-MM-YYYY'), to_date('21-02-2022', 'DD-MM-YYYY')),
          (22, to_date('22-02-2022', 'DD-MM-YYYY'), to_date('22-02-2023', 'DD-MM-YYYY')),
          (23, to_date('23-02-2023', 'DD-MM-YYYY'), to_date('23-02-2024', 'DD-MM-YYYY')),
          (24, to_date('24-02-2024', 'DD-MM-YYYY'), to_date('24-02-2025', 'DD-MM-YYYY')),
          (25, to_date('25-02-2025', 'DD-MM-YYYY'), to_date('25-02-2026', 'DD-MM-YYYY'))
) as d(
    pointid,
    plandate,
    factdate
)
where not exists(
    select 1 from point as t
    where t.pointid = d.pointid
);