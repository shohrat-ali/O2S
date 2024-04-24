import 'package:flutter/material.dart';
import 'package:o2s/adminEntries.dart';

import 'admine2.dart';

class adminscreen extends StatefulWidget {
  const adminscreen({Key? key}) : super(key: key);

  @override
  _adminscreenState createState() => _adminscreenState();
}

class _adminscreenState extends State<adminscreen> {

  var _formKey = GlobalKey<FormState>();
  var isLoading = false;

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => adminentries()),
    );
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
                  padding: EdgeInsets.fromLTRB(0.0, 90.0, 0.0, 0.0),
                  child: Center(
                    child: Text('Admin Log-in', style: TextStyle(color: Colors.black, fontSize: 31, fontWeight: FontWeight.bold),)
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
                        padding: EdgeInsets.fromLTRB(100.0, 10.0, 0.0, 0.0),
                        width: 195,
                        height: 140,
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
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => adminentries()),
                            // );
                          },
                            child: (isLoading)
                                ? const SizedBox(
                                width: 30,
                                height: 30,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 4.0,
                                )): Image.asset("assets/icons/fast.png"),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                        child: Center(
                            child: Text('Next', style: TextStyle(color: Colors.black, fontSize: 22),)
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
