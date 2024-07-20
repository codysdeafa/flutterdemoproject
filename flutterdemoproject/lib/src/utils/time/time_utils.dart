import 'dart:async';

import 'package:intl/intl.dart';

import 'time_cons.dart';

/// millis2String           : 将时间戳转为时间字符串
/// string2Millis           : 将时间字符串转为时间戳
/// string2Date             : 将时间字符串转为 Date 类型
/// date2String             : 将 Date 类型转为时间字符串
/// date2Millis             : 将 Date 类型转为时间戳
/// millis2Date             : 将时间戳转为 Date 类型
/// getTimeSpan             : 获取两个时间差（单位：unit）
/// getFitTimeSpan          : 获取合适型两个时间差
/// getNowMills             : 获取当前毫秒时间戳
/// getNowString            : 获取当前时间字符串
/// getNowDate              : 获取当前 Date
/// getTimeSpanByNow        : 获取与当前时间的差（单位：unit）
/// getFitTimeSpanByNow     : 获取合适型与当前时间的差
/// getFriendlyTimeSpanByNow: 获取友好型与当前时间的差
/// getMillis               : 获取与给定时间等于时间差的时间戳
/// getString               : 获取与给定时间等于时间差的时间字符串
/// getDate                 : 获取与给定时间等于时间差的 Date
/// getMillisByNow          : 获取与当前时间等于时间差的时间戳
/// getStringByNow          : 获取与当前时间等于时间差的时间字符串
/// getDateByNow            : 获取与当前时间等于时间差的 Date
/// isToday                 : 判断是否今天
/// isLeapYear              : 判断是否闰年
/// getChineseWeek          : 获取中式星期
///
/// getUSWeek               : 获取美式式星期
/// getValueByCalendarField : 根据日历字段获取值
/// getChineseZodiac        : 获取生肖
/// getZodiac               : 获取星座
/// getAge                  : 获取年龄
/// _getLastWeeks           : 获取最近七天的时间戳
/// startOfDay              :获取一个时间戳的当天开始时间
/// endOfDay                 :获取一个时间戳当天的结束时间
/// isSameDay               ：对比两个时间是否为同一天
/// getCst                  :设置为中国时区
class TimeUtils {
  static const Symbol _dateFormatKey = #dateFormatKey;
  static const Symbol _hmFormatKey = #hmFormatKey;
  static const Symbol _ymdFormatKey = #ymdFormatKey;

  static DateFormat getDefaultFormat() {
    var dateFormat = Zone.current[_dateFormatKey] as DateFormat?;
    if (dateFormat == null) {
      dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
      // 使用 fork 创建一个新的 Zone，存储 DateFormat 实例
      Zone.current.fork(zoneValues: {_dateFormatKey: dateFormat}).run(() {});
    }
    return dateFormat;
  }

  static DateFormat getHMFormat() {
    var dateFormat = Zone.current[_hmFormatKey] as DateFormat?;
    if (dateFormat == null) {
      dateFormat = DateFormat('MM-dd HH:mm');
      Zone.current.fork(zoneValues: {_hmFormatKey: dateFormat}).run(() {});
    }
    return dateFormat;
  }

  static DateFormat getYMDFormat() {
    var dateFormat = Zone.current[_ymdFormatKey] as DateFormat?;
    if (dateFormat == null) {
      dateFormat = DateFormat('yyyy-MM-dd');
      Zone.current.fork(zoneValues: {_ymdFormatKey: dateFormat}).run(() {});
    }
    return dateFormat;
  }

  static String dateToStamp() {
    return "${getNowMills() / 1000}";
  }

  static int getNowMills() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  static String millis2String(int millis, [DateFormat? format]) {
    if (format == null) {
      return getDefaultFormat()
          .format(DateTime.fromMillisecondsSinceEpoch(millis));
    }
    return format.format(DateTime.fromMillisecondsSinceEpoch(millis));
  }

  static int string2Millis(String time, [DateFormat? format]) {
    if (format == null) {
      return getDefaultFormat().parse(time).millisecondsSinceEpoch;
    }
    return format.parse(time).millisecondsSinceEpoch;
  }

  static DateTime string2Date(String time, [DateFormat? format]) {
    if (format == null) {
      return getDefaultFormat().parse(time);
    }
    return format.parse(time);
  }

  static String date2String(DateTime date, [DateFormat? format]) {
    if (format == null) {
      return getDefaultFormat().format(date);
    }
    return format.format(date);
  }

  static int date2Millis(DateTime date) {
    return date.millisecondsSinceEpoch;
  }

  static DateTime millis2Date(int millis) {
    return DateTime.fromMicrosecondsSinceEpoch(millis);
  }

