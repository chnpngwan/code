import mysql.connector

class MySQLConnector:
    def __init__(self):
        print("数据库连接初始化")
        self.host = "gz-cdb-qq476zov.sql.tencentcdb.com"
        self.user = "root"
        self.password = "admin12345"
        self.database = "smartagridb"
        self.port = 63297
        self.connection = None

        self.connect()

    def connect(self):
        try:
            self.connection = mysql.connector.connect(
                host=self.host,
                user=self.user,
                password=self.password,
                port=self.port,
                database=self.database
            )
            print("--数据库连接成功--")
        except mysql.connector.Error as error:
            print("数据库连接失败：", error)

    def disconnect(self):
        if self.connection:
            self.connection.close()
            print("数据库断开连接--")

    def execute_query(self, query):
        # if not self.connection:
        #     print("Not connected to MySQL database")
        #     return None

        cursor = self.connection.cursor(dictionary=True)
        try:
            cursor.execute(query)
            result = cursor.fetchall()
            return result
        except mysql.connector.Error as error:
            print("查询异常:", error)
            return None
        finally:
            cursor.close()

# 示例用法
# if __name__ == "__main__":
#     # 创建 MySQLConnector 实例
#     mysql_connector = MySQLConnector(host="localhost", user="root", password="password", database="mydatabase")
#
#     # 连接到 MySQL 数据库
#     mysql_connector.connect()
#
#     # 执行查询
#     query = "SELECT * FROM mytable"
#     result = mysql_connector.execute_query(query)
#     if result:
#         for row in result:
#             print(row)
#
#     # 断开与 MySQL 数据库的连接
#     mysql_connector.disconnect()
