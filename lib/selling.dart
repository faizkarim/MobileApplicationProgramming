import 'dart:io';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobileapp/modal/mockItem.dart';
import 'package:mobileapp/modal/mockNotification.dart';
import './modal/itemModal.dart';
import 'package:snack/snack.dart';
import 'dart:async';
import './modal/notificationModal.dart';
import 'package:intl/intl.dart';

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

  File imageFile;
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
          imageFile,
          listingName,
          price,
          ItemDetails(_category, description, _location),
          Seller('johndoe817', '018-4563423', 'john@gmail.com'));
      Notifications noti = new Notifications(
          'Your item succesfully in Listing',
          'You now can check your item in My Listing to edit the item',
          dateTime[0],
          dateTime[1],
          false);
      mockNotification.add(noti);
      mockItem.add(itemdata);

      bar.show(context);
      await Future.delayed(Duration(seconds: 2));
      Navigator.pushNamed(context, '/homescreen');
    } else {
      setState(() {
        print(imageFile);
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

  // String validatePrice(double value) {
  //   if (value.isNegative)
  //     return "Price cannot be negative";
  //   else
  //     return null;
  // }

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
                GestureDetector(
                  onTap: () async {
                    var picture = await ImagePicker.pickImage(
                        source: ImageSource.gallery);
                    // Directory picDir = await getApplicationDocumentsDirectory();
                    // path = picDir.uri.resolve('assets/images/picture.jpg').path;
                    // file = await picture.copy(path);
                    setState(() {
                      imageFile = picture;
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(width: 1.0, color: Colors.black26),
                      // image: DecorationImage(
                      //     image: new FileImage(File(widget.imagePath)),
                      //     fit: BoxFit.fill),
                    ),
                    child: imageFile != null
                        ? Image.file(
                            imageFile,
                            fit: BoxFit.fill,
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.add_a_photo,
                                color: Colors.black45,
                              ),
                              SizedBox(
                                height: 2.0,
                              ),
                              Text(
                                "Tap to add photo",
                                style: TextStyle(
                                    color: Colors.black45,
                                    fontFamily: 'OpenSans'),
                              ),
                            ],
                          ),
                  ),
                ),
                SizedBox(height: 20.0),
                Form(
                  autovalidate: _autoValidate,
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
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
