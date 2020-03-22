print("start importing producers into the database")

movies = open("../dataset/movies.csv", "r")
sql_queries_producer_file = open("../fill_producers.sql", "w")

query = "insert into PRODUCER(name_producer) values"

for line in movies:
    movie = line.replace("'", "").split(",")
    # we need to remove apostrophes from strings to avoid errors
    # when inserting data..

    producer = movie[3]

    query += "('"+producer+"'),"

query = query[:-1] # to remove the last ','
query += ";"

sql_queries_producer_file.write(query);

sql_queries_producer_file.close()
movies.close()


print("importing producers done !")
