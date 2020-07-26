import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class Changepassword extends StatefulWidget {
  get _userData => null;

  
  @override
  _ChangepasswordState createState() => _ChangepasswordState();
}

class _ChangepasswordState extends State<Changepassword> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Timer _timer;
  bool _absorber = false;
  String _currentPass;
  TextEditingController _newPass = new TextEditingController();
  String _confirmNewPass;
  bool _autoValidate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime now;
  var dateTime;
  String formattedDate;

  @override
  void initState() {
    super.initState();
    now = DateTime.now();
    formattedDate = DateFormat('dd-MM-yyyy / kk:mm').format(now);
    print(formattedDate);
    dateTime = formattedDate.toString().split("/");
    print(dateTime[0]);
  }

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
        _timer = new Timer(const Duration(seconds: 2), () {});
      },
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  _validateInputs() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      setState(() {
        widget._userData.password = _newPass.text;
      });

      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
      // Notifications notifications = new Notifications(
      //     'Password Changed',
      //     'Your password has succesfully change',
      //     dateTime[0],
      //     dateTime[1],
      //     false);
      // mockNotification.add(notifications);

      _displaySnackBar(context);
      await Future.delayed(Duration(seconds: 2));
      Navigator.pop(context, widget._userData);
    } else {
      return null;
    }
  }

  String validateCurrentPass(String value) {
    if (value.isEmpty)
      return 'Current Password cannot be blank';
    else if (value != widget._userData.password)
      return 'Current password does not match';
    else
      return null;
  }

  String validateNewPass(String value) {
    if (value.isEmpty)
      return 'New Password cannot be blank';
    else if (value.length < 6)
      return 'Password must be 6 characters or more';
    else
      return null;
  }

  String validateConfirmPass(String value) {
    if (value.isEmpty)
      return 'Confirm Password cannot be blank';
    else if (value != _newPass.text)
      return 'Password does not match';
    else
      return null;
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
              onPressed: () => Navigator.pop(context)),
          backgroundColor: Colors.transparent,
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: IconButton(
                  icon: Icon(EvaIcons.checkmark, color: Colors.black),
                  onPressed: _validateInputs,
                ))
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
                        autovalidate: _autoValidate,
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                                validator: validateCurrentPass,
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: 'Current Password',
                                    hintStyle:
                                        TextStyle(fontFamily: 'OpenSans'))),
                            SizedBox(height: 20.0),
                            TextFormField(
                                validator: validateNewPass,
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: 'New Password',
                                    hintStyle:
                                        TextStyle(fontFamily: 'OpenSans'))),
                            SizedBox(height: 20.0),
                            TextFormField(
                                validator: validateConfirmPass,
                                onChanged: (val) {
                                  setState(() {
                                    _newPass = TextEditingController(text: val);
                                  });
                                },
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: 'Confirm new password',
                                    hintStyle:
                                        TextStyle(fontFamily: 'OpenSans'))),
                          ],
                        ))),
              ])),
        ));
  }
}

