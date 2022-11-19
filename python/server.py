import paho.mqtt.client as mqtt #import library MQTT
import json # library json 
import pymongo #library mongo driver for python



def on_connect(client, userdata, flags, rc):
    print("Connected with result code "+str(rc))
    client.subscribe("caramel")

def on_message(client, userdata, msg):
    print(msg.payload)
    txt = json.loads(msg.payload)
    print(txt)   
    myclient = pymongo.MongoClient("mongodb://localhost:27017/")
    mydb = myclient["App"]
    mycol = mydb["datas"]

    
    x = mycol.insert_one(txt)
    

client = mqtt.Client()
client.on_connect = on_connect
client.on_message = on_message

client.connect("broker.mqttdashboard.com", 1883, 60)

client.loop_forever()

