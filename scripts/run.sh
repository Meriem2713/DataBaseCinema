
# delete the database cinema..
PGPASSWORD=ohayo psql -U meriem meri_1 -c '\x' -c 'drop database if exists cinema'

# set the password & create the database cinema..
PGPASSWORD=ohayo psql -U meriem meri_1  -c '\x' -c 'create database cinema'

# create tables.. 
PGPASSWORD=ohayo psql -U meriem meri_1  -c '\x' --dbname=cinema -c '\i ../create_tables.sql'

# get the free dataset to fill our database..
# importing data from a free dataset from kaggle website..
# the .csv is in the folder /dataset 
python fill_movie.py
python fill_actors.py
python fill_producers.py
#python fill_awards.py

PGPASSWORD=ohayo psql -U meriem meri_1  -c '\x' --dbname=cinema -c '\i ../fill_movies.sql'
PGPASSWORD=ohayo psql -U meriem meri_1  -c '\x' --dbname=cinema -c '\i ../fill_actors.sql'
PGPASSWORD=ohayo psql -U meriem meri_1  -c '\x' --dbname=cinema -c '\i ../fill_producers.sql'
#PGPASSWORD=ohayo psql -U meriem meri_1  -c '\x' --dbname=cinema -c '\i ../fill_awards.sql'


# storing all the functions & triggers..
# PGPASSWORD=ohayo psql -U meriem meri_1  -c '\x' --dbname=cinema -c '\i create_trigger.sql'

# get the data and store it into 'insert_data.sql' ..
## run it to fill the database for once..
# PGPASSWORD=ohayo psql -U meriem meri_1  -c '\x' --dbname=cinema -c '\i insert_data.sql'


# connect to the database..
PGPASSWORD=ohayo psql -U meriem meri_1 --dbname=cinema





