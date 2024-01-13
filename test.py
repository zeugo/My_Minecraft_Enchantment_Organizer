import tkinter as tk
from tkinter import ttk
from api import MC_API


class SampleApp(tk.Tk):
    def __init__(self):
        tk.Tk.__init__(self)
        self._frame = None
        self.switch_frame(StartPage)

    def switch_frame(self, frame_class):
        """Destroys current frame and replaces it with a new one."""
        new_frame = frame_class(self)
        if self._frame is not None:
            self._frame.destroy()
        self._frame = new_frame
        self._frame.pack()

class StartPage(tk.Frame):
    def __init__(self, master):
        tk.Frame.__init__(self, master)
        tk.Label(self, text="This is the start page").pack(side="top", fill="x", pady=10)
        tk.Button(self, text="Open page one",
                  command=lambda: master.switch_frame(Enchantment)).pack()
        tk.Button(self, text="Open page two",
                  command=lambda: master.switch_frame(Item)).pack()

class Enchantment(tk.Frame):
    def __init__(self, master):
        tk.Frame.__init__(self, master)
        tk.Label(self, text="This is page one").pack(side="top", fill="x", pady=10)
        tk.Button(self, text="Return to start page",
                  command=lambda: master.switch_frame(StartPage)).pack()
        
        table = ttk.Treeview(master, columns=("Id", "Name", "MaxLevel"), show="headings")
        table.heading("Id", text="Id")
        table.heading("Name", text="Name")
        table.heading("MaxLevel", text="Max level")
        table.pack()

        for row in missing:
            Id, Name, MaxLevel = row
            data = (Id, Name, MaxLevel)
            table.insert(parent='', index=0, values=data)

        #Table binding
        #table.bind('<<TreeviewSelect>>', item_select)


class Item(tk.Frame):
    def __init__(self, master):
        tk.Frame.__init__(self, master)
        tk.Label(self, text="This is page two").pack(side="top", fill="x", pady=10)
        tk.Button(self, text="Return to start page",
                  command=lambda: master.switch_frame(StartPage)).pack()

if __name__ == "__main__":
    app = SampleApp()
    app.geometry("1000x800")
    app.mainloop()