from os.path import abspath
import requests
import os


BASE_URL = "http://192.168.1.3:50005"
AUTH = "L2YFFJFCM4F9luIqdxgTs7hNepkiRyacjZSJOjqvouF7HSwmyeTk1Dq2Lc6M4U0R"

def run():
    uploadall()
    r = requests.get(BASE_URL + "/runLua")
    print("运行: " + r.text)
    print("--------")


def stop():
    r = requests.get(BASE_URL + "/stopLua")
    print("stop: " + r.text)

def set_path(path):
    dir, name = os.path.split(path)
    header = {"Auth": AUTH,
            "Content-Type": "application/json",
            "Connection":"close",
            "path":name
            }
    data = {"path": "/private/var/mobile/Media/TouchSprite/lua/" + name}
    r = requests.post(BASE_URL + "/setLuaPath", headers=header, json=data)
    print("setpath: " + r.text)

def upload(filepath):
    with open(filepath, "rb") as f:
        dir, name = os.path.split(filepath)
        header = {
            "root":"lua",
            "path":"",
            "filename":name,
            "Content-Type":"touchsprite/uploadfile",
            "Connection":"close"
        }
        r = requests.post(BASE_URL + "/upload", headers=header, data=f)
        print("上传%s:  %s"%(r.text, name))

def uploadall():
    for filepath in [os.path.abspath(x) for x in os.listdir(".") if x.endswith(".lua")]:
        upload(filepath)



import sys

filepath = sys.argv[1]
arg = sys.argv[2]


if arg == "run":
    print("上传:  " + filepath)
    stop()
    upload(filepath)
    set_path(filepath)
    run()
elif arg == "upload":
    upload(filepath)
elif arg == "stop":
    stop()


