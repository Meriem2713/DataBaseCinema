#!/bin/bash

if [ $1 = "test" ]
then

    echo " -- run test with the ./scenario folder -- > \n"
    
    case $2 in
        "1")
            echo "Scenario 1_ New Critiques ";
            PGPASSWORD=ohayo psql -U meriem meri_1  -c '\x' --dbname=cinema -c '\i scenarios/test_1_new_critiques.sql';
                ;;
        "2")
            echo "Scenario 2_ New wins "
            PGPASSWORD=ohayo psql -U meriem meri_1  -c '\x' --dbname=cinema -c '\i scenarios/test_2_new_wins.sql'
                ;;
        "3")
            echo "Scenario 3_ New Produce "
            PGPASSWORD=ohayo psql -U meriem meri_1  -c '\x' --dbname=cinema -c '\i scenarios/test_3_new_produce.sql'
                ;;
        "4")
            echo "Scenario 4_ New Distribution "
            PGPASSWORD=ohayo psql -U meriem meri_1  -c '\x' --dbname=cinema -c '\i scenarios/test_4_new_distribution.sql'
                ;;
        *)
            echo "Error no scenario !"
                ;;
    esac


    # connect to the database..
    PGPASSWORD=ohayo psql -U meriem meri_1 --dbname=cinema

else
    echo " -- run script for init the database --> \n"

    # delete the database cinema..
    PGPASSWORD=ohayo psql -U meriem meri_1 -c '\x' -c 'drop database if exists cinema'

    # set the password & create the database cinema..
    PGPASSWORD=ohayo psql -U meriem meri_1  -c '\x' -c 'create database cinema'

    # create tables.. 
    PGPASSWORD=ohayo psql -U meriem meri_1  -c '\x' --dbname=cinema -c '\i queries/create_All.sql'

    #clear the insert insert_Data.sql
    echo "" > ./queries/insert_Data.sql 

    # get the free dataset to fill our database..l
    # importing data from a free dataset from kaggle website..
    # the .csv is in the folder /dataset 
    python ./scripts/fill_movie.py
    python ./scripts/fill_actors.py
    python ./scripts/fill_producers.py


    # inserting the awards 
    cat ./queries/insert_Awards.sql >> ./queries/insert_Data.sql

    # inserting the users
    cat ./queries/create_Users.sql >> ./queries/insert_Data.sql


    # get the data and store it into 'insert_data.sql' ..
    ## run it to fill the database for once..
    PGPASSWORD=ohayo psql -U meriem meri_1  -c '\x' --dbname=cinema -c '\i ./queries/insert_Data.sql'


    # storing all the functions & triggers..
    PGPASSWORD=ohayo psql -U meriem meri_1  -c '\x' --dbname=cinema -c '\i ./queries/create_Trigger.sql'


    # connect to the database..
    PGPASSWORD=ohayo psql -U meriem meri_1 --dbname=cinema
fi








