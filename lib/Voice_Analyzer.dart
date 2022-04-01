import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'timer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class Vocal_Analyzer extends StatefulWidget{

  @override
  Vocal_Analyzer_State createState() => Vocal_Analyzer_State();
}
class Vocal_Analyzer_State extends State<Vocal_Analyzer>{

  @override
  Widget build(BuildContext context){
    return Scaffold(

      //top of the page with back key
      appBar: AppBar(
        backgroundColor: Color(0xFF180C0C),
        title: Container(
          width: 280,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(30.0, 10.0, 20.0, 10.0),
            child: Text(
              'Vocal Analyzer',
              style: TextStyle(
                fontSize: 17,
                color: Colors.black,
              ),
            ),
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        leading: Row(
          children: [
            SizedBox(
              width: 8.0,
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(FontAwesomeIcons.angleLeft),
            ),
          ],
        ),
      ),
      body: Center(

        child:
        Container(decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.red,
                Colors.black,
              ],
            )
        ),
          child: Column(
          //IMPLEMENTED WIDGETS BUILT HERE
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildTimer(),
              SizedBox(height: 16),
              buildToneGraph(),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildDropMenu()
                ],
              ),
              SizedBox(height: 50),
              buildFeedback()
            ]
          ),
        ),
      ),
    );
  }
  //timer box (NEEDS IMPLEMENTATION)
  Widget buildTimer(){
    return Container(
      width: 150,
      height: 50,
      decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder (
              borderRadius: BorderRadius.circular(32.0),
              side: BorderSide(
                  width: 10,
                  color: Colors.white
              )
          )
      ),
      child: Center(
          child: Column(
              children: [
                Text("00:00",style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                )
              ],
          )
      ),
    );
  }
  //visualized graph (NEEDS IMPLEMENTATION)
  Widget buildToneGraph(){
    return Container(
      width: 400,
      height: 250,
      decoration: ShapeDecoration(
          color: Colors.black,
          shape: RoundedRectangleBorder (
              borderRadius: BorderRadius.circular(32.0),
              side: BorderSide(
                  width: 3,
                  color: Colors.grey
              )
          )
      ),
      child: Center(
          child: Column(

          )
      ),
    );
  }
  //drop down menu for tone selection (NEEDS IMPLEMENTATION)(Needs Redesign)
  Widget buildDropMenu(){
    final List<String> accountType = ['E', 'S', 'P'];
    String dropdownValue = 'Select';
    return Container(
        width: 120,
        height: 70,
        decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder (
                borderRadius: BorderRadius.circular(32.0),
                side: BorderSide(
                    width: 3,
                    color: Colors.white
                )
            )
        ),
        child:DropdownButtonFormField(
          icon: const Icon(Icons.arrow_drop_down_sharp),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            ),
        value: accountType[0],
        onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
        },
        items: accountType.map((accountType) {
        return DropdownMenuItem<String>(
          value: accountType,
          child: Text(accountType),
        );
            }).toList(),
          ),
    );
  }
  //outputs feedback to the user (NEEDS IMPLEMENTATION)
  Widget buildFeedback(){
    return Container(
      width: 300,
      height: 100,
      decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder (
              borderRadius: BorderRadius.circular(32.0),
              side: BorderSide(
                  width: 10,
                  color: Colors.white
              )
          )
      ),
      child: Center(
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Nothing Here Yet",style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.redAccent),
              )
            ],
          )
      ),
    );
  }
  //play button
Widget buildPlay(){
    return Scaffold();
}
//pause button
Widget buildPause(){
    return Scaffold();
  }
}