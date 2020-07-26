import 'package:flutter/material.dart';
import 'detailScreen.dart';
import './modal/itemModal.dart';
import './services/item_services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Color maincolor = Color(0xFFF1E90FF);

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

Future<List<Item>> itemFutures;

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    itemFutures = ItemService().getAllItem();
  }

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
              itemFutures = ItemService().getAllItem();
            });
          }),
      body: Container(
        margin: MediaQuery.of(context).padding,
        padding: EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Buy Your',
              style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans'),
            ),
            Text(
              'Items Here',
              style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans'),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              height: 45.0,
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                decoration: InputDecoration(
                    fillColor: Colors.grey.withOpacity(0.2),
                    filled: true,
                    prefixIcon: Icon(Icons.search),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.transparent, width: 0.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.transparent, width: 0.0),
                    ),
                    hintText: 'Search anything here',
                    hintStyle: TextStyle(fontSize: 12, fontFamily: 'OpenSans')),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Categories',
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans'),
            ),
            SizedBox(
              height: 20.0,
            ),
            CategoriesList(),
            SizedBox(
              height: 5.0,
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: FutureBuilder(
                future: itemFutures,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  var item = snapshot.data;

                  return snapshot.hasData
                      ? GridView.builder(
                          itemCount: item.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: itemWidth / itemHeight,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0,
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ItemDetailsPage(item[index])));
                              },
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 180.0,
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          child: Image.network(
                                            item[index].itemImg,
                                            fit: BoxFit.fill,
                                          )),
                                    ),
                                    SizedBox(height: 5.0),
                                    Text(
                                      item[index].itemName,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.75),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'OpenSans'),
                                    ),
                                    SizedBox(height: 5.0),
                                    Text(
                                      'RM ${item[index].price}',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.75),
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'OpenSans'),
                                    ),
                                    SizedBox(height: 5.0),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          width: 15.0,
                                          height: 15.0,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(width: 5.0),
                                        Text(
                                          'anonymous',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12.0,
                                              fontFamily: 'OpenSans'),
                                        )
                                      ],
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
            )),
          ],
        ),
      ),
    );
  }
}

class CategoriesList extends StatelessWidget {
  var categories = ['Electrical', 'Books', 'Mobile Phones', 'Furniture'];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Container(
                decoration: BoxDecoration(
                    color: index == 0
                        ? maincolor.withOpacity(0.3)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(5)),
                margin: EdgeInsets.fromLTRB(0.0, 0, 20.0, 0),
                padding: EdgeInsets.all(12.0),
                child: Center(
                    child: Text(
                  categories[index],
                  style: TextStyle(color: maincolor, fontFamily: 'OpenSans'),
                )));
          }),
    );
  }
}
