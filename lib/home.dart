import 'package:flutter/material.dart';

Color maincolor = Color(0xFFF1E90FF);
Color secondaryColor = Color(0xFFF3881E3);
Color tertiaryColor = Color(0xFFF084177);
Color lightgrey = Color(0xFFEFEFEF);

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(18.0),
        margin: MediaQuery.of(context).padding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 45.0,
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  decoration: InputDecoration(
                      fillColor: lightgrey,
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
                      hintStyle:
                          TextStyle(fontSize: 12, fontFamily: 'OpenSans')),
                ),
              ),
              SizedBox(
                height: 20.0,
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
                height: 20.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  children: <Widget>[
                    Item('assets/images/item1.jpg', 'Hyper x Fury SSD', '569',
                        'johndoe817'),
                    Item('assets/images/item2.jpg', 'New Razer Fan', '229',
                        'doe718'),
                    Item('assets/images/item2.jpg', 'New Razer Fan', '229',
                        'doe718'),
                    Item('assets/images/item2.jpg', 'New Razer Fan', '229',
                        'doe718'),
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

class CategoriesList extends StatelessWidget {
  var category = ['Electrical', 'Books', 'Mobile Phones', 'Furniture'];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: category.length,
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
                  category[index],
                  style: TextStyle(color: maincolor, fontFamily: 'OpenSans'),
                )));
          }),
    );
  }
}

class Item extends StatelessWidget {
  String itemImage;
  String itemName;
  String itemPrice;
  String sellerUname;

  Item(this.itemImage, this.itemName, this.itemPrice, this.sellerUname);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/detailScreen');
        },
        child: Container(
            width: MediaQuery.of(context).size.width / 2.3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 180,
                  child: ClipRRect(
                    child: Image(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        itemImage,
                      ),
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  itemName,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.75),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans'),
                ),
                SizedBox(height: 5.0),
                Text(
                  'RM ' + itemPrice,
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
                      sellerUname,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0,
                          fontFamily: 'OpenSans'),
                    )
                  ],
                ),
                SizedBox(
                  height: 15.0,
                )
              ],
            )));
  }
}
