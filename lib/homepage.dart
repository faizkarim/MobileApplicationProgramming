import 'package:flutter/material.dart';
import 'selling.dart';
import 'profile.dart';
import 'listing.dart';
import 'home.dart';
import 'notificationscreen.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import './modal/mockItem.dart';
import './modal/mockNotification.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import './data/mockUserDetails.dart';

Color maincolor = Color(0xFFF1E90FF);
Color dark = Color(0xff292b2c);

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var screen = [
    HomeScreen(mockItem),
    ListingScreen(mockItem),
    SellScreen(),
    NotificationScreen(mockNotification),
    ProfileScreen(mockUserDetails[0]),
  ];

  int screenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   leading: Container(),
        //   elevation: 0,
        //   backgroundColor: Colors.red,
        //   iconTheme: IconThemeData(color: Colors.black),
        //   actions: <Widget>[
        //     GestureDetector(
        //       child: Icon(Icons.chat_bubble_outline),
        //     ),
        //     SizedBox(width: 10)
        //   ],
        // ),
        // drawer: Drawer(
        //   child: ListView(
        //     children: <Widget>[
        //       ListTile(
        //         title: Text('Logout'),
        //         onTap: (){
        //           Navigator.pushNamed(context, '/register');
        //         },
        //       )
        //     ],
        //   ),
        // ),
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
                title: Text('My Listings'),
                inactiveColor: Colors.grey,
                textAlign: TextAlign.center,
                activeColor: Colors.blueAccent,
                icon: Icon(EvaIcons.gridOutline),
              ),
              //  BottomNavItem(
              //     activeIcon: Icon(EvaIcons.bell),
              //     icon: new Stack(
              //       children: <Widget>[
              //         new Icon(
              //           EvaIcons.bellOutline,
              //         ),
              //         new Positioned(
              //             right: 0,
              //             child: new Container(
              //               padding: EdgeInsets.all(2),
              //               decoration: new BoxDecoration(
              //                 color: Colors.red,
              //                 borderRadius: BorderRadius.circular(6),
              //               ),
              //               constraints: BoxConstraints(
              //                 minWidth: 12,
              //                 minHeight: 12,
              //               ),
              //               child: new Text(
              //                 '2',
              //                 style:
              //                     new TextStyle(color: Colors.white, fontSize: 8),
              //                 textAlign: TextAlign.center,
              //               ),
              //             )),
              //       ],
              //     ),
              //     title: Text('Notifications', style: TextStyle(fontSize: 12.0)),
              //   ),
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
