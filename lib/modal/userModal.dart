class User {
  String id;
  String userName;
  String fullName;
  String phoneNo;
  String location;
  String email;

  User(
    {this.id,this.userName,this.fullName,this.phoneNo,this.location,this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      userName: json['userName'],
      fullName: json['fullName'],
      phoneNo: json['phoneNo'],
      location: json['location'],
      email: json['email'],
    );
  }
  Map<String, dynamic> toJson() => {
    'id': id,
    'userName': userName,
    'fullName': fullName,
    'phoneNo': phoneNo,
    'location': location,
    'email': email,
  };
  
  //User.copy(User from) : this(from.id,from.userName,from.fullName,from.phoneNo,from.location,from.email);
}