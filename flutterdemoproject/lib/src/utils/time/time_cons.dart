class TimeConstants{
  static int msec = 1;
  static int sec = 1000;
  static int min = 60000;
  static int hour = 3600000;
  static int day = 86400000;

}
enum Unit {
  msec,
  sec,
  min,
  hour,
  day,
}

int unitToMilliseconds(Unit unit) {
  switch (unit) {
    case Unit.msec:
      return TimeConstants.msec;
    case Unit.sec:
      return TimeConstants.sec;
    case Unit.min:
      return TimeConstants.min;
    case Unit.hour:
      return TimeConstants.hour;
    case Unit.day:
      return TimeConstants.day;
    default:
      throw ArgumentError('Unsupported unit');
  }
}