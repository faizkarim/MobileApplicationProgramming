import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'dart:async';
import 'package:mobileapp/data/userDetails.dart';
import 'package:image_picker/image_picker.dart';

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
  bool _autoValidate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _absorber = false;
  File imageFile;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  _validateInputs() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      _absorber = !_absorber;
      setState(() {
        widget.userdetails.profileImage = widget.userdetails.profileImage;
        widget.userdetails.userName = username.text;
        widget.userdetails.fullName = fullname.text;
        widget.userdetails.phoneNo = mobile.text;
        widget.userdetails.location = location.text;
        widget.userdetails.email = email.text;
      });

      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }

      _scaffoldKey.currentState.showSnackBar(snackBar);
      await Future.delayed(Duration(seconds: 2));
      Navigator.pop(context, widget.userdetails);
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
    username = TextEditingController(text: widget.userdetails.userName);
    fullname = TextEditingController(text: widget.userdetails.fullName);
    mobile = TextEditingController(text: widget.userdetails.phoneNo);
    location = TextEditingController(text: widget.userdetails.location);
    email = TextEditingController(text: widget.userdetails.email);
  }

  profileImage() {
    if (widget.userdetails.profileImage != null) {
      return FileImage(widget.userdetails.profileImage);
    } else if (imageFile == null) {
      return null;
    } else {
      return FileImage(imageFile);
    }
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
                  GestureDetector(
                    onTap: () async {
                      var picture = await ImagePicker.pickImage(
                          source: ImageSource.gallery);
                      // Directory picDir = await getApplicationDocumentsDirectory();
                      // path = picDir.uri.resolve('assets/images/picture.jpg').path;
                      // file = await picture.copy(path);
                      setState(() {
                        imageFile = picture;
                        widget.userdetails.profileImage = imageFile;
                      });
                    },
                    child: Align(
                      child: CircleAvatar(
                        backgroundImage: profileImage(),
                        backgroundColor: Colors.grey.withOpacity(0.5),
                        radius: 60.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            imageFile != null ||
                                    widget.userdetails.profileImage != null
                                ? Container()
                                : Icon(
                                    EvaIcons.image,
                                    size: 60,
                                    color: Colors.white,
                                  ),
                            imageFile != null ||
                                    widget.userdetails.profileImage != null
                                ? Container()
                                : Text(
                                    'Change Photo',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.0,
                                        fontFamily: 'OpenSans'),
                                  )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
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
                                      controller: username,
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
                                      controller: fullname,
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
                                      controller: mobile,
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
                                    child: Text('My Location',
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
                                      hint: Text(location.text),
                                      onChanged: (newValue) {
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
                                      controller: email,
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
            )));
  }
}
