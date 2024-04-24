import 'package:flutter/material.dart';
import 'package:o2s/admine2.dart';

class adminentries extends StatefulWidget {
  const adminentries({Key? key}) : super(key: key);

  @override
  _adminentriesState createState() => _adminentriesState();
}

class _adminentriesState extends State<adminentries> {
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
                padding: EdgeInsets.fromLTRB(0.0, 90.0, 0.0, 0.0),
                child: Center(
                    child: Text('Admin Entries', style: TextStyle(color: Colors.black, fontSize: 31, fontWeight: FontWeight.bold),)
                ),
              ),
              Container(
                child: Container(
                  margin: EdgeInsets.only(right: 130, top: 50),
                  child: Text('Controller No.', style: TextStyle(fontSize: 21),),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(42.0, 10.0, 42.0, 0.0),
                height: 50,
                child: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2)
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              ClipRect(
                child: Row(
                  children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(80.0, 20.0, 0.0, 0.0),
                    width: 180,
                    height: 200,
                    // ignore: deprecated_member_use
                    child: FlatButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => admine2()),
                        );
                      }, child: Image.asset("assets/icons/play.png"),
                    ),
                  ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
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
    );
  }
}
