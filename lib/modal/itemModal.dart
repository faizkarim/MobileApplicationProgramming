import 'dart:io';

class Item {
  File itemImg;
  String itemName;
  String price;
  ItemDetails itemDetails;
  Seller sellerDetails;

  Item(this.itemImg, this.itemName, this.price, 
      this.itemDetails, this.sellerDetails);

  Item.copy(Item from)
      : this(from.itemImg, from.itemName, from.price,
            from.itemDetails, from.sellerDetails);
}

class ItemDetails {
  String category;
  String description;
  String place;

  ItemDetails(this.category, this.description, this.place);

  ItemDetails.copy(ItemDetails from)
      : this(from.category, from.description, from.place);
}

class Seller {
  String username;
  String phoneNo;
  String email;

  Seller(this.username, this.phoneNo, this.email);

  Seller.copy(Seller from) : this(from.username, from.phoneNo, from.email);
}
