"""
 ProjectName:   python
 ClassName:     image

 @Author: ChnpngWng
 @Date:   1/3/2023 3:10 PM
 """

import requests,json
ip="192.168.100.10"
auth_url=f"http://{ip}:5000/v3/auth/tokens"
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
    def create_glance():
        data={
            "name":"cirrors",
            "container_format":"bare",
            "disk_format":"qcow2"
        }
        result=requests.post(url="http://192.168.100.10:9292/v2/images",data=json.dumps(data),headers=headers).text
        json_dict=json.loads(result)
        global id
        id=json_dict["id"]
        print(result)
    create_glance()

    def upload_file():
        headers["Content-Type"] = "application/octet-stream"
        result=requests.put(url="http://192.168.100.10:9292/v2/images/{}/file".format(id),data=open("cirros-0.3.4-x86_64-disk.img","rb").read(),headers=headers)
        print(result)
    upload_file()