class Item {
  String id;
  String itemImg;
  String itemName;
  String price;
  bool save;
  ItemDetails itemdetails;

  Item({
    this.id,
    this.itemImg,
    this.itemName,
    this.price,
    this.save,
    this.itemdetails,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      itemImg: json['itemImg'],
      itemName: json['itemName'],
      price: json['price'],
      save: json['save'],
      itemdetails: ItemDetails.fromJson(json['itemdetails']),
    );
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'itemImg': itemImg,
        'itemName': itemName,
        'price': price,
        'save': save,
        'itemdetails': itemdetails.toJson(),
      };
}

class ItemDetails {
  String category;
  String description;
  String place;

  ItemDetails({this.category, this.description, this.place});

  factory ItemDetails.fromJson(Map<String, dynamic> json) {
    return ItemDetails(
      category: json['category'],
      description: json['description'],
      place: json['place'],
    );
  }

  Map<String, dynamic> toJson() => {
        'category': category,
        'description': description,
        'place': place,
      };
}
