import paho.mqtt.client as mqtt # import library mqtt
import json # import library jsom
import time # import library time 
import datetime
from datetime import datetime

def on_connect(client, userdata, flags, rc):
    print("Connected with result code "+str(rc))

client = mqtt.Client() # Create Client
client.on_connect = on_connect
client.connect("broker.mqttdashboard.com", 1883, 60) #connect to server

while (True):
    with open("data.csv", "r") as file: #open file
        last_line = file.readlines()[-1] #read last line 
    value = last_line.split(';')
    A = int(float(value[4].replace(',','.')))
    V = int(float(value[6].replace(',','.')))
    W = int(float(value[8].replace(',','.')))
    T = int(float(value[-1].replace(',','.'))) # last element
    #D = str(datetime.date.today())
    now = datetime.now()
    D = now.strftime("%d/%m/%Y %H:%M:%S")

    text = json.dumps({'puissance': A, 'tension': V, 'courant': W, 'temperature': T, 'date': D}, separators=(',', ':'))
    client.publish(topic="caramel",payload=text)
    time.sleep(10) # Delay for 10 minute (600 seconds).


 
    


      


 



