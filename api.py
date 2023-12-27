import pyodbc
import os
import sys


class MC_API:
    def __init__(self, server_name, db_name):       
        self.server_name = server_name
        self.db_name = db_name
        self.cnxn = pyodbc.connect("Driver={SQL Server};"
                      f"Server={server_name};"
                      f"Database={db_name};"
                      "Trusted_Connection=yes;")

        self.cursor = self.cnxn.cursor()


    def get_enchantment(self, id):
        with open(r"SQL_scripts\Get_Enchantment.sql", mode = "r", encoding= "utf-8") as script:
            query = script.read()
        
        try:
            self.cursor.execute(query, id)       
            row = self.cursor.fetchone()   
            return list(row)
        
        except pyodbc.DataError as err:
            print("Input needs to be of type int")
            sys.exit(1)
        
        
    def get_item(self, id):
        with open(r"SQL_scripts\Get_Item.sql", mode = "r", encoding= "utf-8") as script:
            query = script.read()
        
        try:
            self.cursor.execute(query, id)       
            row = self.cursor.fetchone()   
            return list(row)
        
        except pyodbc.DataError as err:
            print("Input needs to be of type int")
            sys.exit(1)
            
            
    def get_items(self,obtained):
        with open(r"SQL_scripts\Get_Items.sql", mode = "r", encoding= "utf-8") as script:
            query = script.read()
        
        try:
            self.cursor.execute(query, obtained)       
            row = self.cursor.fetchall()   
            return list(row)
        
        except pyodbc.DataError as err:
            print("Input needs to be of type int")
            sys.exit(1)
            

    def get_missing_enchantments(self, status):
        with open(r"SQL_scripts\Get_Enchantments.sql", mode = "r", encoding= "utf-8") as script:
            query = script.read()
        
        try:
            self.cursor.execute(query, status)       
            rows = self.cursor.fetchall()   
            return list(rows)
        
        except pyodbc.DataError as err:
            print("Input needs to be of type int")
            sys.exit(1)    
        

    def update_enchantment(self, status, id):
        with open(r"SQL_scripts\Update_Enchantment.sql", mode = "r", encoding= "utf-8") as script:
            query = script.read()
        
        try:
            self.cursor.execute(query, (status, id))
            self.cnxn.commit()
        
        except pyodbc.DataError as err:
            print("Input needs to be of type int")
            sys.exit(1)