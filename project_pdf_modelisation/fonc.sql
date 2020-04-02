functions:
------------

function newCritique(id movie, id user, string title, string content, int score)
function newWins(id movie, id award, date year)
function produce(id producer, id movie )
function distribute(id actor, id movie, string rank)
function get ScoreMovie(id movie);
function get howManyVoters(id movie);
function get howManyAwards(id movie);
function get howManyActors(id movie);

function getTheBestMovie(id movie);



triggers:
------------

triggers before insert into every relation to fill the audit table to keep track
of every operations

trigger before insert a wins to verify if this movie has already wins this award

trigger before insert a produce to verify if this producer
has already produce this movie

