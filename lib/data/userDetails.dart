import 'dart:io';

class UserDetails {
  File profileImage;
  String userName;
  String fullName;
  String phoneNo;
  String location;
  String email;
  String password;

  UserDetails(this.profileImage,this.userName,this.fullName,this.phoneNo,this.location,this.email,this.password);
  UserDetails.copy(UserDetails from) : this(from.profileImage,from.userName,from.fullName,from.phoneNo,from.location,from.email,from.password);
}