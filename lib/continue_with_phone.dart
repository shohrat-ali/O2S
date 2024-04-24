import 'package:flutter/material.dart';
import 'package:o2s/verifty_phone.dart';

import 'numeric_pad.dart';


class ContinueWithPhone extends StatefulWidget {
  @override
  _ContinueWithPhoneState createState() => _ContinueWithPhoneState();
}

class _ContinueWithPhoneState extends State<ContinueWithPhone> {

  String phoneNumber = "";

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
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0.0, 57.0, 0.0, 0.0),
              child: Center(
                child: Image.asset("assets/icons/logo.png"),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
              child: Text('User Login',
                style: TextStyle(color: Colors.black, fontSize: 31, fontWeight: FontWeight.bold),
              ),
            ),
              Container(
                padding: EdgeInsets.fromLTRB(6.0, 10.0, 6.0, 10.0),
                margin: EdgeInsets.only(top: 10),
                width: 330,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFFFFFFF),
                      Color(0xFFF7F7F7),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    SizedBox(
                      height: 130,
                      child: Image.asset("assets/images/holding.png"),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                      child: Text(
                        "You'll receive a 4 digit code to verify next.",
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xFF818181),
                        ),
                      ),
                    ),

                  ],
                ),
              ),

            Container(
              padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
              height: 67,
              width: 330 ,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[

                    Container(
                      width: 174,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          Text(
                            "Enter your phone",
                            style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),

                          SizedBox(
                            height: 8,
                          ),

                          Text(
                            phoneNumber,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                        ],
                      ),
                    ),

                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => VerifyPhone(phoneNumber: phoneNumber)),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFFFDC3D),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Continue",
                              style: TextStyle(
                                fontSize: 11,
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
                setState(() {
                  if(value != -1){
                    phoneNumber = phoneNumber + value.toString();
                  }
                  else{
                    phoneNumber = phoneNumber.substring(0, phoneNumber.length - 1);
                  }                  
                });
              },
            ),

          ],
        )
      ),
    );
  }
}