  static int getTimeSpan(dynamic time1, dynamic time2, Unit unit,
      [DateFormat? format]) {
    int? time1Millis = 0;
    int? time2Millis = 0;
    if (time1 is String && time2 is String) {
      time1Millis = string2Millis(time1, format ?? getDefaultFormat());
      time2Millis = string2Millis(time2, format ?? getDefaultFormat());
      return (time1Millis - time2Millis) ~/ unitToMilliseconds(unit);
    } else if (time1 is DateTime && time2 is DateTime) {
      time1Millis = date2Millis(time1);
      time2Millis = date2Millis(time1);
      return (time1Millis - time2Millis) ~/ unitToMilliseconds(unit);
    } else if (time1 is int && time2 is int) {
      return (time1 - time2) ~/ unitToMilliseconds(unit);
    }
    return (time1Millis - time2Millis) ~/ unitToMilliseconds(unit);
  }

  static String getFitTimeSpan(dynamic time1, dynamic time2, int precision,
      [DateFormat? format]) {
    if (time1 is String && time2 is String) {
      int time1Millis = string2Millis(time1, format ?? getDefaultFormat());
      int time2Millis = string2Millis(time2, format ?? getDefaultFormat());
      return millis2FitTimeSpan(time1Millis - time2Millis, precision);
    } else if (time1 is DateTime && time2 is DateTime) {
      int time1Millis = date2Millis(time1);
      int time2Millis = date2Millis(time2);
      return millis2FitTimeSpan(time1Millis - time2Millis, precision);
    } else if (time1 is int && time2 is int) {
      return millis2FitTimeSpan(time1 - time2, precision);
    }
    return "";
  }

  static String millis2FitTimeSpan(int millis, int precision) {
    if (precision <= 0) return "";
    precision = (precision < 5) ? precision : 5;
    List<String> units = ["天", "小时", "分钟", "秒", "毫秒"];
    if (millis == 0) return "0${units[precision - 1]}";

    StringBuffer sb = StringBuffer();
    if (millis < 0) {
      sb.write("-");
      millis = -millis;
    }

    List<int> unitLen = [86400000, 3600000, 60000, 1000, 1];
    for (int i = 0; i < precision; i++) {
      if (millis >= unitLen[i]) {
        int mode = millis ~/ unitLen[i];
        millis -= mode * unitLen[i];
        sb.write("$mode${units[i]}");
      }
    }
    return sb.toString();
  }

  static String getNowString([DateFormat? format]) {
    return millis2String(
        DateTime.now().millisecondsSinceEpoch, format ?? getDefaultFormat());
  }

  static DateTime getNowDate() {
    return DateTime.now();
  }

  static int getTimeSpanByNow(dynamic time, Unit unit, [DateFormat? format]) {
    if (time is String) {
      return getTimeSpan(time, getNowString(format), unit, format);
    } else if (time is DateTime) {
      return getTimeSpan(time, getNowDate(), unit);
    } else if (time is int) {
      return getTimeSpan(time, getNowMills(), unit);
    }
    return 0;
  }

  static String getFitTimeSpanByNow(dynamic time, int precision,
      [DateFormat? format]) {
    if (time is String) {
      return getFitTimeSpan(time, getNowString(format), precision, format);
    } else if (time is DateTime) {
      return getFitTimeSpan(time, getNowDate(), precision);
    } else if (time is int) {
      return getFitTimeSpan(time, getNowMills(), precision);
    }
    return "";
  }

  static String getFriendlyTimeSpanByNow(dynamic time, [DateFormat? format]) {
    if (time is String) {
      return millis2FriendlyTimeSpanByNow(string2Millis(time, format));
    } else if (time is DateTime) {
      return millis2FriendlyTimeSpanByNow(time.millisecondsSinceEpoch);
    }
    return "";
  }

  static String millis2FriendlyTimeSpanByNow(int millis) {
    int now = DateTime.now().millisecondsSinceEpoch;
    int span = now - millis;

    if (span < 0) {
      // 如果给定时间在未来，可以返回具体的日期格式
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(millis);
      return '${dateTime.year}-${dateTime.month}-${dateTime.day}';
    } else if (span < 1000) {
      return "刚刚";
    } else if (span < TimeConstants.min) {
      return "${(span / TimeConstants.sec).floor()}秒前";
    } else if (span < TimeConstants.hour) {
      return "${(span / TimeConstants.min).floor()}分钟前";
    }

    // 获取今天凌晨 00:00 的时间戳
    DateTime nowDateTime = DateTime.now();
    DateTime todayWee =
        DateTime(nowDateTime.year, nowDateTime.month, nowDateTime.day);
    int wee = todayWee.millisecondsSinceEpoch;

    if (millis >= wee) {
      // 今天
      return DateFormat('HH:mm')
          .format(DateTime.fromMillisecondsSinceEpoch(millis));
    } else if (millis >= wee - TimeConstants.day) {
      // 昨天
      return "昨天 ${DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(millis))}";
    } else {
      // 其他日期
      return DateFormat('yyyy-MM-dd')
          .format(DateTime.fromMillisecondsSinceEpoch(millis));
    }
  }

