import 'package:flutter/material.dart';
import './data/mockUserDetails.dart';
import './data/userDetails.dart';
import 'editprofile.dart';
import 'modal/userModal.dart';
import 'notifications.dart';
import 'display.dart';
import 'changepassword.dart';
import 'aboutapp.dart';
import 'firstScreen.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';


class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}
Future<User> editUser;
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
          builder: (context) =>
              Editprofile()),
    );
    if (returnData != null) {
      setState(() => mockUserDetails[0] = returnData);
      print(returnData.profileImage);
    }
    else{
      print('object');
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
            onPressed: () => Navigator.pop(context)),
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
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Editprofile())),
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
                    onTap:()=> Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Changepassword())),
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
