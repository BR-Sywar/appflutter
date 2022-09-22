import 'package:application/Menu/pages/tabs/courant.dart';
import 'package:application/Menu/pages/tabs/puissance.dart';
import 'package:application/Menu/pages/tabs/temp.dart';
import 'package:application/Menu/pages/tabs/tension.dart';
import 'package:application/items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class Historique extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
       DefaultTabController(
        length: 4,
        child: Scaffold(

          appBar: AppBar( 

          title: Text("Historique"),
          backgroundColor: Color.fromARGB(255, 58, 62, 70),
        
            bottom: const TabBar(
              tabs: [
                Tab(text: "Puissance"),
                Tab(text: "Temperature"),
                Tab(text: "Courant"),
                Tab(text: "Tension"),

              ],
            ),
          ),
          body: TabBarView(
              children: <Widget>[
                   Puissance(),
                   Temperature(),
                   Tension(),
                   Courant()

    ], 
              
          ),
        ),
     );
    
  }
  
}

