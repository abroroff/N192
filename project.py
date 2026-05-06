from PyQt5.QtWidgets import QApplication,QWidget,QLineEdit,QLabel,QPushButton,QHBoxLayout,QVBoxLayout,QRadioButton,QComboBox,QMessageBox
import json

class Window(QWidget):
    def __init__(self):
        super().__init__()

        self.main = QVBoxLayout()
        self.h = QHBoxLayout()
        self.h_city = QHBoxLayout()
        self.h_district = QHBoxLayout()
        self.h_btn = QHBoxLayout()

        self.name = QLineEdit()
        self.name.setPlaceholderText("First name...")

        self.second = QLineEdit()
        self.second.setPlaceholderText("Second name...")

        self.age = QLineEdit()
        self.age.setPlaceholderText("Age...")

        self.gender = QLabel("Gender:")
        self.lbl_city = QLabel("City:")
        self.lbl_district = QLabel("Dist:")

        self.male = QRadioButton("Male")
        self.female = QRadioButton("Female")

        self.city = QComboBox()
        self.city.addItem("Toshkent city")
        self.city.addItem("Namangan city")
        self.city.addItem("Andijon city")
        self.city.addItem("Farg'ona city")

        self.district = QComboBox()
        self.districts = {
            "Toshkent city": ["Yunusobod district", 
                              "Chilonzor district", 
                              "Mirzo Ulug‘bek district", 
                              "Shayxontohur district", 
                              "Yakkasaroy district"],

            "Namangan city": ["Namangan district", 
                              "Chortoq district", 
                              "Kosonsoy district", 
                              "Pop district", 
                              "Chust district"],

            "Andijon city": ["Andijon district", 
                             "Asaka district", 
                             "Shahrixon district", 
                             "Xo‘jaobod district", 
                             "Paxtaobod district"],

            "Farg'ona city": ["Farg‘ona district", 
                              "Qo‘qon district", 
                              "Marg‘ilon district", 
                              "Quva district", 
                              "Beshariq district"]
            }
        
        self.city.activated[str].connect(self.District)
        
        self.btn_submit = QPushButton("Submit", self)
        self.btn_submit.clicked.connect(self.Check)

        self.btn_exit = QPushButton("Exit")
        self.btn_exit.clicked.connect(self.close)

        self.main.addWidget(self.name)
        self.main.addWidget(self.second)
        self.main.addWidget(self.age)
        self.h.addWidget(self.gender)
        self.h.addWidget(self.male)
        self.h.addWidget(self.female)

        self.main.addLayout(self.h)

        self.h_city.addWidget(self.lbl_city)
        self.h_city.addWidget(self.city,1)
        self.main.addLayout(self.h_city)

        self.h_district.addWidget(self.lbl_district)
        self.h_district.addWidget(self.district,1)
        self.main.addLayout(self.h_district)

        self.h_btn.addWidget(self.btn_submit)
        self.h_btn.addWidget(self.btn_exit)
        self.main.addLayout(self.h_btn)

        self.setLayout(self.main)

        self.District(self.city.currentText())

    def District(self, city):
        self.district.clear()
        self.district.addItems(self.districts[city])

    def Check(self):
        self.msg = QMessageBox()
        name = self.name.text()
        second = self.second.text()
        age = self.age.text()
        male = self.male.isChecked()
        female = self.female.isChecked()
        city = self.city.currentText()
        district = self.district.currentText()
        if name == "" or second == "" or age == "":
            self.msg.setText("Fill the blank ❌")
            self.msg.setIcon(QMessageBox.Warning)
            self.msg.exec_()
            return
        if not age.isdigit():
            self.msg.setText("Age must be number ❌")
            self.msg.setIcon(QMessageBox.Warning)
            self.msg.exec_()
            return
        if not (male or female):
            self.msg.setText("Select gender ❌")
            self.msg.setIcon(QMessageBox.Warning)
            self.msg.exec_()
            return

        self.msg.setText("Submitted successful ✅")
        self.msg.setIcon(QMessageBox.Information)
        self.msg.exec_()
        k = []
        dc = {"name": name,"second": second,"age": age,
              "gender":"Male" if male else "Female",
              "city": city, "district": district}
        try:
            with open("data.json", "r") as r:
                k = json.load(r)
        except(FileNotFoundError, json.JSONDecodeError):
            k = []
        k.append(dc)
        with open("data.json", "w") as w:
            json.dump(k, w, indent=4)     

    
app = QApplication([])
win = Window()
win.show()
app.exec_()
