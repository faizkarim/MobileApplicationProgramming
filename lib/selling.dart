import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:snack/snack.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import './modal/notificationModal.dart';
import './services/notification_services.dart';
import './modal/itemModal.dart';
import './services/item_services.dart';

class SellScreen extends StatefulWidget {
  @override
  _SellScreenState createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  final bar = SnackBar(
      backgroundColor: Colors.blueAccent,
      content: Row(
        children: <Widget>[
          Icon(EvaIcons.checkmarkCircle2Outline),
          SizedBox(
            width: 10.0,
          ),
          Text('Your item succesfully been added')
        ],
      ));

  static String imageUrl;
  static String listingName;
  static String price;
  static String description;
  static String _category = "Please select category";
  static String _location = "Please select location";
  DateTime now;
  var dateTime;
  String formattedDate;

  bool absorber = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  _validateInput() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      setState(() {
        absorber = true;
      });
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }

      Item itemdata = new Item(
          itemImg: imageUrl,
          itemName: listingName,
          price: price,
          save: false,
          itemdetails: ItemDetails(
              category: _category, description: description, place: _location));

      ItemService().addItem(n: itemdata);

      Notifications noti = new Notifications(
          text1: 'Your item succesfully in Listing',
          text2: 'You now can check your item in Home to view the item',
          date: dateTime[0],
          time: dateTime[1],
          read: false);

      NotificationService().addNotifications(n: noti);

      bar.show(context);
      await Future.delayed(Duration(seconds: 2));
      Navigator.pushNamed(context, '/homescreen');
    } else {
      setState(() {
        print(imageUrl);
        _autoValidate = true;
      });
    }
  }

  String validatelistingName(String value) {
    if (value.isEmpty)
      return "Listing cannot be empty";
    else
      return null;
  }

  String validateDescription(String value) {
    if (value.isEmpty)
      return "Description cannot be empty";
    else
      return null;
  }

  @override
  void initState() {
    super.initState();
    now = DateTime.now();
    formattedDate = DateFormat('dd-MM-yyyy / kk:mm').format(now);
    print(formattedDate);
    dateTime = formattedDate.toString().split("/");
    print(dateTime[0]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(16.0, 25.0, 16.0, 0.0),
          child: AbsorbPointer(
            absorbing: absorber,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20.0),
                Container(
                  child: Text(
                    "Add Details",
                    style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans'),
                  ),
                ),
                SizedBox(height: 20.0),
                SizedBox(height: 20.0),
                Form(
                  autovalidate: _autoValidate,
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Image",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans'),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        validator: validatelistingName,
                        onSaved: (String val) {
                          setState(() {
                            imageUrl = val;
                          });
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.grey[100],
                            filled: true,
                            // prefixIcon: Icon(Icons.search),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 0.0),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 0.0),
                            ),
                            hintText: 'Your Image Url',
                            hintStyle: TextStyle(
                                fontSize: 15, fontFamily: 'OpenSans')),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        "Category",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans'),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: new DropdownButtonFormField<String>(
                          isDense: true,
                          isExpanded: true,
                          validator: (value) =>
                              value == null ? 'Category cannot be empty' : null,
                          items: <String>[
                            'Books',
                            'Electronics',
                            'Others',
                          ].map((String value) {
                            return new DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.8),
                              ),
                            ),
                          ),
                          hint: Text(_category),
                          onChanged: (newValue) {
                            this.setState(() {
                              _category = newValue;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        "Listing Title",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans'),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        validator: validatelistingName,
                        onSaved: (String val) {
                          setState(() {
                            listingName = val;
                          });
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.grey[100],
                            filled: true,
                            // prefixIcon: Icon(Icons.search),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 0.0),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 0.0),
                            ),
                            hintText: 'Name your listing',
                            hintStyle: TextStyle(
                                fontSize: 15, fontFamily: 'OpenSans')),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        "Price",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans'),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        onSaved: (val) {
                          setState(() {
                            price = val;
                          });
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            fillColor: Colors.grey[100],
                            filled: true,
                            // prefixIcon: Icon(Icons.attach_money),
                            prefixText: "RM ",
                            prefixStyle:
                                TextStyle(color: Colors.black, fontSize: 15),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 0.0),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 0.0),
                            ),
                            hintText: '0',
                            hintStyle: TextStyle(
                                fontSize: 15, fontFamily: 'OpenSans')),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        "Description",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans'),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        validator: validateDescription,
                        onSaved: (String val) {
                          setState(() {
                            description = val;
                          });
                        },
                        keyboardType: TextInputType.text,
                        maxLines: 5,
                        decoration: InputDecoration(
                            fillColor: Colors.grey[100],
                            filled: true,
                            enabledBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 0.0),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 0.0),
                            ),
                            isDense: true,
                            hintText:
                                'Describe what you are selling and include any details',
                            hintStyle: TextStyle(
                                fontSize: 15, fontFamily: 'OpenSans')),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        "Meet-up",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans'),
                      ),
                      SizedBox(height: 10.0),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: new DropdownButtonFormField<String>(
                          isDense: true,
                          isExpanded: true,
                          validator: (value) =>
                              value == null ? 'Location cannot be empty' : null,
                          items: <String>[
                            'Arked Meranti',
                            'Arked Cengal',
                            'Arked Angkasa',
                            'Masjid UTM',
                            'MagicX UTM',
                            'PKU UTM',
                            'Dataran Kawad UTM',
                            'Stadium UTM',
                          ].map((String value) {
                            return new DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.8),
                              ),
                            ),
                          ),
                          hint: Text(_location),
                          onChanged: (newValue) {
                            this.setState(() {
                              _location = newValue;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 30.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 40.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.blueAccent,
              // border: Border.all(width: 1.0, color: Colors.blueAccent),
            ),
            child: new OutlineButton(
              onPressed: _validateInput,
              child: Text('List It!',
                  style: TextStyle(fontSize: 15.0, color: Colors.white)),
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
