import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:o2s/form.dart';
import 'package:o2s/usage.dart';
import 'package:http/http.dart' as http;


import 'homeScreen.dart';
import 'mainDrawer.dart';
import 'notification.dart';

class setting extends StatefulWidget {
  const setting({Key? key}) : super(key: key);

  @override
  _settingState createState() => _settingState();
}

class MainClass {

  user_data user_Data;

  MainClass(this.user_Data);

//Create the same factory converter, but using another inner factory 'fromJson' converter
//for the inner class object (InnerClass.fromJson(json['inner_class']))

  factory MainClass.fromJson(dynamic json) {
    return MainClass(

        user_data.fromJson(json['user_data']) // << this one
    );
  }
}

class user_data {
  String name = "";
  String email = "";
  String phone = "";
  user_data (
      this.name,
      this.email,
      this.phone
      );
  factory user_data.fromJson(dynamic json) {
    return user_data(
        json['name'] as String,
        json['email'] as String,
        json['phone'] as String,
    );
  }
}

class slots {
  slots({required this.start_from, required this.end_to, required this.max_limit});
  final String start_from;
  final String end_to;
  final String max_limit;


  factory slots.fromJson(Map<String, dynamic> data) {
    final start_from = data['start_from'] as String;
    final end_to = data['end_to'] as String;
    final max_limit = data['max_limit'] as String;
    return slots(start_from: start_from, end_to: end_to, max_limit: max_limit);
  }

  Map<String, dynamic> toJson() {
    return {
      'start_from': start_from,
      'end_to' : end_to,
      'max_limit' : max_limit
    };
  }
}


class _settingState extends State<setting> {

  // late String stringResponse;
  late final Map mapResponse;
  late final Map dataResponse;
  late final MainClass mainClassDartObject;

  late final String start_from1, start_from2, start_from3, start_from4;
  late final String end_to1, end_to2, end_to3, end_to4;
  late final String max_limit1, max_limit2, max_limit3, max_limit4;

