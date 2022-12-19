import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

//separate getTime method so that the code can reuse
class WorldTime{

  late String location;// location name for the UI
  late String time;//the time in that location
  late String flag; //url to an asset flag icon
  late String url;// location  url for api endpoint
  late bool isDaytime;//true ot false if daytime or night

  //constructor
  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async{

    try{
      // make request
      var URL = Uri.parse('http://worldtimeapi.org/api/timezone/$url');//new
      var response = await http.get(URL);//new
      Map data = jsonDecode(response.body);
      // print(data); // this prints all the data in the api

      // get properties from data
      String datetime = data['datetime'];
      String offset1 = data['utc_offset'].substring(1,3);// removing + sign
      String offset2 = data['utc_offset'].substring(4,6);// removing first 4 characters


      //create a DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset1), minutes: int.parse(offset2)));

      //checking daytime or not
      isDaytime = now.hour>6 && now.hour<18 ?true :false;
      //set the time property
      time = DateFormat.jm().format(now); //format the time using jm method of intl package

    }
    catch(e){
      print('Caught error: $e');
      time = 'Could not get time data';
    }

  }
}

