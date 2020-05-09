import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'dart:async';

class Changepassword extends StatefulWidget {
  @override
  _ChangepasswordState createState() => _ChangepasswordState();
}

class _ChangepasswordState extends State<Changepassword> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Timer _timer;
  bool _absorber = false;

  _displaySnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Row(
        children: <Widget>[
          Icon(EvaIcons.checkmarkCircle),
          SizedBox(
            width: 20.0,
          ),
          Text('Your password has been change'),
        ],
      ),
      backgroundColor: Colors.blueAccent,
      duration: Duration(seconds: 2),
      // behavior: SnackBarBehavior.floating,
      onVisible: () {
        setState(() {
          _absorber = true;
        });
        _timer = new Timer(const Duration(seconds: 2), () {
          Navigator.pop(context);
        });
      },
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  createAlertDialog(BuildContext context) {
    Widget yesButton = FlatButton(
      child: Text("Yes"),
      onPressed: () {
        _displaySnackBar(context);
        Navigator.pop(context);
      },
    );
    Widget noButton = FlatButton(
      child: Text("No"),
      onPressed: () => Navigator.of(context).pop(),
    );

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Are you sure that you want to change your password?"),
            actions: <Widget>[
              yesButton,
              noButton,
            ],
          );
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 0,
          brightness: Brightness.light,
           leading: IconButton(
              icon: Icon(
                EvaIcons.arrowBack,
                color: Colors.black,
              ),
              onPressed: () => Navigator.of(context).pop()),
          backgroundColor: Colors.transparent,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                  icon: Icon(EvaIcons.checkmark, color: Colors.black),
                  onPressed: () {
                    createAlertDialog(context);
                  }),
            )
          ],
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.fromLTRB(18.0, 0.0, 18.0, 0.0),
          child: AbsorbPointer(
              absorbing: _absorber,
              child: ListView(children: <Widget>[
                Text(
                  'Change Password',
                  style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans'),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                    child: Form(
                        child: Column(
                  children: <Widget>[
                    TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: 'Current Password',
                            hintStyle: TextStyle(fontFamily: 'OpenSans'))),
                    SizedBox(height: 20.0),
                    TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: 'New Password',
                            hintStyle: TextStyle(fontFamily: 'OpenSans'))),
                    SizedBox(height: 20.0),
                    TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: 'Confirm new password',
                            hintStyle: TextStyle(fontFamily: 'OpenSans'))),
                  ],
                ))),
              ])),
        ));
  }
}
