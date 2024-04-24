import 'package:flutter/material.dart';
import 'package:o2s/loginScreen.dart';

class demoscreen extends StatefulWidget {
  const demoscreen({Key? key}) : super(key: key);

  @override
  _demoscreenState createState() => _demoscreenState();
}

class _demoscreenState extends State<demoscreen> {
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
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
                child: Center(
                  child: Image.asset("assets/icons/logo.png"),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
                child: Center(
                    child: Text('Demo Video', style: TextStyle(color: Colors.black, fontSize: 31, fontWeight: FontWeight.bold),)
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 35.0, 0.0, 0.0),
                // ignore: deprecated_member_use
                child: FlatButton(
                  onPressed: (){
                  }, child: Image.asset("assets/icons/demo.png"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 115),
                child: Center(
                  child: Stack(
                    children: <Widget>[
                      SizedBox(height: 80.0),
                      Container(
                        height: 54.0,
                        width: 70.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Color(0xFF33691E),shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1.0)
                          ),),

                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginSccreen()),
                            );
                          },
                          child: Text("Back", style: TextStyle(color: Color(0xB3FFFFFF), fontSize: 11),),
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
