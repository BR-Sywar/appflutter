import 'dart:convert';
import 'dart:developer';

import 'package:application/Menu/pages/menu.dart';
import 'package:application/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';

class AuthController{

   registreToast(String toast) {
    return Fluttertoast.showToast(
        msg: toast,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: toast == "sing up Sucessfull" ? Colors.green : Colors.red ,
        textColor: Colors.white);
  }


Future<void> signUp(BuildContext context,String email,String password,String nom,String prenom)async{

   
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.Register); 
    Response response = await post(url, body: {
      "Email": email,
      "Password": password,
      "Nom" : nom,
      "Prenom" : prenom ,
    });

    if (response.statusCode == 200){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ((context) => Dashbord())));
    }
    else if (response.statusCode  == 400){
      registreToast('Utilisateur Déjà existe');
    }
    else{
      registreToast('Sign Up Failed');
    }

    




    

    // if (response.statusCode == 200) {
    //    Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(
    //           builder: (context) => Login()),
    //     );
    //     final data = jsonDecode(response.body);
    //   setState(() {
       
    //   });
    //   registreToast("sing up Sucessfull");
    // } else if (response.statusCode == 400){
    //   registreToast("Email or password is not correct");
    // }
    // else {
    //   registreToast("sing up Failed");
    // }


}






}