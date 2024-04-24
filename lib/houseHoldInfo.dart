import 'package:flutter/material.dart';
import 'package:o2s/setting.dart';
import 'package:o2s/usage.dart';

import 'homeScreen.dart';
import 'mainDrawer.dart';
import 'notification.dart';

class household extends StatefulWidget {
  const household({Key? key}) : super(key: key);

  @override
  _householdState createState() => _householdState();
}

class _householdState extends State<household> {
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
                  child: Text('Household Information', style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),),
                ),
              ),
            ),
            Container(
              width: 400,
              height: 400,
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
                    ListTile(
                      title: Text('Square Footage',
                        style: TextStyle(
                            fontSize: 16
                        ),),
                      leading: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: 30,
                          maxWidth: 30,
                          minHeight: 30,
                          minWidth: 30
                        ),
                        child: Image.asset('assets/icons/expand.png', fit: BoxFit.cover),
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text('Home Type',
                        style: TextStyle(
                            fontSize: 16
                        ),),
                      leading: ConstrainedBox(
                        constraints: BoxConstraints(
                            maxHeight: 30,
                            maxWidth: 30,
                            minHeight: 30,
                            minWidth: 30
                        ),
                        child: Image.asset('assets/icons/homes.png', fit: BoxFit.cover),
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text('# of Residents',
                        style: TextStyle(
                            fontSize: 16
                        ),),
                      leading: ConstrainedBox(
                        constraints: BoxConstraints(
                            maxHeight: 30,
                            maxWidth: 30,
                            minHeight: 30,
                            minWidth: 30
                        ),
                        child: Image.asset('assets/icons/multipleUsers.png', fit: BoxFit.cover),
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text('Kitchen Appliances',
                        style: TextStyle(
                            fontSize: 16
                        ),),
                      leading: ConstrainedBox(
                        constraints: BoxConstraints(
                            maxHeight: 30,
                            maxWidth: 30,
                            minHeight: 30,
                            minWidth: 30
                        ),
                        child: Image.asset('assets/icons/flame.png', fit: BoxFit.cover),
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text('Air Conditioning',
                        style: TextStyle(
                            fontSize: 16
                        ),),
                      leading: ConstrainedBox(
                        constraints: BoxConstraints(
                            maxHeight: 30,
                            maxWidth: 30,
                            minHeight: 30,
                            minWidth: 30
                        ),
                        child: Image.asset('assets/icons/snowflake.png', fit: BoxFit.cover),
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text('No of Fans',
                        style: TextStyle(
                            fontSize: 16
                        ),),
                      leading: ConstrainedBox(
                        constraints: BoxConstraints(
                            maxHeight: 30,
                            maxWidth: 30,
                            minHeight: 30,
                            minWidth: 30
                        ),
                        child: Image.asset('assets/icons/swimming.png', fit: BoxFit.cover),
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text('Lights',
                        style: TextStyle(
                            fontSize: 16
                        ),),
                      leading: ConstrainedBox(
                        constraints: BoxConstraints(
                            maxHeight: 30,
                            maxWidth: 30,
                            minHeight: 30,
                            minWidth: 30
                        ),
                        child: Image.asset('assets/icons/lightbulb.png', fit: BoxFit.cover),
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {},
                    ),
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
