import 'package:flutter/material.dart';
import './modal/notificationModal.dart';
import './services/notification_services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

Future<List<Notifications>> notificationsFuture;

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    super.initState();
    notificationsFuture = NotificationService().getAllNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            this.setState(() {
              notificationsFuture = NotificationService().getAllNotifications();
            });
          }),
      body: Container(
        padding: EdgeInsets.only(top: 18.0),
        margin: MediaQuery.of(context).padding,
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
            //notifications start here
            Expanded(
              child: FutureBuilder(
                future: notificationsFuture,
                builder: (BuildContext context, AsyncSnapshot s) {
                  var n = s.data;

                  return s.hasData
                      ? ListView.builder(
                          itemCount: n.length,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: n[index].read
                                      ? Colors.transparent
                                      : Colors.lightBlue.withOpacity(0.08),
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 1.0,
                                        color: Colors.black.withOpacity(0.05)),
                                  )),
                              child: ListTile(
                                dense: true,
                                onLongPress: () {
                                  // NotificationService()
                                  //     .deleteNotifications(id: n[index].id);
                                },
                                onTap: () {
                                  setState(() {
                                    if (n[index].read == false) {
                                      NotificationService().updateNotifications(
                                          id: n[index].id, read: n[index].read);
                                    }
                                  });
                                },
                                title: Container(
                                  margin: EdgeInsets.only(top: 10.0),
                                  child: Text(
                                    n[index].text1,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'OpenSans'),
                                  ),
                                ),
                                contentPadding:
                                    EdgeInsets.only(left: 16.0, right: 16.0),
                                leading: CircleAvatar(
                                  child: Text(
                                    'U',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.grey.withOpacity(0.5),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        n[index].text2,
                                        style: TextStyle(
                                            fontFamily: 'OpenSans',
                                            color: Colors.black54),
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 10.0),
                                      child: Row(
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
                                            n[index].date,
                                            style: TextStyle(
                                                color: Colors.black38),
                                          ),
                                          SizedBox(
                                            width: 5.0,
                                          ),
                                          Text(
                                            n[index].time,
                                            style: TextStyle(
                                                color: Colors.black38),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })
                      : SpinKitFoldingCube(
                          color: Colors.blueAccent,
                          size: 30.0,
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
