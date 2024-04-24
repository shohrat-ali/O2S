import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:o2s/houseHoldInfo.dart';
import 'package:o2s/savingOpportunities.dart';
import 'package:o2s/setting.dart';
import 'package:o2s/usage.dart';

import 'loginScreen.dart';
import 'notification.dart';

class maindrawer extends StatefulWidget {
  const maindrawer({Key? key}) : super(key: key);

  @override
  _maindrawerState createState() => _maindrawerState();
}

class _maindrawerState extends State<maindrawer> {

  void write(String value) async {
    final _storage = new FlutterSecureStorage();
    await _storage.write(key: "is_logged_in", value: value);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(0),
            color: Colors.white,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 65,
                    margin: EdgeInsets.only(top: 60, bottom: 10),
                    child: Image.asset("assets/icons/logo.png"),
                  )
                ],
              ),
            ),
          ),
          Divider(color: Colors.grey,),
          ListTile(
            title: Text('Usage Trend',
              style: TextStyle(
                fontSize: 14
            ),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => usage()),
              );
            },
          ),
          Divider(color: Colors.grey,),
          ListTile(
            title: Text('Saving Opportunities',
              style: TextStyle(
                  fontSize: 14
              ),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => savingopportunities()),
              );
            },
          ),
          Divider(color: Colors.grey,),
          ListTile(
            title: Text('Notifications',
              style: TextStyle(
                  fontSize: 14
              ),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => notification()),
              );
            },
          ),
          Divider(color: Colors.grey,),
          ListTile(
            title: Text('Household Information',
              style: TextStyle(
                  fontSize: 14
              ),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => household()),
              );
            },
          ),
          Divider(color: Colors.grey,),
          ListTile(
            title: Text('Appliance Usage',
              style: TextStyle(
                  fontSize: 14
              ),),
            onTap: null,
          ),
          Divider(color: Colors.grey,),
          ListTile(
            title: Text('Smart Switch',
              style: TextStyle(
                  fontSize: 14
              ),),
            onTap: null,
          ),
          Divider(color: Colors.grey,),
          ListTile(
            title: Text('Setting',
              style: TextStyle(
                  fontSize: 14
              ),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => setting()),
              );
            },
          ),
          Divider(color: Colors.grey,),
          ListTile(
            title: Text('Log Out',
              style: TextStyle(
                  fontSize: 14
              ),),
            onTap: () {
              write("0");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginSccreen()),
              );
            },
          ),
          Divider(color: Colors.grey,),
        ],
      ),
    );
  }
}


