import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:o2s/setting.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import 'homeScreen.dart';
import 'mainDrawer.dart';
import 'notification.dart';
import 'dart:math';
import 'dart:convert';

class usage extends StatefulWidget {
  const usage({Key? key}) : super(key: key);

  @override
  _usageState createState() => _usageState();
}

// class kWhInfo {
//   String kwday;
//
//   kWhInfo(this.kwday);
//
//   factory kWhInfo.fromJson(dynamic json) {
//     return kWhInfo(json['kwday'] as String);
//   }
//
//   @override
//   String toString() {
//     return '{ ${this.kwday} }';
//   }
// }
//
// class kWhInfo1 {
//   String kwweek;
//
//   kWhInfo1(this.kwweek);
//
//   factory kWhInfo1.fromJson(dynamic json) {
//     return kWhInfo1(json['kwweek'] as String);
//   }
//
//   @override
//   String toString() {
//     return '{ ${this.kwweek} }';
//   }
// }
//
// class kWhInfo2 {
//   String kwmonth;
//
//   kWhInfo2(this.kwmonth);
//
//   factory kWhInfo2.fromJson(dynamic json) {
//     return kWhInfo2(json['kwmonth'] as String);
//   }
//
//   @override
//   String toString() {
//     return '{ ${this.kwmonth} }';
//   }
// }

class slots {
  slots({required this.today, required this.yesterday, required this.time});
  final String today;
  final String yesterday;
  final String time;


  factory slots.fromJson(Map<String, dynamic> data) {
    final today = data['today'] as String;
    final yesterday = data['yesterday'] as String;
    final time = data['time'] as String;

    return slots(today: today, yesterday: yesterday, time: time);
  }

  Map<String, dynamic> toJson() {
    return {
      'today': today,
      'yesterday' : yesterday,
      'time' : time
    };
  }
}


class kWhInfo {
  kWhInfo({required this.kwweek, required this.kwday, required this.kwmonth});
  final String kwweek;
  final String kwday;
  final String kwmonth;


  factory kWhInfo.fromJson(Map<String, dynamic> data) {
    final kwweek = data['kwweek'] as String;
    final kwday = data['kwday'] as String;
    final kwmonth = data['kwmonth'] as String;
    return kWhInfo(kwweek: kwweek, kwday: kwday, kwmonth: kwmonth);
  }

  Map<String, dynamic> toJson() {
    return {
      'kwweek': kwweek,
      'kwday' : kwday,
      'kwmonth' : kwmonth
    };
  }
}

// class MainClass {
//   MainClass({
//     required this.kwhInfo,
//   });
//
//   final List<kWhInfo> kwhInfo;
//
//   factory MainClass.fromJson(Map<String, dynamic> data) {
//
//     //ruk call karta mera phn band ho gaya h ok
//
//     final kwhInfoData = data['kWhInfo'] as List<dynamic>?;
//
//     final kwhInfo = kwhInfoData != null
//
//         ? kwhInfoData.map((kwhInfoData) => kWhInfo.fromJson(kwhInfoData))
//         .toList()
//         : <kWhInfo>[];
//
//     return MainClass(
//       kwhInfo: kwhInfo,
//     );
//   }
// }

// class MainClass {
//
//   kWhInfo kwhInfo;
//
//   MainClass(this.kwhInfo);
//
// //Create the same factory converter, but using another inner factory 'fromJson' converter
// //for the inner class object (InnerClass.fromJson(json['inner_class']))
//
//   factory MainClass.fromJson(dynamic json) {
//     return MainClass(
//
//         kWhInfo.fromJson(json['kWhInfo']) // << this one
//     );
//   }
// }
//
// class kWhInfo {
//   // int current = 0;
//   // int past = 0;
//   //  String kwmonth = "";
//   String kwh = "";
//   // String kwweek = "";
//   kWhInfo (
//       // this.current,
//       // this.past,
//       // this.kwmonth,
//       this.kwh,
//       // this.kwweek
//       );
//   factory kWhInfo.fromJson(dynamic json) {
//     return kWhInfo(
//         // json['current'] as int,
//         // json['past'] as int
//       // json['kwmonth'] as String,
//       json['kwh'] as String,
//       // json['kwweek'] as String
//     );
//   }
// }


class _usageState extends State<usage> {


    // Week wise
    late double week1 = double.parse(kwWeek1);
    late double week2 = double.parse(kwWeek2);
    late double week3 = double.parse(kwWeek3);
    late double week4 = double.parse(kwWeek4);

    late double ctotal =double.parse(kwWeek1) + double.parse(kwWeek2) + double.parse(kwWeek3) + double.parse(kwWeek4);
    late double cp1 = double.parse(kwWeek1) / ctotal * 100;
    late double cp2 = double.parse(kwWeek2) / ctotal * 100;
    late double cp3 = double.parse(kwWeek3) / ctotal * 100;
    late double cp4 = double.parse(kwWeek4) / ctotal * 100;

    late String ct = ctotal.toStringAsFixed(2);

    late String c1 = cp1.toStringAsFixed(2);
    late String c2 = cp2.toStringAsFixed(2);
    late String c3 = cp3.toStringAsFixed(2);
    late String c4 = cp4.toStringAsFixed(2);

    // Day wise
    late double day1 = double.parse(kwDay1);
    late double day2 = double.parse(kwDay2);
    late double day3 = double.parse(kwDay3);
    late double day4 = double.parse(kwDay4);

