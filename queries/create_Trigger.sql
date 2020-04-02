

-- -- fonction to add a new review --
create or replace function new_critique(id_movie_1 int ,id_user_1 int ,name_review text, content_review text, score int) returns void as $$
declare
	exist_movie boolean;
	exist_user boolean;
begin
    -- we need to insert a new review into the database..
    -- verifying if the movie and the user exist..

    -- check whether the id_movie exists or no --
	select count(*) = 1 into exist_movie from MOVIE where id_movie = id_movie_1;
	if not exist_movie then 
		raise 'ERROR:THE ID_MOVIE % DOES NOT EXIST !',id_movie_1;
	end if;
	
	-- check whether the id_user exists or no --
	select count(*) = 1 into exist_user from USER_USER where id_user = id_user_1;
	if not exist_user then 
		raise 'ERROR:THE ID_USER % DOES NOT EXIST !',id_user_1;
	end if;

	-- the movie & the user exist..
    raise notice 'insert new review into the database..';

    -- inserting..
	insert into REVIEW(id_movie,id_user,name_review,content_review,score) 
    values(id_movie_1 ,id_user_1 ,name_review ,content_review ,score);


	--we fill the audit..
	-- for later!!

end;

$$ LANGUAGE plpgsql;



-- -- fonction to add a new wins --

create or replace function newWins(id_movie_1 int ,id_award_1 int ,year_wins date ) returns void as $$
declare
	exist_movie boolean; 
	exist_award boolean;  
   
    -- we need to insert a new wins into the database..
    -- verifying if the awards and the movie  exist..
begin

    -- check whether the id_movie exists or no --
	select count(*) = 1 into exist_movie from MOVIE where id_movie = id_movie_1;
	if not exist_movie then 
		raise 'ERROR:THE ID_MOVIE % DOES NOT EXIST !',id_movie_1;
	end if;
	-- check whether the id_award exists or no --
	select count(*) = 1 into exist_award from AWARD where id_award = id_award_1;
	if not exist_award then 
		raise 'ERROR:THE ID_AWARD % DOES NOT EXIST !',id_award_1 ;
	end if;

	-- the movie & the award exist..
    raise notice 'insert new wins into the database..';

    -- inserting..

	insert into wins(id_movie,id_award,year_wins) 
    values(id_movie_1,id_award_1,year_wins);

		--we fill the audit..
	-- for later!!

end;

$$ LANGUAGE plpgsql;


-- fonction to add a new produce --

create or replace function newProduce(id_movie_1 int ,id_producer_1 int ) returns void as $$

declare
	exist_movie boolean; 
	exist_producer boolean;  
begin
    -- check whether the id_movie exists or no --
	select count(*) = 1 into exist_movie from MOVIE where id_movie = id_movie_1;
	if not exist_movie then 
		raise 'ERROR:THE ID_MOVIE % DOES NOT EXIST !',id_movie;
	end if;
	-- check whether the id_producer exists or no --
	select count(*) = 1 into exist_producer from PRODUCER where id_producer = id_producer_1;
	if not exist_producer then 
		raise 'ERROR:THE ID_PRODUCER % DOES NOT EXIST !',id_producer ;
	end if;

	-- the movie & the producer exist..
    raise notice 'insert new produce into the database..';

    -- inserting..
	insert into produce(id_movie,id_producer) 
    values(id_movie_1,id_producer_1);

end;

$$ LANGUAGE plpgsql;




-- fonction to add a new distribute --

create or replace function newDistribute(id_movie_1 int ,id_actor_1 int ,rank int ) returns void as $$
declare
	exist_movie boolean; 
	exist_actor boolean;  
begin
    -- check whether the id_movie exists or no --
	select count(*) = 1 into exist_movie from MOVIE where id_movie = id_movie_1;
	if not exist_movie then 
		raise 'ERROR:THE ID_MOVIE % DOES NOT EXIST !',id_movie;
	end if;
	-- check whether the id_actor exists or no --
	select count(*) = 1 into exist_actor from ACTOR where id_actor = id_actor_1;
	if not exist_actor then 
		raise 'ERROR:THE ID_ACTOR % DOES NOT EXIST !',id_actor ;
	end if;

	-- the movie & the actor exist..
    raise notice 'insert new distribute into the database..';

	-- inserting....
	insert into Distribute(id_movie,id_actor,rank) 
    values(id_movie_1,id_actor_1,rank);

end;

$$ LANGUAGE plpgsql;





-- ------------ to get the score of movie ---------------

-- create or replace function getScoreMovie(id_movie_1 int) returns void as $$

-- declare
-- 	cursor_movie refcursor; -- to loop over the table movies
-- 	row_movies_to_fetch MOVIES%ROWTYPE;
--     sum_score int; -- pour calculer la somme de score pour chaque movie
--     nb_votant int; -- pour compter le nombre de votant 

-- begin
-- 	-- on doit parcourire tout la table REview pour calculer la somme (score) pour chaque movie
-- 	OPEN cursor_review FOR select * from REVIEW where id_movie = id_movie_1;
-- 	raise notice 'fetching for movie % ',id_movie_1;
-- 	loop 
-- 		fetch cursor_movie into row_movies_to_fetch;
-- 		EXIT WHEN NOT FOUND;
-- 		-- insert the data in the var sum_score and nb_votant --
		
-- 	end loop;

-- end;

-- $$ LANGUAGE plpgsql;





-- ------------ to get the best movie ---------------

-- create or replace function getTheBestMovie(id_movie_1 int) returns void as $$

-- begin
--    SELECT id_movie, title_movie, MAX(score) FROM REVIEW,MOVIES 
--    WHERE id_movie_1 = id_movie;
--    raise 'The best movie is % with score of %', title_movie, score;

-- end;

-- $$ LANGUAGE plpgsql;

