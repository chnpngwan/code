"""
 ProjectName:   python
 ClassName:     router

 @Author: ChnpngWng
 @Date:   1/3/2023 3:44 PM
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
    def create_router(name):
        global router_id
        data={
            "router":{
                "name":name,
                "external_gateway_info":{
                    "enable_snat":"true",
                    "network_id":""
                }
            }
        }
        result=requests.post(url="http://{ip}:9696/v2.0/routers",data=json.dumps(data),headers=headers).text
        json_dict=json.loads(result)
        print(json_dict)
        router_id=json_dict["router"]["id"]
        print(router_id)
    create_router("demo")

    def router_add_interface():
        data={
            "subnet_id":""
        }
        result=requests.put(url=f"http://{ip}:9696/v2.0/routers/{router_id}/add_router_interface",data=json.dumps(data),headers=headers).text
        print(result)
    router_add_interface()