import 'package:flutter/material.dart';
import 'package:o2s/admine2.dart';

class admine3 extends StatefulWidget {
  const admine3({Key? key}) : super(key: key);

  @override
  _admine3State createState() => _admine3State();
}

class _admine3State extends State<admine3> {
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
                padding: EdgeInsets.fromLTRB(0.0, 55.0, 0.0, 0.0),
                child: Center(
                  child: Image.asset("assets/icons/logo.png"),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                child: Center(
                    child: Text('Admin Entries', style: TextStyle(color: Colors.black, fontSize: 31, fontWeight: FontWeight.bold),)
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 50),
                      child:Expanded(
                        child: Table(
                          border: TableBorder.all(width:0.5, color:Colors.black45), //table border,
                          children: [
                            TableRow(
                                decoration: BoxDecoration(
                                  color: Color(0xFF9CCC65),
                                ),
                                children: [
                                  TableCell(child: SizedBox(height: 50, child: Center(child: Text("Feeder", style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),)),)),
                                  TableCell(child: SizedBox(height: 50, child: Center(child: Text("Data Received", style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),)),)),
                                ]
                            ),

                          ],),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 0),
                      child:Table(
                        border: TableBorder.all(width:0.5, color:Colors.black45), //table border
                        children: [

                          TableRow(
                              decoration: BoxDecoration(
                                  color: Colors.white
                              ),
                              children: [
                                TableCell(child: SizedBox(height: 43, child: Center(child: Text("1", style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),)),)),
                                TableCell(child: SizedBox(height: 43, child: Center(child: Text("----", style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),)),)),
                              ]
                          ),

                        ],),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 0),
                      child:Table(
                        border: TableBorder.all(width:0.5, color:Colors.black45), //table border
                        children: [

                          TableRow(
                              decoration: BoxDecoration(
                                  color: Colors.white
                              ),
                              children: [
                                TableCell(child: SizedBox(height: 43, child: Center(child: Text("2", style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),)),)),
                                TableCell(child: SizedBox(height: 43, child: Center(child: Text("----", style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),)),)),
                              ]
                          ),

                        ],),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 0),
                      child:Table(
                        border: TableBorder.all(width:0.5, color:Colors.black45), //table border
                        children: [

                          TableRow(
                              decoration: BoxDecoration(
                                  color: Colors.white
                              ),
                              children: [
                                TableCell(child: SizedBox(height: 43, child: Center(child: Text("3", style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),)),)),
                                TableCell(child: SizedBox(height: 43, child: Center(child: Text("----", style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),)),)),
                              ]
                          ),

                        ],),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 0),
                      child:Table(
                        border: TableBorder.all(width:0.5, color:Colors.black45), //table border
                        children: [

                          TableRow(
                              decoration: BoxDecoration(
                                  color: Colors.white
                              ),
                              children: [
                                TableCell(child: SizedBox(height: 43, child: Center(child: Text("4", style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),)),)),
                                TableCell(child: SizedBox(height: 43, child: Center(child: Text("----", style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),)),)),
                              ]
                          ),

                        ],),
                    ),

                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(top: 120),
                            child: Center(
                              child: Stack(
                                children: <Widget>[
                                  SizedBox(height: 60.0),
                                  Container(
                                    height: 50.0,
                                    width: 85.0,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(primary: Color(0xFF33691E),shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(1.0)
                                      ),),

                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => admine2()),
                                        );
                                      },
                                      child: Text("Back", style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(top: 120),
                            child: Center(
                              child: Stack(
                                children: <Widget>[
                                  SizedBox(height: 60.0),
                                  Container(
                                    height: 50.0,
                                    width: 120.0,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(primary: Color(0xFF33691E),shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(1.0)
                                      ),),

                                      onPressed: () {
                                      },
                                      child: Text("Installation Completed", style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),


                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
