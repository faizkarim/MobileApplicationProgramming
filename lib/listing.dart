import 'package:flutter/material.dart';

class ListingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
         children: <Widget>[
           Container(
             child: CircleAvatar(
               backgroundImage: AssetImage('assets/images/profile.jpg'),
             ),
           )
         ],
      ),
    );
  }
}
