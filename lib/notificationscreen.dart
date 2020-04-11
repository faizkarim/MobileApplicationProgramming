import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 18.0),
                child: Text(
                  'Notification',
                  style: TextStyle(
                    fontSize: 32.0,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              //notifications start here
              Container(
                padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(
                      width: 1.0, color: Colors.black.withOpacity(0.05)),
                )),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                        left: 18.0,
                      ),
                      child: CircleAvatar(
                        child: Text(
                          'U',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 100.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Welcome New User',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'OpenSans'),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            'The company’s welcome message follows the same strategy as Drift’s.Instead of driving new users toward product tutorials, this email’s primary CTAs are the five recommended blog posts.',
                            style: TextStyle(
                                fontFamily: 'OpenSans', color: Colors.black54),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.access_time,
                                size: 15.0,
                                color: Colors.black38,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                '31-2-2020',
                                style: TextStyle(color: Colors.black38),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                '20:10',
                                style: TextStyle(color: Colors.black38),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    border: Border(
                      bottom: BorderSide(
                          width: 1.0, color: Colors.black.withOpacity(0.05)),
                    )),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                        left: 18.0,
                      ),
                      child: CircleAvatar(
                        child: Text(
                          'U',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 100.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Lets get Started!',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            'The company’s welcome message follows new primary CTAs are the five recommended blog posts.',
                            style: TextStyle(
                                fontFamily: 'OpenSans', color: Colors.black54),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.access_time,
                                size: 15.0,
                                color: Colors.black38,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                '31-2-2020',
                                style: TextStyle(color: Colors.black38),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                '20:10',
                                style: TextStyle(color: Colors.black38),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
