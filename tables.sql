create table if not exists activitytype
(
    activitytypeid integer not null
        primary key
        unique,
    name           text    not null,
    sysname        text    not null
);

create table if not exists activity
(
    activityid     integer not null
        primary key
        unique,
    activitytypeid integer not null,
    code           text    not null,
    name           text    not null,
    parentid       integer,

    foreign key (activitytypeid) references activitytype(activitytypeid) on delete cascade,
    foreign key (parentid) references activity(activityid) on delete cascade
);

create table if not exists program
(
    programid      integer not null
        primary key
        unique,
    indexnum       integer,
    yearstart      integer,
    yearfinish     integer,

    foreign key (programid) references activity(activityid) on delete cascade
);

create table if not exists subprogram
(
    subprogramid   integer not null
        primary key
        unique,
    indexnum       integer,

    foreign key (subprogramid) references activity(activityid) on delete cascade
);

create table if not exists project
(
    projectid      integer not null
        primary key
        unique,
    targetdescr    text,

    foreign key (projectid) references activity(activityid) on delete cascade
);

create table if not exists contract
(
    contractid     integer not null
        primary key
        unique,
    areaid         integer not null,

    foreign key (areaid) references area(areaid) on delete cascade,
    foreign key (contractid) references activity(activityid) on delete cascade
);

create table if not exists point
(
    pointid        integer not null
        constraint pk_point
            primary key,
    plandate       date    not null,
    factdate       date,

    foreign key (pointid) references activity(activityid) on delete cascade
);

create table if not exists area
(
    areaid         integer not null
        constraint pk_area
            primary key,
    name           text    not null
);