import 'dart:convert';
import 'dart:developer';
import 'dart:ui';
import 'package:application/constants.dart';
import 'package:application/Menu/pages/menu.dart';
import 'package:application/controllers/authController.dart';
import 'package:application/controllers/globalController.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';
import 'package:application/LoginScreen/page/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Register extends StatefulWidget {

  @override
  State<Register> createState() => _RegisterPageState();
}
enum RegisterenStatus { notSignup, signup }

class _RegisterPageState extends State<Register> {
  RegisterenStatus _RegisterenStatus = RegisterenStatus.notSignup;

  final _formKey = GlobalKey<FormState>();
  final _key = new GlobalKey<FormState>();

  AuthController authController = AuthController();

  GlobalController globalController = GlobalController();

  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();



final myController = TextEditingController() ;
@override


  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

var _productName ;
void updateText ( val ) {
  setState ( ( ) {
    _productName = val ;
})
  ;} 

  var _password ;
void updatepassword ( val ) {
  setState ( ( ) {
    _password = val ;
})
  ;} 

var _Nom ;
void updateNom ( val ) {
  setState ( ( ) {
    _Nom = val ;
})
  ;} 

  var _Prenom ;
void updatePrenom ( val ) {
  setState ( ( ) {
    _Prenom = val ;
})
  ;} 


 check() {
    final form = _key.currentState;
    if (form!.validate()) {
      form.save();
      Dashbord();
    }
  }


 


 

  savePref(String auth_token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setString("auth_token", auth_token);
    });
  }

  var value;

  setPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getInt("value");

      if (value == 1) {
      } else {
      }
    });
  }


 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setPref();
  }
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
         
            
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Registre',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                   color: Color.fromARGB(255, 96, 101, 110),

                fontSize: 40,
              ),
            ),
             const SizedBox(
                        height: 30,
                      ),
              
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              maxLines: 1,
                              controller: nomController,
                               onChanged : ( val ) {
                                          updateNom ( val ) ;
                                          
                                        } , 
                              decoration: InputDecoration(
                                hintText: 'Nom',
                                prefixIcon: const Icon(Icons.person),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          )
,                          Expanded(
                            child: TextFormField(
                              maxLines: 1,
                              controller: prenomController,
                               onChanged : ( val ) {
                                      updatePrenom ( val ) ;
                                      
                                    } , 
                              decoration: InputDecoration(
                                hintText: 'Prenom',
                                prefixIcon: const Icon(Icons.person),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        maxLines: 1,
                        controller: emailController,
                         onChanged : ( val ) {
                              updateText ( val ) ;
                              
                            } , 
                          decoration: InputDecoration(
                          hintText: 'Entrer votre  email',
                          prefixIcon: const Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return ' Le mot de passe est erroné.';
                          }
                          return null;
                        },

                        controller: passwordController,
                        onChanged : ( val ) {
                          updatepassword ( val ) ;
                          
                        } ,
                        maxLines: 1,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          hintText: 'Entrer votre mot de passe',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        
                        onPressed: ()async {
                          // await globalController.getAllData();

                          await authController.signUp(context, emailController.text, passwordController.text, nomController.text, prenomController.text);

                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                        
                        ),
                        
                        child: const Text(
                          'Registre',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,

                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Déjà enregistré?'),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                       Login(),
                                ),
                              );
                            },
                            child: const Text(('Login')),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
