print("start importing actors into the database")

movies = open("dataset/movies.csv", "r")
sql_queries_actor_file = open("queries/insert_Data.sql", "a")

query = "insert into ACTOR(name_actor) values"

for line in movies:
    movie = line.replace("'", "").split(",")
    # we need to remove apostrophes from strings to avoid errors
    # when inserting data..

    actor = movie[11]

    query += "('"+actor+"'),"

query = query[:-1] # to remove the last ','
query += ";"

sql_queries_actor_file.write(query);

sql_queries_actor_file.close()
movies.close()

print("importing actors done !")
