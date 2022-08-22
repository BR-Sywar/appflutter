import 'package:application/Menu/Historique.dart';
import 'package:application/Menu/statistique.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import '../LoginScreen/login.dart';

class Dashbord extends StatefulWidget {
  const Dashbord({Key? key}) : super(key: key);

  @override
  State<Dashbord> createState() => _DashbordState();
}

class _DashbordState extends State<Dashbord> {
  late List<CollapsibleItem> _items;
  late String _title;

  @override
  void initState() {
    super.initState();
    _items = _generateItems;
    _title = _items.firstWhere((item) => item.isSelected).text;
  }

  List<CollapsibleItem> get _generateItems {
    return [
      /// Dashboard
      CollapsibleItem(
          text: 'Dashboard',
          icon: Icons.menu,
          onPressed: () => setState(
                () => _title = 'Dashboard',
              ),
          isSelected: true),

      /// Team
      CollapsibleItem(
        text: 'Setting',
        icon: Icons.settings,
        onPressed: () => setState(
          () => _title = 'Setting',
        ),
      ),

      /// Historique
      CollapsibleItem(
          text: 'Historique',
          icon: Icons.history,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Historique()));
          }),

      /// Statistique
      CollapsibleItem(
          text: 'Statistique',
          icon: Icons.analytics,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => statique()));
          }),

      /// Sign Out'
      CollapsibleItem(
          text: 'Sign Out',
          icon: LineIcons.alternateSignOut,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>  Login(title: "Login")));
          }),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("App"),
            backgroundColor: Color.fromARGB(255, 58, 62, 70),
          ),
          body: CollapsibleSidebar(
            screenPadding: 1.0,
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            onHoverPointer: SystemMouseCursors.click,
            showToggleButton: true,
            borderRadius: 10,
            title: "Home",
            titleBack: true,
            titleStyle: GoogleFonts.lato(fontSize: 22),
            unselectedIconColor: Colors.white38,
            unselectedTextColor: Colors.white38,
            selectedIconBox: Color.fromARGB(255, 57, 58, 59),
            selectedIconColor: const Color(0xffffffff),
            selectedTextColor: const Color(0xffffffff),
            textStyle:
                GoogleFonts.oxygen(fontWeight: FontWeight.w400, fontSize: 22),
            sidebarBoxShadow: [],
            backgroundColor: Color.fromARGB(255, 58, 62, 70),
            body: _body(),
            items: _items,
          )),
    );
  }

  Scaffold _body() {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              const SizedBox(
                width: 7,
              ),
              const SizedBox(
                height: 20,
                child: Text(
                  ('Puissance'),
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
              Card(
                shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 3),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                margin: const EdgeInsets.all(10),
                elevation: 8,
                child: Container(
                  padding: const EdgeInsets.all(25.0),
                  child: const Text(
                    '2450 W',
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              const SizedBox(
                height: 20,
                child: Text(('Tension '),
                    style: TextStyle(
                      fontSize: 20.0,
                    )),
              ),
              Card(
                shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 3),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                margin: const EdgeInsets.all(10),
                elevation: 8,
                child: Container(
                  padding: const EdgeInsets.all(25),
                  child: const Text(
                    '48287 U',
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              const SizedBox(
                height: 20,
                child: Text(('Courant'),
                    style: TextStyle(
                      fontSize: 20.0,
                    )),
              ),
              Card(
                shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 3),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                margin: const EdgeInsets.all(10),
                elevation: 8,
                child: Container(
                  padding: const EdgeInsets.all(25),
                  child: const Text(
                    '15.071 A',
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              const SizedBox(
                height: 20,
                child: Text(('Temperature'),
                    style: TextStyle(
                      fontSize: 20.0,
                    )),
              ),
              Card(
                shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 3),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                margin: const EdgeInsets.all(15),
                elevation: 15,
                child: Container(
                  padding: const EdgeInsets.all(30),
                  child: const Text(
                    '74.2 C',
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
