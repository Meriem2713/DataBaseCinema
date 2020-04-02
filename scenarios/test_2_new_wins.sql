 /* * * * *
 **  -- test 2
 **  -- Inserting new wins testing..
 **  --  
 * * * * */ 


\! clear -- to clear the screen --

-- insert a new MOVIE
delete from MOVIE where title_movie = 'movieDiderot'; -- to avoid duplicating during tests
insert into MOVIE(title_movie, kind_movie ,release_date, company ,star_actor) 
	values('movieDiderot','Amour','2010','20th Century Fox','Meriem Benyahia');

-- to verify whether is in the table
select * from MOVIE where title_movie = 'movieDiderot';

-- insert a new AWARD

delete from AWARD where name_award =  'Academy OF Oscar'; -- to avoid duplicating during tests
insert into AWARD(name_award) 
	values('Academy OF Oscar');

-- to verify whether is in the table
select * from AWARD where name_award = 'Academy OF Oscar';

-- create the new wins
select newWins(
	(select id_movie  from MOVIE where title_movie = 'movieDiderot'),
	(select id_award  from AWARD where name_award = 'Academy OF Oscar'),
	CURRENT_DATE
);


-- showing the result 
select * from WINS;
