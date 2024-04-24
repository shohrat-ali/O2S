import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:o2s/adminScreen.dart';
import 'package:o2s/setting.dart';
import 'package:o2s/usage.dart';

import 'homeScreen.dart';
import 'mainDrawer.dart';
import 'notification.dart';

class savingopportunities extends StatefulWidget {
  const savingopportunities({Key? key}) : super(key: key);

  @override
  _savingopportunitiesState createState() => _savingopportunitiesState();
}

class _savingopportunitiesState extends State<savingopportunities> {
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
                     child: Text('Saving Opportunities', style: TextStyle(
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
                        padding: EdgeInsets.only(left: 2),
                        child: Row(
                          children: [
                            Container(
                              width: 175,
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF42A5F5), width: 1),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFFE3F2FD),
                                    Color(0xFFE3F2FD),
                                  ],
                                ),
                              ),
                              child: Center(
                                child: RichText(text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Air Conditioners',
                                    style: TextStyle(
                                          fontSize: 18.2,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = (){
                                          FocusScope.of(context).unfocus();
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                contentPadding: EdgeInsets.only(left: 25, right: 25),
                                                title: Center(child: Text("AC SAVING PRACTICAL CASE", style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),)),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                                                content: Container(
                                                  height: 200,
                                                  width: 450,
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                                      children: <Widget>[
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        Text(
                                                            'Mr. Bose, a technocrat has witnessed significant savings in electricity bills by setting the AC temperature higher. Bose, has a 3BHK apartment in Gurgaon, sets the AC temperature at 27 degrees during the day and moves to 28-29 degrees with a ceiling fan at low speed, if required, at night. His bill was around ₹ 3,000 whereas comparable apartments gets electricity bills of ₹ 6,000-10,000.',
                                                            style: TextStyle(color: Colors.black, fontSize: 9,)
                                                        ),
                                                        // Image.asset('assets/images/AC.png',
                                                        //   width: 300, height: 450, fit: BoxFit.contain,),
                                                        Text(
                                                            'Though the apartment has two ACs, only about 1-2 are used at a time and all are set at 27-29 degrees, which means that the compressors are mostly not on or are on only intermittently," said Roy.',
                                                            style: TextStyle(color: Colors.black, fontSize: 9,)
                                                        ),
                                                        Text('  '),
                                                        Text(
                                                            '“Each degree increase in the AC temperature can save about 3-5% electricity. ',
                                                            style: TextStyle(color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold)
                                                        ),
                                                        Text(''),
                                                        Text(' Increasing your AC temperature from 18 to 27 degrees can help you save around ₹ 6,240 in a year.',
                                                            style: TextStyle(color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold)
                                                        ),
                                                        Text(''),
                                                        Text(
                                                            'Besides temperature following are additional tips for further energy saving-',
                                                            style: TextStyle(color: Colors.black, fontSize: 9,)
                                                        ),
                                                        Text('  '),
                                                        Text('1. Fan + AC = Reduced Energy Consumption by another 1-2%.',
                                                            style: TextStyle(color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold)
                                                        ),
                                                        Text('  '),
                                                        Text('2. Regular Servicing and Cleaning Saves Electricity – Another saving of 5-10%.',
                                                            style: TextStyle(color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold)
                                                        ),
                                                        Text('  '),
                                                        Text('3. Rearrange your furniture – Ensure no air flow obstruction & avoid over burns.',
                                                            style: TextStyle(color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold)
                                                        ),
                                                        Text('  '),
                                                        Text('4. Turn off AC using Power Switch and not via Remote – If AC is off via remote its controller consumes power almost equivalent to Rs. 10 for twelve Hrs.',
                                                            style: TextStyle(color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold)
                                                        ),
                                                        Text('')
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        }
                                    )
                                  ]
                                )),
                                // child: Text('Air Conditioners', style: TextStyle(
                                //     fontSize: 13.2,
                                //     fontWeight: FontWeight.bold
                                // ),),
                              ),
                            ),
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF42A5F5), width: 1),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFFE3F2FD),
                                    Color(0xFFE3F2FD),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 175,
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF42A5F5), width: 1),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFFE3F2FD),
                                    Color(0xFFE3F2FD),
                                  ],
                                ),
                              ),
                              child: Center(
                                child: RichText(text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: 'Microwave Ovens',
                                          style: TextStyle(
                                              fontSize: 18.2,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = (){
                                              FocusScope.of(context).unfocus();
                                              showDialog(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return AlertDialog(
                                                    contentPadding: EdgeInsets.only(left: 25, right: 25),
                                                    title: Center(child: Text("Microwave Ovens", style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),)),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                                                    content: Container(
                                                      height: 200,
                                                      width: 450,
                                                      child: SingleChildScrollView(
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                                          children: <Widget>[
                                                            SizedBox(
                                                              height: 20,
                                                            ),
                                                            Text(
                                                              'Depending on capacity of Oven its power rating varies……. Exact rating you can cross check with your make and its lable. However here it is standard rating.',
                                                                style: TextStyle(color: Colors.black, fontSize: 9,)
                                                            ),
                                                            Text(''),
                                                            Table(
                                                              border: TableBorder.all(width:0.5, color:Colors.black45),
                                                              children: [
                                                                TableRow(
                                                                    decoration: BoxDecoration(
                                                                        color: Color(0xFFEEEEEE)
                                                                    ),
                                                                    children: [
                                                                      TableCell(child: Center(child: Text("Microwave Oven Capacity",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold)))),
                                                                      TableCell(child: Center(child: Text("Wattage",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold)))),
                                                                    ]
                                                                ),
                                                              ],
                                                            ),
                                                            Table(
                                                              border: TableBorder.all(width:0.5, color:Colors.black45),
                                                              children: [
                                                                TableRow(
                                                                    decoration: BoxDecoration(
                                                                        color: Colors.white
                                                                    ),
                                                                    children: [
                                                                      TableCell(child: Center(child: Text("20 liters",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold)))),
                                                                      TableCell(child: Center(child: Text("800 watts",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold)))),
                                                                    ]
                                                                ),
                                                              ],
                                                            ),
                                                            Table(
                                                              border: TableBorder.all(width:0.5, color:Colors.black45),
                                                              children: [
                                                                TableRow(
                                                                    decoration: BoxDecoration(
                                                                        color: Color(0xFFEEEEEE)
                                                                    ),
                                                                    children: [
                                                                      TableCell(child: Center(child: Text("23 liters",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold)))),
                                                                      TableCell(child: Center(child: Text("1150 watts",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold)))),
                                                                    ]
                                                                ),
                                                              ],
                                                            ),
                                                            Table(
                                                              border: TableBorder.all(width:0.5, color:Colors.black45),
                                                              children: [
                                                                TableRow(
                                                                    decoration: BoxDecoration(
                                                                        color: Colors.white
                                                                    ),
                                                                    children: [
                                                                      TableCell(child: Center(child: Text("28 liters",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold)))),
                                                                      TableCell(child: Center(child: Text("2900 watts",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold)))),
                                                                    ]
                                                                ),
                                                              ],
                                                            ),
                                                            Text(''),
                                                            Text('The rated power wattage of a microwave oven ranges from 800 watts to 3000 watts. Larger the size of the microwave oven larger if the rated power. A 1000 watts microwave oven running for 1 hour will consume 1 kWh (unit) of electricity. Hence, for the entire month power consumed by this microwave oven will be 30 kWh meaning considering average rate of Rs. 5 it will use electricity worth of Rs. 150/- month.',
                                                            style: TextStyle(color: Colors.black, fontSize: 9),
                                                            ),
                                                            Text(''),
                                                            Text('The power consumption of a microwave oven depends on the temperature settings, wattage and the operational hours.',
                                                              style: TextStyle(color: Colors.black, fontSize: 9),
                                                            ),
                                                            Text(''),
                                                            Text('One think to keep in mind is the larger the wattage of the microwave oven, less time it takes to cook the food inside it and less will be the power consumption.',
                                                              style: TextStyle(color: Colors.black, fontSize: 9),
                                                            ),
                                                            Text(''),
                                                            Text('Also the temperature setting governs the power consumption, if the oven is running at high temperature then the wattage will be high and it will take less time to cook vice versa if the oven is running at low temperature the wattage will be low but it will take more time to cook the same food.',
                                                              style: TextStyle(color: Colors.black, fontSize: 9),
                                                            ),
                                                            Text(''),
                                                            Text('Hence it is difficult to reach an exact figure of power consumption of a microwave oven but the above calculation gives you the maximum amount of power your microwave oven can consume.',
                                                              style: TextStyle(color: Colors.black, fontSize: 9),
                                                            ),
                                                            Text('')
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            }
                                      )
                                    ]
                                )),
                                // child: Text('Microwave Ovens', style: TextStyle(
                                //     fontSize: 13.2,
                                //     fontWeight: FontWeight.bold
                                // ),),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 2),
                        child: Row(
                          children: [
                            Container(
                              width: 175,
                              height: 120,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF42A5F5), width: 1),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFFBBDEFD),
                                    Color(0xFFBBDEFD),
                                  ],
                                ),
                              ),
                              child: IconButton(
                                icon: Image.asset('assets/images/ac.jpg', height: 130, width: 250,
                                  fit: BoxFit.cover,
                                ),
                                onPressed: () {
                                },
                              ),
                            ),
                            Container(
                              width: 40,
                              height: 120,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF42A5F5), width: 1),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                     Color(0xFFBBDEFD),
                                    Color(0xFFBBDEFD),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 175,
                              height: 120,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF42A5F5), width: 1),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                     Color(0xFFBBDEFD),
                                    Color(0xFFBBDEFD),
                                  ],
                                ),
                              ),
                              child: IconButton(
                                icon:  Image.asset('assets/images/mo.png', height: 200, width: 200,
                                  fit: BoxFit.cover,
                                ),
                                onPressed: () {
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 2),
                        child: Row(
                          children: [
                            Container(
                              width: 175,
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF42A5F5), width: 1),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFFE3F2FD),
                                    Color(0xFFE3F2FD),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF42A5F5), width: 1),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFFE3F2FD),
                                    Color(0xFFE3F2FD),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 175,
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF42A5F5), width: 1),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFFE3F2FD),
                                    Color(0xFFE3F2FD),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 2),
                        child: Row(
                          children: [
                            Container(
                              width: 175,
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF42A5F5), width: 1),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFFBBDEFD),
                                    Color(0xFFBBDEFD),
                                  ],
                                ),
                              ),
                              child: Center(
                                child: RichText(text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: 'Induction Hot Plate',
                                          style: TextStyle(
                                              fontSize: 18.2,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = (){
                                              FocusScope.of(context).unfocus();
                                              showDialog(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return AlertDialog(
                                                    contentPadding: EdgeInsets.only(left: 25, right: 25),
                                                    title: Center(child: Text("INDUCTION Cooking", style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),)),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                                                    content: Container(
                                                      height: 200,
                                                      width: 450,
                                                      child: SingleChildScrollView(
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                                          children: <Widget>[
                                                            SizedBox(
                                                              height: 20,
                                                            ),
                                                            Text(
                                                                'There are 3 types of cook-tops available in market: Gas, Electric and Induction.',
                                                                style: TextStyle(color: Colors.black, fontSize: 9,)
                                                            ),
                                                            Text(''),
                                                            Text(
                                                                'This is how they are different:',
                                                                style: TextStyle(color: Colors.black, fontSize: 9,)
                                                            ),
                                                            Text(''),
                                                            Text(
                                                                '1. Gas: it has burner on top and uses LPG gas to burn a flame that is used to cook food.',
                                                                style: TextStyle(color: Colors.black, fontSize: 9,)
                                                            ),
                                                            Text(
                                                                '2. Electric: This has a coil which heats up & generate heat to cook food.',
                                                                style: TextStyle(color: Colors.black, fontSize: 9,)
                                                            ),
                                                            Text(
                                                                '3. Induction: It uses magnetic property to directly heat the cooking vessel hence more energy efficient.',
                                                                style: TextStyle(color: Colors.black, fontSize: 9,)
                                                            ),
                                                            Text(''),
                                                            Text('Efficiencies & cooking Cost of various cooktops:',
                                                              style: TextStyle(color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold)
                                                            ),
                                                            Text(''),
                                                            Text(
                                                                'There are 3 types of sources that we commonly get: LPG Cylinders, Piped Natural Gas and Electricity. Find herebelow comparison to boil 10 ltrs of water (at 25 degrees). Energy required for the same is: 10000 x 4.2 x 75 = 3150000 Joules.',
                                                                style: TextStyle(color: Colors.black, fontSize: 9,)
                                                            ),
                                                            Text(''),
                                                            Table(
                                                              border: TableBorder.all(width:0.5, color:Colors.black45),
                                                              children: [
                                                                TableRow(
                                                                    decoration: BoxDecoration(
                                                                        color: Color(0xFFEEEEEE)
                                                                    ),
                                                                    children: [
                                                                      TableCell(child: Center(child: Text("",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold)))),
                                                                      TableCell(child: Center(child: Text("LPG Stove",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold)))),
                                                                      TableCell(child: Center(child: Text("Piped Natural Gas Stove",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold)))),
                                                                      TableCell(child: Center(child: Text("Induction Cooktop",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold)))),
                                                                      TableCell(child: Center(child: Text("Electric Coil Cooktop",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold)))),
                                                                    ]
                                                                ),
                                                              ],
                                                            ),
                                                            Table(
                                                              border: TableBorder.all(width:0.5, color:Colors.black45),
                                                              children: [
                                                                TableRow(
                                                                    decoration: BoxDecoration(
                                                                        color: Colors.white
                                                                    ),
                                                                    children: [
                                                                      TableCell(child: Container(padding: EdgeInsets.only(top: 6, bottom: 4),child: Center(child: Text("Unit Definition",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold))))),
                                                                      TableCell(child: Center(child: Text("1 Cylinder (14.2 kgs LPG)",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9, )))),
                                                                      TableCell(child: Container(padding: EdgeInsets.only(top: 15, bottom: 2),child: Center(child: Text("1 SCM",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9, ))))),
                                                                      TableCell(child: Container(padding: EdgeInsets.only(top: 15, bottom: 2),child: Center(child: Text("1 kWH",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9, ))))),
                                                                      TableCell(child: Container(padding: EdgeInsets.only(top: 15, bottom: 2),child: Center(child: Text("1 kWH",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9, ))))),
                                                                    ]
                                                                ),
                                                              ],
                                                            ),
                                                            Table(
                                                              border: TableBorder.all(width:0.5, color:Colors.black45),
                                                              children: [
                                                                TableRow(
                                                                    decoration: BoxDecoration(
                                                                        color: Color(0xFFEEEEEE)
                                                                    ),
                                                                    children: [
                                                                      TableCell(child: Center(child: Text("Energy (in Joules) per unit",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold)))),
                                                                      TableCell(child: Container(padding: EdgeInsets.only(top: 15, bottom: 2),child: Center(child: Text("654620000",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9, ))))),
                                                                      TableCell(child: Container(padding: EdgeInsets.only(top: 15, bottom: 2),child: Center(child: Text("41868000",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9, ))))),
                                                                      TableCell(child: Container(padding: EdgeInsets.only(top: 15, bottom: 2),child: Center(child: Text("3600000",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9, ))))),
                                                                      TableCell(child: Container(padding: EdgeInsets.only(top: 15, bottom: 2),child: Center(child: Text("3600000",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9, ))))),
                                                                    ]
                                                                ),
                                                              ],
                                                            ),
                                                            Table(
                                                              border: TableBorder.all(width:0.5, color:Colors.black45),
                                                              children: [
                                                                TableRow(
                                                                    decoration: BoxDecoration(
                                                                        color: Colors.white
                                                                    ),
                                                                    children: [
                                                                      TableCell(child: Center(child: Text("Energy (in Joules) per unit factoring efficiency",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold)))),
                                                                      TableCell(child: Container(padding: EdgeInsets.only(top: 25, bottom: 2),child: Center(child: Text("261848000",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9, ))))),
                                                                      TableCell(child: Container(padding: EdgeInsets.only(top: 25, bottom: 2),child: Center(child: Text("16747200",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9, ))))),
                                                                      TableCell(child: Container(padding: EdgeInsets.only(top: 25, bottom: 2),child: Center(child: Text("3024000",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9, ))))),
                                                                      TableCell(child: Container(padding: EdgeInsets.only(top: 25, bottom: 2),child: Center(child: Text("2664000",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9, ))))),
                                                                    ]
                                                                ),
                                                              ],
                                                            ),
                                                            Table(
                                                              border: TableBorder.all(width:0.5, color:Colors.black45),
                                                              children: [
                                                                TableRow(
                                                                    decoration: BoxDecoration(
                                                                        color: Color(0xFFEEEEEE)
                                                                    ),
                                                                    children: [
                                                                      TableCell(child: Center(child: Text("Units Required to heat 10 lts of water.",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold)))),
                                                                      TableCell(child: Container(padding: EdgeInsets.only(top: 15, bottom: 2),child: Center(child: Text("0.012",textAlign: TextAlign.center, style: TextStyle(color: Colors.black,fontSize: 9 ))))),
                                                                      TableCell(child: Container(padding: EdgeInsets.only(top: 15, bottom: 2),child: Center(child: Text("0.188",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9))))),
                                                                      TableCell(child: Container(padding: EdgeInsets.only(top: 15, bottom: 2),child: Center(child: Text("1.042",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9))))),
                                                                      TableCell(child: Container(padding: EdgeInsets.only(top: 15, bottom: 2),child: Center(child: Text("1.182",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9))))),
                                                                    ]
                                                                ),
                                                              ],
                                                            ),
                                                            Table(
                                                              border: TableBorder.all(width:0.5, color:Colors.black45),
                                                              children: [
                                                                TableRow(
                                                                    decoration: BoxDecoration(
                                                                        color: Colors.white
                                                                    ),
                                                                    children: [
                                                                      TableCell(child: Center(child: Text("Cost per Unit (in Rs)",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold)))),
                                                                      TableCell(child: Center(child: Text("Rs 900 (Un-Subsidized)",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9,)))),
                                                                      TableCell(child: Container(padding: EdgeInsets.only(top: 15, bottom: 2),child: Center(child: Text("Rs 23",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9, ))))),
                                                                      TableCell(child: Container(padding: EdgeInsets.only(top: 15, bottom: 2),child: Center(child: Text("Rs 5",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9, ))))),
                                                                      TableCell(child: Container(padding: EdgeInsets.only(top: 15, bottom: 2),child: Center(child: Text("Rs 5",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9, ))))),
                                                                    ]
                                                                ),
                                                              ],
                                                            ),
                                                            Table(
                                                              border: TableBorder.all(width:0.5, color:Colors.black45),
                                                              children: [
                                                                TableRow(
                                                                    decoration: BoxDecoration(
                                                                        color: Color(0xFFEEEEEE)
                                                                    ),
                                                                    children: [
                                                                      TableCell(child: Center(child: Text("Cost of heating 10 lts water (in Rs)",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold)))),
                                                                      TableCell(child: Container(padding: EdgeInsets.only(top: 5, bottom: 2),child: Center(child: Text("Rs 10.8 (Un-Subsidized)",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9,))))),
                                                                      TableCell(child: Container(padding: EdgeInsets.only(top: 15, bottom: 2),child: Center(child: Text("Rs 4.33",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9, ))))),
                                                                      TableCell(child: Container(padding: EdgeInsets.only(top: 15, bottom: 2),child: Center(child: Text("Rs 5.21",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9, ))))),
                                                                      TableCell(child: Container(padding: EdgeInsets.only(top: 15, bottom: 2),child: Center(child: Text("Rs 5.91",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 9, ))))),
                                                                    ]
                                                                ),
                                                              ],
                                                            ),
                                                            Text(''),
                                                            Text('Actual values may vary based on the latest prices of LPG, PNG or electricity.',
                                                              style: TextStyle(color: Colors.black, fontSize: 9),
                                                            ),
                                                            Text(''),
                                                            Text('For Induction Cook-tops:',
                                                              style: TextStyle(color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold),
                                                            ),
                                                            Text(''),
                                                            Text('Pros:',
                                                              style: TextStyle(color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold),
                                                            ),
                                                            Text(''),
                                                            Text('1. Induction cook-tops heat faster and distribute heat more evenly.',
                                                              style: TextStyle(color: Colors.black, fontSize: 9),
                                                            ),
                                                            Text('2. They are completely safe as they heat only vessel in contact.',
                                                              style: TextStyle(color: Colors.black, fontSize: 9),
                                                            ),
                                                            Text('3. They are easier to clean & Efficient in terms of energy use.',
                                                              style: TextStyle(color: Colors.black, fontSize: 9),
                                                            ),
                                                            Text('4. Come with programmable temperature controls.',
                                                              style: TextStyle(color: Colors.black, fontSize: 9),
                                                            ),
                                                            Text('5. No heat wasted as it cools quickly as one shuts it down.',
                                                              style: TextStyle(color: Colors.black, fontSize: 9),
                                                            ),
                                                            Text(''),
                                                            Text('Cons:',
                                                              style: TextStyle(color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold),
                                                            ),
                                                            Text(''),
                                                            Text('1. Can only be used with steel or iron utensils. Needs kitchen adjustment.',
                                                              style: TextStyle(color: Colors.black, fontSize: 9),
                                                            ),
                                                            Text('2. Expensive than regular cook-tops.',
                                                              style: TextStyle(color: Colors.black, fontSize: 9),
                                                            ),
                                                            Text('3. Can be used only with flat surface utensils..',
                                                              style: TextStyle(color: Colors.black, fontSize: 9),
                                                            ),
                                                            Text('4. Will not work at all for some Indian food like chapatti.',
                                                              style: TextStyle(color: Colors.black, fontSize: 9),
                                                            ),
                                                            Text('5. As heating is localized & at centre. Preferred right sized utensil ',
                                                              style: TextStyle(color: Colors.black, fontSize: 9),
                                                            ),
                                                            Text('')
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            }
                                      )
                                    ]
                                )),
                                // child: Text('Induction Hot Plate', style: TextStyle(
                                //     fontSize: 13.2,
                                //     fontWeight: FontWeight.bold
                                // ),),
                              ),
                            ),
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF42A5F5), width: 1),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFFBBDEFD),
                                    Color(0xFFBBDEFD),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 175,
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF42A5F5), width: 1),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFFBBDEFD),
                                    Color(0xFFBBDEFD),
                                  ],
                                ),
                              ),
                              child: Center(
                                child: Text('Refrigerator', style: TextStyle(
                                    fontSize: 13.2,
                                    fontWeight: FontWeight.bold
                                ),),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 2),
                        child: Row(
                          children: [
                            Container(
                              width: 175,
                              height: 120,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF42A5F5), width: 1),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFFE3F2FD),
                                    Color(0xFFE3F2FD),
                                  ],
                                ),
                              ),
                              child: IconButton(
                                icon:  Image.asset('assets/images/ip.jpg', height: 130,
                                  fit: BoxFit.cover,
                                ),
                                onPressed: () {
                                },
                              ),
                            ),
                            Container(
                              width: 40,
                              height: 120,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF42A5F5), width: 1),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFFE3F2FD),
                                    Color(0xFFE3F2FD),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 175,
                              height: 120,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF42A5F5), width: 1),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFFE3F2FD),
                                    Color(0xFFE3F2FD),
                                  ],
                                ),
                              ),
                              child: IconButton(
                                icon:  Image.asset('assets/images/r.jpg', height: 105,
                                  fit: BoxFit.cover,
                                ),
                                onPressed: () {
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 2),
                        child: Row(
                          children: [
                            Container(
                              width: 175,
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF42A5F5), width: 1),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFFBBDEFD),
                                    Color(0xFFBBDEFD),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF42A5F5), width: 1),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFFBBDEFD),
                                    Color(0xFFBBDEFD),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 175,
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF42A5F5), width: 1),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFFBBDEFD),
                                    Color(0xFFBBDEFD),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 2),
                        child: Row(
                          children: [
                            Container(
                              width: 175,
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF42A5F5), width: 1),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFFE3F2FD),
                                    Color(0xFFE3F2FD),
                                  ],
                                ),
                              ),
                              child: Center(
                                child: Text('TVs', style: TextStyle(
                                    fontSize: 13.2,
                                    fontWeight: FontWeight.bold
                                ),),
                              ),
                            ),
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF42A5F5), width: 1),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFFE3F2FD),
                                    Color(0xFFE3F2FD),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 175,
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF42A5F5), width: 1),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFFE3F2FD),
                                    Color(0xFFE3F2FD),
                                  ],
                                ),
                              ),
                              child: Center(
                                child: Text('Washing Machines', style: TextStyle(
                                    fontSize: 13.2,
                                    fontWeight: FontWeight.bold
                                ),),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 2),
                        child: Row(
                          children: [
                            Container(
                              width: 175,
                              height: 120,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF42A5F5), width: 1),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFFBBDEFD),
                                    Color(0xFFBBDEFD),
                                  ],
                                ),
                              ),
                              child: IconButton(
                                icon:  Image.asset('assets/images/tv.jpg', height: 125,
                                  fit: BoxFit.cover,
                                ),
                                onPressed: () {
                                },
                              ),
                            ),
                            Container(
                              width: 40,
                              height: 120,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF42A5F5), width: 1),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFFBBDEFD),
                                    Color(0xFFBBDEFD),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 175,
                              height: 120,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF42A5F5), width: 1),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFFBBDEFD),
                                    Color(0xFFBBDEFD),
                                  ],
                                ),
                              ),
                              child: IconButton(
                                icon: Image.asset(
                                  'assets/images/wa.jpg', height: 150, width: 150,
                                  fit: BoxFit.cover,
                                ),
                                onPressed: () {
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 2),
                        child: Row(
                          children: [
                            Container(
                              width: 175,
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF42A5F5), width: 1),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFFE3F2FD),
                                    Color(0xFFE3F2FD),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF42A5F5), width: 1),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFFE3F2FD),
                                    Color(0xFFE3F2FD),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 175,
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF42A5F5), width: 1),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFFE3F2FD),
                                    Color(0xFFE3F2FD),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
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














