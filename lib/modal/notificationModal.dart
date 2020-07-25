class Notifications {
  String text1;
  String text2;
  String date;
  String time;
  String id;
  bool read;

  Notifications(
      {this.id, this.text1, this.text2, this.date, this.time, this.read});
  factory Notifications.fromJson(Map<String, dynamic> json) {
    return Notifications(
      id: json['id'],
      text1: json['text1'],
      text2: json['text2'],
      date: json['date'],
      time: json['time'],
      read: json['read'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'text1': text1,
        'text2': text2,
        'date': date,
        'time': time,
        'read': read,
      };
}
