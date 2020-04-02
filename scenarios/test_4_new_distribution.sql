 /* * * * *
 **  -- test 4
 **  -- Inserting new distribute testing..
 **  --  
 * * * * */ 


\! clear -- to clear the screen --

-- insert a new MOVIE
delete from MOVIE where title_movie = 'Luck movie'; -- to avoid duplicating during tests
insert into MOVIE(title_movie, kind_movie ,release_date, company ,star_actor) 
	values('Luck movie','Drama','2015','Sony Pictures Motion Picture Group','Mohamed Achraf');

-- to verify whether is in the table
select * from MOVIE where title_movie = 'Luck movie';

-- insert a new ACTOR

delete from ACTOR where name_actor =  'Youcef Ben'; -- to avoid duplicating during tests
insert into ACTOR(name_actor) 
	values('Louiza Hanoun');

-- to verify whether is in the table
select * from ACTOR where name_actor = 'Louiza Hanoun';

-- create the new Distribute
select newDistribute(
	(select id_movie  from MOVIE where title_movie = 'Luck movie'),
	(select id_actor  from ACTOR where name_actor = 'Louiza Hanoun'),
    1
);


-- showing the result 
select * from DISTRIBUTE;