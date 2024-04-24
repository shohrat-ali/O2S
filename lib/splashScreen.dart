import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:o2s/homeScreen.dart';
import 'package:o2s/loginScreen.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({Key? key}) : super(key: key);

  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {

  @override
  void initState() {
    super.initState();
    this.gotonextpage();
  }

  gotonextpage() async{

    await Future.delayed(Duration(milliseconds: 2000), () {});
    final storage = new FlutterSecureStorage();
    String? value = await storage.read(key:"is_logged_in");
    print("valure");
    print(value);
    if(value=="1"){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> homescreen()));
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginSccreen()));
    }

  }

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
        child: Center(
          child: Image.asset("assets/icons/logo.png"),
        ),
      ),
    );
  }
}
