# -*- codeing = utf-8 -*-
'''
===================================
@Time : 2023/12/1 13:27
@Author: 元夜
@File : apploction.py
1.功能描述：

2.实现步骤：

======================================
'''
from flask import Flask
from flask_sqlalchemy import SQLAlchemy

class Application( Flask ):
    def __init__(self,import_name):
        super(Application,self).__init__(import_name)
        self.config.from_pyfile(r'..\config\base_setting.py')

        db.init_app(self)


db = SQLAlchemy()
app = Application(__name__)