

print("start importing movies into the database")

movies = open("dataset/movies.csv", "r")
sql_queries_movie_file = open("queries/insert_Data.sql", "a")

query = "insert into MOVIE(title_movie, kind_movie, release_date, company, star_actor) values"

for line in movies:
    movie = line.replace("'", "").split(",")
    # we need to remove apostrophes from strings to avoid errors
    # when inserting data..
    company = movie[1]
    genre = movie[4]
    name = movie[6]
    released = movie[14]
    start_actor = movie[11]

    query += "('"+name+"','"+genre+"','"+released+"','"+company+"','"+start_actor+"'),"

    # we write the sql queries inside the .sql file

query = query[:-1] # to remove the last ','
query += ";"

sql_queries_movie_file.write(query);

sql_queries_movie_file.close()
movies.close()
print("importing movies done !")
