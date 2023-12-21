import pyodbc
import os
import sys

server_name = "MSI"
db_name = "MC_Data"

cwd = os.getcwd()

cnxn = pyodbc.connect("Driver={SQL Server};"
                      f"Server={server_name};"
                      f"Database={db_name};"
                      "Trusted_Connection=yes;")

cursor = cnxn.cursor()


def get_enchantment(id):
    with open(r"SQL_scripts\Get_Enchantment.sql", mode = "r", encoding= "utf-8") as script:
        query = script.read()
    
    try:
        cursor.execute(query, id)       
        row = cursor.fetchone()   
        return row
    
    except pyodbc.DataError as err:
        print("Input needs to be of type int")
        sys.exit(1)
        
        
def get_item(id):
    with open(r"SQL_scripts\Get_Item.sql", mode = "r", encoding= "utf-8") as script:
        query = script.read()
    
    try:
        cursor.execute(query, id)       
        row = cursor.fetchone()   
        return row
    
    except pyodbc.DataError as err:
        print("Input needs to be of type int")
        sys.exit(1)    

print(get_enchantment("5"))
print(get_item(4))