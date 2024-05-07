"""
 ProjectName:   python
 ClassName:     Intranet

 @Author: ChnpngWng
 @Date:   12/31/2022 9:34 AM
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

class demo:
    # 查询所有network
    def select_network():
        result=requests.get(url="http://192.168.100.10:9696/v2.0/networks",headers=headers).text
        print(result)
        json_dict=json.loads(result)
        for i in json_dict["networks"]:
            name=i["name"] # 获取network名字
            print(name)
            if(name=="test"): # 如果存在名字为test的network
                id=i["id"]
                requests.delete(url="http://192.168.100.10:9696/v2.0/network/{}".format(ip),headers=headers) # 删除network网络
    select_network()

    def create_network():
        data={
            "network":{
                "name":"private",
                "provider:network_type":"vxlan"
            }
        }
        result = requests.post(url="http://192.168.100.10:9696/v2.0/networks",data=json.dumps(data), headers=headers).text
        print(result)
        global id
        json_dict=json.loads(result)
        id=json_dict["network"]["id"]
    create_network()

    def create_subnet():
        data={
            "subnet":{
                "name":"prisubnet",
                "network_id":id,
                "cidr":"10.10.10.0/24",
                "ip_version":4
            }
        }
        result=requests.post(url="http://192.168.100.10:9696/v2.0/subnets",data=json.dumps(data),headers=headers).text
        print(result)
    create_subnet()