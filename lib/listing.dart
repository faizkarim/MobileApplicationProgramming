import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import './modal/itemModal.dart';
import './services/item_services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ListingScreen extends StatefulWidget {
  @override
  _ListingScreenState createState() => _ListingScreenState();
}

Future<List<Item>> itemSaveFuture;

class _ListingScreenState extends State<ListingScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - 24) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            this.setState(() {
              itemSaveFuture = ItemService().getAllSaveItem();
            });
          }),
      body: Container(
          margin: MediaQuery.of(context).padding,
          padding: EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'My Favourite',
                style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans'),
              ),
              Expanded(
                child: FutureBuilder(
                  future: itemSaveFuture,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    var save = snapshot.data;
                    return snapshot.hasData
                        ? GridView.builder(
                            itemCount: save.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
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
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 180.0,
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              child: Image.network(
                                                save[index].itemImg,
                                                fit: BoxFit.fill,
                                              )),
                                        ),
                                        Positioned.fill(
                                          child: Align(
                                            alignment: Alignment.bottomRight,
                                            child: Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  PopupMenuButton(
                                                      padding:
                                                          EdgeInsets.all(0.0),
                                                      icon: Icon(
                                                        EvaIcons
                                                            .moreVerticalOutline,
                                                        color: Colors.white,
                                                        size: 20.0,
                                                      ),
                                                      itemBuilder:
                                                          (context) => [
                                                                PopupMenuItem(
                                                                  child:
                                                                      ListTile(
                                                                    onTap: () {
                                                                      ItemService().updateItem(
                                                                          id: save[index]
                                                                              .id,
                                                                          save:
                                                                              save[index].save);
                                                                    },
                                                                    dense: true,
                                                                    leading:
                                                                        Icon(
                                                                      EvaIcons
                                                                          .trash2Outline,
                                                                      color: Colors
                                                                          .black54,
                                                                    ),
                                                                    title: Text(
                                                                        'Remove'),
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
                                      save[index].itemName,
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
                                      'RM ${save[index].price}',
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
                            })
                        : SpinKitFoldingCube(
                            color: Colors.blueAccent,
                            size: 30.0,
                          );
                  },
                ),
              )
            ],
          )),
    );
  }
}
