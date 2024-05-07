"""
 ProjectName:   python
 ClassName:     flavor

 @Author: ChnpngWng
 @Date:   12/30/2022 3:24 PM
 """
import requests,json
ip="192.168.100.10"
auth_url="http://{}:5000/v3/auth/tokens".format(ip)

body={
    "auth":{
        "identity":{
            "methods":[
                "password"
            ],
            "password":{
                "user":{
                    "name":"admin",
                    "password":"000000",
                    "domain":{
                        "name":"demo"
                    }
                }
            }
        },
        "scope":{
            "project":{
                "domain":{
                    "name":"demo"
                },
                "name":"admin"
            }
        }
    }
}

Token=requests.post(url=auth_url,data=json.dumps(body)).headers["X-Subject-Token"]
headers={
    "X-Auth-Token":Token,
    "Content-Type":"application/json"
}

# 函数不带参数 创建云主机类型
# class demo:
#     def create_flavor():
#         data={
#             "flavor":{
#                 "name":"test",
#                 "id":"12",
#                 "ram":512,
#                 "disk":20,
#                 "vcpus":1
#             }
#         }
#         result=requests.post(url="http://{}:8774/v2.1/flavors".format(ip),data=json.dumps(data),headers=headers).text
#         result=requests.post(url="http://192.168.100.10:8774/v2.1/flavors",data=json.dumps(data),headers=headers).text
#         print(result)
#     create_flavor()

# 函数带参数 创建云主机类型
class test:
    def create_flavor(name,id,ram,disk,vcpus):
        data={
            "flavor":{
                "name":name,
                 "id":id,
                "ram":ram,
                "disk":disk,
                "vcpus":vcpus
            }
        }
        result=requests.post(url="http://{}:8774/v2.1/flavors".format(ip),data=json.dumps(data),headers=headers).text
        print(result)
    create_flavor(name="test",id=12,ram=1024,disk=20,vcpus=1)