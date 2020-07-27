import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:mobileapp/services/user_services.dart';
import 'firstScreen.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import './services/user_services.dart';
import './modal/userModal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Color maincolor = Color(0xFFF1E90FF);
Color secondaryColor = Color(0xFFF3881E3);
Color tertiaryColor = Color(0xFFF084177);

class Register extends StatefulWidget {
  @override
  RegisterState createState() {
    return new RegisterState();
  }
}

class RegisterState extends State<Register> {
  static String _id;
  static String _username;
  static String _fullname;
  static String _email;
  static String _phone;
  static String _location = "Location";
  static String _password;
  
  bool _autoValidate = false;
  bool _absorber = false;
  final CollectionReference postsRef = Firestore.instance.collection('/users');
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Timer _timer;
  

  _displaySnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Row(
        children: <Widget>[
          Icon(EvaIcons.checkmarkCircle),
          SizedBox(
            width: 20.0,
          ),
          Text('Your account succesfully been created'),
        ],
      ),
      backgroundColor: Colors.blueAccent,
      duration: Duration(seconds: 3),
      // behavior: SnackBarBehavior.floating,

      onVisible: () {
        setState(() {
          _absorber = true;
        });
        _timer = new Timer(const Duration(seconds: 3), () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => FirstScreen()));
        });
      },
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  _validateInputs() async{
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        FirebaseUser user = (await _auth.createUserWithEmailAndPassword(email: _email, password: _password)).user;
        print('Registered user : ${user.uid}');
        _id = user.uid;
        print(_id);
        print(_username);
        print(_fullname);
        print(_phone);
        print(_location);
        print(_email);
      }
      catch (e) {
        print('Error: $e');
      }
      User newUser = User(
        id: _id,
        userName: _username,
        fullName: _fullname,
        phoneNo: _phone,
        location: _location,
        email: _email,
      );
      await postsRef.document(_id).setData(newUser.toJson());
      //UserService().addUser(user: newUser);
      _displaySnackBar(context);
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  String validateUsername(String value) {
    if (value.isEmpty)
      return 'Username cannot be blank';
    else if (value.length < 6)
      return 'Username must be 6 characters or more';
    else
      return null;
  }

   String validateFullname(String value) {
    if (value.isEmpty)
      return 'Full name cannot be blank';
    else
      return null;
  }

  String validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password cannot be blank';
    } else if (value.length < 6)
      return 'Password must be 6 characters or more';
    else
      return null;
  }

  String validatePhone(String value) {
    if (value.isEmpty)
      return 'Phone number cannot be blank';
    else if (!(value.length >= 10 && value.length <= 11))
      return 'Please enter a valid phone number';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.blueAccent),
      ),
      body: SingleChildScrollView(
          child: AbsorbPointer(
              absorbing: _absorber,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width - 60,
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 50.0,
                              ),
                              Text(
                                'Register',
                                style: TextStyle(
                                    color: maincolor,
                                    fontFamily: 'Ubuntu',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Form(
                                key: _formKey,
                                autovalidate: _autoValidate,
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 15.0,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          60,
                                      child: TextFormField(
                                        validator: validateUsername,
                                        onSaved: (String val) {
                                          setState(() {
                                            _username = val;
                                          });
                                        },
                                        decoration: InputDecoration(
                                            labelText: 'Username',
                                            labelStyle: TextStyle(
                                                fontFamily: 'Ubuntu')),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15.0,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          60,
                                      child: TextFormField(
                                        validator: validateFullname,
                                        onSaved: (String val) {
                                          setState(() {
                                            _fullname = val;
                                          }); 
                                        },
                                        decoration: InputDecoration(
                                            labelText: 'Full Name',
                                            labelStyle: TextStyle(
                                                fontFamily: 'Ubuntu')),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15.0,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          60,
                                      child: TextFormField(
                                        validator: validateEmail,
                                        onSaved: (String val) {
                                          setState(() {
                                            _email = val;
                                          });
                                        },
                                        
                                        decoration: InputDecoration(
                                            labelText: 'Email',
                                            labelStyle: TextStyle(
                                                fontFamily: 'Ubuntu')),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15.0,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          60,
                                      child: TextFormField(
                                        validator: validatePassword,
                                        onSaved: (String val) {
                                          setState(() {
                                            _password = val;
                                          });
                                        },
                                        obscureText: true,
                                        decoration: InputDecoration(
                                            labelText: 'Password',
                                            labelStyle: TextStyle(
                                                fontFamily: 'Ubuntu')),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15.0,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          60,
                                      child:
                                          new DropdownButtonFormField<String>(
                                        isDense: true,
                                        isExpanded: true,
                                        validator: (value) => value == null
                                            ? 'Location cannot be blank'
                                            : null,
                                        items: <String>[
                                          'Kolej Tun Hussin Onn (KTHO)',
                                          'Kolej Tun Dr. Ismail (KTDI)',
                                          'Kolej Tun Razak (KTR)',
                                          'Kolej Tuanku Canselor (KTC)',
                                          'Kolej Tun Fatimah (KTF)',
                                          'Kolej 9 & 10 (K9/K10)',
                                          'Kolej Rahman Putra (KRP)',
                                          'Kolej Datin Seri Endon (KDSE)',
                                          'Kolej Dato Onn Jaafar (KDOJ)',
                                          'Kolej Kediaman Siswa Jaya (KKSJ)',
                                          'Kolej Perdana (KP)',
                                        ].map((String value) {
                                          return new DropdownMenuItem<String>(
                                            value: value,
                                            child: new Text(value),
                                          );
                                        }).toList(),
                                        decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  Colors.grey.withOpacity(0.8),
                                            ),
                                          ),
                                        ),
                                        hint: Text(_location),
                                        onChanged: (newValue) {
                                          this.setState(() {
                                            _location = newValue;
                                          });
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15.0,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          60,
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        validator: validatePhone,
                                        onSaved: (String val) {
                                          setState(() {
                                            _phone = val;
                                          });
                                        },
                                        decoration: InputDecoration(
                                            labelText: 'Phone Number',
                                            labelStyle: TextStyle(
                                                fontFamily: 'Ubuntu')),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
      
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.blueAccent),
                            child: FlatButton(
                              onPressed: _validateInputs,
                              child: Text(
                                'Create Account',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}