    late double dtotal =double.parse(kwDay1) + double.parse(kwDay2) + double.parse(kwDay3) + double.parse(kwDay4);
    late double dp1 = double.parse(kwDay1) / dtotal * 100;
    late double dp2 = double.parse(kwDay2) / dtotal * 100;
    late double dp3 = double.parse(kwDay3) / dtotal * 100;
    late double dp4 = double.parse(kwDay4) / dtotal * 100;

    late String dt = dtotal.toStringAsFixed(2);

    late String d1 = dp1.toStringAsFixed(2);
    late String d2 = dp2.toStringAsFixed(2);
    late String d3 = dp3.toStringAsFixed(2);
    late String d4 = dp4.toStringAsFixed(2);


    //today
    late double tc1 = double.parse(today1);
    late double tc2 = double.parse(today2);
    late double tc3 = double.parse(today3);
    late double tc4 = double.parse(today4);

    late double todaytotal =double.parse(today1) + double.parse(today2) + double.parse(today3) + double.parse(today4);
    late double todayp1 = double.parse(today1) / todaytotal * 100;
    late double todayp2 = double.parse(today2) / todaytotal * 100;
    late double todayp3 = double.parse(today3) / todaytotal * 100;
    late double todayp4 = double.parse(today4) / todaytotal * 100;

    late String todayt = todaytotal.toStringAsFixed(2);

    late String t1 = todayp1.toStringAsFixed(2);
    late String t2 = todayp2.toStringAsFixed(2);
    late String t3 = todayp3.toStringAsFixed(2);
    late String t4 = todayp4.toStringAsFixed(2);

    //yesterday
    late double yc1 = double.parse(yesterday1);
    late double yc2 = double.parse(yesterday2);
    late double yc3 = double.parse(yesterday3);
    late double yc4 = double.parse(yesterday4);

    late double yesterdaytotal =double.parse(yesterday1) + double.parse(yesterday2) + double.parse(yesterday3) + double.parse(yesterday4);
    late double yesterdayp1 = double.parse(yesterday1) / yesterdaytotal * 100;
    late double yesterdayp2 = double.parse(yesterday2) / yesterdaytotal * 100;
    late double yesterdayp3 = double.parse(yesterday3) / yesterdaytotal * 100;
    late double yesterdayp4 = double.parse(yesterday4) / yesterdaytotal * 100;

    late String yesterdayt = yesterdaytotal.toStringAsFixed(2);

    late String y1 = yesterdayp1.toStringAsFixed(2);
    late String y2 = yesterdayp2.toStringAsFixed(2);
    late String y3 = yesterdayp3.toStringAsFixed(2);
    late String y4 = yesterdayp4.toStringAsFixed(2);


    // Month wise
    late double month1 = double.parse(kwMonth1);
    late double month2 = double.parse(kwMonth2);
    late double month3 = double.parse(kwMonth3);
    late double month4 = double.parse(kwMonth4);

    late double mtotal =double.parse(kwMonth1) + double.parse(kwMonth2) + double.parse(kwMonth3) + double.parse(kwMonth4);
    late double mp1 = double.parse(kwMonth1) / mtotal * 100;
    late double mp2 = double.parse(kwMonth2) / mtotal * 100;
    late double mp3 = double.parse(kwMonth3) / mtotal * 100;
    late double mp4 = double.parse(kwMonth4) / mtotal * 100;

    late String mt = mtotal.toStringAsFixed(2);

    late String m1 = mp1.toStringAsFixed(2);
    late String m2 = mp2.toStringAsFixed(2);
    late String m3 = mp3.toStringAsFixed(2);
    late String m4 = mp4.toStringAsFixed(2);

   // late double mtotal =double.parse(mainClassDartObject2.kwhInfo.kwh) * 4;
   // late double mp = double.parse(mainClassDartObject2.kwhInfo.kwh) / mtotal * 100;
   // late double wtotal =double.parse(mainClassDartObject3.kwhInfo.kwh) * 4;
   // late double wp = double.parse(mainClassDartObject3.kwhInfo.kwh) / wtotal * 100;
  // late double ptotal =double.parse((mainClassDartObject.kwhInfo.past + mainClassDartObject.kwhInfo.past + mainClassDartObject.kwhInfo.past + mainClassDartObject.kwhInfo.past ).toStringAsFixed(2));
  // late double cp =double.parse((mainClassDartObject.kwhInfo.current / ctotal * 100).toStringAsFixed(2));
  // late double pp =double.parse((mainClassDartObject.kwhInfo.past / ptotal * 100).toStringAsFixed(2));


  // late String stringResponse;
  late final Map mapResponse;
  late final Map dataResponse;
  late MainClass mainClassDartObject;
  late MainClass mainClassDartObject2;
  late MainClass mainClassDartObject3;
  late final String kwWeek1,kwWeek2,kwWeek3,kwWeek4;
  late final String kwDay1,kwDay2,kwDay3,kwDay4;
  late final String kwMonth1,kwMonth2,kwMonth3,kwMonth4;
  late double mx, mx1, mx2;
  var dd;
  late double mn, mn1, mn2;

    late final String today1, today2, today3, today4;
    late final String yesterday1, yesterday2, yesterday3, yesterday4;
    late final String time1, time2, time3, time4;

