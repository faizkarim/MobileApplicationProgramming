import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'dart:async';
import 'package:mobileapp/data/userDetails.dart';

class Editprofile extends StatefulWidget {
  final UserDetails userdetails;
  Editprofile(this.userdetails);
  @override
  _EditprofileState createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  TextEditingController username = new TextEditingController();
  TextEditingController fullname = new TextEditingController();
  TextEditingController mobile = new TextEditingController();
  TextEditingController location = new TextEditingController();
  TextEditingController email = new TextEditingController();
  String errormessage1, errormessage2, errormessage3, errormessage4, errormessage5;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Timer _timer;
  bool _absorber = false;

  void initState() {
    super.initState();
    username = TextEditingController(text: widget.userdetails.userName);
    fullname = TextEditingController(text: widget.userdetails.fullName);
    mobile = TextEditingController(text: widget.userdetails.phoneNo);
    location = TextEditingController(text: widget.userdetails.location);
    email = TextEditingController(text: widget.userdetails.email);
  }
  // createAlertDialog(BuildContext context) {
  //   Widget yesButton = FlatButton(
  //       child: Text("Yes"),
  //       onPressed: () {
  //         _displaySnackBar(context);
  //         Navigator.pop(context);
  //       });
  //   Widget noButton = FlatButton(
  //     child: Text("No"),
  //     onPressed: () => Navigator.of(context).pop(),
  //   );

  //   return showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           title: Text("Confirm to edit your profile?"),
  //           actions: <Widget>[
  //             yesButton,
  //             noButton,
  //           ],
  //         );
  //       });
  // }

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
              onPressed: () => Navigator.pop(context, null)),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                  icon: Icon(EvaIcons.checkmark, color: Colors.black),
                  onPressed: () {
                    if (username.text.isNotEmpty && fullname.text.isNotEmpty && mobile.text.isNotEmpty && location.text.isNotEmpty && email.text.isNotEmpty) {
                      setState(() {
                        widget.userdetails.userName = username.text;
                        widget.userdetails.fullName = fullname.text;
                        widget.userdetails.phoneNo = mobile.text;
                        widget.userdetails.location = location.text;
                        widget.userdetails.email = email.text;
                        Navigator.pop(context,widget.userdetails);
                      });
                    } else {
                      setState(() {
                        if(username.text.isEmpty)
                        errormessage1 = "Required field!";
                        if(fullname.text.isEmpty)
                          errormessage2 = "Required field!";
                        if(mobile.text.isEmpty)
                          errormessage3 = "Required field!";
                        if(location.text.isEmpty)
                          errormessage4 = "Required field!";
                        if(email.text.isEmpty)
                          errormessage5 = "Required field!";
                      });
                    } 
                  },
            )
            )],
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
                                controller: username,
                                
                                decoration: InputDecoration(isDense: true, errorText: errormessage1),
                                
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
                                controller: fullname,
                                
                                decoration: InputDecoration(isDense: true, errorText: errormessage2),
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
                                controller: mobile,
                                keyboardType: TextInputType.number,
                                
                                decoration: InputDecoration(isDense: true, errorText: errormessage3),
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
                                controller: location,
                                
                                decoration: InputDecoration(isDense: true, errorText: errormessage4),
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
                                controller: email,
                                
                                decoration: InputDecoration(isDense: true, errorText: errormessage5),
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
