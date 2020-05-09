class Notifications{
  String text1;
  String text2;
  String date;
  String time;
  bool read;

  Notifications(this.text1,this.text2,this.date,this.time,this.read);

  Notifications.copy(Notifications from) : this(from.text1,from.text2,from.date,from.time,from.read);
}