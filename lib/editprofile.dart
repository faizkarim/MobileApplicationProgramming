import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import './services/user_services.dart';
import 'dart:async';
import 'modal/userModal.dart';

class Editprofile extends StatefulWidget {
  final User user;
  Editprofile(this.user);
  @override
  _EditprofileState createState() => _EditprofileState();
}
Future<User> editUser;

class _EditprofileState extends State<Editprofile> {
  TextEditingController username = new TextEditingController();
  TextEditingController fullname = new TextEditingController();
  TextEditingController mobile = new TextEditingController();
  TextEditingController location = new TextEditingController();
  TextEditingController email = new TextEditingController();
  bool _autoValidate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _absorber = false;
  bool _isChanged = false;
  File imageFile;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  _validateInputs() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      _absorber = !_absorber;
      setState(() {
        User updateInfo = new User(
          userName: username.text,
          email: email.text,
          fullName: fullname.text,
          phoneNo: mobile.text,
          location: location.text,
        );
        UserService().updateUser(id: widget.user.id,u: updateInfo);
      });

      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }

      _scaffoldKey.currentState.showSnackBar(snackBar);
      await Future.delayed(Duration(seconds: 2));
      Navigator.pop(context);
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  final snackBar = SnackBar(
    backgroundColor: Colors.blueAccent,
    content: Row(
      children: <Widget>[
        Icon(EvaIcons.checkmarkCircle),
        SizedBox(
          width: 20.0,
        ),
        Text('Your profile succesfully been update'),
      ],
    ),
  );

  String validateUsername(String value) {
    if (value.isEmpty)
      return 'Username cannot be blank';
    else if (value.length < 6)
      return 'Username must be 6 characters or more';
    else
      return null;
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  String validatePhone(String value) {
    if (!(value.length >= 10 && value.length <= 11))
      return 'Please enter a valid phone number';
    else
      return null;
  }

  String validateFullName(String value) {
    if (value.isEmpty)
      return 'Full Name cannot be blank';
    else
      return null;
  }

  String validateLocation(String value) {
    if (value.isEmpty)
      return 'Location cannot be blank';
    else
      return null;
  }

  

  final validbar = SnackBar(
      backgroundColor: Colors.blueAccent,
      content: Row(
        children: <Widget>[
          Icon(EvaIcons.checkmarkCircle2Outline),
          SizedBox(
            width: 10.0,
          ),
          Text('Your profile succesfully been update')
        ],
      ));

  @override
  void initState() {
    super.initState();
    editUser = UserService().getUser(id: widget.user.id);
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
                  onPressed: _validateInputs,
                ))
          ],
        ),
        body: FutureBuilder(
          future: editUser,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData)
            return Padding(
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
                      SizedBox(height: 20.0),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Form(
                            key: _formKey,
                            autovalidate: _autoValidate,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  height: 50.0,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        child: Text('Username',
                                            style:
                                                TextStyle(fontFamily: 'OpenSans')),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width / 1.8,
                                        child: TextFormField(
                                          validator: validateUsername,
                                          controller: username = TextEditingController(text: snapshot.data.userName),
                                          decoration: InputDecoration(
                                            isDense: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 15.0),
                                Container(
                                  height: 50.0,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        child: Text('Full Name',
                                            style:
                                                TextStyle(fontFamily: 'OpenSans')),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width / 1.8,
                                        child: TextFormField(
                                          validator: validateFullName,
                                          controller: fullname  = TextEditingController(text: snapshot.data.fullName),
                                          decoration: InputDecoration(
                                            isDense: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Container(
                                  height: 50.0,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        child: Text('Mobile',
                                            style:
                                                TextStyle(fontFamily: 'OpenSans')),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width / 1.8,
                                        child: TextFormField(
                                          validator: validatePhone,
                                          controller: mobile = TextEditingController(text: snapshot.data.phoneNo),
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            isDense: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  height: 60.0,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        child: Text('Location',
                                            style:
                                                TextStyle(fontFamily: 'OpenSans')),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width / 1.8,
                                        child: DropdownButtonFormField<String>(
                                          style: TextStyle(color: Colors.black),
                                          isDense: true,
                                          items: <String>[
                                            'Kolej Tun Hussin Onn',
                                            'Kolej Tun Dr. Ismail',
                                            'Kolej Tun Razak',
                                            'Kolej Tuanku Canselor',
                                            'Kolej Tun Fatimah',
                                            'Kolej 9 & 10',
                                            'Kolej Rahman Putra',
                                            'Kolej Datin Seri Endon',
                                            'Kolej Dato Onn Jaafar',
                                            'Kolej Kediaman Siswa Jaya',
                                            'Kolej Perdana',
                                          ].map((String value) {
                                            return new DropdownMenuItem<String>(
                                              value: value,
                                              child: new Text(value),
                                            );
                                          }).toList(),
                                          decoration: InputDecoration(
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.grey.withOpacity(0.8),
                                              ),
                                            ),
                                          ),
                                          hint: Text(snapshot.data.location),
                                          onSaved: (value) {
                                            if(_isChanged)
                                              location.text = value;
                                            else
                                              location.text = snapshot.data.location;
                                          },
                                          onChanged: (newValue) {
                                            _isChanged = true;
                                            this.setState(() {
                                              location.text = newValue;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              height: 50.0,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    child: Text('Email',
                                        style:
                                            TextStyle(fontFamily: 'OpenSans')),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.8,
                                    child: TextFormField(
                                      validator: validateEmail,
                                      controller: email = TextEditingController(text: snapshot.data.email),
                                      decoration: InputDecoration(
                                        isDense: true,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                              ],
                            )),
                      )
                    ],
                  ),
                ));
          else{
            return SpinKitFoldingCube(
                          color: Colors.blueAccent,
                          size: 30.0,
                        );
          }
          }
        ));
  }
}
