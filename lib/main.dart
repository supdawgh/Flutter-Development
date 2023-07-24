import 'package:flutter/material.dart';
import 'package:gm/login.dart';
import 'package:gm/register.dart';
import 'package:gm/otp.dart';


void main() {

  String firstName="";
  String lastName="";
  int contactNo=0;
  String address="";
  String password="";

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {'login': (context)=> const MyLogin(),
      
      'register': (context)=> MyRegister(firstName: firstName, lastName: lastName, contactNo: contactNo, address: address, password: password),
      'worker':(context) =>const MyWorker(),
      'otp':(context)=> MyOtp(firstName: firstName, lastName: lastName, contactNo: contactNo, address: address, password: password),
      'dash': (context)=> const MyDash(), 
      
    }
  ));
}

