from pymysql import Connect
from sqlalchemy import create_engine
def connect():
    conn = Connect(user="root",
                   password="123456",
                   host="127.0.0.1",
                   database="db_covid",
                   port=3306,
                   charset="utf8", )
    return conn
#
# def connect():
#     conn = Connect(user="root",
#                    password="root",
#                    host="121.89.192.22",
#                    database="yangluludatbase",
#                    port=3306,
#                    charset="utf8", )
#     return conn

def get_engine():
    # 数据库 用户名和密码 root:000000
    return  create_engine('mysql+pymysql://root:123456@localhost/db_covid?charset=utf8')
# def get_engine():
#     # 数据库 用户名和密码 root:000000
#     return  create_engine('mysql+pymysql://root:root@121.89.192.22/yangluludatbase?charset=utf8')


