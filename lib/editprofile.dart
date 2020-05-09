import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'dart:async';

class Editprofile extends StatefulWidget {
  @override
  _EditprofileState createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Timer _timer;
  bool _absorber = false;

  createAlertDialog(BuildContext context) {
    Widget yesButton = FlatButton(
        child: Text("Yes"),
        onPressed: () {
          _displaySnackBar(context);
          Navigator.pop(context);
        });
    Widget noButton = FlatButton(
      child: Text("No"),
      onPressed: () => Navigator.of(context).pop(),
    );

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Confirm to edit your profile?"),
            actions: <Widget>[
              yesButton,
              noButton,
            ],
          );
        });
  }

  _displaySnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Row(
        children: <Widget>[
          Icon(EvaIcons.checkmarkCircle),
          SizedBox(
            width: 20.0,
          ),
          Text('Your profile has been updated'),
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

  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
              icon: Icon(
               EvaIcons.arrowBack,
                color: Colors.black,
              ),
              onPressed: () => Navigator.of(context).pop()),
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
        body: Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 0.0, 18.0, 0.0),
            child: AbsorbPointer(
              absorbing: _absorber,
              child: ListView(
                children: <Widget>[
                  Text(
                    'My Profile',
                    style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans'),
                  ),
                  SizedBox(height: 25.0),
                  CircleAvatar(
                    backgroundColor: Colors.grey.withOpacity(0.5),
                    radius: 60.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          EvaIcons.image,
                          size: 60,
                          color: Colors.white,
                        ),
                        Text(
                          'Change Photo',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              fontFamily: 'OpenSans'),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Form(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Text('Username',
                                  style: TextStyle(fontFamily: 'OpenSans')),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.8,
                              child: TextFormField(
                                decoration: InputDecoration(isDense: true),
                                initialValue: 'JohnDoe',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 25.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Text('Full Name',
                                  style: TextStyle(fontFamily: 'OpenSans')),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.8,
                              child: TextFormField(
                                initialValue: 'Muhammad John Bin Doe',
                                decoration: InputDecoration(isDense: true),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Text('Mobile',
                                  style: TextStyle(fontFamily: 'OpenSans')),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.8,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                initialValue: '0134716247',
                                decoration: InputDecoration(isDense: true),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Text('My Location',
                                  style: TextStyle(fontFamily: 'OpenSans')),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.8,
                              child: TextFormField(
                                initialValue: 'KTHO',
                                decoration: InputDecoration(isDense: true),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Text('Email',
                                  style: TextStyle(fontFamily: 'OpenSans')),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.8,
                              child: TextFormField(
                                initialValue: 'johdoe817@gmail.com',
                                decoration: InputDecoration(isDense: true),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                  )
                ],
              ),
            )));
  }
}
