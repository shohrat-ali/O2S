import 'dart:async';
import 'dart:convert';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:o2s/homeScreen.dart';
import 'package:o2s/usage.dart';

import 'package:http/http.dart' as http;

import 'ApiService.dart';
import 'adminEntries.dart';



class userlogin extends StatefulWidget {
  const userlogin({Key? key}) : super(key: key);

  @override
  _userloginState createState() => _userloginState();
}

class _userloginState extends State<userlogin> {

  var _formKey = GlobalKey<FormState>();
  var isLoading = false;

  final grant_type = "password";

  final client_id = "8";

  final client_secret = "hFIYUMnylCbdSVhDaZ8ylxXTZrtM2ytYn2rL1Eog";
  final username = TextEditingController();
  final password = TextEditingController();

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    callLoginApi();
  }

  callLoginApi() {
    final service = ApiServices();

    service.apiCallLogin(
      {
        "grant_type": grant_type.toString(),
        "client_id": client_id.toString(),
        "client_secret": client_secret.toString(),
        "username": username.text,
        "password": password.text,
      },
    ).then((value){
      if(value.error != null){
       print(value.error);
      }else{
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => homescreen()),
        );
        //push
      }
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 1000,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.JPG"),
              fit: BoxFit.cover,
            )
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
                  child: Center(
                    child: Image.asset("assets/icons/logo.png"),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0.0, 65.0, 0.0, 0.0),
                  child: Center(
                      child: Text('User Log-in', style: TextStyle(color: Colors.black, fontSize: 31, fontWeight: FontWeight.bold),)
                  ),
                ),
                Container(
                  child: Container(
                    margin: EdgeInsets.only(right: 180, top: 50),
                    child: Text('Username', style: TextStyle(fontSize: 21),),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(42.0, 10.0, 42.0, 0.0),
                  height: 50,
                  child: TextFormField(
                    controller: username,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(fontSize: 9, height: 0.1, color: Colors.red),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 2)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 2)
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                        return 'Enter a valid email!';
                      }
                      return null;
                    },
                  ),
                ),

                Container(
                  child: Container(
                    margin: EdgeInsets.only(right: 180, top: 10),
                    child: Text('Password', style: TextStyle(fontSize: 21),),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(42.0, 10.0, 42.0, 0.0),
                  height: 50,
                  child: TextFormField(
                    obscureText: true,
                    controller: password,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter a valid password!';
                      }
                      return null;
                    },
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(fontSize: 9, height: 0.1, color: Colors.red),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 2)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 2)
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(185.0, 8.0, 0.0, 0.0),
                  child: GestureDetector(
                    onTap: () {
                      print("Resend the code to the user");
                    },
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                ClipRect(
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(80.0, 0.0, 0.0, 0.0),
                        width: 180,
                        height: 200,
                        // ignore: deprecated_member_use
                        child: FlatButton(
                          onPressed: () async {
                            _submit();
                            setState(() {
                              isLoading = true;
                            });
                            await Future.delayed(const Duration(seconds: 1));
                            setState(() {
                              isLoading = false;
                            });
                             },
                            child: (isLoading)
                                ? const SizedBox(
                                width: 30,
                                height: 30,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 4.0,
                                )): Image.asset("assets/icons/play.png"),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                        child: Center(
                            child: Text('Confirm', style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),)
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}