  DeepCollectionEquality dcEquality = DeepCollectionEquality();

  //day wise
  late bool eq1 = dcEquality.equals(kwDay1, kwDay1);
  late bool eq2 = dcEquality.equals(kwDay2, kwDay2);
  late bool eq3 = dcEquality.equals(kwDay3, kwDay3);
  late bool eq4 = dcEquality.equals(kwDay4, kwDay4);

  late bool eqt = dcEquality.equals(dtotal, dtotal);


  //week wise
    late bool eqw1 = dcEquality.equals(kwWeek1, kwWeek2);
    late bool eqw2 = dcEquality.equals(kwWeek2, kwWeek1);

    late bool eqwt = dcEquality.equals(ctotal, ctotal);

  Future apicall() async{
    final storage = new FlutterSecureStorage();

// Read value
    String? value = await storage.read(key:"access_token");

   http.Response response;
   http.Response response2;
   http.Response response3;
   http.Response response4;
   response = await http.get(Uri.parse("https://nskoffice.nutshellinfosoft.com/o2s/api/getDayData"),
       headers: {
      HttpHeaders.authorizationHeader: 'Bearer $value'
       });

    response2 = await http.get(Uri.parse("https://nskoffice.nutshellinfosoft.com/o2s/api/getWeekData"),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $value'
        });

