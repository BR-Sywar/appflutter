import 'dart:convert';
import 'dart:developer';


import 'package:application/LoginScreen/model/data.dart';
import 'package:application/LoginScreen/model/historyModel.dart';
import 'package:application/Menu/pages/menu.dart';
import 'package:application/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';


class GlobalController{

 


  Future<HistoryModel?> getAllData()async{
    http.Response response = await http.get(Uri.parse('http://192.168.1.15:5000/user/Historique'),

   headers: {
    
    'Content-Type': 'application/json; charset=UTF-8',

   
   
   }
    
    
    
    
    );

log(response.body);


    if (response.statusCode == 200){
      return HistoryModel.fromJson(json.decode(response.body));
    }
    else{
    log("${response.statusCode}");
    }

    

  }








}