from flask import Flask, render_template
from pyecharts import options as opts
from pyecharts.charts import Bar, Line
from pyecharts.commons.utils import JsCode
import matplotlib.pyplot as plt
import io
import base64
from collections import defaultdict
from datetime import datetime

from SearchData import SearchData

app = Flask(__name__)


# 图表main_t1_1_1
def charts1():
    # 设置图表参数
    plt.rcParams.update({'font.size': 14})  # 设置字体大小
    plt.rcParams['font.family'] = 'sans-serif'
    plt.rcParams['font.sans-serif'] = ['SimHei']
    plt.rcParams['text.color'] = 'white'  # 设置文字颜色为白色
    plt.figure(figsize=(3.1, 2))  # 设置图表尺寸（宽度310px，高度200px）

    # 查询农作物产收占比
    names, values = SearchData().crop_yield_ratio()
    print(names)
    print(values)
    # 生成饼图
    labels = names
    sizes = values
    plt.pie(sizes, labels=labels, autopct='%1.1f%%', shadow=True, startangle=140)
    plt.axis('equal')  # 保持饼图圆形
    # 将图像转换为 Base64 编码的字符串
    img = io.BytesIO()
    plt.savefig(img, format='png', transparent=True)  # 设置图像背景颜色为透明
    img.seek(0)
    img_base64 = base64.b64encode(img.getvalue()).decode()

    # 清空当前图形
    plt.clf()

    return img_base64


# 图表main_t1_1_2
def charts2():
    # 农作物产量排序
    names, values = SearchData().sort_crop_yield()
    print(names)
    print(values)

    # 数据
    crops = names
    production = values  # 产量（单位：吨）

    # 生成横向柱状条图
    plt.figure(figsize=(4, 2.1))  # 设置图表尺寸（宽度310px，高度200px）
    bars = plt.barh(crops, production, color='#3B9AEA', alpha=0.5)  # 蓝色柱状条，透明度为0.5
    plt.xlabel('产量（吨）', color='white')  # X轴标签，白色文字
    plt.ylabel('农作物', color='white')  # Y轴标签，白色文字

    plt.tick_params(axis='x', colors='white')
    plt.tick_params(axis='y', colors='white')

    # 在每个柱状条上显示数值和单位
    for bar, value in zip(bars, production):
        plt.text(bar.get_width(), bar.get_y() + bar.get_height() / 3, f'{value} 吨', ha='left', va='center',
                 color='white')

    # 设置背景透明
    plt.gca().set_facecolor('none')

    # 将图像转换为 Base64 编码的字符串
    img = io.BytesIO()
    plt.savefig(img, format='png', transparent=True)  # 设置图像背景颜色为透明
    img.seek(0)
    img_base64 = base64.b64encode(img.getvalue()).decode()

    # 清空当前图形
    plt.clf()

    return img_base64


# 图表main_t2_1
def charts3():
    # 生产地产量
    names, values = SearchData().calculate_production_yield()
    print(names)
    print(values)

    # 生成柱状图
    plt.figure(figsize=(6, 2.5))  # 设置图表尺寸（宽度300px，高度250px）
    bars = plt.bar(names, values, color='#3B9AEA')  # 蓝色柱状条
    plt.xlabel('位置', color='white')  # X轴标签，白色文字
    plt.ylabel('产量（吨）', color='white')  # Y轴标签，白色文字

    plt.tick_params(axis='x', colors='white')
    plt.tick_params(axis='y', colors='white')

    # 在每个柱状条上添加数据描述
    for bar, value in zip(bars, values):
        plt.text(bar.get_x() + bar.get_width() / 2, bar.get_height(), f'{value} 吨', ha='center', va='bottom',
                 color='white')

    # 设置背景透明
    plt.gca().set_facecolor('none')

    # 将图像转换为 Base64 编码的字符串
    img = io.BytesIO()
    plt.savefig(img, format='png', transparent=True)  # 设置图像背景颜色为透明
    img.seek(0)
    img_base64 = base64.b64encode(img.getvalue()).decode()

    return img_base64


# 地图上2文字指标
def text_charts1():
    values = SearchData().cumulative_yield_planted_area()
    return values


