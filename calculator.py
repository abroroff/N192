from PyQt5.QtWidgets import QApplication,QWidget,QLabel,QLineEdit,QPushButton,QHBoxLayout,QVBoxLayout

class Window(QWidget):
    def __init__(self):
        super().__init__()

        self.v_main = QVBoxLayout()

        self.edi = QLineEdit()
        self.v_main.addWidget(self.edi)

        self.lbl = QLabel()
        self.lbl.setStyleSheet("font-size:20px")
        self.v_main.addWidget(self.lbl)

        self.row1 = QHBoxLayout()
        self.btn = QPushButton("7")
        self.row1.addWidget(self.btn)
        self.btn.clicked.connect(lambda: self.belgi("7"))
        self.btn = QPushButton("8")
        self.row1.addWidget(self.btn)
        self.btn.clicked.connect(lambda: self.belgi("8"))
        self.btn = QPushButton("9")
        self.row1.addWidget(self.btn)
        self.btn.clicked.connect(lambda: self.belgi("9"))
        self.btn = QPushButton("/")
        self.row1.addWidget(self.btn)
        self.btn.clicked.connect(lambda: self.belgi("/"))

        self.row2 = QHBoxLayout()
        self.btn = QPushButton("4")
        self.row2.addWidget(self.btn)
        self.btn.clicked.connect(lambda: self.belgi("4"))
        self.btn = QPushButton("5")
        self.row2.addWidget(self.btn)
        self.btn.clicked.connect(lambda: self.belgi("5"))
        self.btn = QPushButton("6")
        self.row2.addWidget(self.btn)
        self.btn.clicked.connect(lambda: self.belgi("6"))
        self.btn = QPushButton("x")
        self.row2.addWidget(self.btn)
        self.btn.clicked.connect(lambda: self.belgi("x"))

        self.row3 = QHBoxLayout()
        self.btn = QPushButton("1")
        self.row3.addWidget(self.btn)
        self.btn.clicked.connect(lambda: self.belgi("1"))
        self.btn = QPushButton("2")
        self.row3.addWidget(self.btn)
        self.btn.clicked.connect(lambda: self.belgi("2"))
        self.btn = QPushButton("3")
        self.row3.addWidget(self.btn)
        self.btn.clicked.connect(lambda: self.belgi("3"))
        self.btn = QPushButton("-")
        self.row3.addWidget(self.btn)
        self.btn.clicked.connect(lambda: self.belgi("-"))

        self.row4 = QHBoxLayout()
        self.btn = QPushButton("0")
        self.row4.addWidget(self.btn)
        self.btn.clicked.connect(lambda: self.belgi("0"))
        self.btn = QPushButton("AC")
        self.row4.addWidget(self.btn)
        self.btn.clicked.connect(lambda: self.belgi("AC"))
        self.btn = QPushButton("=")
        self.row4.addWidget(self.btn)
        self.btn.clicked.connect(lambda: self.belgi("="))
        self.btn = QPushButton("+")
        self.row4.addWidget(self.btn)
        self.btn.clicked.connect(lambda: self.belgi("+"))

        self.v_main.addLayout(self.row1)
        self.v_main.addLayout(self.row2)
        self.v_main.addLayout(self.row3)
        self.v_main.addLayout(self.row4)

        self.setLayout(self.v_main)

    def belgi(self, value):
        if value == "AC":
            self.edi.clear()
            self.lbl.clear()
        elif value == "=":
            try:
                text = self.edi.text().replace("x", "*")
                res = eval(text)
                self.lbl.setText(str(res))
            except:
                self.lbl.setText("Error")
        else:
            self.edi.setText(self.edi.text() + value)

app = QApplication([])
win = Window()
win.show()
app.exec_()