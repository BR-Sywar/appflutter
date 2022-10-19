import 'package:application/controllers/globalController.dart';
import 'package:flutter/material.dart';

import 'items.dart';

import 'LoginScreen/page/login.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List<Widget> slides = items
      .map((item) => Container(
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Image.asset(
                  item['image'],
                  fit: BoxFit.contain,
                  width: 3000,
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Text(item['header'],
                          style: const TextStyle(
                              fontSize: 50.0,
                              fontWeight: FontWeight.w300,
                              color: Color(0XFF3F3D56),
                              height: 2.0)),
                       Text(
                        item['description'],
                        style: const TextStyle(
                            color: Colors.grey,
                            letterSpacing: 1.2,
                            fontSize: 16.0,
                            height: 1.3),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              )
            ],
          )))
      .toList();

  List<Widget> indicator() => List<Widget>.generate(
      slides.length,
      (index) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 3.0),
            height: 10.0,
            width: 10.0,
            decoration: BoxDecoration(
                color: currentPage.round() == index
                    ? Color.fromARGB(255, 82, 89, 92)
                    : Color.fromARGB(255, 89, 96, 99).withOpacity(0.2),
                borderRadius: BorderRadius.circular(10.0)),
          ));

  double currentPage = 0.0;
  final _pageViewController = PageController();

  GlobalController globalController = GlobalController();

  @override
  void initState() {
    super.initState();
    _pageViewController.addListener(() {
      setState(() {
        currentPage = _pageViewController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("App"),
          backgroundColor: Color.fromARGB(255, 58, 62, 70),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.login),
                onPressed: () async{
                //  await globalController.getAllData();
                 Navigator.push(
                     context,
                      MaterialPageRoute(
                          builder: (context) => Login()));
                }),
          ]),
      body: Container(
        child: Stack(
          children: <Widget>[
            PageView.builder(
              controller: _pageViewController,
              itemCount: slides.length,
              itemBuilder: (BuildContext context, int index) {
                return slides[index];
              },
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(top: 70.0),
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: indicator(),
                  ),
                )
                //  ),
                )
            // )
          ],
        ),
      ),
    );
  }
}
