class UserDetails {
  String userName;
  String fullName;
  String phoneNo;
  String location;
  String email;

  UserDetails(this.userName,this.fullName,this.phoneNo,this.location,this.email);
  UserDetails.copy(UserDetails from) : this(from.userName,from.fullName,from.phoneNo,from.location,from.email);
}