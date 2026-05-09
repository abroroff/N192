from PyQt5.QtWidgets import *
import json

class Tasks(QWidget):
    def __init__(self):
        super().__init__()

        self.v_main = QVBoxLayout()

        self.setWindowTitle("Task Manager Lite")
        self.setGeometry(500,300,280,200)
        self.task_input = QLineEdit()
        self.task_input.setPlaceholderText("Task name...")
        self.status_input = QLineEdit()
        self.status_input.setPlaceholderText("Status (Done/Pending)...")
        self.search_input = QLineEdit()
        self.search_input.setPlaceholderText("Search...")

        self.add_btn = QPushButton("Add")
        self.add_btn.clicked.connect(self.Add)
        self.search_btn = QPushButton("Search")
        self.search_btn.clicked.connect(self.Search)
        self.total_btn = QPushButton("Total tasks")
        self.total_btn.clicked.connect(self.Overall)

        with open("data.json", "r") as r:
            self.k = json.load(r)

        self.info_lbl = QLabel(f"Total tasks: {len(self.k)}")

        self.v_main.addWidget(self.task_input)
        self.v_main.addWidget(self.status_input)
        self.v_main.addWidget(self.search_input)
        self.v_main.addWidget(self.add_btn)
        self.v_main.addWidget(self.search_btn)
        self.v_main.addWidget(self.total_btn)
        self.v_main.addWidget(self.info_lbl)


        self.setLayout(self.v_main)

    def Add(self):
        task = self.task_input.text()
        status = self.status_input.text()
        dc = {"task": task, "status": status}
        if len(task) > 3 and status == "Done" or status == "Pending":
            try:
                with open("data.json", "r") as r:
                    k = json.load(r)
            except:
                k = []
            k.append(dc)
            with open("data.json", "w") as w:
                json.dump(k, w, indent=4)
            self.task_input.clear()
            self.status_input.clear()
            with open("data.json", "r") as r:
                self.k = json.load(r)
            self.info_lbl.setText(f"Total tasks: {len(self.k)}")
            QMessageBox().information(self, "Done", "Task saved successfuly")
        elif status != "Done" and status != "Pending" and status != "":
            QMessageBox().warning(self, "Warning", "Status is wrong")
        elif len(task) < 3:
            QMessageBox().warning(self, "Warning", "Task is too short")
        else:
            QMessageBox().warning(self, "Warning", "Fill in all fields")

    def Search(self):
        search = self.search_input.text()
        if search:
            with open("data.json", "r") as r:
                k = json.load(r)
            for i in k:
                if i["task"] == search:
                    QMessageBox().information(self, "Done", f'''Taks:  {i["task"]}\nStatus:  {i["status"]}''')
                    self.search_input.clear()
                    break
            else:
                QMessageBox().warning(self, "Warning", "Invalid task")
        else:
            QMessageBox().warning(self, "Warning", "Fill in the search field")

    def Overall(self):
        with open("data.json", "r") as r:
            k = json.load(r)
        QMessageBox().information(self, "Done", f'''Total tasks:  {len(k)}''')

app = QApplication([])
win = Tasks()
win.show()
app.exec_()

