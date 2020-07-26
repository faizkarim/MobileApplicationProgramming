import 'package:flutter/material.dart';
import 'selling.dart';
import 'profile.dart';
import 'listing.dart';
import 'home.dart';
import 'notificationscreen.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';


Color maincolor = Color(0xFFF1E90FF);
Color dark = Color(0xff292b2c);

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  var screen = [
    HomeScreen(),
    ListingScreen(),
    SellScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  int screenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        bottomNavigationBar: BottomNavyBar(
            itemCornerRadius: 100.0,
            selectedIndex: screenIndex,
            onItemSelected: (index) {
              print(index);
              setState(() {
                screenIndex = index;
              });
            },
            items: [
              BottomNavyBarItem(
                title: Text('Home'),
                inactiveColor: Colors.grey,
                activeColor: Colors.blueAccent,
                icon: Icon(EvaIcons.homeOutline),
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                title: Text('My Favourite'),
                inactiveColor: Colors.grey,
                textAlign: TextAlign.center,
                activeColor: Colors.blueAccent,
                icon: Icon(EvaIcons.bookmarkOutline),
              ),
              BottomNavyBarItem(
                  title: Text('Sell'),
                  activeColor: Colors.blueAccent,
                  icon: Icon(EvaIcons.plusOutline),
                  textAlign: TextAlign.center),
              BottomNavyBarItem(
                  title: Text('Notifications'),
                  inactiveColor: Colors.grey,
                  activeColor: Colors.blueAccent,
                  icon: Icon(EvaIcons.bellOutline),
                  textAlign: TextAlign.center),
              BottomNavyBarItem(
                  title: Text('Me'),
                  inactiveColor: Colors.grey,
                  activeColor: Colors.blueAccent,
                  icon: Icon(EvaIcons.personOutline),
                  textAlign: TextAlign.center),
            ]),
        body: screen[screenIndex]);
  }
}

