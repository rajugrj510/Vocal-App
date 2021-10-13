import 'package:flutter/material.dart';
import 'package:vocal_app/metronome/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Metronome extends StatefulWidget {

  @override
  _MetronomeState createState() => _MetronomeState();
}

class _MetronomeState extends State<Metronome> {
  int tempo = 90;
  int _value = 0 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFAE0A14),
      appBar: AppBar(
        backgroundColor: Color(0xFF390202),
        title: Container(
          width: 280,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(30.0, 10.0, 20.0, 10.0),
            child: Text(
              'BREATHING METRONOME',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.all(35.0),
              decoration: BoxDecoration(
                color: Color(0xFFEE0708),
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                  color: Colors.black,
                  blurRadius: 5,
                  offset: Offset(3, 8),
                )]
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(30.0),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 8.0),
                      child: Text(
                        tempo.toString(),
                        style: TextStyle(
                          fontSize: 70,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),


                ],
              ),
            ),
          ),
          //This is the play button
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 220,
                  height: 220,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                            Icons.arrow_back_ios,
                          size: 30.0,),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.play_arrow),
                        iconSize: 100.0,

                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                            Icons.arrow_forward_ios,
                        size: 30.0,),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          //This is where the last set of buttons will be for the metronome
          Expanded(
            child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration:BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 5.0),
                    child: Text(
                      'TAP',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  //padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: (){
                            //perform action for metronome
                            setState(() {
                              tempo--;
                            });
                          }),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                        tempo.toString(),
                        style: ktext_style,
                        ),
                      ),
                      RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: (){
                            //perform action for metronome
                            setState(() {
                              tempo++;
                            });
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPressed});
  final IconData icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        child: Icon(icon,
        color: Colors.white,),
        elevation: 3.0,
        shape: CircleBorder(),
        fillColor: Colors.black,
        constraints: BoxConstraints.tightFor(
          width: 40.0,
          height: 40.0,
        ),
        onPressed: onPressed);
  }
}