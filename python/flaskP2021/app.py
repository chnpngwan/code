from flask import Flask,request
from gevent.pywsgi import WSGIServer
import pymysql
import json

app = Flask(__name__)

@app.route('/')
def hello_world():  # put application's code here
    return 'Hello World!'

@app.route('/getBrowserByDate1',methods=['GET'])
def getBrowserByDate1():
    conn = pymysql.connect(host='127.0.0.1', port=3307, user='root', passwd='123456', db='shtd_store', charset='utf8')
    cur = conn.cursor()
    cont = cur.execute("select * from tb_browsers ")
    res = cur.fetchall()
    cur.close()
    conn.commit()
    conn.close()

    arrayResult = []  # 定义一个数组
    # 遍历元组数据将数据装到指定元组
    for row in res:
        result = {}
        result['id'] = row[0]
        result['user'] = row[1]
        result['code'] = row[2]
        result['browser'] = row[3]
        result['banner'] = row[4]
        result['score_designer'] = row[5]
        result['score_speed'] = row[6]
        result['score_content'] = row[7]
        result['visit_date'] = row[8]
        arrayResult.append(result)

    result = {
        'code':200,
        'msg':'查询成功',
        'results':arrayResult
    }
    Jsonstr = json.dumps(result)
    return Jsonstr.encode('utf-8').decode('unicode_escape')

@app.route('/getBrowserByDate2',methods=['POST'])
def getBrowserByDate2():
    start = request.form.get('start')
    end = request.form.get('end')
    conn = pymysql.connect(host='127.0.0.1', port=3307, user='root', passwd='123456', db='shtd_store', charset='utf8')
    cur = conn.cursor()
    cont = cur.execute("select * from tb_browsers where visit_date >= '{}' and visit_date <= '{}'".format(start,end))
    res = cur.fetchall()
    cur.close()
    conn.commit()
    conn.close()

    arrayResult = []  # 定义一个数组
    # 遍历元组数据将数据装到指定元组
    for row in res:
        result = {}
        result['id'] = row[0]
        result['user'] = row[1]
        result['code'] = row[2]
        result['browser'] = row[3]
        result['banner'] = row[4]
        result['score_designer'] = row[5]
        result['score_speed'] = row[6]
        result['score_content'] = row[7]
        result['visit_date'] = row[8]
        arrayResult.append(result)

    result = {
        'code':200,
        'msg':'查询成功',
        'results':arrayResult
    }
    Jsonstr = json.dumps(result)
    return Jsonstr.encode('utf-8').decode('unicode_escape')

if __name__ == '__main__':
    WSGIServer(('127.0.0.1',5000),app).serve_forever()
