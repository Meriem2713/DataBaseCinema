 /* * * * *
 **  -- test 3
 **  -- Inserting new produce testing..
 **  --  
 * * * * */ 


\! clear -- to clear the screen --

-- insert a new MOVIE
delete from MOVIE where title_movie = 'Good Luck movie'; -- to avoid duplicating during tests
insert into MOVIE(title_movie, kind_movie ,release_date, company ,star_actor) 
	values('Good Luck movie','Drama','2015','Sony Pictures Motion Picture Group','Harry Achraf');

-- to verify whether is in the table
select * from MOVIE where title_movie = 'Good Luck movie';

-- insert a new PRODUCER

delete from PRODUCER where name_producer =  'Youcef Ben'; -- to avoid duplicating during tests
insert into PRODUCER(name_producer) 
	values('Youcef Ben');

-- to verify whether is in the table
select * from PRODUCER where name_producer = 'Youcef Ben';

-- create the new produce
select newProduce(
	(select id_movie  from MOVIE where title_movie = 'Good Luck movie'),
	(select id_producer  from PRODUCER where name_producer = 'Youcef Ben')
);


-- showing the result 
select * from PRODUCE;
