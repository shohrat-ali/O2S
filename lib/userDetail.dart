import 'package:flutter/material.dart';

import 'homeScreen.dart';

class userdetail extends StatefulWidget {
  const userdetail({Key? key}) : super(key: key);

  @override
  _userdetailState createState() => _userdetailState();
}

class _userdetailState extends State<userdetail> {
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
                    padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 25.0),
                    child: Text('User Login',
                      style: TextStyle(color: Colors.black, fontSize: 31, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(6.0, 10.0, 6.0, 10.0),
                  margin: EdgeInsets.only(top: 10, left: 20, right: 20),
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

                      Padding(
                        padding: EdgeInsets.only(top: 2,bottom: 8),
                        child: Text(
                          "Michael Jordan",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF818181),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 70,
                        child: Image.asset("assets/icons/camera.png"),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                        child: Text(
                          "Enter Your Photo",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        width: 340,
                        height: 45,
                        padding: EdgeInsets.only(left: 16, top: 12),
                        decoration: BoxDecoration(
                            border: Border(left: BorderSide(color: Colors.black, width: 3)),
                            boxShadow: [BoxShadow(color: Color(0xFFD6D6D6))]
                        ),
                        child: Text('Basic Profile', style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 20,left: 10),
                            child: SizedBox(
                              height: 25,
                              child: Image.asset("assets/images/holding.png"),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                            width: 290,
                            height: 50,
                            child: TextField(
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                hintText: 'User Name',
                                hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 12,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFFD6D6D6))
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 20,left: 10),
                            child: SizedBox(
                              height: 25,
                              child: Image.asset("assets/images/holding.png"),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                            width: 290,
                            height: 50,
                            child: TextField(
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                hintText: 'Email ID',
                                hintStyle: TextStyle(
                                  color: Colors.black, fontSize: 12,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFFD6D6D6))
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 340,
                        height: 45,
                        margin: EdgeInsets.only(top: 22),
                        padding: EdgeInsets.only(left: 16, top: 12),
                        decoration: BoxDecoration(
                            border: Border(left: BorderSide(color: Colors.black, width: 3)),
                            boxShadow: [BoxShadow(color: Color(0xFFD6D6D6))]
                        ),
                        child: Text('Basic Profile', style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                        width: 350,
                        height: 50,
                        child: TextField(
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.open_in_full),
                            hintText: 'Square Footage',
                            hintStyle: TextStyle(
                              color: Colors.black, fontSize: 12,
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFD6D6D6))
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 32),
                  child: Center(
                    child: Stack(
                      children: <Widget>[
                        SizedBox(height: 80.0),
                        Container(
                          height: 44.0,
                          width: 70.0,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Color(0xFF33691E),shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(1.0)
                            ),),

                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => homescreen()),
                              );
                            },
                            child: Text("Next", style: TextStyle(color: Color(0xB3FFFFFF), fontSize: 11),),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
