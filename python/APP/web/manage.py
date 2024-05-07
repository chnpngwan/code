# -*- codeing = utf-8 -*-
'''
===================================
@Time : 2023/12/1 13:27
@Author: 元夜
@File : manage.py
1.功能描述：

2.实现步骤：

======================================
'''
from application import app

def main():
    app.run( host="0.0.0.0",debug=True)



if __name__ == '__main':
    try:
        import sys
        sys.exit(main())
    except Exception as e:
        import traceback
        traceback.print_exception()