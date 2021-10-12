import 'package:flutter/material.dart';

class Metronome extends StatefulWidget {
  const Metronome({ Key? key }) : super(key: key);

  @override
  _MetronomeState createState() => _MetronomeState();
}

class _MetronomeState extends State<Metronome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('BREATHING METRONOME'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.red,
                width: 300,
                height: 150,
                child: Text(
                  'TEMPO',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                  ),
                  ),
              ),
            ],
          ),

          SizedBox(height: 150,),

          //This is the play button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 220,
                height: 220,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                    IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.play_arrow),
                      iconSize: 90,
                    ),
                    IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.arrow_forward_ios),
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
          SizedBox(height: 90,),

          //This is where the last set of buttons will be for the metronome
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 50,
                color: Colors.grey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: (){}, 
                      icon: Icon(Icons.add_circle_outline_rounded)
                      ),
                    Text('1'),
                    IconButton(
                      onPressed: (){}, 
                      icon: Icon(Icons.do_not_disturb_on_outlined)
                      ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