# 左下3文字指标
def text_charts2():
    values = SearchData().getCropPlantingTypesAndBaseCountLastYearTotalYield()
    return values


# 右中 3 警告文字指标
def text_charts3():
    names, values = SearchData().calculate_pest_disease_counts()
    return values


# 图表main_t1_3_1
def charts4():
    valuesa = SearchData().average_microclimate_monitoring()
    # 数据
    categories = ['湿度', '降水量', '温度', '风速']
    values = valuesa  # 对应单位值

    # 创建柱状图
    fig, ax = plt.subplots(figsize=(11, 5))
    bars = ax.bar(categories, values, color='#3B9AEA')

    # 添加数值标签
    for bar in bars:
        yval = bar.get_height()
        ax.text(bar.get_x() + bar.get_width() / 2, yval, f'{yval}', ha='center', va='bottom', color='white')

    # 设置坐标轴标签和单位值颜色
    ax.set_xlabel('监测项目', color='white')
    ax.set_ylabel('数据值', color='white')

    # 设置坐标轴刻度线颜色
    ax.tick_params(axis='x', colors='white')
    ax.tick_params(axis='y', colors='white')

    # 设置背景透明
    plt.gca().set_facecolor('none')

    # 将图像转换为 Base64 编码的字符串
    img = io.BytesIO()
    plt.savefig(img, format='png', transparent=True)  # 设置图像背景颜色为透明
    img.seek(0)
    img_base64 = base64.b64encode(img.getvalue()).decode()

    # 清空当前图形
    plt.clf()

    return img_base64


# 图表main_t1_3_2
def charts5():
    valuess = SearchData().pest_disease_succession()

    data = []

    for item in valuess:
        temp = (item["month"], item["name"], item["count"])
        data.append(temp)

    # 使用 defaultdict 创建按日期分组的字典
    grouped_data = defaultdict(lambda: defaultdict(int))
    for date, pest_type, count in data:
        grouped_data[date][pest_type] += count

    # 提取日期和病虫害类型
    dates = sorted(grouped_data.keys())
    pest_types = sorted({pest_type for pests in grouped_data.values() for pest_type in pests.keys()})

    # 创建图表对象
    fig, ax = plt.subplots(figsize=(8, 2))  # 宽度为 500px，高度为 250px

    # 设置坐标轴刻度线颜色
    ax.tick_params(axis='x', colors='white')
    ax.tick_params(axis='y', colors='white')

    # 绘制柱状图
    width = 0.2
    for i, pest_type in enumerate(pest_types):
        counts = [grouped_data[date][pest_type] for date in dates]
        x = [j + i * width for j in range(len(dates))]
        ax.bar(x, counts, width, label=pest_type)

        # 添加数值标签
        for j, count in enumerate(counts):
            ax.text(x[j], count, str(count), ha='center', va='bottom', color='white')

    # 设置 X 轴标签和刻度
    ax.set_xticks([j + (len(pest_types) - 1) * width / 2 for j in range(len(dates))])
    ax.set_xticklabels(dates, rotation=0, ha='right', color='white')

    # 设置坐标轴标签和单位值颜色
    ax.set_xlabel('日期', color='white')
    ax.set_ylabel('数量', color='white')

    # 设置图例
    ax.legend()

    # 设置图表背景颜色透明
    ax.set_facecolor('none')

    # 保存图表到临时文件
    img = io.BytesIO()
    plt.savefig(img, format='png', facecolor='none')
    img.seek(0)
    img_base64 = base64.b64encode(img.getvalue()).decode()

    # 清空图表以释放资源
    plt.close()

    return img_base64


