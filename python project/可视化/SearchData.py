from MySQLConnector import MySQLConnector


class SearchData:

    # 1.农作物产收占比
    def crop_yield_ratio(self):

        # 获取数据库连接
        connector = MySQLConnector()

        sql = "select ct.id,ct.crop_name as name,sum(yi.yield_amount) as amount from yields as yi left join crop_types as ct on yi.crop_type_id = ct.id GROUP BY ct.id limit 6"

        result = connector.execute_query(sql)

        names = []
        values = []

        if result:
            for row in result:
                names.append(row["name"])
                values.append(float(row["amount"]))

        return names,values

    # 2.农作物产量排序
    def sort_crop_yield(self):
        # 获取数据库连接
        connector = MySQLConnector()

        sql = "select ct.id,ct.crop_name as name,sum(yi.yield_amount) as amount from yields as yi left join crop_types as ct on yi.crop_type_id = ct.id GROUP BY ct.id order by amount asc limit 5"

        result = connector.execute_query(sql)

        names = []
        values = []

        if result:
            for row in result:
                names.append(row["name"])
                values.append(float(row["amount"]))

        return names, values

    # 3.生产地产量
    def calculate_production_yield(self):
        # 获取数据库连接
        connector = MySQLConnector()

        sql = "select pl.id,pl.location,sum(yi.yield_amount) as amount from yields as yi LEFT JOIN plots as pl on pl.id = yi.plot_id GROUP BY pl.id ORDER BY amount desc limit 5"

        result = connector.execute_query(sql)

        names = []
        values = []

        if result:
            for row in result:
                names.append(row["location"])
                values.append(float(row["amount"]))

        return names, values

    # 4.累计产收 + 种植总面积
    def cumulative_yield_planted_area(self):

        # 获取数据库连接
        connector = MySQLConnector()

        sql = """
        select SUM(yield_amount) as amount from yields
        UNION all
        select sum(area) as area from plots
        """

        result = connector.execute_query(sql)
        values = []

        if result:
            for row in result:
                values.append(float(row["amount"]))

        return values

    #5. 农作物种植种类+种植基地总数+去年总产收
    def getCropPlantingTypesAndBaseCountLastYearTotalYield(self):

        # 获取数据库连接
        connector = MySQLConnector()

        sql = """
                select count(1) as count2 from crop_types UNION all select count(1) as count from plots
 UNION all 
select SUM(yield_amount) as amount from yields where harvest_date BETWEEN '2023-01-01' and '2023-12-31' 
                """

        result = connector.execute_query(sql)
        values = []

        if result:
            for row in result:
                values.append(float(row["count2"]))

        return values

    # 6. 一、二、三级病虫害次数
    def calculate_pest_disease_counts(self):

        # 获取数据库连接
        connector = MySQLConnector()

        sql = """select  cc.severity,count(1) as count from pest_disease_records as cc where cc.severity in (1,2,3) GROUP BY cc.severity"""

        result = connector.execute_query(sql)

        names = []
        values = []

        if result:
            for row in result:
                names.append(float(row["severity"]))
                values.append(int(row["count"]))

        return names,values

    # 7.# 微气象监测平均值
    def average_microclimate_monitoring(self):

        # 获取数据库连接
        connector = MySQLConnector()

        sql = """
        SELECT
	avg( humidity ) AS humidity 
FROM
	humidity_data 
WHERE
	plot_id = 1 
GROUP BY
	plot_id UNION ALL
SELECT
	avg( rainfall ) AS rainfall 
FROM
	rainfall_data 
WHERE
	plot_id = 1 
GROUP BY
	plot_id UNION ALL
SELECT
	avg( temperature ) AS temperature 
FROM
	temperature_data 
WHERE
	plot_id = 1 
GROUP BY
	plot_id UNION ALL
SELECT
	avg( wind_speed ) AS wind_speed 
FROM
	wind_speed_data 
WHERE
	plot_id = 1 
GROUP BY
	plot_id
        """

        result = connector.execute_query(sql)

        values = []

        if result:
            for row in result:
                values.append(float(row["humidity"]))

        return values

    # 8.土地采样数据趋势
    def get_soil_sampling_data_trends(self):

        # 获取数据库连接
        connector = MySQLConnector()


        sql = """
        select * from soil_samples where plot_id=1 order by sample_date asc
        """

        result = connector.execute_query(sql)

        values = []

        if result:
            for row in result:
                values.append(row)

        return values

    # 9.病虫害更替
    def pest_disease_succession(self):

        # 获取数据库连接
        connector = MySQLConnector()

        sql = """
        SELECT 
    DATE_FORMAT(cc.date_observed, '%Y-%m') AS month,
    tt.name AS name,
    COUNT(*) AS count
FROM 
    pest_disease_records AS cc
LEFT JOIN 
    pest_disease_types AS tt ON tt.id = cc.pest_disease_id
GROUP BY 
    month, name
ORDER BY 
    month ASC

        """

        result = connector.execute_query(sql)

        values = []

        if result:
            for row in result:
                values.append(row)

        return values

    # 10.虫害类型占比
    def calculate_pest_disease_type_proportion(self):

        # 获取数据库连接
        connector = MySQLConnector()

        sql = """
        SELECT 
    tt.name AS name,
    COUNT(*) AS count
FROM 
    pest_disease_records AS cc
LEFT JOIN 
    pest_disease_types AS tt ON tt.id = cc.pest_disease_id
GROUP BY name
        """

        result = connector.execute_query(sql)

        names = []
        count = []

        if result:
            for row in result:
                names.append(row["name"])
                count.append(float(row["count"]))

        return names, count