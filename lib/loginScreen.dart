import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o2s/adminEntries.dart';
import 'package:o2s/adminScreen.dart';
import 'package:o2s/demoScreen.dart';
import 'package:o2s/userDetail.dart';
import 'package:o2s/userLogin.dart';

import 'continue_with_phone.dart';

class LoginSccreen extends StatefulWidget {
  const LoginSccreen({Key? key}) : super(key: key);

  @override
  _LoginSccreenState createState() => _LoginSccreenState();
}

class _LoginSccreenState extends State<LoginSccreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 860,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.JPG"),
                fit: BoxFit.cover,
              )
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 150.0, 0.0, 0.0),
                child: Center(
                  child: Image.asset("assets/icons/logo.png", ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 62),
                child: Center(
                  child: Stack(
                    children: <Widget>[
                      SizedBox(height: 80.0),
                      Container(
                        height: 74.0,
                        width: 232.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Color(0xFFFBC02D),shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1.0)
                          ),),

                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => userlogin()),
                            );
                          },
                          child: Text("User Login", style: TextStyle(color: Color(0xFF1565C0), fontSize: 19, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Center(
                  child: Stack(
                    children: <Widget>[
                      SizedBox(height: 80.0),
                      Container(
                        height: 74.0,
                        width: 232.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Color(0xFF00BCD4),shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1.0)
                          ),),

                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => adminscreen()),
                            );
                          },
                          child: Text("Admin Login", style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold),),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Center(
                  child: Stack(
                    children: <Widget>[
                      SizedBox(height: 80.0),
                      Container(
                        height: 74.0,
                        width: 232.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Color(0xFF424242),shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1.0)
                          ),),

                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => demoscreen()),
                            );
                          },
                          child: Text("Demo Login", style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold),),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 45),
                child: Center(
                  child: Stack(
                    children: <Widget>[
                      SizedBox(height: 80.0),
                      Container(
                        height: 54.0,
                        width: 85.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Color(0xFF33691E),shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1.0)
                          ),),

                          onPressed: () {},
                          child: Text("En", style: TextStyle(color: Color(0xB3FFFFFF), fontSize: 14),),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
