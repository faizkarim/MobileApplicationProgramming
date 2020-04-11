import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class ItemDetailsPage extends StatefulWidget {
  @override
  _ItemDetailsPageState createState() => _ItemDetailsPageState();
}

int count = 0;

class _ItemDetailsPageState extends State<ItemDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 15.0),
            child: Icon(Icons.more_vert),
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Container(
          margin: MediaQuery.of(context).padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new Container(
                height: 300.0,
                width: MediaQuery.of(context).size.width,
                decoration: new BoxDecoration(
                  image: DecorationImage(
                      image: new AssetImage('assets/images/item1.jpg'),
                      fit: BoxFit.fill),
                  shape: BoxShape.rectangle,
                  //border: Border.all(width: 1.0, color: Colors.black)
                ),
              ),
              new Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        'Hyper x Fury DDR',
                        style: new TextStyle(fontSize: 20.0),
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      new Text(
                        'RM 480',
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold),
                      ),
                      new Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new SizedBox(height: 15.0),
                            Row(
                              children: <Widget>[
                                Icon(
                                  EvaIcons.clockOutline,
                                  color: Colors.black38,
                                ),
                                SizedBox(width: 5.0),
                                Text(
                                  '1 week ago by johndoe817',
                                  style: TextStyle(color: Colors.black54),
                                )
                              ],
                            ),
                            new SizedBox(height: 15.0),
                            Row(
                              children: <Widget>[
                                Icon(
                                  EvaIcons.heartOutline,
                                  color: Colors.black38,
                                ),
                                SizedBox(width: 5.0),
                                Text(
                                  '12 Likes',
                                  style: TextStyle(color: Colors.blueAccent),
                                )
                              ],
                            ),
                            new SizedBox(height: 15.0),
                            Row(
                              children: <Widget>[
                                Icon(
                                  EvaIcons.gridOutline,
                                  color: Colors.black38,
                                ),
                                SizedBox(width: 5.0),
                                Text(
                                  'in Electronics',
                                  style: TextStyle(color: Colors.black54),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              new Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(18.0, 0.0, 18.0, 0.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Divider(),
                      new Text('Item Description',
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                              fontFamily: 'OpenSans')),
                      SizedBox(height: 10.0),
                      new Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: new BoxDecoration(
                            //border: Border.all(width: 1.0, color: Colors.black)
                            ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            new Expanded(
                              child: Text(
                                  'Sepasang SSD untuk diletgo condition mantap area utm sahaja',
                                  style: new TextStyle(
                                      color: Colors.black87,
                                      fontSize: 15.0,
                                      fontFamily: 'OpenSans')),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Divider(),
                      new Text('Getting This',
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                              fontFamily: 'OpenSans')),
                      SizedBox(height: 10.0),
                      new Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(
                                  EvaIcons.peopleOutline,
                                  color: Colors.black38,
                                ),
                                SizedBox(width: 10.0),
                                Text(
                                  'Meet Up',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontFamily: 'OpenSans'),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  EvaIcons.pinOutline,
                                  color: Colors.black38,
                                ),
                                SizedBox(width: 10.0),
                                Text(
                                  'Arked Meranti',
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontFamily: 'OpenSans'),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      new Divider(),
                      Container(
                        child: new Text('Meet The Seller',
                            style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                              fontSize: 22.0,
                            )),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      new Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 80,
                              height: 80,
                              child: CircleAvatar(
                                backgroundColor: Colors.grey,
                              ),
                            ),
                            new Container(
                              margin: EdgeInsets.only(left: 15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new Text('johndoe817 ',
                                      style: new TextStyle(
                                          color: Colors.blueAccent,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'OpenSans',
                                          fontSize: 20.0)),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  new Text('019-5643245',
                                      style: new TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15.0,
                                          fontFamily: 'OpenSans')),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  new Text('albab@gmail.com',
                                      style: new TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15.0,
                                          fontFamily: 'OpenSans')),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.fromLTRB(18.0, 0.0, 18.0, 0.0),
          height: 60.0,
          width: MediaQuery.of(context).size.width,
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: <
              Widget>[
            Container(
                child: GestureDetector(
              onTap: () {
                setState(() {
                  if (count == 0) {
                    count = 1;
                  } else {
                    count = 0;
                  }
                });
              },
              child: Icon(
                count == 0 ? EvaIcons.heartOutline : EvaIcons.heart,
                color: count == 0 ? Colors.black38 : Colors.red,
                size: 30,
              ),
            )),
            Container(
              width: MediaQuery.of(context).size.width - 66,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new Container(
                    width: 90.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.transparent,
                      border: Border.all(width: 1.0, color: Colors.grey),
                    ),
                    child: new OutlineButton(
                      onPressed: () {},
                      child: Text('Chat',
                          style:
                              TextStyle(fontSize: 15.0, color: Colors.black)),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  new Container(
                    width: 150.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.blueAccent,
                      border: Border.all(width: 1.0, color: Colors.transparent),
                    ),
                    child: new FlatButton(
                      onPressed: () {},
                      child: Text('Make Offer',
                          style:
                              TextStyle(fontSize: 15.0, color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
