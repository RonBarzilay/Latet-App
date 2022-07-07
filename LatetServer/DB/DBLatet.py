from flask import Flask, jsonify, request
from flask_sqlalchemy import SQLAlchemy
import psycopg2

"""
Variables Declaration
"""


def connect_to_database():
    connection = psycopg2.connect(user="postgres",
                                  password="1212",
                                  host="127.0.0.1",
                                  port="5432",
                                  database="latetdb")
    cursor = connection.cursor()
    return connection, cursor


class DBLatet:
    # Create instance of SQLAlchemy and config
    app = Flask(import_name="latet")
    app.config['SQLALCHEMY_DATABASE_URI'] = "postgresql://postgres:1212@localhost/latetdb"
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    db = SQLAlchemy(app)

    # Connect to the db

    def insert_into_responsible_table(army_id, id, first_name, last_name, unit, manager_army_id):
        try:
            connection, cursor = connect_to_database()
            cursor.execute(
                'INSERT INTO admin (army_id,id,first_name,last_name,unit,manager_army_id) VALUES (%s,%s,%s,%s,%s,%s)',
                (army_id, id, first_name, last_name, unit, manager_army_id))
            connection.commit()
            print(cursor.rowcount)

        except (Exception, psycopg2.Error) as error:
            print("Failed to insert record into responsible table", error)

        finally:
            # closing database connection.
            if connection:
                cursor.close()
                connection.close()
                print("PostgreSQL connection is closed")

    def insert_into_manager_table(army_id, id, first_name, last_name, unit):
        try:
            connection, cursor = connect_to_database()
            cursor.execute('INSERT INTO admin (army_id,id,first_name,last_name,unit) VALUES (%s,%s,%s,%s,%s)',
                           (army_id, id, first_name, last_name, unit))
            connection.commit()

        except (Exception, psycopg2.Error) as error:
            print("Failed to insert record into manager table", error)

        finally:
            # closing database connection.
            if connection:
                cursor.close()
                connection.close()
                print("PostgreSQL connection is closed")

    def select_from_admin_table(self):
        try:
            connection, cursor = connect_to_database()
            cursor.execute('SELECT * FROM Admin;')
            connection.commit()
            print("total rows: ", cursor.rowcount)
            print("data: ", cursor.fetchall())
            print("type: ", type(cursor.fetchall()))
        except (Exception, psycopg2.Error) as error:
            print("Failed to select record from Admin table", error)
        finally:
            # closing database connection.
            if connection:
                cursor.close()
                connection.close()
                print("PostgreSQL connection is closed")

    def select_from_volunteer_table(self, unit, populationType):
        try:
            connection, cursor = connect_to_database()
            cursor.execute(f'SELECT id, first_name, last_name FROM "Volunteer" WHERE "unit"={unit} AND "population_type"={populationType} ORDER BY last_name ASC')
            connection.commit()
            print("total rows: ", cursor.rowcount)
            volunteers = cursor.fetchall()
        except (Exception, psycopg2.Error) as error:
            print("Failed to select record into Volunteer table", error)
        finally:
            # closing database connection.
            if connection:
                cursor.close()
                connection.close()
                print("PostgreSQL connection is closed")
                return volunteers

def instert_into_volunteers_table(volunteer):
        try:
            connection, cursor = connect_to_database()
            cursor.execute(
                'INSERT INTO volunteer (army_id,id,first_name,last_name,unit,responsible_id,birth_date,age,location,start_of_insurance,end_of_insurance,id_manager,)')

        except (Exception, psycopg2.Error) as error:
            print("Failed to insert record into responsible table", error)

        finally:
            # closing database connection.
            if connection:
                cursor.close()
                connection.close()
                print("PostgreSQL connection is closed")
