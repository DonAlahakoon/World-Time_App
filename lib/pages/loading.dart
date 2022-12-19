import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/services/world_time.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setupWorldTime() async{// if function is not async then could use 'await'
    WorldTime instance1 = WorldTime(location:'Colombo',flag: 'Sri Lanka',url:'Asia/Colombo');
    await instance1.getTime();
    Navigator.pushReplacementNamed(context,'/home',arguments: {
      'location': instance1.location,
      'flag' : instance1.flag,
      'time': instance1.time,
      'isDaytime': instance1.isDaytime,
    });


  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();//calling asynchronous function

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitSpinningLines(
          color: Colors.white,
          size: 70.0,
        ),
      ),
    );
  }
}
