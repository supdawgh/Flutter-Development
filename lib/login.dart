import 'dart:convert';

import 'package:gm/otp.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:gm/otp.dart';


class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  int phoneNumber=0;
  String password="";
  
 
  Future<void> loginUser() async {
    print("I have been called");
    var url = Uri.parse('http://172.16.7.116:5000/api/V1/users/login');
    var registerBody = {
      "phoneNumber":phoneNumber,
      "password":password
    };   
    try {
      var response = await http.post(url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(registerBody));
      print(response); 
      if (response.statusCode == 200) {
        print('POST request succeesful');
        print(response);
      } else {
        print("Else part");
        print(response.body);
      }
    } catch (err) {
      print("Inside catch part");
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Login.jpg'),fit: BoxFit.cover),
        ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
            
              children: [
                Container(
            padding:const EdgeInsets.only(left:50,top:130),
                  child:const Text('LOGIN', style:  TextStyle(color:Colors.white,fontSize: 35),
                ),
                ),
                Container(
                  padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.45,
                  right:50,
                  left:50),
                  child:Center(
                    child:Form(
                  child:Column(
                    children:<Widget> [
                      TextFormField( 
                        onChanged: (value){
                          phoneNumber=int.parse(value);
                        },
                        enableSuggestions: false,
                        autocorrect: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Email',
                  
                          fillColor: Colors.grey[217],
                          filled: true,
                          prefixIcon: const Icon(Icons.email),
                          border:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (val){
                          if(val!.isEmpty){

                            return"Required";
                          }else{
                            return null;
                          }
                        },
                      ),
                  
                     
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                     child:Center(
                    child:Form(
                  child:Column(
                    children:<Widget> [
                      TextFormField( 
                        onChanged: (value){
                          password=value;
                        },
                        enableSuggestions: false,
                        autocorrect: false,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            fillColor: Colors.grey[217],
                            filled: true,
                            prefixIcon: const Icon(Icons.lock),
                            
                            border:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                        ),
                         validator: (val){
                          if(val!.isEmpty){

                            return"Required";
                          }else{
                            return null;
                          }
                        },
                      ),
                    ]
                  ),
                 ),),),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Sign In', style:TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w700)),
                          CircleAvatar(
                            radius: 20,
                              backgroundColor: Colors.black87,
                            child: IconButton(
                              color: Colors.grey,
                              onPressed: (){
                                loginUser();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const MyDash()),
                                );
                              },
                              icon: const Icon(Icons.arrow_forward),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height:60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(onPressed: (){
                            Navigator.pushNamed(context, 'register');
                          },
                              child: const Text('Sign Up',style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 17,
                              color: Colors.white,
                          ),)),
                          TextButton(onPressed: (){
                            
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const MyDash()),
                                );
                             
                          }, child: const Text('Forgot Password',style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 17,
                            color: Colors.white,
                          ),))
                        ],
                      )
                    ],
                  )
                    ),
                  ),
                ),
              ],
            )
        ),
      );

  }
}