    response3 = await http.get(Uri.parse("https://nskoffice.nutshellinfosoft.com/o2s/api/getMonthData"),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $value'
        });

    response4 = await http.get(Uri.parse("https://nskoffice.nutshellinfosoft.com/o2s/api/getSlotDataUser"),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $value'
        });

   if(response.statusCode == 200){
     setState(() {
       print(response.body);
       try {
         // var tagObjsJson = jsonDecode(response.body)['kWhInfo'] as List;
         // List<kWhInfo> tagObjs = tagObjsJson.map((tagJson) => kWhInfo.fromJson(tagJson)).toList();
         // print("ac $tagObjs");

         final decodedJson = jsonDecode(response.body); // dynamic
         kwDay1 = decodedJson['kWhInfo'][0]['kwday'] as String;
         kwDay2 = decodedJson['kWhInfo'][1]['kwday'] as String;
         kwDay3 = decodedJson['kWhInfo'][2]['kwday'] as String;
         kwDay4 = decodedJson['kWhInfo'][3]['kwday'] as String;


         // bool equality = dcEquality.equals(dp1, dp1);
         //
         // print("equality: $equality");

        if(day1>day2)
          {
             print("Highest");
          }else{
          print("lowest");
        }

         //mainClassDartObject = MainClass.fromJson(json.decode(response.body));
         // // double cp = 100 * mainClassDartObject.kwhInfo.current / 6.42;
         // // print("hello $cp");
         // print("ali $mainClassDartObject.kwhInfo.toString()");
         // final decodedJson = jsonDecode(mainClassDartObject.kwhInfo.toString());
         // final score = decodedJson['k'][0]['score'] as double;
       } catch (e) {
         print(e);
         print(",");
       }
     });
   }else{
     print("api call error");
   }

    if(response2.statusCode == 200){
      setState(() {
        print(response2.body);
        try {

          final decodedJson = jsonDecode(response2.body); // dynamic
          kwWeek1 = decodedJson['kWhInfo'][0]['kwweek'] as String;
          kwWeek2 = decodedJson['kWhInfo'][1]['kwweek'] as String;
          kwWeek3 = decodedJson['kWhInfo'][2]['kwweek'] as String;
          kwWeek4 = decodedJson['kWhInfo'][3]['kwweek'] as String;
          // var tagObjsJson = jsonDecode(response2.body)['kWhInfo'] as List;
          // List<kWhInfo1> tagObjs = tagObjsJson.map((tagJson) => kWhInfo1.fromJson(tagJson)).toList();
          // print("ac $tagObjs");
          // mainClassDartObject2 = MainClass.fromJson(json.decode(response2.body));
          // double cp = 100 * mainClassDartObject.kwhInfo.current / 6.42;
          // print("hello $cp");
          // print(mainClassDartObject2.kwhInfo.kwh.toString());
        } catch (e) {
          print(e);
          print(",");
        }
      });
    }else{
      print("api call error");
    }

    if(response3.statusCode == 200){
      setState(() {
        print(response3.body);
        try {

          final decodedJson = jsonDecode(response3.body); // dynamic
          kwMonth1 = decodedJson['kWhInfo'][0]['kwmonth'] as String;
          kwMonth2 = decodedJson['kWhInfo'][1]['kwmonth'] as String;
          kwMonth3 = decodedJson['kWhInfo'][2]['kwmonth'] as String;
          kwMonth4 = decodedJson['kWhInfo'][3]['kwmonth'] as String;
          // var tagObjsJson = jsonDecode(response3.body)['kWhInfo'] as List;
          // List<kWhInfo2> tagObjs = tagObjsJson.map((tagJson) => kWhInfo2.fromJson(tagJson)).toList();
          // print("ac $tagObjs");
          //mainClassDartObject3 = MainClass.fromJson(json.decode(response3.body));
          // double cp = 100 * mainClassDartObject.kwhInfo.current / 6.42;

          mx = max(month1, month2);
          mx1 = max(mx, month3);
          mx2 = max(mx1, month4);

          mn = min(month1, month2);
          mn1 = min(mn, month3);
          mn2 = min(mn1, month4);


          print("asasas $mx2");
          print("asasas $mn2");
          // print("asasas $mn");
          // print("hello $cp");
          // print(mainClassDartObject3.kwhInfo.kwh.toString());
        } catch (e) {
          print(e);
          print(",");
        }
      });
    }else{
      print("api call error");
    }

    if(response4.statusCode == 200){
      setState(() {
        print(response4.body);
        try {

          final decodedJson = jsonDecode(response4.body); // dynamic
          today1 = decodedJson['slots'][0]['today'] as String;
          today2 = decodedJson['slots'][1]['today'] as String;
          today3 = decodedJson['slots'][2]['today'] as String;
          today4 = decodedJson['slots'][3]['today'] as String;
          yesterday1 = decodedJson['slots'][0]['yesterday'] as String;
          yesterday2 = decodedJson['slots'][1]['yesterday'] as String;
          yesterday3 = decodedJson['slots'][2]['yesterday'] as String;
          yesterday4 = decodedJson['slots'][3]['yesterday'] as String;
          time1 = decodedJson['slots'][0]['time'] as String;
          time2 = decodedJson['slots'][1]['time'] as String;
          time3 = decodedJson['slots'][2]['time'] as String;
          time4 = decodedJson['slots'][3]['time'] as String;

          print(time1);
          print(today1);

          // var tagObjsJson = jsonDecode(response2.body)['kWhInfo'] as List;
          // List<kWhInfo1> tagObjs = tagObjsJson.map((tagJson) => kWhInfo1.fromJson(tagJson)).toList();
          // print("ac $tagObjs");
          // mainClassDartObject2 = MainClass.fromJson(json.decode(response2.body));
          // double cp = 100 * mainClassDartObject.kwhInfo.current / 6.42;
          // print("hello $cp");
          // print(mainClassDartObject2.kwhInfo.kwh.toString());
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
    final screenHeight = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
              height: screenHeight * 1.01,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/background.JPG",),
                    fit: BoxFit.cover,
                  )
              ),
              child: Column(
                children: [
                  Container(
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Text('Usage Trend', style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF33691E),
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(0.0),
                        child: TabBar(indicator: BoxDecoration(color: Color(0xFF689F38), borderRadius: BorderRadius.circular(6)),
                          tabs: [
                            Tab(
                              child: Text('Day Wise' , style: TextStyle(fontSize: 11),),
                            ),
                            Tab(
                              child: Text('Week Wise' , style: TextStyle(fontSize: 11),),
                            ),
                            Tab(
                              child: Text('Month Wise' , style: TextStyle(fontSize: 11),),
                            ),
                          ],),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 633,
                    child: TabBarView(
                      children: [
                        Container(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 101, right: 15, top: 30),
                              child: Table(
                                border: TableBorder.all(width:0.5, color:Colors.black45), //table border
                                children: [

                                  TableRow(
                                      decoration: BoxDecoration(
                                          color: Color(0xFFEEEEEE)
                                      ),
                                      children: [
                                        TableCell(child: Container(padding: EdgeInsets.only(top: 2, bottom: 2),child: Center(child: Text("Yesterday's usage",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold))))),
                                        TableCell(child: Container(padding: EdgeInsets.only(top: 2, bottom: 2),child: Center(child: Text("Two day's back usage",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold))))),
                                      ]
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 15, right: 15, top: 0),
                              child:Table(
                                columnWidths: {
                                  0: FlexColumnWidth(2),
                                  1: FlexColumnWidth(1.9),
                                  2: FlexColumnWidth(1.3),
                                  3: FlexColumnWidth(1.9),
                                  4: FlexColumnWidth(1.3),
                                },
                                border: TableBorder.all(width:0.5, color:Colors.black45), //table border
                                children: [

                                  TableRow(
                                      decoration: BoxDecoration(
                                          color: Color(0xFFEEEEEE)
                                      ),
                                      children: [
                                        TableCell(child: Container(padding: EdgeInsets.only(top: 2, bottom: 2),child: Center(child: Text("Time Slot",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),)))),
                                        TableCell(child: Container(padding: EdgeInsets.only(top: 2, bottom: 2),child: Center(child: Text("In Units",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold))))),
                                        TableCell(child: Container(padding: EdgeInsets.only(top: 2, bottom: 2),child: Center(child: Text("In %",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold))))),
                                        TableCell(child: Container(padding: EdgeInsets.only(top: 2, bottom: 2),child: Center(child: Text("In Units",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold))))),
                                        TableCell(child: Container(padding: EdgeInsets.only(top: 2, bottom: 2),child: Center(child: Text("In %",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold))))),
                                      ]
                                  ),

                                ],),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 15, right: 15, top: 0),
                              child:Table(
                                columnWidths: {
                                  0: FlexColumnWidth(2),
                                  1: FlexColumnWidth(1.9),
                                  2: FlexColumnWidth(1.3),
                                  3: FlexColumnWidth(1.9),
                                  4: FlexColumnWidth(1.3),
                                },
                                border: TableBorder.all(width:0.5, color:Colors.black45), //table border
                                children: [

                                  TableRow(
                                    decoration: BoxDecoration(
                                      color: Colors.white
                                    ),
                                      children: [
                                        TableCell(child: Container(padding: EdgeInsets.only(top: 2, bottom: 2),child: Center(child: Text("$time1",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.5, fontWeight: FontWeight.bold),)))),
                                        TableCell(child: Container(padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),child: Center(child: Text("$today1",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.3, fontWeight: FontWeight.bold))))),
                                        TableCell(child: Container(padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),child: Center(child: Text("$t1%",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.3, fontWeight: FontWeight.bold))))),
                                        TableCell(child: Container(padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),child: Center(child: Text("$yesterday1".toString(),textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.3, fontWeight: FontWeight.bold))))),
                                        TableCell(child: Container(padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),child: Center(child: Text("$y1%",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.3, fontWeight: FontWeight.bold))))),
                                      ]
                                  ),
                                ],),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 15, right: 15, top: 0),
                              child:Table(
                                columnWidths: {
                                  0: FlexColumnWidth(2),
                                  1: FlexColumnWidth(1.9),
                                  2: FlexColumnWidth(1.3),
                                  3: FlexColumnWidth(1.9),
                                  4: FlexColumnWidth(1.3),
                                },
                                border: TableBorder.all(width:0.5, color:Colors.black45), //table border
                                children: [

                                  TableRow(
                                      decoration: BoxDecoration(
                                          color: Color(0xFFEEEEEE)
                                      ),
                                      children: [
                                        TableCell(child: Container(padding: EdgeInsets.only(top: 2, bottom: 2),child: Center(child: Text("$time2",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.5, fontWeight: FontWeight.bold),)))),
                                        TableCell(child: Container(padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),child: Center(child: Text("$today2".toString(),textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.3, fontWeight: FontWeight.bold))))),
                                        TableCell(child: Container(padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),child: Center(child: Text("$t2%",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.3, fontWeight: FontWeight.bold))))),
                                        TableCell(child: Container(padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),child: Center(child: Text("$yesterday2".toString(),textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.3, fontWeight: FontWeight.bold))))),
                                        TableCell(child: Container(padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),child: Center(child: Text("$y2%",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.3, fontWeight: FontWeight.bold))))),
                                      ]
                                  ),

                                ],),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 15, right: 15, top: 0),
                              child:Table(
                                columnWidths: {
                                  0: FlexColumnWidth(2),
                                  1: FlexColumnWidth(1.9),
                                  2: FlexColumnWidth(1.3),
                                  3: FlexColumnWidth(1.9),
                                  4: FlexColumnWidth(1.3),
                                },
                                border: TableBorder.all(width:0.5, color:Colors.black45), //table border
                                children: [

                                  TableRow(
                                      decoration: BoxDecoration(
                                          color: Colors.white
                                      ),
                                      children: [
                                        TableCell(child: Container(padding: EdgeInsets.only(top: 2, bottom: 2),child: Center(child: Text("$time3",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.3, fontWeight: FontWeight.bold),)))),
                                        TableCell(child: Container(padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),child: Center(child: Text("$today3".toString(),textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.3, fontWeight: FontWeight.bold))))),
                                        TableCell(child: Container(padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),child: Center(child: Text("$t3%",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.3, fontWeight: FontWeight.bold))))),
                                        TableCell(child: Container(padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),child: Center(child: Text("$yesterday3".toString(),textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.3, fontWeight: FontWeight.bold))))),
                                        TableCell(child: Container(padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),child: Center(child: Text("$y3%",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.3, fontWeight: FontWeight.bold))))),
                                      ]
                                  ),

                                ],),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 15, right: 15, top: 0),
                              child:Table(
                                columnWidths: {
                                  0: FlexColumnWidth(2),
                                  1: FlexColumnWidth(1.9),
                                  2: FlexColumnWidth(1.3),
                                  3: FlexColumnWidth(1.9),
                                  4: FlexColumnWidth(1.3),
                                },
                                border: TableBorder.all(width:0.5, color:Colors.black45), //table border
                                children: [

                                  TableRow(
                                      decoration: BoxDecoration(
                                          color: Color(0xFFEEEEEE)
                                      ),
                                      children: [
                                        TableCell(child: Container(padding: EdgeInsets.only(top: 2, bottom: 2),child: Center(child: Text("$time4",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.3, fontWeight: FontWeight.bold),)))),
                                        TableCell(child: Container(padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),child: Center(child: Text("$today4".toString(),textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.3, fontWeight: FontWeight.bold))))),
                                        TableCell(child: Container(padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),child: Center(child: Text("$t4%",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.3, fontWeight: FontWeight.bold))))),
                                        TableCell(child: Container(padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),child: Center(child: Text("$yesterday4".toString(),textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.3, fontWeight: FontWeight.bold))))),
                                        TableCell(child: Container(padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),child: Center(child: Text("$y4%",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.3, fontWeight: FontWeight.bold))))),
                                      ]
                                  ),

                                ],),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 15, right: 15, top: 0),
                              child:Table(
                                columnWidths: {
                                  0: FlexColumnWidth(2),
                                  1: FlexColumnWidth(3.2),
                                  2: FlexColumnWidth(3.2),
                                },
                                border: TableBorder.all(width:0.5, color:Colors.black45), //table border
                                children: [

                                  TableRow(
                                      decoration: BoxDecoration(
                                          color: Colors.white
                                      ),
                                      children: [
                                        TableCell(child: Container(padding: EdgeInsets.only(top: 2, bottom: 2),child: Center(child: Text("Total Usage",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.5, fontWeight: FontWeight.bold),)))),
                                        TableCell(child: Container(padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),child: Center(child: Text("$todayt",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.3, fontWeight: FontWeight.bold))))),
                                        // TableCell(child: Container(padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),child: Center(child: Text("",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.3, fontWeight: FontWeight.bold))))),
                                        TableCell(child: Container(padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),child: Center(child: Text("$yesterdayt",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.3, fontWeight: FontWeight.bold))))),
                                        // TableCell(child: Container(padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),child: Center(child: Text("",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.3, fontWeight: FontWeight.bold))))),
                                      ]
                                  ),

                                ],),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only( top: 9, left: 26),
                                    child: Text("Usage Comments", style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only( top: 8, left: 30),
                                    child: Text(() {
                                      if(yc1>=tc1){
                                        return "Slot 1 : Yesterday usage is Higher";}

                                      return "Slot 1 : Yesterday usage is Lower";
                                    }(),style:  TextStyle(color: Colors.black, fontSize: 8.4),),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only( top: 4, left: 30),
                                    child: Text(() {
                                      if(yc2>=tc2){
                                        return "Slot 2 : Yesterday usage is Higher";}

                                      return "Slot 2 : Yesterday usage is Lower";
                                    }(),style:  TextStyle(color: Colors.black, fontSize: 8.4),),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only( top: 4, left: 30),
                                    child: Text(() {
                                      if(yc3>=tc3){
                                        return "Slot 3 : Yesterday usage is Higher";}

                                      return "Slot 3 : Yesterday usage is Lower";
                                    }(),style:  TextStyle(color: Colors.black, fontSize: 8.4),),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only( top: 4, left: 30),
                                    child: Text(() {
                                      if(yc4>=tc4){
                                        return "Slot 4 : Yesterday usage is Higher";}

                                      return "Slot 4 : Yesterday usage is Lower";
                                    }(),style:  TextStyle(color: Colors.black, fontSize: 8.4),),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only( top: 12, left: 30),
                                    child: Text(() {
                                      if(yesterdaytotal>=todaytotal){
                                        return "Total Usage : Yesterday usage is Higher";}

                                      return "Total Usage : Yesterday usage is Lower";
                                    }(),style:  TextStyle(color: Colors.black, fontSize: 8.4),),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.only(top: 30),
                              child: Center(
                                child: Stack(
                                  children: <Widget>[
                                    SizedBox(height: 55.0),
                                    Container(
                                      height: 45.0,
                                      width: 180.0,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(primary: Color(0xFF33691E),shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(6.0)
                                        ),),

                                        onPressed: () {
                                        },
                                        child: Text("Use Saving Tips", style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 0),
                              child: Center(
                                child: Stack(
                                  children: <Widget>[
                                    SizedBox(height: 55.0),
                                    Container(
                                      height: 54.0,
                                      width: 140.0,
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: ClipOval(
                                          child: Container(
                                            color: Colors.red,
                                            height: 70.0,
                                            width: 90.0,
                                            child: Center(
                                                child: Text('Pro',
                                                  style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
                                                  textAlign: TextAlign.center,)),
                                          ),
                                        ),
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
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 50, right: 50, top: 30),
                                child: Table(
                                  border: TableBorder.all(width:0.5, color:Colors.black45), //table border
                                  children: [

                                    TableRow(
                                        decoration: BoxDecoration(
                                            color: Color(0xFFEEEEEE)
                                        ),
                                        children: [
                                          TableCell(child: Center(child: Text("Week Wise Usage", style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold)))),
                                        ]
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 50, right: 50, top: 0),
                                child:Table(
                                  border: TableBorder.all(width:0.5, color:Colors.black45), //table border
                                  children: [

                                    TableRow(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                        ),
                                        children: [
                                          TableCell(child: Center(child: Text("",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),))),
                                          TableCell(child: Center(child: Text("In Units",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold)))),
                                          TableCell(child: Center(child: Text("In %",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold)))),
                                        ]
                                    ),

                                  ],),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 50, right: 50, top: 0),
                                child:Table(
                                  border: TableBorder.all(width:0.5, color:Colors.black45), //table border
                                  children: [

                                    TableRow(
                                        decoration: BoxDecoration(
                                            color: Color(0xFFEEEEEE)
                                        ),
                                        children: [
                                          TableCell(child: Container(padding: EdgeInsets.only(top: 2, bottom: 2),child: Center(child: Text("This Week",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.5, fontWeight: FontWeight.bold),)))),
                                          TableCell(child: Container(padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),child: Center(child: Text("$kwWeek1",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.3, fontWeight: FontWeight.bold))))),
                                          TableCell(child: Container(padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),child: Center(child: Text("$c1%",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.3, fontWeight: FontWeight.bold))))),
                                        ]
                                    ),

                                  ],),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 50, right: 50, top: 0),
                                child:Table(
                                  border: TableBorder.all(width:0.5, color:Colors.black45), //table border
                                  children: [

                                    TableRow(
                                        decoration: BoxDecoration(
                                            color: Colors.white
                                        ),
                                        children: [
                                          TableCell(child: Container(padding: EdgeInsets.only(top: 2, bottom: 2),child: Center(child: Text("Last Week",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.5, fontWeight: FontWeight.bold),)))),
                                          TableCell(child: Container(padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),child: Center(child: Text("$kwWeek2",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.3, fontWeight: FontWeight.bold))))),
                                          TableCell(child: Container(padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),child: Center(child: Text("$c2%",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.3, fontWeight: FontWeight.bold))))),
                                        ]
                                    ),

                                  ],),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 50, right: 50, top: 0),
                                child:Table(
                                  border: TableBorder.all(width:0.5, color:Colors.black45), //table border
                                  children: [

                                    TableRow(
                                        decoration: BoxDecoration(
                                            color: Color(0xFFEEEEEE)
                                        ),
                                        children: [
                                          TableCell(child: Container(padding: EdgeInsets.only(top: 2, bottom: 2),child: Center(child: Text("2 Week Before",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.5, fontWeight: FontWeight.bold),)))),
                                          TableCell(child: Container(padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),child: Center(child: Text("$kwWeek3",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.3, fontWeight: FontWeight.bold))))),
                                          TableCell(child: Container(padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),child: Center(child: Text("$c3%",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.3, fontWeight: FontWeight.bold))))),
                                        ]
                                    ),

                                  ],),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 50, right: 50, top: 0),
                                child:Table(
                                  border: TableBorder.all(width:0.5, color:Colors.black45), //table border
                                  children: [

                                    TableRow(
                                        decoration: BoxDecoration(
                                            color: Colors.white
                                        ),
                                        children: [
                                          TableCell(child: Container(padding: EdgeInsets.only(top: 2, bottom: 2),child: Center(child: Text("3 Week Before",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.5, fontWeight: FontWeight.bold),)))),
                                          TableCell(child: Container(padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),child: Center(child: Text("$kwWeek4",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.3, fontWeight: FontWeight.bold))))),
                                          TableCell(child: Container(padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),child: Center(child: Text("$c4%",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.3, fontWeight: FontWeight.bold))))),
                                        ]
                                    ),

                                  ],),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 50, right: 50, top: 0),
                                child:Table(
                                  border: TableBorder.all(width:0.5, color:Colors.black45), //table border
                                  children: [

                                    TableRow(
                                        decoration: BoxDecoration(
                                            color: Color(0xFFEEEEEE)
                                        ),
                                        children: [
                                          TableCell(child: Container(padding: EdgeInsets.only(top: 2, bottom: 2),child: Center(child: Text("Total Usage",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.5, fontWeight: FontWeight.bold),)))),
                                          TableCell(child: Container(padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),child: Center(child: Text("$ct",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.3, fontWeight: FontWeight.bold))))),
                                          TableCell(child: Container(padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),child: Center(child: Text("",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.3, fontWeight: FontWeight.bold))))),
                                        ]
                                    ),

                                  ],),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.only( top: 7, left: 26),
                                      child: Text("Usage Comments", style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.only( top: 8, left: 30),
                                      child: Text(() {
                                        if(week2 > week1){
                                          return "Last week usage is Higher";}

                                        return "Last week usage is Lower";
                                      }(),style:  TextStyle(color: Colors.black, fontSize: 8.4),),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.only( top: 4, left: 30),
                                      child: Text(() {
                                        if(week3 > week4){
                                          return "Week before usage is Higher";}

                                        return "Week before usage is Lower";
                                      }(),style:  TextStyle(color: Colors.black, fontSize: 8.4),),
                                    ),

                                  ],
                                ),
                              ),

                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: Center(
                                  child: Stack(
                                    children: <Widget>[
                                      SizedBox(height: 55.0),
                                      Container(
                                        height: 45.0,
                                        width: 180.0,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(primary: Color(0xFF33691E),shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(6.0)
                                          ),),

                                          onPressed: () {
                                          },
                                          child: Text("Use Saving Tips", style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0),
                                child: Center(
                                  child: Stack(
                                    children: <Widget>[
                                      SizedBox(height: 55.0),
                                      Container(
                                        height: 54.0,
                                        width: 140.0,
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: ClipOval(
                                            child: Container(
                                              color: Colors.red,
                                              height: 90.0,
                                              width: 90.0,
                                              child: Center(
                                                  child: Text('Pro',
                                                    style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
                                                    textAlign: TextAlign.center,)),
                                            ),
                                          ),
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
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 50, right: 50, top: 30),
                                child: Table(
                                  border: TableBorder.all(width:0.5, color:Colors.black45), //table border
                                  children: [

                                    TableRow(
                                        decoration: BoxDecoration(
                                            color: Color(0xFFEEEEEE)
                                        ),
                                        children: [
                                          TableCell(child: Center(child: Text("Month Wise Usage",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold)))),
                                        ]
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 50, right: 50, top: 0),
                                child:Table(
                                  border: TableBorder.all(width:0.5, color:Colors.black45), //table border
                                  children: [

                                    TableRow(
                                        decoration: BoxDecoration(
                                            color: Colors.white
                                        ),
                                        children: [
                                          TableCell(child: Center(child: Text("",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),))),
                                          TableCell(child: Center(child: Text("In Units",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold)))),
                                          TableCell(child: Center(child: Text("In %",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold)))),
                                        ]
                                    ),

                                  ],),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 50, right: 50, top: 0),
                                child:Table(
                                  border: TableBorder.all(width:0.5, color:Colors.black45), //table border
                                  children: [

                                    TableRow(
                                        decoration: BoxDecoration(
                                            color: Color(0xFFEEEEEE)
                                        ),
                                        children: [
                                          TableCell(child: Container(padding: EdgeInsets.only(top: 2, bottom: 2),child: Center(child: Text("October",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.5, fontWeight: FontWeight.bold),)))),
                                          TableCell(child: Container(padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),child: Center(child: Text("$kwMonth1",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.3, fontWeight: FontWeight.bold))))),
                                          TableCell(child: Container(padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),child: Center(child: Text("$m1%",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.3, fontWeight: FontWeight.bold))))),
                                        ]
                                    ),

                                  ],),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 50, right: 50, top: 0),
                                child:Table(
                                  border: TableBorder.all(width:0.5, color:Colors.black45), //table border
                                  children: [

                                    TableRow(
                                        decoration: BoxDecoration(
                                            color: Colors.white
                                        ),
                                        children: [
                                          TableCell(child: Container(padding: EdgeInsets.only(top: 2, bottom: 2),child: Center(child: Text("September",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.5, fontWeight: FontWeight.bold),)))),
                                          TableCell(child: Container(padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),child: Center(child: Text("$kwMonth2",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.3, fontWeight: FontWeight.bold))))),
                                          TableCell(child: Container(padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),child: Center(child: Text("$m2%",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.3, fontWeight: FontWeight.bold))))),
                                        ]
                                    ),

                                  ],),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 50, right: 50, top: 0),
                                child:Table(
                                  border: TableBorder.all(width:0.5, color:Colors.black45), //table border
                                  children: [

                                    TableRow(
                                        decoration: BoxDecoration(
                                            color: Color(0xFFEEEEEE)
                                        ),
                                        children: [
                                          TableCell(child: Container(padding: EdgeInsets.only(top: 2, bottom: 2),child: Center(child: Text("August",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.5, fontWeight: FontWeight.bold),)))),
                                          TableCell(child: Container(padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),child: Center(child: Text("$kwMonth3",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.3, fontWeight: FontWeight.bold))))),
                                          TableCell(child: Container(padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),child: Center(child: Text("$m3%",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.3, fontWeight: FontWeight.bold))))),
                                        ]
                                    ),

                                  ],),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 50, right: 50, top: 0),
                                child:Table(
                                  border: TableBorder.all(width:0.5, color:Colors.black45), //table border
                                  children: [

                                    TableRow(
                                        decoration: BoxDecoration(
                                            color: Colors.white
                                        ),
                                        children: [
                                          TableCell(child: Container(padding: EdgeInsets.only(top: 2, bottom: 2),child: Center(child: Text("July",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.5, fontWeight: FontWeight.bold),)))),
                                          TableCell(child: Container(padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),child: Center(child: Text("$kwMonth4",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.3, fontWeight: FontWeight.bold))))),
                                          TableCell(child: Container(padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),child: Center(child: Text("$m4%",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.3, fontWeight: FontWeight.bold))))),
                                        ]
                                    ),

                                  ],),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 50, right: 50, top: 0),
                                child:Table(
                                  border: TableBorder.all(width:0.5, color:Colors.black45), //table border
                                  children: [

                                    TableRow(
                                        decoration: BoxDecoration(
                                            color: Color(0xFFEEEEEE)
                                        ),
                                        children: [
                                          TableCell(child: Container(padding: EdgeInsets.only(top: 2, bottom: 2),child: Center(child: Text("Total Usage",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.5, fontWeight: FontWeight.bold),)))),
                                          TableCell(child: Container(padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),child: Center(child: Text("$mt",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.3, fontWeight: FontWeight.bold))))),
                                          TableCell(child: Container(padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),child: Center(child: Text("",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9.3, fontWeight: FontWeight.bold))))),
                                        ]
                                    ),

                                  ],),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.only( top: 7, left: 26),
                                      child: Text("Usage Comments", style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.only( top: 4, left: 30),
                                      child: Text("Highest usage was is ' $mx2 '", style: TextStyle(color: Colors.black, fontSize: 8.4),),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.only( top: 4, left: 30),
                                      child: Text("Lowest usage was is ' $mn2 '", textAlign: TextAlign.left, style: TextStyle(color: Colors.black, fontSize: 8.4),),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.only( top: 4, left: 30),
                                      child: Text("Check Trend to achieve Saving", style: TextStyle(color: Colors.black, fontSize: 11),),
                                    ),
                                  ],
                                ),
                              ),

                              Container(
                                margin: EdgeInsets.only(top: 30),
                                child: Center(
                                  child: Stack(
                                    children: <Widget>[
                                      SizedBox(height: 55.0),
                                      Container(
                                        height: 45.0,
                                        width: 180.0,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(primary: Color(0xFF33691E),shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(6.0)
                                          ),),

                                          onPressed: () {
                                          },
                                          child: Text("Use Saving Tips", style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0),
                                child: Center(
                                  child: Stack(
                                    children: <Widget>[
                                      SizedBox(height: 55.0),
                                      Container(
                                        height: 54.0,
                                        width: 140.0,
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: ClipOval(
                                            child: Container(
                                              color: Colors.red,
                                              height: 90.0,
                                              width: 90.0,
                                              child: Center(
                                                  child: Text('Pro',
                                                    style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
                                                    textAlign: TextAlign.center,)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}