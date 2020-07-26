import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


Color maincolor = Color(0xFFF1E90FF);
Color secondaryColor = Color(0xFFF3881E3);
Color tertiaryColor = Color(0xFFF084177);

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}
  
class _LoginState extends State<Login> {
  final formKey = new GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _email;
  String _password;
  String errorMessage;
 
  bool saveForm() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;

    }
  }

  void submitForm() async{
    if (saveForm()) {
      try {
        FirebaseUser user = (await _auth.signInWithEmailAndPassword(email: _email, password: _password)).user;
        print('Signed in: ${user.uid}');
        Navigator.pushReplacementNamed(context, '/loaderspinnerscreen');
      }
      catch (e) {
        setState(() {
          errorMessage = "Invalid email or password";
        });
      }
    }
  }
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
        child: Form(
          key: formKey,
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
                              child: TextFormField(
                                key: new Key('email'),
                                validator: (value) => value.isEmpty ? 'Email cannot be empty' : null,
                                onSaved: (value) => _email = value.trim(),
                                autocorrect: false,
                                decoration: InputDecoration(
                                    errorText: errorMessage,
                                    labelText: 'Email',
                                    labelStyle:
                                        TextStyle(fontFamily: 'OpenSans')),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 60,
                              child: TextFormField(
                                key: new Key('password'),
                                validator: (value) => value.isEmpty ? 'Password cannot be empty' : null,
                                onSaved: (value) => _password = value,
                                obscureText: true,
                                autocorrect: false,
                                
                                decoration: InputDecoration(
                                    errorText: errorMessage,
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
                        onPressed: submitForm,
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
        ),
      )),
    );
  }
}

