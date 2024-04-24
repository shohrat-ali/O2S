import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:o2s/setting.dart';
import 'package:o2s/usage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

import 'homeScreen.dart';
import 'mainDrawer.dart';

class notification extends StatefulWidget {
  const notification({Key? key}) : super(key: key);

  @override
  _notificationState createState() => _notificationState();
}


class notificationdata {
  notificationdata({required this.module_id, required this.meter_id, required this.limit, required this.current});
  final String module_id;
  final String meter_id;
  final String limit;
  final String current;


  factory notificationdata.fromJson(Map<String, dynamic> data) {
    final module_id = data['module_id'] as String;
    final meter_id = data['meter_id'] as String;
    final limit = data['limit'] as String;
    final current = data['current'] as String;
    return notificationdata(module_id: module_id, meter_id: meter_id, limit: limit, current: current);
  }

  Map<String, dynamic> toJson() {
    return {
      'module_id': module_id,
      'meter_id' : meter_id,
      'limit' : limit,
      'current': current
    };
  }
}

class _notificationState extends State<notification> {

  late final String module_id1, module_id2, module_id3, module_id4;
  late final String meter_id1, meter_id2, meter_id3, meter_id4;
  late final String limit1, limit2, limit3, limit4;
  late final String current1, current2, current3, current4;


  Future apicall() async{
    final storage = new FlutterSecureStorage();

// Read value
    String? value = await storage.read(key:"access_token");

    http.Response response;

    response = await http.get(Uri.parse("https://nskoffice.nutshellinfosoft.com/o2s/api/get_notif?module_id=147&meter_id=8&phase=1"),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $value'
        });

    if(response.statusCode == 200){
      setState(() {
        print(response.body);
        try {

          final decodedJson = jsonDecode(response.body); // dynamic
          module_id1 = decodedJson['notificationdata'][0]['module_id'] as String;
          module_id2 = decodedJson['notificationdata'][1]['module_id'] as String;
          module_id3 = decodedJson['notificationdata'][2]['module_id'] as String;
          module_id4 = decodedJson['notificationdata'][3]['module_id'] as String;
          meter_id1 = decodedJson['notificationdata'][0]['meter_id'] as String;
          meter_id2 = decodedJson['notificationdata'][1]['meter_id'] as String;
          meter_id3 = decodedJson['notificationdata'][2]['meter_id'] as String;
          meter_id4 = decodedJson['notificationdata'][3]['meter_id'] as String;
          limit1 = decodedJson['notificationdata'][0]['limit'] as String;
          limit2 = decodedJson['notificationdata'][1]['limit'] as String;
          limit3 = decodedJson['notificationdata'][2]['limit'] as String;
          limit4 = decodedJson['notificationdata'][3]['limit'] as String;
          current1 = decodedJson['notificationdata'][0]['current'] as String;
          current2 = decodedJson['notificationdata'][1]['current'] as String;
          current3 = decodedJson['notificationdata'][2]['current'] as String;
          current4 = decodedJson['notificationdata'][3]['current'] as String;

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


  _launchURL() async {
    const url = 'https://o2stechno.co.in/';
    if (await canLaunch(url)) {
      print("okkk");
      await launch(url);
    } else {
      print("no link");
      throw 'Could not launch $url';
    }
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
          onPressed: () {
            _launchURL();
          },
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
      body: Container(
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
                  child: Text('Notifications & Alerts', style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),),
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    height: 80,
                    width: 400,
                    padding: EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white,
                          Colors.white,
                        ],
                      ),
                    ),
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            child: Text("$module_id1 - $meter_id1", style: TextStyle(color: Color(0xFF33691E), fontSize: 15, fontWeight: FontWeight.bold),),
                          ),
                          Container(
                            width: 380,
                            padding: EdgeInsets.only(top: 15),
                            child: Row(
                              children: [
                                Container(
                                  width: 190,
                                  // padding: EdgeInsets.only(left: 100),
                                  child: Text("KWatt:  $current1",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)),
                                ),
                                Container(
                                  width: 190,
                                  // padding: EdgeInsets.only(left: 10),
                                  child: Text("Limit:  $limit1",textAlign: TextAlign.center, style: TextStyle(color: Colors.red, fontSize: 15, fontWeight: FontWeight.bold),),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 5,
              width: 400,
            ),
            Container(
              height: 80,
              width: 400,
              padding: EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Colors.white,
                  ],
                ),
              ),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      child: Text("$module_id2 - $meter_id2", style: TextStyle(color: Color(0xFF33691E), fontSize: 15, fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      width: 380,
                      padding: EdgeInsets.only(top: 15),
                      child: Row(
                        children: [
                          Container(
                            width: 190,
                            // padding: EdgeInsets.only(left: 100),
                            child: Text("KWatt:  $current2",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)),
                          ),
                          Container(
                            width: 190,
                            // padding: EdgeInsets.only(left: 10),
                            child: Text("Limit:  $limit2",textAlign: TextAlign.center, style: TextStyle(color: Colors.red, fontSize: 15, fontWeight: FontWeight.bold),),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 5,
              width: 400,
            ),
            Container(
              height: 80,
              width: 400,
              padding: EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Colors.white,
                  ],
                ),
              ),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      child: Text("$module_id3 - $meter_id3", style: TextStyle(color: Color(0xFF33691E), fontSize: 15, fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      width: 380,
                      padding: EdgeInsets.only(top: 15),
                      child: Row(
                        children: [
                          Container(
                            width: 190,
                            // padding: EdgeInsets.only(left: 100),
                            child: Text("KWatt:  $current3",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)),
                          ),
                          Container(
                            width: 190,
                            // padding: EdgeInsets.only(left: 10),
                            child: Text("Limit:  $limit3",textAlign: TextAlign.center, style: TextStyle(color: Colors.red, fontSize: 15, fontWeight: FontWeight.bold),),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 5,
              width: 400,
            ),
            Container(
              height: 80,
              width: 400,
              padding: EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Colors.white,
                  ],
                ),
              ),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      child: Text("$module_id4 - $meter_id4", style: TextStyle(color: Color(0xFF33691E), fontSize: 15, fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      width: 380,
                      padding: EdgeInsets.only(top: 15),
                      child: Row(
                        children: [
                          Container(
                            width: 190,
                            // padding: EdgeInsets.only(left: 100),
                            child: Text("KWatt:  $current4",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)),
                          ),
                          Container(
                            width: 190,
                            // padding: EdgeInsets.only(left: 10),
                            child: Text("Limit:  $limit4",textAlign: TextAlign.center, style: TextStyle(color: Colors.red, fontSize: 15, fontWeight: FontWeight.bold),),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),

      ),
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
                onPressed: () => {},
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
