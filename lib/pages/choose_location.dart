import 'package:flutter/material.dart';


//created stateful widget
class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {



  @override
  Widget build(BuildContext context) {
    print('build function ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(//an arrow will create automatically
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        title: Text('Choose location screen'),
        elevation: 0,

      ),
      body: RaisedButton(
          onPressed: (){
            setState((){

            });
          },
        child: Text('counter is '),
      ),
    );
  }
}
