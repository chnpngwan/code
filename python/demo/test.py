# -*- coding: utf-8 -*-
"""
    @Time ： 2023/9/22 16:35
    @Auth ： chnpngwng
    @Project : python
    @File ：test.py
    @IDE ：PyCharm
"""
from selenium import webdriver

driver = webdriver.Chrome()
url = 'https://www.baidu.com/'
driver.get(url)
driver.maximize_window()