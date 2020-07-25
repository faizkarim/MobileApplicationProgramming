import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:mobileapp/data/mockUserDetails.dart';
import 'package:mobileapp/data/userDetails.dart';
import 'package:mobileapp/settings.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:clip_shadow/clip_shadow.dart';

class ProfileScreen extends StatefulWidget {
  final UserDetails userdetails;
  ProfileScreen(this.userdetails);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _navigate() async {
    UserDetails returnData = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => Settings()));
    if (returnData != null) {
      setState(() => mockUserDetails[0] = returnData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          actions: <Widget>[
            Container(
                margin: EdgeInsets.only(right: 15.0),
                child: GestureDetector(
                  onTap: () => _navigate(),
                  child: Icon(EvaIcons.settings2Outline,
                      size: 30.0, color: Colors.white),
                )),
          ],
          leading: new Container(),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: MediaQuery.of(context).padding,
            child: Column(
              children: <Widget>[
                ClipShadow(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1.0,
                      offset: Offset(0.0, 5.0),
                      color: Colors.lightBlue.withOpacity(0.3),
                    )
                  ],
                  clipper: WaveClipperTwo(),
                  child: Container(
                    padding: EdgeInsets.only(bottom: 40.0),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.blueAccent, Colors.lightBlue]),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 60.0,
                          backgroundImage:
                              mockUserDetails[0].profileImage == null
                                  ? null
                                  : FileImage(mockUserDetails[0].profileImage),
                          backgroundColor: Colors.white.withOpacity(0.2),
                          child: mockUserDetails[0].profileImage != null ||
                                  widget.userdetails.profileImage != null
                              ? Container()
                              : Icon(
                                  EvaIcons.image,
                                  size: 60,
                                  color: Colors.white,
                                ),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Text(
                                mockUserDetails[0].userName,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'OpenSans'),
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Container(
                                child: Text(
                              mockUserDetails[0].fullName,
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'OpenSans'),
                            )),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(18.0),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 60.0,
                            width: 60.0,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0)),
                              elevation: 3.0,
                              child: Icon(
                                EvaIcons.navigation2,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 126,
                            child: Text(
                              mockUserDetails[0].location,
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 17.0,
                                  fontFamily: 'OpenSans'),
                              maxLines: 5,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Divider(),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            height: 60.0,
                            width: 60.0,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0)),
                              elevation: 3.0,
                              child: Icon(
                                EvaIcons.messageSquare,
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 126,
                            child: Text(
                              mockUserDetails[0].email,
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 17.0,
                                  fontFamily: 'OpenSans'),
                              maxLines: 5,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Divider(),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            height: 60.0,
                            width: 60.0,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0)),
                              elevation: 3.0,
                              child: Icon(
                                EvaIcons.phone,
                                color: Colors.greenAccent,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 126,
                            child: Text(
                              mockUserDetails[0].phoneNo,
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 17.0,
                                  fontFamily: 'OpenSans'),
                              maxLines: 5,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Container(
                //   padding: EdgeInsets.all(18.0),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: <Widget>[
                //       RichText(
                //         text: TextSpan(children: <InlineSpan>[
                //           WidgetSpan(
                //             child: Container(
                //               child: Icon(FontAwesomeIcons.mapMarkerAlt),
                //             ),
                //           ),
                //           WidgetSpan(
                //               child: SizedBox(
                //             width: 30.0,
                //           )),
                //           TextSpan(
                //             text:
                //                 'Kolej Tun Hussein Onn,Universiti Teknologi Malaysia,Johor',
                //           )
                //         ], style: TextStyle(color: Colors.black26)),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ));
  }
}
