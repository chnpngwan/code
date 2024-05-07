"""
 ProjectName:   python
 ClassName:     server

 @Author: ChnpngWng
 @Date:   1/3/2023 3:43 PM
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
    def create_server():
        data={
            "server":{
                "name":"test",
                "flavorRef":"12",
                "network":[{
                    "uuid":"a69dbfd0-7289-4721-ba3f-4a05100c7c28"
                }],
                "imageRef":"21a829a2-9a9f-45a1-896e-11163f6514c2"
            }
        }
        status_code=requests.post(url="http://192.168.100.10:8774/servers",data=json.dumps(data),headers=headers).text
        print(status_code)
    create_server()