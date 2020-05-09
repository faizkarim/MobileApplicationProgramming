import 'package:flutter/material.dart';
import './data/mockUserDetails.dart';

Color maincolor = Color(0xFFF1E90FF);
Color secondaryColor = Color(0xFFF3881E3);

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();

  String errormessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.blueAccent),
      ),
      body: SingleChildScrollView(
          child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width - 60,
              child: Column(
                children: <Widget>[
                  Image(image: AssetImage('assets/images/logo.png')),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 50.0,
                      ),
                      Text(
                        'Login',
                        style: TextStyle(
                            color: maincolor,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20.0,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 60,
                            child: TextField(
                              controller: username,
                              decoration: InputDecoration(
                                  errorText: errormessage,
                                  labelText: 'Username',
                                  labelStyle:
                                      TextStyle(fontFamily: 'OpenSans')),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 60,
                            child: TextField(
                              controller: password,
                              obscureText: true,
                              decoration: InputDecoration(
                                  errorText: errormessage,
                                  labelText: 'Password',
                                  labelStyle:
                                      TextStyle(fontFamily: 'OpenSans')),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.blueAccent),
                    child: FlatButton(
                      onPressed: () {
                        if (username.text == mockUserDetails[0].userName &&
                            password.text == mockUserDetails[0].password) {
                          print(username.text);
                          Navigator.pushReplacementNamed(
                              context, '/loaderspinnerscreen');
                        }
                        if (username.text.isEmpty) {
                          setState(() {
                            errormessage =
                                'Username or password cannot be empty';
                          });
                        } else {
                          setState(() {
                            errormessage = 'Invalid username or password';
                          });
                        }
                      },
                      child: Text(
                        'Login',
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
      )),
    );
  }
}
