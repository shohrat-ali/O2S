import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:o2s/mainDrawer.dart';
import 'package:o2s/notification.dart';
import 'package:o2s/setting.dart';
import 'package:o2s/usage.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  _homescreenState createState() => _homescreenState();
}

class MainClass1 {

  String Kwmonth = "";
  String kwday = "";
  String Percent = "";


  MainClass1(this.Kwmonth, this.kwday, this.Percent);

//Create the same factory converter, but using another inner factory 'fromJson' converter
//for the inner class object (InnerClass.fromJson(json['inner_class']))

  factory MainClass1.fromJson(dynamic json) {
    return MainClass1(

      json['Kwmonth'] as String,
      json['kwday'] as String,
      json['Percent'] as String,

    );
  }
}

// class kWhInfo {
//   kWhInfo({required this.kwh});
//   final double kwh;
//
//
//   factory kWhInfo.fromJson(Map<double, dynamic> data) {
//     final kwh = data['kwh'] as double;
//
//     return kWhInfo(kwh: kwh);
//   }
//
//   Map<double, dynamic> toJson() {
//     return {
//       kwh: kwh,
//     };
//   }
// }

class _homescreenState extends State<homescreen> {

  late double d = double.parse(mainClassDartObject.kwday);
  late String day = d.toStringAsFixed(2);
  late double m = double.parse(mainClassDartObject.Kwmonth);
  late String month = m.toStringAsFixed(2);
  late double percent = double.parse(mainClassDartObject.Percent);
  late String per = percent.toStringAsFixed(2);

  // late String day = mainClassDartObject.kwday.toStringAsFixed(2);
  // late String month = mainClassDartObject.Kwmonth.toStringAsFixed(2);
 // late String percent = mainClassDartObject.Percent.toString();

  // late double p = double.parse(day) / double.parse(month) * 100;
  // late String per = p.toStringAsFixed(1);
  //
  late double tc = double.parse(day) * 5;
  late String t = tc.toStringAsFixed(2);

  late double yc = double.parse(month) * 5;
  late String y = yc.toStringAsFixed(2);


  // late double htotal =kwH1 + kwH2 + kwH3 + kwH4;
  // late String ht = htotal.toStringAsFixed(2);
  //
  // late double yesterday = 3000.0;
  // late double progress = double.parse(ht) / yesterday * 100;
  // late String p = progress.toStringAsFixed(2);
  //
  // late final double kwH1,kwH2,kwH3,kwH4;

  late final MainClass1 mainClassDartObject;

  Future apicall() async{
    final storage = new FlutterSecureStorage();

// Read value
    String? value = await storage.read(key:"access_token");

    http.Response response;

    response = await http.get(Uri.parse("https://nskoffice.nutshellinfosoft.com/o2s/api/getMonthDataPer"),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $value'
        });


    if(response.statusCode == 200){
      setState(() {
        print(response.body);
        try {

          // final decodedJson = jsonDecode(response.body); // dynamic
          // kwH1 = decodedJson['kWhInfo'][0]['kwh'] as double;
          // kwH2 = decodedJson['kWhInfo'][1]['kwh'] as double;
          // kwH3 = decodedJson['kWhInfo'][2]['kwh'] as double;
          // kwH4 = decodedJson['kWhInfo'][3]['kwh'] as double;

          mainClassDartObject = MainClass1.fromJson(json.decode(response.body));
          // double cp = 100 * mainClassDartObject.user_Data.current / 6.42;
          // print("hello $cp");
          // print(mainClassDartObject.Percent);

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


  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          TextButton(
            onPressed: () => SystemNavigator.pop(),
            child: new Text('Yes'),
          ),
        ],
      ),
    )) ?? false;
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
    final screenHeight = MediaQuery.of(context).size.height;
    return WillPopScope(
        onWillPop: _onWillPop,
        child: new Scaffold(
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

      body: SingleChildScrollView(
        child: Container(
          height: screenHeight * 1.025,
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
                  height: screenHeight * 0.15,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF76FF03),
                        Color(0xFF76FF03),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 26, left: 31, right: 31),
                    child: Text("O2S Technologies O2S Watcher saves energy and protects",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 0),
                child: Image.asset('assets/images/bulb.png'),
              ),
              Container(
                child: Center(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(6.0, 0.0, 6.0, 0.0),
                    margin: EdgeInsets.only(top: 5, left: 0, right: 0),
                    width: 390,
                    height: screenHeight * 0.275,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.red,
                          Colors.red,
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          Container(
                            child: Text("Current Data: $day",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5),
                            child: Text("Yesterday Data: $month",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15, left: 0, right: 0),
                            child: new LinearPercentIndicator(
                              width: MediaQuery.of(context).size.width - 70,
                              animation: true,
                              lineHeight: 22.0,
                              animationDuration: 2500,
                              percent:() {
                               if(percent > 100)
                                 {
                                   return 1.0;
                                 }else if(percent < 0){
                                 return 0.0;
                               }else{
                                 return percent/100;
                               }
                              }(),
                              center: Text("$per %", style: TextStyle(fontSize: 13),),
                              linearStrokeCap: LinearStrokeCap.roundAll,
                              progressColor: Colors.green,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 15),
                            child: Text("Current Cost: Rs. $t",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5),
                            child: Text("Yesterday Cost: Rs. $y",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 40, right: 40, top: 10),
                child: Text("Try to reduce usage to be within target.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
              ),
              Container(
                padding: EdgeInsets.only(left: 40, right: 40, top: 5),
                child: Text("Save Money!",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
              ),
            ],
          ),
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
                // ignore: deprecated_member_use
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
                onPressed: () {
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
      ),
    );
  }
}
