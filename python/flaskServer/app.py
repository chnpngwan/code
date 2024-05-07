from flask import Flask, request
import json
import pymysql

app = Flask(__name__)


@app.route('/')
def hello_world():  # put application's code here
    return 'Hello World!'

#
@app.route('/getNationByMonth', methods=['POST'])
def getNationByMonth():
    rawjson = request.get_json()
    year = rawjson.get('year')
    month = rawjson.get('month')
    # year = request.form.get('year')
    # month = request.form.get('month')
    conn = pymysql.connect(host='127.0.0.1', port=3307, user='root', passwd='123456', db='shtd_store', charset='utf8')
    cur = conn.cursor()
    cont = cur.execute("select nation.nationkey,nation.name,orderdate,totalprice "
                       "from orders inner join customer on orders.custkey = customer.CUSTKEY "
                       "inner join nation on customer.nationkey = nation.nationkey "
                       "where year(orderdate) = {} and month(orderdate) = {}".format(year, month))
    res = cur.fetchall()
    cur.close()
    conn.commit()
    conn.close()

    arrayResult = []  # 定义一个数组
    # 遍历元组数据将数据装到指定元组
    for row in res:
        result = {}
        result['nationkey'] = row[0]
        result['name'] = row[1]
        result['orderdate'] = row[2]
        result['totalprice'] = row[3]
        arrayResult.append(result)

    result = {
        'code': 200,
        'msg': '查询成功',
        'results': arrayResult
    }
    Jsonstr = json.dumps(result)
    return Jsonstr.encode('utf-8').decode('unicode_escape')


# 接口2：某年第一季度消费总额占比,年份和季度（1,2,3,4）
@app.route('/getNationByQuarter', methods=['POST'])
def getNationByQuarter():
    rawjson = request.get_json()
    year = rawjson.get('year')
    quarter = request.form.get('quarter')  # 季度
    conn = pymysql.connect(host='127.0.0.1', port=3307, user='root', passwd='123456', db='shtd_store', charset='utf8')
    cur = conn.cursor()
    cont = cur.execute("select region.regionkey,region.name,totalprice "
                       "from orders inner join customer on orders.custkey = customer.CUSTKEY "
                       "inner join nation on customer.nationkey = nation.nationkey "
                       "inner join region on nation.regionkey = region.regionkey "
                       "where year(orderdate) = {} and quarter(orderdate) = {}".format(year, quarter))
    res = cur.fetchall()
    cur.close()
    conn.commit()
    conn.close()

    arrayResult = []  # 定义一个数组
    # 遍历元组数据将数据装到指定元组
    for row in res:
        result = {}
        result['regionkey'] = row[0]
        result['name'] = row[1]
        result['totalprice'] = row[2]
        arrayResult.append(result)

    result = {
        'code': 200,
        'msg': '查询成功',
        'results': arrayResult
    }
    Jsonstr = json.dumps(result)
    return Jsonstr.encode('utf-8').decode('unicode_escape')


# 接口3：某年第一季度消费总额占比2,自己计算季度
@app.route('/getNationByQuarter2', methods=['POST'])
def getNationByQuarter2():
    rawjson = request.get_json()
    year = rawjson.get('year')
    conn = pymysql.connect(host='127.0.0.1', port=3307, user='root', passwd='123456', db='shtd_store3', charset='utf8')
    cur = conn.cursor()
    cont = cur.execute(
        "select region.regionkey,region.name,orderdate,totalprice from orders inner join customer on orders.custkey = customer.CUSTKEY inner join nation on customer.nationkey = nation.nationkey inner join region on nation.regionkey = region.regionkey where year(orderdate)={}".format(
            year))
    res = cur.fetchall()
    cur.close()
    conn.commit()
    conn.close()

    arrayResult = []  # 定义一个数组
    # 遍历元组数据将数据装到指定元组
    for row in res:
        result = {}
        result['regionkey'] = row[0]
        result['name'] = row[1]
        result['orderdate'] = row[2]
        result['totalprice'] = row[3]
        arrayResult.append(result)

    result = {
        'code': 200,
        'msg': '查询成功',
        'results': arrayResult
    }
    Jsonstr = json.dumps(result)
    return Jsonstr.encode('utf-8').decode('unicode_escape')


