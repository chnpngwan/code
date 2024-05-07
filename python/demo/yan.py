# -*- coding: utf-8 -*-
"""
    @Auth ： chnpngwng
    @Time ： 2023/12/28 16:02
    @File ：yan.py
    @IDE ：PyCharm
"""
import turtle
import random

# 设置窗口大小和标题
screen = turtle.Screen()
screen.setup(800, 600)
screen.title("Python Fireworks")

# 定义烟花的颜色和数量
colors = ["red", "orange", "yellow", "green", "blue", "purple", "white"]
num_fireworks = 10

# 定义烟花的形状
firework_shape = turtle.Shape("compound")
circle = turtle.Circle(10)
trail = turtle.Turtle()
trail.penup()
trail.setposition(0, -10)
trail.pendown()
trail.pensize(3)
trail.pencolor("white")
trail.circle(10, 180)
firework_shape.addcomponent(circle, "red")
firework_shape.addcomponent(trail, "white")

# 注册烟花的形状
turtle.register_shape("firework", firework_shape)


# 定义烟花类
class Firework(turtle.Turtle):
    def __init__(self, x, y):
        turtle.Turtle.__init__(self)
        self.penup()
        self.setposition(x, y)
        self.pendown()
        self.color(random.choice(colors))
        self.shape("firework")
        self.shapesize(0.5)
        self.speed(0)
        self.setheading(random.randint(0, 360))
        self.vx = random.uniform(0.5, 2.0) * 6
        self.vy = random.uniform(0.5, 2.0) * 8
        self.gravity = 0.1

    def update(self):
        self.vy -= self.gravity
        self.setx(self.xcor() + self.vx)
        self.sety(self.ycor() + self.vy)

        if self.ycor() < -300:
            self.clear()
            self.hideturtle()
            return True
        else:
            return False


# 创建烟花
fireworks = []
for i in range(num_fireworks):
    x = random.randint(-400, 400)
    y = random.randint(-200, 200)
    f = Firework(x, y)
    fireworks.append(f)

# 动画循环
while True:
    for f in fireworks:
        if f.update():
            fireworks.remove(f)
    if len(fireworks) == 0:
        break

    screen.update()

turtle.done()