  Future apicall() async{
    final storage = new FlutterSecureStorage();

// Read value
    String? value = await storage.read(key:"access_token");
    http.Response response;
    response = await http.get(Uri.parse("https://nskoffice.nutshellinfosoft.com/o2s/api/user_data"),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $value'
        });
    if(response.statusCode == 200){
      setState(() {
        print(response.body);
        try {
          mainClassDartObject = MainClass.fromJson(json.decode(response.body));
          // double cp = 100 * mainClassDartObject.user_Data.current / 6.42;
          // print("hello $cp");
          print(mainClassDartObject.user_Data.name);

          // final decodedJson = jsonDecode(response.body); // dynamic
          // start_from1 = decodedJson['slots'][0]['start_from'] as String;
          // start_from2 = decodedJson['slots'][1]['start_from'] as String;
          // start_from3 = decodedJson['slots'][2]['start_from'] as String;
          // end_to1 = decodedJson['slots'][0]['end_to'] as String;
          // end_to2 = decodedJson['slots'][1]['end_to'] as String;
          // end_to3 = decodedJson['slots'][2]['end_to'] as String;
          // max_limit1 = decodedJson['slots'][0]['max_limit'] as String;
          // max_limit2 = decodedJson['slots'][1]['max_limit'] as String;
          // max_limit3 = decodedJson['slots'][2]['max_limit'] as String;



        } catch (e) {
          print(e);
          print(",");
        }
      });
    }else{
      print("api call error");
    }
  }
  @override
  void initState() {
    apicall();
    super.initState();
  }


  TimeOfDay time1 = TimeOfDay(hour: 0, minute: 00);
  TimeOfDay time2 = TimeOfDay(hour: 8, minute: 59);
  TimeOfDay time3 = TimeOfDay(hour: 9, minute: 00);
  TimeOfDay time4 = TimeOfDay(hour: 13, minute: 59);
  TimeOfDay time5 = TimeOfDay(hour: 14, minute: 00);
  TimeOfDay time6 = TimeOfDay(hour: 18, minute: 59);
  TimeOfDay time7 = TimeOfDay(hour: 19, minute: 00);
  TimeOfDay time8 = TimeOfDay(hour: 23, minute: 59);

  String getText() {
    if (time1 == null) {
      return 'Select Time';
    } else {
      final hours = time1.hour.toString().padLeft(2, '0');
      final minutes = time1.minute.toString().padLeft(2, '0');

      return '$hours:$minutes';
    }
  }

  Future pickTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: time1 ?? initialTime,
    );

    if (newTime == null) return;

    setState(() => time1 = newTime);
  }

  String getText1() {
    if (time2 == null) {
      return 'Select Time';
    } else {
      final hours = time2.hour.toString().padLeft(2, '0');
      final minutes = time2.minute.toString().padLeft(2, '0');

      return '$hours:$minutes';
    }
  }

  Future pickTime1(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: time2 ?? initialTime,
    );

    if (newTime == null) return;

    setState(() => time2 = newTime);
  }

  String getText2() {
    if (time3 == null) {
      return 'Select Time';
    } else {
      final hours = time3.hour.toString().padLeft(2, '0');
      final minutes = time3.minute.toString().padLeft(2, '0');

      return '$hours:$minutes';
    }
  }

  Future pickTime2(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: time3 ?? initialTime,
    );

    if (newTime == null) return;

    setState(() => time3 = newTime);
  }

  String getText3() {
    if (time4 == null) {
      return 'Select Time';
    } else {
      final hours = time4.hour.toString().padLeft(2, '0');
      final minutes = time4.minute.toString().padLeft(2, '0');

      return '$hours:$minutes';
    }
  }

  Future pickTime3(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: time4 ?? initialTime,
    );

    if (newTime == null) return;

    setState(() => time4 = newTime);
  }

  String getText4() {
    if (time5 == null) {
      return 'Select Time';
    } else {
      final hours = time5.hour.toString().padLeft(2, '0');
      final minutes = time5.minute.toString().padLeft(2, '0');

      return '$hours:$minutes';
    }
  }

  Future pickTime4(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: time5 ?? initialTime,
    );

    if (newTime == null) return;

    setState(() => time5 = newTime);
  }

  String getText5() {
    if (time6 == null) {
      return 'Select Time';
    } else {
      final hours = time6.hour.toString().padLeft(2, '0');
      final minutes = time6.minute.toString().padLeft(2, '0');

      return '$hours:$minutes';
    }
  }

  Future pickTime5(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: time6 ?? initialTime,
    );

    if (newTime == null) return;

    setState(() => time6 = newTime);
  }

  String getText6() {
    if (time7 == null) {
      return 'Select Time';
    } else {
      final hours = time7.hour.toString().padLeft(2, '0');
      final minutes = time7.minute.toString().padLeft(2, '0');

      return '$hours:$minutes';
    }
  }

  Future pickTime6(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: time7 ?? initialTime,
    );

    if (newTime == null) return;

    setState(() => time7 = newTime);
  }

  String getText7() {
    if (time8 == null) {
      return 'Select Time';
    } else {
      final hours = time8.hour.toString().padLeft(2, '0');
      final minutes = time8.minute.toString().padLeft(2, '0');

      return '$hours:$minutes';
    }
  }

  Future pickTime7(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: time8 ?? initialTime,
    );

    if (newTime == null) return;

    setState(() => time8 = newTime);
  }


   late File _image;

   // _openGallery(BuildContext context) async{
   //   var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
   //   this.setState(() {
   //     _image = picture;
   //   });
   //   Navigator.of(context).pop();
   // }
   //
   _openCamera(BuildContext context) async{
     final image = await imagePicker.getImage(source: ImageSource.camera);
     setState(() {
       _image = File(image.path);
     });
     Navigator.of(context).pop();
   }


  final imagePicker = ImagePicker();

   Future<void> getImage(BuildContext context){
     return showDialog(context: context, builder: (BuildContext context){
       return AlertDialog(
         title: Text('Make a choice'),
         content: SingleChildScrollView(
           child: ListBody(
             children: [
               GestureDetector(
                 child: Text('Camera'),
                 onTap: () {
                   _openCamera(context);
                 },
               )
             ],
           ),
         ),
       );
     });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: IconButton(
          icon: Image.asset(
            'assets/icons/logo.png', height: 60, width: 60,
            fit: BoxFit.cover,
          ),iconSize: 53,
          onPressed: () {},
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: new Image.asset("assets/icons/user.png", width: 28, height: 28,),
            color: Colors.black,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => setting()),
              );
            },
          ),
          IconButton(
            icon: new Image.asset("assets/icons/notif.png", width: 25, height: 25,),
            color: Colors.black,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => notification()),
              );
            },
          )
        ],
      ),
      drawer: maindrawer(),

      body: SingleChildScrollView(
        child: Container(
          height: 830,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.JPG",),
                fit: BoxFit.cover,
              )
          ),
          child: Column(
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.fromLTRB(6.0, 0.0, 6.0, 0.0),
                  margin: EdgeInsets.only(top: 0, left: 0, right: 0),
                  width: 390,
                  height: 45,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFFFFCA28),
                        Color(0xFFFFCA28),
                      ],
                    ),
                  ),
                  child: Center(
                    child: Text('Settings', style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 5),
                child: Text('User Profile Setting', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 20, left: 15, bottom: 0),
                            margin: EdgeInsets.only(left: 16),
                            child: Text('Photo:', style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15,left: 84),
                            child: Center(
                              child: Stack(
                                children: <Widget>[
                                  SizedBox(height: 40.0),
                                  Container(
                                    height: 44.0,
                                    width: 130.0,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(primary: Color(0xFF33691E),shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(1.0)
                                      ),),

                                      onPressed: () {
                                        getImage(context);
                                      },
                                      child: Text("Select Image", style: TextStyle(color: Color(0xB3FFFFFF), fontSize: 11),),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      height: 40,
                      width: 100,
                      child: Text(''),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  child: Column(
                                    children: [
                                      Container(
                                      padding: EdgeInsets.only(top: 50, left: 10, bottom: 0),
                                      child: Text('Name:', style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),),
                                    ),
                                      Container(
                                        padding: EdgeInsets.only(top: 40, left: 10, bottom: 0),
                                        child: Text('Email:', textAlign: TextAlign.left, style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(top: 40, left: 10, bottom: 18),
                                        child: Text('Mobile No.:', style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),),
                                      ),],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 40,left: 64),
                                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                                  width: 200,
                                  height: 40,
                                  child: TextFormField(
                                    cursorColor: Colors.black,
                                    initialValue: mainClassDartObject.user_Data.name,
                                    style: TextStyle(color: Colors.black, fontSize: 11),
                                    decoration: InputDecoration(
                                        hintText: "",
                                        hintStyle: TextStyle(
                                          color: Colors.black, fontSize: 11,
                                        ),
                                        border: InputBorder.none,
                                        fillColor: Colors.white,
                                        filled: true
                                    ),
                                    obscureText: false,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20,left: 64),
                                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                                  width: 200,
                                  height: 40,
                                  child: TextFormField(
                                    cursorColor: Colors.black,
                                    initialValue: mainClassDartObject.user_Data.email,
                                    style: TextStyle(color: Colors.black, fontSize: 11),
                                    decoration: InputDecoration(
                                        hintText: "",
                                        hintStyle: TextStyle(
                                          color: Colors.black, fontSize: 11,
                                        ),
                                        border: InputBorder.none,
                                        fillColor: Colors.white,
                                        filled: true
                                    ),
                                    obscureText: false,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20,left: 64),
                                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                                  width: 200,
                                  height: 40,
                                  child: TextFormField(
                                    cursorColor: Colors.black,
                                    initialValue: mainClassDartObject.user_Data.phone,
                                    style: TextStyle(color: Colors.black, fontSize: 11),
                                    decoration: InputDecoration(
                                        hintText: "",
                                        hintStyle: TextStyle(
                                          color: Colors.black, fontSize: 11,
                                        ),
                                        border: InputBorder.none,
                                        fillColor: Colors.white,
                                        filled: true
                                    ),
                                    obscureText: false,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      height: 40,
                      width: 100,
                      child: Text(''),
                    ),
                    // Container(
                    //   child: Row(
                    //     children: [
                    //       Container(
                    //         padding: EdgeInsets.only(top: 50, left: 15, bottom: 0),
                    //         child: Text('Name:', style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),),
                    //       ),
                    //       Container(
                    //         margin: EdgeInsets.only(top: 50,left: 64),
                    //         padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                    //         width: 210,
                    //         height: 40,
                    //         child: TextFormField(
                    //           cursorColor: Colors.black,
                    //           // initialValue: mainClassDartObject.user_Data.name,
                    //           style: TextStyle(color: Colors.black, fontSize: 11),
                    //           decoration: InputDecoration(
                    //             hintText: "",
                    //             hintStyle: TextStyle(
                    //               color: Colors.black, fontSize: 11,
                    //             ),
                    //             border: InputBorder.none,
                    //             fillColor: Colors.white,
                    //             filled: true
                    //           ),
                    //           obscureText: false,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Container(
                    //   child: Row(
                    //     children: [
                    //       Container(
                    //         padding: EdgeInsets.only(top: 5, left: 15, bottom: 0),
                    //         child: Text('Email:', style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),),
                    //       ),
                    //       Container(
                    //         margin: EdgeInsets.only(top: 5,left: 66),
                    //         padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                    //         width: 210,
                    //         height: 40,
                    //         child: TextFormField(
                    //           cursorColor: Colors.black,
                    //           // initialValue: mainClassDartObject.user_Data.email,
                    //           style: TextStyle(color: Colors.black, fontSize: 11),
                    //           decoration: InputDecoration(
                    //               hintText: "",
                    //               hintStyle: TextStyle(
                    //                 color: Colors.black, fontSize: 11,
                    //               ),
                    //               border: InputBorder.none,
                    //               fillColor: Colors.white,
                    //               filled: true
                    //           ),
                    //           obscureText: false,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Container(
                    //   child: Row(
                    //     children: [
                    //       Container(
                    //         padding: EdgeInsets.only(top: 10, left: 15, bottom: 18),
                    //         child: Text('Mobile No.:', style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),),
                    //       ),
                    //       Container(
                    //         margin: EdgeInsets.only(top: 0,left: 35),
                    //         padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                    //         width: 200,
                    //         height: 40,
                    //         child: TextFormField(
                    //           cursorColor: Colors.black,
                    //           // initialValue: mainClassDartObject.user_Data.phone,
                    //           style: TextStyle(color: Colors.black, fontSize: 11),
                    //           decoration: InputDecoration(
                    //               hintText: "",
                    //               hintStyle: TextStyle(
                    //                 color: Colors.black, fontSize: 11,
                    //               ),
                    //               border: InputBorder.none,
                    //               fillColor: Colors.white,
                    //               filled: true
                    //           ),
                    //           obscureText: false,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Container(
                      padding: EdgeInsets.fromLTRB(6.0, 0.0, 6.0, 0.0),
                      margin: EdgeInsets.only(top: 0, left: 0, right: 0),
                      width: 390,
                      height: 30,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFFFFF00),
                            Color(0xFFFFFF00),
                          ],
                        ),
                      ),
                      child: Center(
                        child: Text('Time Slot Selection', style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 10, left: 15),
                            child: Text('Slot 1: From', style: TextStyle(color: Color(0xFF33691E), fontSize: 13, fontWeight: FontWeight.bold),),
                          ),
                          Container(
                            width: 85,
                            padding: EdgeInsets.only(top: 10, left: 8),
                            child: Column(
                              children: [
                                // ignore: deprecated_member_use
                                RaisedButton(
                                    child: Text(getText(), style: TextStyle(fontSize: 10)),
                                    onPressed: () {
                                      pickTime(context);
                                    }
                                ),
                              ],
                            ),
                          ),
                          // Container(
                          //   padding: EdgeInsets.only(top: 10, left: 15),
                          //   child: Text('$start_from1', style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),),
                          // ),
                          Container(
                            padding: EdgeInsets.only(top: 10, left: 5),
                            child: Text('To', style: TextStyle(color: Color(0xFF33691E), fontSize: 13, fontWeight: FontWeight.bold),),
                          ),
                          Container(
                            width: 85,
                            padding: EdgeInsets.only(top: 10, left: 6),
                            child: Column(
                              children: [
                                // ignore: deprecated_member_use
                                RaisedButton(
                                    child: Text(getText1(), style: TextStyle(fontSize: 10),),
                                    onPressed: () {
                                      pickTime1(context);
                                    }
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 11,left: 8),
                            padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                            width: 70,
                            height: 40,
                            child: TextFormField(
                              cursorColor: Colors.black,
                              initialValue: "100",
                              style: TextStyle(color: Colors.black, fontSize: 11),
                              decoration: InputDecoration(
                                  hintText: "",
                                  hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 11,
                                  ),
                                  border: InputBorder.none,
                                  fillColor: Colors.white,
                                  filled: true
                              ),
                              obscureText: false,
                            ),
                          ),
                          // Container(
                          //   padding: EdgeInsets.only(top: 10, left: 15),
                          //   child: Text('$end_to1', style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),),
                          // ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 0, left: 15),
                            child: Text('Slot 2: From', style: TextStyle(color: Color(0xFF33691E), fontSize: 13, fontWeight: FontWeight.bold),),
                          ),
                          Container(
                            width: 85,
                            padding: EdgeInsets.only(top: 0, left: 8),
                            child: Column(
                              children: [
                                // ignore: deprecated_member_use
                                RaisedButton(
                                    child: Text(getText2(), style: TextStyle(fontSize: 10)),
                                    onPressed: () {
                                      pickTime2(context);
                                    }
                                ),
                              ],
                            ),
                          ),
                          // Container(
                          //   padding: EdgeInsets.only(top: 10, left: 15),
                          //   child: Text('$start_from2', style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),),
                          // ),
                          Container(
                            padding: EdgeInsets.only(top: 0, left: 5),
                            child: Text('To', style: TextStyle(color: Color(0xFF33691E), fontSize: 13, fontWeight: FontWeight.bold),),
                          ),
                          Container(
                            width: 85,
                            padding: EdgeInsets.only(top: 0, left: 6),
                            child: Column(
                              children: [
                                // ignore: deprecated_member_use
                                RaisedButton(
                                    child: Text(getText3(), style: TextStyle(fontSize: 10)),
                                    onPressed: () {
                                      pickTime3(context);
                                    }
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 1,left: 8),
                            padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                            width: 70,
                            height: 40,
                            child: TextFormField(
                              cursorColor: Colors.black,
                              initialValue: "100",
                              style: TextStyle(color: Colors.black, fontSize: 11),
                              decoration: InputDecoration(
                                  hintText: "",
                                  hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 11,
                                  ),
                                  border: InputBorder.none,
                                  fillColor: Colors.white,
                                  filled: true
                              ),
                              obscureText: false,
                            ),
                          ),
                          // Container(
                          //   padding: EdgeInsets.only(top: 10, left: 15),
                          //   child: Text('$end_to2', style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),),
                          // ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 0, left: 15),
                            child: Text('Slot 3: From', style: TextStyle(color: Color(0xFF33691E), fontSize: 13, fontWeight: FontWeight.bold),),
                          ),
                          Container(
                            width: 85,
                            padding: EdgeInsets.only(top: 0, left: 8),
                            child: Column(
                              children: [
                                // ignore: deprecated_member_use
                                RaisedButton(
                                    child: Text(getText4(), style: TextStyle(fontSize: 10)),
                                    onPressed: () {
                                      pickTime4(context);
                                    }
                                ),
                              ],
                            ),
                          ),
                          // Container(
                          //   padding: EdgeInsets.only(top: 10, left: 15),
                          //   child: Text('$start_from3', style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),),
                          // ),
                          Container(
                            padding: EdgeInsets.only(top: 0, left: 5),
                            child: Text('To', style: TextStyle(color: Color(0xFF33691E), fontSize: 13, fontWeight: FontWeight.bold),),
                          ),
                          Container(
                            width: 85,
                            padding: EdgeInsets.only(top: 0, left: 6),
                            child: Column(
                              children: [
                                // ignore: deprecated_member_use
                                RaisedButton(
                                    child: Text(getText5(), style: TextStyle(fontSize: 10)),
                                    onPressed: () {
                                      pickTime5(context);
                                    }
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 1,left: 8),
                            padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                            width: 70,
                            height: 40,
                            child: TextFormField(
                              cursorColor: Colors.black,
                              initialValue: "100",
                              style: TextStyle(color: Colors.black, fontSize: 11),
                              decoration: InputDecoration(
                                  hintText: "",
                                  hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 11,
                                  ),
                                  border: InputBorder.none,
                                  fillColor: Colors.white,
                                  filled: true
                              ),
                              obscureText: false,
                            ),
                          ),
                          // Container(
                          //   padding: EdgeInsets.only(top: 10, left: 15),
                          //   child: Text('$end_to3', style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),),
                          // ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 0, left: 15),
                            child: Text('Slot 4: From', style: TextStyle(color: Color(0xFF33691E), fontSize: 13, fontWeight: FontWeight.bold),),
                          ),
                          Container(
                            width: 85,
                            padding: EdgeInsets.only(top: 0, left: 8),
                            child: Column(
                              children: [
                                // ignore: deprecated_member_use
                                RaisedButton(
                                    child: Text(getText6(), style: TextStyle(fontSize: 10),),
                                    onPressed: () {
                                      pickTime6(context);
                                    }
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 0, left: 5),
                            child: Text('To', style: TextStyle(color: Color(0xFF33691E), fontSize: 13, fontWeight: FontWeight.bold),),
                          ),
                          Container(
                            width: 85,
                            padding: EdgeInsets.only(top: 0, left: 6),
                            child: Column(
                              children: [
                                // ignore: deprecated_member_use
                                RaisedButton(
                                    child: Text(getText7(), style: TextStyle(fontSize: 10),),
                                    onPressed: () {
                                      pickTime7(context);
                                    }
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 1,left: 8),
                            padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                            width: 70,
                            height: 40,
                            child: TextFormField(
                              cursorColor: Colors.black,
                              initialValue: "100",
                              style: TextStyle(color: Colors.black, fontSize: 11),
                              decoration: InputDecoration(
                                  hintText: "",
                                  hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 11,
                                  ),
                                  border: InputBorder.none,
                                  fillColor: Colors.white,
                                  filled: true
                              ),
                              obscureText: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 40),
                      height: 85.0,
                      width: 375.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Color(0xFFECEFF1),shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0)
                        ),),

                        onPressed: () {
                        },
                        child: Text("Save", style: TextStyle(color: Color(0xFF33691E), fontSize: 13, fontWeight: FontWeight.bold),),
                      ),
                    ),

                    // Container(
                    //   width: 380,
                    //   padding: EdgeInsets.only(top: 15),
                    //   child: Row(
                    //     children: [
                    //       Container(
                    //         width: 190,
                    //         // padding: EdgeInsets.only(left: 100),
                    //         child: Column(
                    //           children: [
                    //             Container(
                    //               child: Container(
                    //                 margin: EdgeInsets.only(right: 0, top: 10),
                    //                 child: Text('Kw', textAlign: TextAlign.center, style: TextStyle(fontSize: 18),),
                    //               ),
                    //             ),
                    //             Container(
                    //               padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                    //               height: 50,
                    //               width: 170,
                    //               child: TextFormField(
                    //                 cursorColor: Colors.black,
                    //                 initialValue: "100",
                    //                 validator: (value){
                    //                   if(value!.isEmpty){
                    //                     print("value"+value);
                    //                     return 'Required Field';
                    //                   }else{
                    //                     return null;
                    //                   }
                    //                 },
                    //                 decoration: InputDecoration(
                    //                   enabledBorder: OutlineInputBorder(
                    //                       borderSide: BorderSide(color: Colors.black, width: 2)
                    //                   ),
                    //                   focusedBorder: OutlineInputBorder(
                    //                       borderSide: BorderSide(color: Colors.black, width: 2)
                    //                   ),
                    //                   fillColor: Colors.white,
                    //                   filled: true,
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //       Container(
                    //         width: 190,
                    //         // padding: EdgeInsets.only(left: 100),
                    //         child: Column(
                    //           children: [
                    //             Container(
                    //               child: Container(
                    //                 margin: EdgeInsets.only(right: 0, top: 10),
                    //                 child: Text('KwH', textAlign: TextAlign.center, style: TextStyle(fontSize: 18),),
                    //               ),
                    //             ),
                    //             Container(
                    //               padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                    //               height: 50,
                    //               width: 170,
                    //               child: TextFormField(
                    //                 cursorColor: Colors.black,
                    //                 initialValue: "100",
                    //                 validator: (value){
                    //                   if(value!.isEmpty){
                    //                     print("value"+value);
                    //                     return 'Required Field';
                    //                   }else{
                    //                     return null;
                    //                   }
                    //                 },
                    //                 decoration: InputDecoration(
                    //                   enabledBorder: OutlineInputBorder(
                    //                       borderSide: BorderSide(color: Colors.black, width: 2)
                    //                   ),
                    //                   focusedBorder: OutlineInputBorder(
                    //                       borderSide: BorderSide(color: Colors.black, width: 2)
                    //                   ),
                    //                   fillColor: Colors.white,
                    //                   filled: true,
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // ignore: deprecated_member_use
      bottomNavigationBar: Container(
       child: Row(
         crossAxisAlignment: CrossAxisAlignment.center, // Optional
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
           Container(
               padding: EdgeInsets.only(top: 5, bottom: 5, left: 12, right: 6),
               height: 65.0,
               width: 128.0,
               // ignore: deprecated_member_use
               child: FlatButton.icon(onPressed: (){
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => homescreen()),
                 );
               },
                 color: Color(0xFF33691E),
                 icon: new Image.asset("assets/icons/home.png", width: 30, height: 30,),
                 label: Text("Home", style: new TextStyle(
                     fontSize: 11.0,
                     color: Colors.white
                 ),),
               )
           ),
           Container(
               padding: EdgeInsets.only(top: 5, bottom: 5, left: 6, right: 6),
               height: 65.0,
               width: 128.0,
               child: FlatButton.icon(onPressed: (){
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => usage()),
                 );
               },
                 color: Color(0xFF33691E),
                 icon: new Image.asset("assets/icons/usage.png", width: 30, height: 30,),
                 label: Text("Usage", style: new TextStyle(
                     fontSize: 11.0,
                     color: Colors.white
                 ),),
               )
           ),
           Container(
             padding: EdgeInsets.only(top: 5, bottom: 5, left: 6, right: 12),
             height: 65.0,
             width: 128.0,
             // ignore: deprecated_member_use
             child: FlatButton(
               onPressed: ()  {
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => notification()),
                 );
               },
               color: Color(0xFF33691E),
               padding: EdgeInsets.only(top: 9),
               child: Column(// Replace with a Row for horizontal icon + text
                 children: <Widget>[
                   Image.asset("assets/icons/bell.png", width: 20, height: 20,),
                   Text("Notification", style: TextStyle(color: Colors.white, fontSize: 11.0),)
                 ],
               ),
             ),
           )
         ],
       ),
      ),
    );
  }
}
