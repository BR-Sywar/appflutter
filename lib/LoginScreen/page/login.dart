import 'dart:convert';
import 'dart:developer';
import 'package:application/Menu/pages/menu.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants.dart';
import 'register.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';




class Login extends StatefulWidget {

  @override
  State<Login> createState() => _LoginPageState();
}
enum LoginStatus { notSignIn, signIn }


class _LoginPageState extends State<Login> {
  LoginStatus _loginStatus = LoginStatus.notSignIn;

  final _formKey = GlobalKey<FormState>();
  final _key = new GlobalKey<FormState>();


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
 check() {
    final form = _key.currentState;
    if (form!.validate()) {
      form.save();
      Dashbord();
    }
  }


  login() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.log);
log(myController.text);    
    final response = await http
        .post(url, body: {
      "Email": _productName,
      "Password": _password,
    });

    

    if (response.statusCode == 200) {
       Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Dashbord()),
        );
        final data = jsonDecode(response.body);
    String auth_token = data['token'];
      setState(() {
       
        savePref(auth_token);
      });
      loginToast("Login Sucessfull");
    } else if (response.statusCode == 400){
      loginToast("Email or password is not correct");
    }
    else {
      loginToast("Login Failed");
    }
  }



  loginToast(String toast) {
    return Fluttertoast.showToast(
        msg: toast,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: toast == "Login Sucessfull" ?  Color.fromARGB(255, 47, 49, 53): Color.fromARGB(255, 58, 62, 70),
 
        textColor: Colors.white);
  }

  savePref(String auth_token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setString("auth_token", auth_token);
    });
  }

  var value;

  getPref() async {
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
    getPref();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home :Scaffold(

      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Sign in',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) => EmailValidator.validate(value!)
                        ? null
                        : "Please enter a valid email",
                    maxLines: 1,
                    onChanged : ( val ) {
  updateText ( val ) ;
   
} , 
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      prefixIcon  : const Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    controller: myController,
onChanged : ( val ) {
  updatepassword ( val ) ;
   
} , 
                    maxLines: 1,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {

                      login();/*
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => 
                                  Dashbord(),
                            ),
                          );*/
                        
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                    ),
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Not registered yet?'),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                   Register(),
                            ),
                          );
                        },
                        child: const Text('Create an account'),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),);
  }

}