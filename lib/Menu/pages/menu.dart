
import 'package:application/LoginScreen/model/data.dart';
import 'package:application/LoginScreen/model/historyModel.dart';
import 'package:application/Menu/pages/Historique.dart';
import 'package:application/WelcomeScreen.dart';
import 'package:application/controllers/globalController.dart';
import 'package:application/main.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../LoginScreen/page/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'dart:io';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';


class Dashbord extends StatefulWidget {
  const Dashbord({Key? key}) : super(key: key);

  @override
  State<Dashbord> createState() => _DashbordState();
 

}

class _DashbordState extends State<Dashbord> {

  GlobalController globalController = GlobalController();

  late Timer _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer){
     
      setState(() {
        
      });
      

    });
  }




  @override

  Widget build(BuildContext context) {return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: Text('Acceuil'),
        backgroundColor: Colors.black,
      ),
     body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FutureBuilder<HistoryModel?>(
            future: globalController.getAllData(),
            builder: (context, snapshot) {
              return 

             !snapshot.hasData?

             Center(child: CircularProgressIndicator()):
              
              
              
              Column(
                children: [
                  const SizedBox(
                    child: Text(
                      ('Puissance'),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Card(
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black, width: 5),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      child:  Text(
                        '${snapshot.data!.response!.last.puissance} W',
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                  ),
          
                  const SizedBox(
                    
          
                    child: Text(
          
                      
                      ('Tension'),
                      style: TextStyle(
          
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Card(
          
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black, width: 5),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      child: Text(
                        '${snapshot.data!.response!.last.tension} V',
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                  ),
          
                  const SizedBox(
                    child: Text(
                      ('Courant'),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Card(
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black, width: 5),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      child: Text(
                        '${snapshot.data!.response!.last.courant} A',
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                  ),
          
                  const SizedBox(
                    child: Text(
                      ('Temperature'),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Card(
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black, width: 5),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      child: Text(
                        '${snapshot.data!.response!.last.temperature} °C',
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                  ),
          
                ],
              );
            }
          )
        ],
      ),
    );
  }
}


class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
         const  DrawerHeader(
            child:  Center(
              child: const Text(
                'Menu',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.black,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Acceuil'),
            onTap: () => {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => Dashbord()))},
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('Historique'),
            onTap: () => {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => Historique()))},
          ),
         
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
             onTap: 
              () async {SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (c) => WelcomeScreen()),
                    (r) => false);
              },
             


          ),
        ],
      ),
    );
  

  }
}


