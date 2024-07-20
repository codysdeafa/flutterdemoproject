extension DateTimeExtension on DateTime {

  ///是否成年
  bool isAgeEighteenOrOlder() {
    DateTime today = DateTime.now();
    int age = today.year - year;
    if (today.month < month || (today.month == month && today.day < day)) {
      age--;
    }
    return age >= 18;
  }
}
