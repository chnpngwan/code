"""
 ProjectName:   python
 ClassName:     ExtranetNetwork

 @Author: ChnpngWng
 @Date:   12/30/2022 4:38 PM
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

class test:
    def create_network():
        data={
            "network":{
                "name":"public",
                "provider:network_type":"flat",
                "provider:physical_network":"provider",
                "router:external":"true"
            }
        }
        result=requests.post(url="http://192.168.100.10:9696/v2.0/networks",data=json.dumps(data),headers=headers).text
        print(result)
        json_dict=json.loads(result)
        global id
        id=json_dict["network"]["id"]

    create_network()

    def create_subnet():
        data={
            "subnet":{
                "name":"pubsubnet",
                "network_id":id,
                "cidr":"192.168.200.0/24",
                "ip_version":4
            }
        }
        result = requests.post(url="http://192.168.100.10:9696/v2.0/subnets", data=json.dumps(data),headers=headers).text
        print(result)
    create_subnet()