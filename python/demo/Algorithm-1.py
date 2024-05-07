# -*- coding: utf-8 -*-
"""
    @Time ： 2023/10/30 16:28
    @Auth ： chnpngwng
    @Project : python
    @File ：Algorithm.py
    @IDE ：PyCharm
"""
# 输入序列
arr = list(map(int, input("请输入n个整数构成的序列,每个整数之间用空格隔开: ").split()))
k = int(input("请输入需要查找的元素(整数): "))

try:
    result = arr.index(k)
    print(f'查找成功,您查找的值为:{k},在当前序列{arr}中的位置为:{result}.')
except ValueError:
    print(f'查找失败,当前序列{arr}中未找到值为:{k}的元素.')

