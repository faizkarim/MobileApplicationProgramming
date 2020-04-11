import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black,), 
          onPressed: () => Navigator.of(context).pop()
        ),
        backgroundColor: Colors.grey.shade200,
        title: Text('Notifications',style: TextStyle(color: Colors.black),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(children: <Widget>[
          SwitchListTile(
              title: Text("Received notifications", style: TextStyle(fontSize: 18),),
              activeColor: Colors.lightBlue,
              value: true,
              onChanged: (val){}
          ),
          SwitchListTile(
              title: Text("Received offer notifications", style: TextStyle(fontSize: 18),),
              activeColor: Colors.lightBlue,
              value: false,
              onChanged: null
          ),
        ],),
      ),
    );
  }
}