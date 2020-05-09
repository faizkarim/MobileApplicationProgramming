import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class ListingScreen extends StatefulWidget {
  final List _itemData;
  ListingScreen(this._itemData);

  @override
  _ListingScreenState createState() => _ListingScreenState();
}

class _ListingScreenState extends State<ListingScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - 24) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
      body: Container(
          margin: MediaQuery.of(context).padding,
          padding: EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'My Listing',
                style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans'),
              ),
              Expanded(
                child: GridView.builder(
                    itemCount: widget._itemData.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: itemWidth / itemHeight,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 180.0,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: widget._itemData[index].itemImg ==
                                              null
                                          ? Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.broken_image,
                                                    color: Colors.grey,
                                                  ),
                                                  SizedBox(width: 5.0),
                                                  Text(
                                                    'Image Not Available',
                                                    style: TextStyle(
                                                        fontFamily: 'OpenSans',
                                                        color: Colors.grey),
                                                  )
                                                ],
                                              ),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                color: Colors.grey
                                                    .withOpacity(0.8),
                                                width: 2.0,
                                              )),
                                            )
                                          : Image.file(
                                              widget._itemData[index].itemImg,
                                              fit: BoxFit.fill,
                                            )),
                                ),
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text('2 days ago',
                                                style: TextStyle(
                                                    color:
                                                        widget._itemData[index]
                                                                    .itemImg ==
                                                                null
                                                            ? Colors.grey
                                                            : Colors.white,
                                                    fontFamily: 'OpenSans')),
                                          ),
                                          PopupMenuButton(
                                              padding: EdgeInsets.all(0.0),
                                              icon: Icon(
                                                EvaIcons.moreVerticalOutline,
                                                color: widget._itemData[index]
                                                            .itemImg ==
                                                        null
                                                    ? Colors.black54
                                                    : Colors.white,
                                                size: 20.0,
                                              ),
                                              itemBuilder: (context) => [
                                                    PopupMenuItem(
                                                      child: ListTile(
                                                        onTap: () {
                                                          setState(() {
                                                            widget._itemData
                                                                .removeAt(
                                                                    index);
                                                            Navigator.pop(
                                                                context);
                                                          });
                                                        },
                                                        dense: true,
                                                        leading: Icon(
                                                          EvaIcons
                                                              .trash2Outline,
                                                          color: Colors.black54,
                                                        ),
                                                        title: Text(
                                                            'Mark as Sold'),
                                                      ),
                                                    ),
                                                  ]),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              widget._itemData[index].itemName,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.75),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'OpenSans'),
                              maxLines: 1,
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              'RM ${widget._itemData[index].price}',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.75),
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'OpenSans'),
                            ),
                          ],
                        ),
                      );
                    }),
              )
            ],
          )),
    );
  }
}
