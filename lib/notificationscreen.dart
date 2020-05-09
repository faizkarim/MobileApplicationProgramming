import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class NotificationScreen extends StatefulWidget {
  final List _notificationData;
  NotificationScreen(this._notificationData);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: ListView.builder(
                    itemCount: widget._notificationData.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: widget._notificationData[index].read
                                ? Colors.transparent
                                : Colors.lightBlue.withOpacity(0.08),
                            border: Border(
                              bottom: BorderSide(
                                  width: 1.0,
                                  color: Colors.black.withOpacity(0.05)),
                            )),
                        child: Dismissible(
                          direction: DismissDirection.endToStart,
                          secondaryBackground: null,
                          background: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                                width: 120,
                                height: MediaQuery.of(context).size.height,
                                color: Colors.red,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      EvaIcons.trash2,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      height: 2.0,
                                    ),
                                    Text('Delete',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'OpenSans'))
                                  ],
                                )),
                          ),
                          key: Key(widget._notificationData[index].text1),
                          onDismissed: (direction) {
                            setState(() {
                              widget._notificationData.removeAt(index);
                            });
                          },
                          child: ListTile(
                            dense: true,
                            onTap: () {
                              setState(() {
                                widget._notificationData[index].read = true;
                              });
                            },
                            title: Container(
                              margin: EdgeInsets.only(top: 10.0),
                              child: Text(
                                widget._notificationData[index].text1,
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
                                    widget._notificationData[index].text2,
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
                                        widget._notificationData[index].date,
                                        style: TextStyle(color: Colors.black38),
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Text(
                                        widget._notificationData[index].time,
                                        style: TextStyle(color: Colors.black38),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
