import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class Display extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          elevation: 0,
          brightness: Brightness.light,
          leading: IconButton(
              icon: Icon(
                EvaIcons.arrowBack,
                color: Colors.black,
              ),
              onPressed: () => Navigator.of(context).pop()),
          backgroundColor: Colors.grey.shade200,
          title: Text(
            'Display',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
            child: Center(
          child: Text('Nothing here'),
        )));
  }
}
