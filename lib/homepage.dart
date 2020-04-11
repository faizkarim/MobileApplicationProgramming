import 'package:flutter/material.dart';
import 'selling.dart';
import 'profile.dart';
import 'listing.dart';
import 'home.dart';
import 'notificationscreen.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

Color maincolor = Color(0xFFF1E90FF);
Color dark = Color(0xff292b2c);

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var screen = [
    HomeScreen(),
    NotificationScreen(),
    SellScreen(),
    ListingScreen(),
    ProfileScreen(),
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
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: screenIndex,
            onTap: (index) {
              print(index);
              setState(() {
                screenIndex = index;
              });
            },
            unselectedIconTheme: IconThemeData(
              color: Colors.grey,
            ),
            selectedIconTheme: IconThemeData(
              color: dark,
            ),
            selectedItemColor: dark,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  activeIcon: Icon(EvaIcons.home),
                  icon: Icon(
                    EvaIcons.homeOutline,
                  ),
                  title: Text(
                    'Home',
                    style: TextStyle(fontSize: 12.0),
                  )),
              BottomNavigationBarItem(
                activeIcon: Icon(EvaIcons.bell),
                icon: new Stack(
                  children: <Widget>[
                    new Icon(
                      EvaIcons.bellOutline,
                    ),
                    new Positioned(
                        right: 0,
                        child: new Container(
                          padding: EdgeInsets.all(2),
                          decoration: new BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 12,
                            minHeight: 12,
                          ),
                          child: new Text(
                            '2',
                            style:
                                new TextStyle(color: Colors.white, fontSize: 8),
                            textAlign: TextAlign.center,
                          ),
                        )),
                  ],
                ),
                title: Text('Notifications', style: TextStyle(fontSize: 12.0)),
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    EvaIcons.plusSquare,
                    size: 30,
                    color: Colors.blueAccent,
                  ),
                  title: Text(
                    'Sell',
                    style: TextStyle(fontSize: 12.0),
                  )),
              BottomNavigationBarItem(
                  activeIcon: Icon(
                    EvaIcons.grid,
                  ),
                  icon: Icon(
                    EvaIcons.gridOutline,
                    size: 22,
                  ),
                  title: Text(
                    'My Listing',
                    style: TextStyle(fontSize: 12.0),
                  )),
              BottomNavigationBarItem(
                  activeIcon: Icon(EvaIcons.person),
                  icon: Icon(
                    EvaIcons.personOutline,
                  ),
                  title: Text(
                    'Me',
                    style: TextStyle(fontSize: 12.0),
                  )),
            ]),
        body: screen[screenIndex]);
  }
}
