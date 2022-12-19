import 'package:flutter/material.dart';


//created stateful widget and name it Home
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};//empty map

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context)!.settings.arguments as Map;//new
    print(data);

    //set background
    String bgImage = data['isDaytime']? 'daytime.jpg':'nighttime.jpg';
    Color? bgColor = data['isDaytime']? Colors.yellow : Colors.indigo[900];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea( // this use to keep top margin clean
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10,80,10,10),
              child: Column(
                children:<Widget> [
                  FlatButton.icon(
                    onPressed: (){
                      Navigator.pushNamed(context,'/location');//pushing another screen on top of home like a stack
                    },
                    icon: Icon(
                        Icons.edit_location,
                      color: data['isDaytime']? Colors.black87 : Colors.white,
                    ),
                    label: Text(
                        'Edit Location',
                      style: TextStyle(
                        color: data['isDaytime']? Colors.black87 : Colors.white,
                      ),
                    ),

                  ),
                  SizedBox(height:20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget> [
                      Text(
                          data['location'],
                        style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color: data['isDaytime']? Colors.black87 : Colors.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                      data['time'],
                    style: TextStyle(
                      fontSize: 50,
                      color: data['isDaytime']? Colors.black87 : Colors.white,
                    )
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
