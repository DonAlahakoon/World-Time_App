import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';


//created stateful widget
class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(location: "London", flag: "uk.png", url: 'Europe/London'),
    WorldTime(location: "Colombo", flag: "sl.png", url: 'Asia/Colombo'),
    WorldTime(location: "Mexico", flag: "mx.png", url: 'America/Mexico_City'),
    WorldTime(location: "LosAngeles", flag: "us.png", url: 'America/Los_Angeles'),
    WorldTime(location: "Vancouver", flag: "ca.png", url: 'America/Vancouver'),
    WorldTime(location: "Tokyo", flag: "jp.png", url: 'Asia/Tokyo'),
    WorldTime(location: "Hong_Kong", flag: "ch.png", url: 'Asia/Hong_Kong'),
  ];

  void updateTime(index) async {
    WorldTime  instance = locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag' : instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }


  @override
  Widget build(BuildContext context) {
    print('build function ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(//an arrow will create automatically
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        title: Text('Choose a location'),
        elevation: 0,

      ),
      body: ListView.builder(
        itemCount: locations.length,//no of items in the list
        itemBuilder:(context,index){//function takes two parameters
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      )
    );
  }
}
