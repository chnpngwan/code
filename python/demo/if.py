# -*- coding: utf-8 -*-
"""
    @Time ： 2023/8/13 21:27
    @Auth ： chnpngwng
    @Project : python
    @File ：if.py
    @IDE ：PyCharm
"""
# 实例1
m = 20
n = 50
d = m - n
if d < 0:
    d = -d
else:
   d = d
print("m",m)
print("n",n)
print("distance",d)


# 多条if
age = 20
print("年龄：",age)
if 0 <= age <= 6:
    print("童年")
if 7 <= age <= 17:
    print("少年")
if 18 <= age <= 40:
    print("青年")
if 41 <= age <= 65:
    print("中年")
if age >= 66:
    print("老年")

# if子句
age = 20
print("年龄：",age)
if 0 <= age <= 6:
    print("童年")
else:
    if 0 <= age <= 6:
        print("少年")
    else:
        if 7 <= age <= 17:
            print("青年")
        else:
            if 18 <= age <= 40:
                print("青年")
            else:
                if 41 <= age <= 65:
                    print("中年")
                else:
                    print("老年")