# 图表main_t2_3
def charts6():
    # sample_date, nitrogen_content, phosphorus_content, potassium_content,organic_matter,pH_level

    # 准备数据
    data = []

    datass = SearchData().get_soil_sampling_data_trends()
    for item in datass:
        temp = (item["sample_date"], item["nitrogen_content"], item["phosphorus_content"], item["potassium_content"],
                item["organic_matter"], item["pH_level"])
        data.append(temp)

    # 提取日期和监测项目数据
    dates = []
    nitrogen_levels = []
    phosphorus_levels = []
    potassium_levels = []
    organic_matter_levels = []
    ph_levels = []

    for entry in data:
        date_str, nitrogen, phosphorus, potassium, organic_matter, ph = entry
        dates.append(date_str)
        nitrogen_levels.append(nitrogen)
        phosphorus_levels.append(phosphorus)
        potassium_levels.append(potassium)
        organic_matter_levels.append(organic_matter)
        ph_levels.append(ph)

    # 创建图表对象
    fig, ax = plt.subplots(figsize=(9, 3))  # 宽度为 500px，高度为 250px

    # 绘制折线图
    ax.plot(dates, nitrogen_levels, label='氮含量', color='blue')
    ax.plot(dates, phosphorus_levels, label='磷含量', color='green')
    ax.plot(dates, potassium_levels, label='钾含量', color='red')
    ax.plot(dates, organic_matter_levels, label='有机质含量', color='purple')
    ax.plot(dates, ph_levels, label='酸碱度', color='orange')

    # 设置坐标轴标签和刻度的颜色
    ax.set_xlabel('日期', color='white')
    ax.set_ylabel('监测项目', color='white')

    # 设置图例和背景颜色透明
    ax.legend()
    ax.set_facecolor('none')

    # 设置图表文字颜色和轴线颜色
    plt.setp(ax.get_xticklabels(), color='white')
    plt.setp(ax.get_yticklabels(), color='white')
    ax.spines['bottom'].set_color('white')
    ax.spines['top'].set_color('white')
    ax.spines['left'].set_color('white')
    ax.spines['right'].set_color('white')

    # 保存图表到临时文件
    img = io.BytesIO()
    plt.savefig(img, format='png', facecolor='none')
    img.seek(0)
    img_base64 = base64.b64encode(img.getvalue()).decode()

    # 生成嵌入的 HTML 图片标签
    plot_url = f'data:image/png;base64,{img_base64}'

    # 清空图表以释放资源
    plt.close()

    return img_base64


# 图表main_t2_4
def charts7():
    # 准备数据
    names, values = SearchData().calculate_pest_disease_type_proportion()

    pests = names
    counts = values

    # 创建图表对象
    fig, ax = plt.subplots(figsize=(4, 3))  # 设置图表大小

    # 绘制环形图
    wedges, texts, autotexts = ax.pie(counts, labels=pests, autopct='%1.1f%%', startangle=90,
                                      colors=plt.cm.tab20.colors)

    # 设置文字颜色为白色
    plt.setp(texts, color='white')
    plt.setp(autotexts, color='white')

    # 设置图表背景颜色透明
    ax.set_facecolor('none')

    # 保存图表到临时文件
    img = io.BytesIO()
    plt.savefig(img, format='png', facecolor='none')
    img.seek(0)
    img_base64 = base64.b64encode(img.getvalue()).decode()

    # 清空图表以释放资源
    plt.close()

    return img_base64


@app.route('/')
def index():
    # 图表main_t1_1_1
    main_t1_1_1_img = charts1()

    # 图表main_t1_1_2
    main_t1_1_2_img = charts2()

    # 图表main_t2_1
    main_t2_1 = charts3()

    # 地图上2 文字指标
    text_charts1_data = text_charts1()

    # 左下3文字指标
    text_charts2_data = text_charts2()

    # 右中 3警告指标
    text_charts3_data = text_charts3()

    # 图表main_t1_3_1
    main_t1_3_1_img = charts4()

    # 图表main_t1_3_2
    main_t1_3_2_img = charts5()

    # 图表main_t2_3
    main_t2_3_img = charts6()

    # 图表main_t2_4
    main_t2_4_img = charts7()

    # 将 Base64 编码的图像传递给 index 页面
    return render_template('index.html',
                           main_t1_1_1_img=main_t1_1_1_img,
                           main_t1_1_2_img=main_t1_1_2_img,
                           main_t2_1=main_t2_1,
                           text_charts1_data=text_charts1_data,
                           text_charts2_data=text_charts2_data,
                           text_charts3_data=text_charts3_data,
                           main_t1_3_1_img=main_t1_3_1_img,
                           main_t1_3_2_img=main_t1_3_2_img,
                           main_t2_3_img=main_t2_3_img,
                           main_t2_4_img=main_t2_4_img
                           )


if __name__ == '__main__':
    app.run(host="0.0.0.0", port="8090")