# 接口4：用折线图展示某年上半年各个月份商城总消费额的变化情况
@app.route('/getTotalByYear', methods=['POST'])
def getTotalByYear():
    rawjson = request.get_json()
    year = rawjson.get('year')
    conn = pymysql.connect(host='127.0.0.1', port=3307, user='root', passwd='123456', db='shtd_store', charset='utf8')
    cur = conn.cursor()
    cont = cur.execute("select orderdate,totalprice from orders where year(orderdate) = {}".format(year))
    res = cur.fetchall()
    cur.close()
    conn.commit()
    conn.close()

    arrayResult = []  # 定义一个数组
    # 遍历元组数据将数据装到指定元组
    for row in res:
        result = {}
        result['orderdate'] = row[0]
        result['totalprice'] = row[1]
        arrayResult.append(result)

    result = {
        'code': 200,
        'msg': '查询成功',
        'results': arrayResult
    }
    Jsonstr = json.dumps(result)
    return Jsonstr.encode('utf-8').decode('unicode_escape')


# 接口5：用条形图展示某年平均消费额最高的5个国家
@app.route('/getNationAvgByYear', methods=['POST'])
def getNationAvgByYear():
    rawjson = request.get_json()
    year = rawjson.get('year')
    conn = pymysql.connect(host='127.0.0.1', port=3307, user='root', passwd='123456', db='shtd_store', charset='utf8')
    cur = conn.cursor()
    cont = cur.execute(
        "select nation.name,totalprice from orders inner join customer on orders.custkey = customer.CUSTKEY inner join nation on customer.nationkey = nation.nationkey where year(orderdate) = {}".format(
            year))
    res = cur.fetchall()
    cur.close()
    conn.commit()
    conn.close()

    arrayResult = []  # 定义一个数组
    # 遍历元组数据将数据装到指定元组
    for row in res:
        result = {}
        result['name'] = row[0]
        result['totalprice'] = row[1]
        arrayResult.append(result)

    result = {
        'code': 200,
        'msg': '查询成功',
        'results': arrayResult
    }
    Jsonstr = json.dumps(result)
    return Jsonstr.encode('utf-8').decode('unicode_escape')


# 接口6：用折柱混合图展示地区平均消费额和国家平均消费额
# 柱状图展示平均消费额最高的5个国家，折线图展示每个国家所在的地区的平均消费额变化
@app.route('/getNationRegionAvg', methods=['POST'])
def getNationRegionAvg():
    year = request.form.get('year')
    conn = pymysql.connect(host='127.0.0.1', port=3307, user='root', passwd='123456', db='shtd_store', charset='utf8')
    cur = conn.cursor()
    cont = cur.execute(
        "select nation.name as gj,region.name as dq,totalprice from orders inner join customer on orders.custkey = customer.CUSTKEY inner join nation on customer.nationkey = nation.nationkey inner join region on nation.regionkey = region.regionkey where year(orderdate) = {}".format(
            year))
    res = cur.fetchall()
    cur.close()
    conn.commit()
    conn.close()

    arrayResult = []  # 定义一个数组
    # 遍历元组数据将数据装到指定元组
    for row in res:
        result = {}
        result['gj'] = row[0]
        result['dq'] = row[1]
        result['totalprice'] = row[2]
        arrayResult.append(result)

    result = {
        'code': 200,
        'msg': '查询成功',
        'results': arrayResult
    }
    Jsonstr = json.dumps(result)
    return Jsonstr.encode('utf-8').decode('unicode_escape')


if __name__ == '__main__':
    app.run()
