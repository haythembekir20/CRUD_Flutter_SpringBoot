import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:workshop7/screen/studentsscreen.dart';
import 'register.dart';
import '../entities/user.dart';

import 'dashboard.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  User user = User("", "");
  String url = "http://192.168.137.1:8081/login";
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  Future save(user) async {
    var res = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': user.email, 'password': user.password}));
    print(res.body);
    if (res.body != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StudentScreen(),
          ));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
                child: Form(
                    key: _formKey,
                    child: Column(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 520.0,
                            width: 340.0,
                            child:  Padding(
                              padding:  EdgeInsets.all(10.0),
                              child:  Column(
                                 children: [
                                  Text("Login",
                                  style: TextStyle(
                                    fontSize: 62,
                                  ),
                                  ),
                                const Align(
                                  alignment:Alignment.center ,
                                ),
                                TextFormField(
                                  controller:emailCtrl ,
                                  decoration: InputDecoration(
                                      labelText: "Email"
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                TextFormField(
                                  controller:passwordCtrl ,
                                  decoration: InputDecoration(
                                        labelText: "Password"
                                  ),
                                  obscureText: true,
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Center(
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
                                    },
                                    child: Text("Wanna register  ?"),
                                  ),
                                ),
                                   const SizedBox(
                                     height: 10.0,
                                   ),
                                   Container(
                                     height: 45,
                                     width: 90,
                                     child: TextButton(
                                       
                                       style: TextButton.styleFrom(
                                         textStyle: const TextStyle(fontSize: 20),
                                         backgroundColor: Color.fromARGB(255, 81, 5, 168),
                                         
                                       ),
                                       onPressed: (){
                                         if(_formKey.currentState!.validate())
                                         {
                                           save(User(emailCtrl.text,passwordCtrl.text));
                                         }
                                       },
                                       child: Text('login',
                                       
                                       )
                                     ),
                                   ),


                                ],
                              ),
                            ),
                          ),

                        ]
                    )
                )
            )
        )
    );
  }
}
