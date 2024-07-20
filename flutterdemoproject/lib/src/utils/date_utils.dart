import 'package:date_format/date_format.dart';

///算出两个时间相差多少天
int daysDifference(DateTime date1, DateTime date2) {
  DateTime date1Midnight = DateTime(date1.year, date1.month, date1.day);
  DateTime date2Midnight = DateTime(date2.year, date2.month, date2.day);
  int difference = date1Midnight.difference(date2Midnight).inDays;
  return difference.abs();
}




String formatTimestamp(int? timestamp,{List<String>? format}){
  format??=[yyyy,'-',mm,'-',dd,' ',HH,':',nn,':',ss];
  return formatDate(DateTime.fromMillisecondsSinceEpoch(timestamp??0), format);
}
