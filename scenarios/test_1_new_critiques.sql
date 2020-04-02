 /* * * * *
 **  -- test 1
 **  -- Inserting new review testing..
 **  --  
 * * * * */ 


\! clear -- to clear the screen --

-- insert a new MOVIE
insert into MOVIE(title_movie, kind_movie ,release_date, company ,star_actor) 
	values('movieDiderot','Action','1997','20th Century Fox','Meriem benyahia');

-- to verify whether is in the table
select * from MOVIE where title_movie = 'movieDiderot';

-- create the new critiques 
select new_critique(
	(select id_movie  from MOVIE where title_movie = 'movieDiderot'),
	(select id_user  from USER_USER where name_user = 'toto'),
	'review_one',
	'Its a good movie, the story of a computer science student Meriem :)',
    5
);


-- showing the result 
select * from REVIEW;
