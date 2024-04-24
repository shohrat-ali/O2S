import 'package:flutter/material.dart';
import 'package:o2s/userDetail.dart';

import 'continue_with_phone.dart';
import 'numeric_pad.dart';


class VerifyPhone extends StatefulWidget {

  final String phoneNumber;

  VerifyPhone({required this.phoneNumber});

  @override
  _VerifyPhoneState createState() => _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone> {

  String code = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.JPG"),
                fit: BoxFit.cover,
              )
          ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0.0, 57.0, 0.0, 0.0),
              child: Center(
                child: Image.asset("assets/icons/logo.png"),
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                child: Text('User Login',
                  style: TextStyle(color: Colors.black, fontSize: 31, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              child: Container(
                color: Colors.white,
                margin: EdgeInsets.only(right: 31, left: 31),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: Text(
                        "Code is sent to " + widget.phoneNumber,
                        style: TextStyle(
                          fontSize: 17,
                          color: Color(0xFF818181),
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top:25, bottom: 30),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          buildCodeNumberBox(code.length > 0 ? code.substring(0, 1) : ""),
                          buildCodeNumberBox(code.length > 1 ? code.substring(1, 2) : ""),
                          buildCodeNumberBox(code.length > 2 ? code.substring(2, 3) : ""),
                          buildCodeNumberBox(code.length > 3 ? code.substring(3, 4) : ""),

                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          
                          Text(
                            "Didn't recieve code? ",
                            style: TextStyle(
                              fontSize: 10,
                              color: Color(0xFF818181),
                            ),
                          ),
                          
                          SizedBox(
                            width: 8,
                          ),

                          GestureDetector(
                            onTap: () {
                              print("Resend the code to the user");
                            },
                            child: Text(
                              "Request again",
                              style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 31, right: 31),
              height: 90,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),

              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: <Widget>[

                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => userdetail()),
                          );
                        },
                        child: Container(
                          height: 63,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFDC3D),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Verify and Create Account",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),

            NumericPad(
              onNumberSelected: (value) {
                print(value);
                setState(() {
                  if(value != -1){
                    if(code.length < 4){
                      code = code + value.toString();
                    }
                  }
                  else{
                    code = code.substring(0, code.length - 1);
                  }
                  print(code);        
                });
              },
            ),

          ],
        )
      ),
    );
  }

  Widget buildCodeNumberBox(String codeNumber) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        width: 60,
        height: 60,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFF6F5FA),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 25.0,
                  spreadRadius: 1,
                  offset: Offset(0.0, 0.75)
              )
            ],
          ),
          child: Center(
            child: Text(
              codeNumber,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F1F1F),
              ),
            ),
          ),
        ),
      ),
    );
  }
}