  static int getWeeOfToday() {
    DateTime now = DateTime.now();
    DateTime wee = DateTime(now.year, now.month, now.day);
    return wee.millisecondsSinceEpoch;
  }

  static int getMillis(dynamic millis, int timeSpan, Unit unit, [DateFormat? format]) {
    if (millis is int) {
      return millis + timeSpan2Millis(timeSpan, unit);
    } else if (millis is String) {
      return string2Millis(millis, format) + timeSpan2Millis(timeSpan, unit);
    } else if (millis is DateTime) {
      return date2Millis(millis) + timeSpan2Millis(timeSpan, unit);
    }

    return 0;
  }

  static int timeSpan2Millis(int timeSpan, Unit unit) {
    return timeSpan * unitToMilliseconds(unit);
  }

  static String getString(dynamic millis, int timeSpan, Unit unit,
      [DateFormat? format]) {
    if (millis is int) {
      return millis2String(millis + timeSpan2Millis(timeSpan, unit), format);
    } else if (millis is String) {
      return millis2String(
          string2Millis(millis) + timeSpan2Millis(timeSpan, unit), format);
    } else if (millis is DateTime) {
      return millis2String(
          date2Millis(millis) + timeSpan2Millis(timeSpan, unit), format);
    }
    return "";
  }

  static DateTime getDate(dynamic millis, int timeSpan, Unit unit,
      [DateFormat? format]) {
    if (millis is String) {
      return millis2Date(
          string2Millis(millis, format) + timeSpan2Millis(timeSpan, unit));
    } else if (millis is DateTime) {
      return millis2Date(date2Millis(millis) + timeSpan2Millis(timeSpan, unit));
    } else if (millis is int) {
      return millis2Date(millis + timeSpan2Millis(timeSpan, unit));
    }
    return millis2Date(0);
  }

  static int getMillisByNow(int timeSpan, Unit unit) {
    return getMillis(getNowMills(), timeSpan, unit);
  }

  static String getStringByNow(int timeSpan, Unit unit) {
    return getString(getNowMills(), timeSpan, unit);
  }

  static DateTime getDateByNow(int timeSpan, Unit unit) {
    return getDate(getNowMills(), timeSpan, unit);
  }

  static bool isToday(dynamic time, [DateFormat? format]) {
    if (time is int) {
      return time >= getWeeOfToday() &&
          time < getWeeOfToday() + TimeConstants.day;
    } else if (time is String) {
      return string2Millis(time, format) >= getWeeOfToday() &&
          string2Millis(time, format) < getWeeOfToday() + TimeConstants.day;
    } else if (time is DateTime) {
      return time.millisecondsSinceEpoch >= getWeeOfToday() &&
          time.millisecondsSinceEpoch < getWeeOfToday() + TimeConstants.day;
    }

    return false;
  }

  static bool isLeapYear(dynamic time, [DateFormat? format]) {
    if (time is String) {
      return _isLeapYear(string2Date(time, format));
    } else if (time is int) {
      return _isLeapYear(millis2Date(time));
    } else if (time is DateTime) {
      return _isLeapYear(time);
    }
    return false;
  }

  static bool _isLeapYear(DateTime date) {
    int year = date.year;
    // 判断闰年的逻辑
    if (year % 4 == 0) {
      if (year % 100 == 0) {
        return year % 400 == 0;
      } else {
        return true;
      }
    } else {
      return false;
    }
  }

  static String getChineseWeek(dynamic millis,[DateFormat? format]){
    if(millis is int){
      return _getChineseWeek(DateTime.fromMicrosecondsSinceEpoch(millis));
    }else if(millis is DateTime){
      return _getChineseWeek(millis);
    }else if(millis is String){
      return _getChineseWeek(string2Date(millis,format));
    }
    return "";
  }

  static String _getChineseWeek(DateTime date) {
    var formatter = DateFormat.E('zh'); // 'E' represents abbreviated day name
    return formatter.format(date);
  }
  static List<DateTime> getLastWeeks(DateTime date){
    List<DateTime> lastWeekDays = List.generate(
      7,
          (index) => date.subtract(Duration(days: index)),
    );
    return lastWeekDays;
  }

  static String startOfDay(DateTime date) {
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime(date.year, date.month, date.day, 0, 0, 0));
  }
  static String endOfDay(DateTime date) {
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime(date.year, date.month, date.day, 23, 59, 59));
  }
  static bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
  static String getWeekdayName(int weekday) {
    const weekdays = [
      '星期一',
      '星期二',
      '星期三',
      '星期四',
      '星期五',
      '星期六',
      '星期日',
    ];
    return weekdays[weekday - 1];
  }
  static DateTime getCst(DateTime date) {
    // 获取当前 UTC 时间
    DateTime nowUtc = date.toUtc();
    // 手动将时间调整为中国标准时间 (UTC+8)
    DateTime nowCst = nowUtc.add(const Duration(hours: 8));
    return nowCst;
  }
}