//
// FocusScope.of(context).unfocus();
// showDialog(
// context: context,
// builder: (BuildContext context) {
// return AlertDialog(
// title: Center(
// child: SingleChildScrollView(
// child: Container(
// child: Column(
// children: [
// Container(
// child: Padding(
// padding: EdgeInsets.fromLTRB(0.0, 14.0, 0.0, 0.0),
// child: Text('AC SAVING PRACTICAL CASE ',
// textAlign: TextAlign.center,style: TextStyle(color: Colors.blue),),
// ),color: Colors.white,),
// Container(
// child: Padding(
// padding: EdgeInsets.fromLTRB(0.0, 14.0, 0.0, 0.0),
// child: Text('Mr. Bose, a technocrat has witnessed significant savings in electricity bills by setting the AC temperature higher. Bose, has a 3BHK apartment in Gurgaon, sets the AC temperature at 27 degrees during the day and moves to 28-29 degrees with a ceiling fan at low speed, if required, at night. His bill was around ₹ 3,000 whereas comparable apartments gets electricity bills of ₹ 6,000-10,000.',
// textAlign: TextAlign.center,style: TextStyle(color: Colors.blue),),
// ),color: Colors.white,)
// ],
// ),
// ),
// ),
// ),
// content: setupAlertDialoadContainer(context),
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.all(Radius.circular(30.0))),
// );
// },
// );