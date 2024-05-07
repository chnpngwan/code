import requests
from PyQt5.QtWidgets import QApplication, QMainWindow, QLabel, QLineEdit, QPushButton
from PyQt5.QtGui import QFont

def get_public_ip():
    try:
        response = requests.get('https://api.ipify.org?format=json')
        data = response.json()
        public_ip = data['ip']
        return public_ip
    except Exception as e:
        return None

class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("公网IP地址查询工具")
        self.setFixedSize(576, 283)

        self.label = QLabel("获取本机公网IP地址", self)
        self.label.setGeometry(50, 50, 476, 30)
        self.label.setFont(QFont("Arial", 16))

        self.ip_textbox = QLineEdit(self)
        self.ip_textbox.setGeometry(50, 90, 476, 30)
        self.ip_textbox.setReadOnly(True)
        self.ip_textbox.setStyleSheet("QLineEdit { background-color: #f2f2f2; border: 1px solid #ccc; font-size: 14px; }")
        self.ip_textbox.setFont(QFont("Arial", 14))

        self.button = QPushButton("一键获取IP", self)
        self.button.setGeometry(200, 140, 176, 40)
        self.button.setStyleSheet("QPushButton { background-color: #4CAF50; color: white; border: none; font-size: 16px; }"
                                  "QPushButton:hover { background-color: #45a049; }")
        self.button.setFont(QFont("Arial", 16))
        self.button.clicked.connect(self.show_public_ip)

    def show_public_ip(self):
        public_ip = get_public_ip()
        if public_ip:
            self.ip_textbox.setText(public_ip)
        else:
            self.ip_textbox.setText("获取公网IP地址时发生错误")

# 创建应用程序
app = QApplication([])

# 创建主窗口
window = MainWindow()

# 显示窗口
window.show()

# 运行应用程序
app.exec_()