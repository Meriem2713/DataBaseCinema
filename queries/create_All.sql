drop table if exists USER_USER cascade;
drop table if exists MOVIE cascade;
drop table if exists ACTOR cascade;
drop table if exists AWARD cascade;
drop table if exists PRODUCER cascade;

drop table if exists AUDIT_MOVIE cascade;

drop table if exists WINS cascade;
drop table if exists REVIEW cascade;
drop table if exists DISTRIBUTE cascade;
drop table if exists PRODUCE cascade;

create table USER_USER(
	id_user serial primary key,
    type_user varchar(32) not null,
	name_user varchar(32) not null,
	last_name_user varchar(32) not null,
	pseudo varchar(31) not null,
	email varchar(32) not null,

	password varchar(32) not null,
	unique(pseudo)
);

create table MOVIE(
	id_movie serial primary key,
	title_movie varchar(128) not null,
	kind_movie varchar(128) not null,
    release_date varchar(64) not null, -- we have to put a check on year
	company varchar(128),
	star_actor varchar(128)
);

create table ACTOR(
	id_actor serial primary key,
	name_actor varchar(128) not null
);

create table AWARD(
	id_award serial primary key,
	name_award varchar(64) not null
);

create table PRODUCER(
	id_producer serial primary key,
	name_producer varchar(128) not null
);

-- this table contains all the operations --
create table AUDIT_MOVIE (
	id_audit serial primary key,
	pseudo varchar(32) not null,
	operation_name varchar(32) not null,
	operation_date date not null,
	check (operation_name in ('CREATE_CRITIQUES', 'CREATE_WINS', 'NEW_PRODUCE', 'NEW_DISTRIBUTE'))
);

create table WINS(
    id_wins serial primary key,
	id_movie integer not null references MOVIE,
	id_award integer not null references AWARD,
    year_wins date not null

);

create table REVIEW (
	id_review serial primary key,
    id_movie integer not null references MOVIE,
	id_user integer not null references USER_USER,
	name_review varchar(32) not null,
    content_review varchar(128) not null,
    score integer default 0,
    check (score >= 0 and score <= 5)
);

create table DISTRIBUTE (
    id_distribute serial primary key,
	id_movie integer not null references MOVIE,
	id_actor integer not null references ACTOR,
	rank integer not null /** par exemple 1 veut dire que l'acteur a le rôle principale*/
);

create table PRODUCE (
    id_produce serial primary key,
    id_movie integer not null references MOVIE,
    id_producer integer not null references PRODUCER

);



/**
  -- indexes for later ..
*/
