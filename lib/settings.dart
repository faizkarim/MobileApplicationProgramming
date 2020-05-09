import 'package:flutter/material.dart';
import 'package:mobileapp/data/mockUserDetails.dart';
import 'package:mobileapp/data/userDetails.dart';
import 'editprofile.dart';
import 'notifications.dart';
import 'display.dart';
import 'changepassword.dart';
import 'aboutapp.dart';
import 'firstScreen.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';// import 'dart:io';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {

//     return ChangeNotifierProvider<ThemeChanger>(
//       create: (_) => ThemeChanger(ThemeData.light()),
//           child: MaterialAppWithTheme(),
//     );
//   }
// }

// class MaterialAppWithTheme extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     // final theme = Provider.of<ThemeChanger>(context);
//     return MaterialApp(
//         title: 'Settings',
//         home: Settings(title: 'Settings'),
//         // theme: theme.getTheme(),
//       );
//   }
// }

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  createExitDialog(BuildContext context) {
    Widget yesButton = FlatButton(
        child: Text("Yes"),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => FirstScreen()));
        });
    Widget noButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () => Navigator.pop(context),
    );

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Logout from this account?"),
            actions: <Widget>[
              yesButton,
              noButton,
            ],
          );
        });
  }

  void _navigate() async {
    UserDetails returnData = await Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => Editprofile(UserDetails.copy(mockUserDetails[0]))
      ),
    );
    if (returnData != null) {
      setState(() => mockUserDetails[0] = returnData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        leading: IconButton(
            icon: Icon(
              EvaIcons.arrowBack,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context,mockUserDetails[0])),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Settings',
              style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans'),
            ),
            const SizedBox(height: 20.0),
            Container(
                child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    EvaIcons.personOutline,
                    color: Colors.blueAccent,
                  ),
                  title: Text(
                    "Edit Profile",
                    style: TextStyle(fontFamily: 'OpenSans'),
                  ),
                  trailing: Icon(EvaIcons.chevronRight),
                  onTap: () => _navigate(),
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    EvaIcons.lockOutline,
                    color: Colors.blueAccent,
                  ),
                  title: Text(
                    "Change Password",
                    style: TextStyle(fontFamily: 'OpenSans'),
                  ),
                  trailing: Icon(EvaIcons.chevronRight),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Changepassword()));
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    EvaIcons.bellOutline,
                    color: Colors.blueAccent,
                  ),
                  title: Text(
                    "Notifications",
                    style: TextStyle(fontFamily: 'OpenSans'),
                  ),
                  trailing: Icon(EvaIcons.chevronRight),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Notifications()));
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    EvaIcons.bulbOutline,
                    color: Colors.blueAccent,
                  ),
                  title: Text(
                    "Display",
                    style: TextStyle(fontFamily: 'OpenSans'),
                  ),
                  trailing: Icon(EvaIcons.chevronRight),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Display()));
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    EvaIcons.infoOutline,
                    color: Colors.blueAccent,
                  ),
                  title: Text(
                    "About UniSell",
                    style: TextStyle(fontFamily: 'OpenSans'),
                  ),
                  trailing: Icon(EvaIcons.chevronRight),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Aboutapp()));
                  },
                ),
                Divider(),
                ListTile(
                    leading: Icon(
                      EvaIcons.logOutOutline,
                      color: Colors.blueAccent,
                    ),
                    title: Text(
                      "Logout",
                      style: TextStyle(fontFamily: 'OpenSans'),
                    ),
                    trailing: Icon(EvaIcons.chevronRight),
                    onTap: () {
                      createExitDialog(context);
                    })
              ],
            )),
          ],
        ),
      ),
    );
  }
}
