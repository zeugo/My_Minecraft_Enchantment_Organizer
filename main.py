import tkinter as tk
from tkinter import ttk
from api import MC_API

#GUI Window
root = tk.Tk()
root.geometry("1000x800")
root.title("Mincraft Supply")
width = 1000
height = 800


api = MC_API("MSI", "MC_Data")


def main():
    main_frame = tk.Frame(root, width=width, height=height)
    main_frame.place(x=0,y=0)
    
    button_enchantment = tk.Button(main_frame, text="Enchantment", command=encahntment)
    button_enchantment.grid(row=0,column=0)
    


def encahntment():
    encahntment_frame = tk.Frame(root, width=width, height=height)
    encahntment_frame.place(x = 0, y = 0)
    
    button_main = tk.Button(encahntment_frame, text = "Main", command = main)
    button_main.grid(row=0,column=0)


def item():
    item_frame = tk.Frame(root,width=width, height=height)
main()
    
"""    
def create_missing_table(missing):
    #Table
    table = ttk.Treeview(root, columns=("Id", "Name", "MaxLevel"), show="headings")
    table.heading("Id", text="Id")
    table.heading("Name", text="Name")
    table.heading("MaxLevel", text="Max level")
    table.pack()

    for row in missing:
        Id, Name, MaxLevel = row
        data = (Id, Name, MaxLevel)
        table.insert(parent='', index=0, values=data)

    #Table binding
    table.bind('<<TreeviewSelect>>', item_select)
"""
  
"""
def update_click():
    Id = e_update.get()
    api.update_enchantment(1, id)
    
def item_select(_):
    Id = 0
    selection = table.selection()
    for item in selection:
        row = table.item(item)
        Id = row["values"][0]
        break
    
    e_update.insert(0, f"{Id}")











###Button
b_update = tk.Button(root, text="Update")
b_update.pack()



###InputField
e_update = tk.Entry(root, width=20, borderwidth=5)
e_update.pack()

"""
root.mainloop()