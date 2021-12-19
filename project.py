import pandas as pd
import psycopg2
import streamlit as st
from configparser import ConfigParser

"# AirBnb Database "


@st.cache
def get_config(filename="database.ini", section="postgresql"):
    parser = ConfigParser()
    parser.read(filename)
    return {k: v for k, v in parser.items(section)}


@st.cache
def query_db(sql: str):
    # print(f"Running query_db(): {sql}")

    db_info = get_config()

    # Connect to an existing database
    conn = psycopg2.connect(**db_info)

    # Open a cursor to perform database operations
    cur = conn.cursor()

    # Execute a command: this creates a new table
    cur.execute(sql)

    # Obtain data
    data = cur.fetchall()

    column_names = [desc[0] for desc in cur.description]

    # Make the changes to the database persistent
    conn.commit()

    # Close communication with the database
    cur.close()
    conn.close()

    df = pd.DataFrame(data=data, columns=column_names)

    return df


"## Read tables"

sql_all_table_names = "SELECT relname FROM pg_class WHERE relkind='r' AND relname !~ '^(pg_|sql_)';"
try:
    all_table_names = query_db(sql_all_table_names)["relname"].tolist()
    table_name = st.selectbox("Choose a table", all_table_names)
except:
    st.write("Sorry! Something went wrong with your query, please try again.")

if table_name:
    f"Display the table"

    sql_table = f"SELECT * FROM {table_name};"
    try:
        df = query_db(sql_table)
        st.dataframe(df)
    except:
        st.write(
            "Sorry! Something went wrong with your query, please try again."
        )




"## 1. Query Hosts, Rooms and Neighborhoods info"

sql_neighborhoods_names1 = "SELECT n_name FROM Neighborhoods;"
try:
    neighborhoods_names1 = query_db(sql_neighborhoods_names1)["n_name"].tolist()
    neighborhoods_name1 = st.selectbox("Choose a Neighborhood, we will show you the hosts' names, and how many listings that host has in that neighborhood: ", neighborhoods_names1)
except:
    st.write("Sorry! Something went wrong with your query, please try again.")


if neighborhoods_name1:
            sql_neighborhoods1 = f"""SELECT H.name, N.n_name, COUNT(H.hid)
            FROM Rooms R, Listings L, Neighborhoods N, Hosts H
            WHERE R.lid = L.lid
            AND H.hid = L.hid
            AND L.n_name = N.n_name
            AND L.n_name = '{neighborhoods_name1}'
            GROUP BY H.name, N.n_name;"""

            df = query_db(sql_neighborhoods1)
            st.dataframe(df)

        
        
"## 2. Query Neighborhoods with certain qualifications"

equinox_res_museum = st.checkbox('Check this box, if you are looking for a place to stay for September Equinox. [The result shows neighborhoods, start, end dates, that have restaurants, museums, no curfew, and have listings available on September Equinox (September 22nd, 2021).]')
quiet_business_stay = st.checkbox('Check this box, if you are looking for a few quiet nights in during your Business trip in September. [The result shows neighborhoods, start, end dates, that have museums, restaurants, and a curfew.')
party_fun_stay = st.checkbox('Check this box, if you are looking for a few fun nights in Amsterdam in September. The result shows neighborhoods that have restaurants, museums, and no curfew.')

if equinox_res_museum:
    st.write('A list of options for you to consider if you are in Amsterdam for September Equinox.')
    sql_equinox_res_museum = f"""SELECT N.n_name, AD.start_date, AD.end_date, count(*)
    FROM Neighborhoods N, Availability_dates AD, Rooms R, Listings L
    WHERE N.n_name = L.n_name
    AND R.lid = L.lid
    AND AD.lid = L.lid
    AND AD.room_id = R.room_id
    AND N.restaurant = true
    AND N.museum = true
    AND N.curfew = false
    AND AD.start_date between '2021-09-10' and'2021-09-22'
    AND AD.end_date between '2021-09-22' and '2021-10-01'
    GROUP by N.n_name, AD.start_date, AD.end_date;"""
    
    try:
        df = query_db(sql_equinox_res_museum)
        st.dataframe(df)
    except:
        st.write(
            "Sorry! Something went wrong with your query, please try again."
        )
        
if quiet_business_stay:
    st.write('A list of options for you to consider if you are in Amsterdam for Business in September.')
    sql_quiet_business_stay = f"""SELECT N.n_name, AD.start_date, AD.end_date, count(*)
    FROM Neighborhoods N, Availability_dates AD, Rooms R, Listings L
    WHERE N.restaurant = true
    AND L.n_name = N.n_name
    AND R.lid = L.lid
    AND AD.lid = R.lid
    AND AD.room_id = R.room_id
    AND N.restaurant = true
    AND N.museum = true
    AND N.curfew = true
    AND AD.start_date between '2021-09-01' and'2021-10-01'
    AND AD.end_date between '2021-09-01' and '2021-10-01'
    GROUP by N.n_name, AD.start_date, AD.end_date; """
    try:
        df = query_db(sql_quiet_business_stay)
        st.dataframe(df)
    except:
        st.write(
            "Sorry! Something went wrong with your query, please try again."
        )
if party_fun_stay:
    st.write('A list of options for you to consider if you are in Amsterdam for fun in September.')
    sql_party_fun_stay = f"""SELECT N.n_name, AD.start_date, AD.end_date, count(*)
    FROM Neighborhoods N, Availability_dates AD, Rooms R, Listings L
    WHERE N.n_name = L.n_name
    AND R.lid = L.lid
    AND AD.lid = L.lid
    AND AD.room_id = R.room_id
    AND N.restaurant = true
    AND N.museum = true
    AND N.curfew = false
    AND AD.start_date between '2021-09-01' and'2021-10-01'
    AND AD.end_date between '2021-09-01' and '2021-10-01'
    GROUP by N.n_name, AD.start_date, AD.end_date;"""
    try:
        df = query_db(sql_party_fun_stay)
        st.dataframe(df)
    except:
        st.write(
            "Sorry! Something went wrong with your query, please try again."
        )
        
"## 3. Query the highest, lowest, and average price in each Neighborhood "

sql_neighborhoods_names3 = "SELECT n_name FROM Neighborhoods;"
try:
    neighborhoods_names3 = query_db(sql_neighborhoods_names3)["n_name"].tolist()
    neighborhoods_name3 = st.selectbox("Choose a Neighborhood, we will show you the Max, Min, and Average price in that neighborhood. ", neighborhoods_names3)
except:
    st.write("Sorry! Something went wrong with your query, please try again.")

if neighborhoods_name3:
            sql_neighborhoods3 = f"""
            SELECT N.n_name, P.max_price, P.min_price, P.avg_price
            FROM Neighborhoods N
            INNER JOIN
            (
            SELECT n_name, MAX(price) max_price, MIN(price) min_price, SUM(price)/COUNT(*) avg_price
            FROM Listings AS L
            GROUP BY n_name)
            AS P ON N.n_name = P.n_name
            WHERE N.n_name = '{neighborhoods_name3}'; """

            df = query_db(sql_neighborhoods3)
            st.dataframe(df)
            

"## 4. Find your ideal room based on your lowest acceptable rating and expected neighborhood. "

sql_neighborhoods_names4 = "SELECT n_name FROM Neighborhoods;"
try:
    neighborhoods_names4 = query_db(sql_neighborhoods_names4)["n_name"].tolist()
    neighborhoods_name4 = st.selectbox("Choose a Neighborhood you would like to stay", neighborhoods_names4)
    rating_number = st.number_input('Insert the lowest acceptable rating and we will help you find a list of rooms in your desired neighborhood. [Rating should be an integer between 0 and 10.]', min_value=0, max_value=10, step= 1)
    st.write(rating_number)
#    rating_number = st.slider("Pick a rating between 1 - 10 ", min_value = 0.00, max_value = 10.00, step = 0.01)
#    st.write("The lowest rating you'd like to accept is : ", rating_number)
except:
    st.write("Sorry! Something went wrong with your query, please try again.")

if neighborhoods_name4:
            sql_neighborhoods_review_rooms = f"""
            SELECT H.name, R.lid, R.room_id, N.n_name, RA.score, R.room_type, R.num_people
            FROM Hosts H, Neighborhoods N, Ratings RA, Rooms R, Listings L
            WHERE H.hid = L.hid
            AND L.n_name = N.n_name
            AND RA.lid = L.lid
            AND L.lid = R.lid
            AND N.n_name = '{neighborhoods_name4}'
            AND RA.score >= '{rating_number}'
            ORDER BY RA.score DESC, R.room_id;"""

            df = query_db(sql_neighborhoods_review_rooms)
            st.dataframe(df)
            
            
"## 5. Find your ideal rooms based on the number of people who are visiting."
"#### We will let you know if any rooms would be able accomodate everyone in your group, and show you the host, listing, and room information."

try:
    st.subheader("Number of people: ")
    total_visitor_count = st.slider("Pick a number between 1 - 20 ", min_value = 1, max_value = 20, step = 1)
    st.write("The most number of people a listing can accomodate: ", total_visitor_count)
except:
    st.write("Sorry! Something went wrong with your query, please try again.")

if total_visitor_count:
            sql_neighborhoods_vistor_rooms = f"""
            SELECT L.lid, L.property_type, R.room_id, R.room_type, H.name, N.n_name, R.num_people as num_people_per_room
            FROM Hosts H, Neighborhoods N, Rooms R, Listings L
            WHERE H.hid = L.hid
            AND L.n_name = N.n_name
            AND R.lid = L.lid
            AND R.num_people >= '{total_visitor_count}'
            ORDER BY L.lid, L.property_type, R.room_id, R.room_type, N.n_name, H.name, R.num_people DESC; """

            df = query_db(sql_neighborhoods_vistor_rooms)
            st.dataframe(df)

