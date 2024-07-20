import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:html/parser.dart';

import '../toast.dart';

extension StringExtension on String {
  Color toColor() {
    String hexColor = replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    } else if (hexColor.length == 3) {
      hexColor =
          'FF${hexColor.substring(0, 1)}${hexColor.substring(0, 1)}${hexColor.substring(1, 2)}${hexColor.substring(1, 2)}${hexColor.substring(2, 3)}${hexColor.substring(2, 3)}';
    }
    return Color(int.parse(hexColor, radix: 16));
  }

  ///判断用户名是否合法
  bool isUserValid({bool toastError = true}) {
    RegExp regExp = RegExp(r'^[a-zA-Z0-9]{4,20}$');
    bool matches = regExp.hasMatch(this);
    final match = isNotEmpty && matches;
    if (!match && toastError) toast("请输入4-20位字母、数字用户名");
    return match;
  }

  bool isNickNameValid({bool toastError = true}) {
    RegExp regExp = RegExp(r'^[a-zA-Z0-9\u4e00-\u9fa5]{4,16}$');
    bool matches = regExp.hasMatch(this);
    final match = isNotEmpty && matches;
    if (!match && toastError) toast("昵称由4-16个汉字、字母与数字的任意组合组成");
    return match;
  }

  bool isRealNameValid({bool toastError = true}) {
    RegExp regExp = RegExp(r'^[\u4E00-\u9FA5\·]{2,16}$');
    bool matches = regExp.hasMatch(this);
    final match = isNotEmpty && matches;
    if (!match && toastError) toast("请输入2-16位中文真实姓名");
    return match;
  }

  String deleteHtmlTag() {
    final document = parse(this);
    final String parsedString =
        parse(document.body?.text).documentElement?.text ?? "";
    return parsedString;
  }

  ///判断密码是否合法
  bool isPasswordValid({bool toastError = true}) {
    final match = isNotEmpty && length >= 4 && length <= 20;
    if (!match && toastError) toast("请输入4-20位字母、数字或特殊字符密码");
    return match;
  }

  bool isSamePassword(String resPassword, {bool toastError = true}) {
    final match = isNotEmpty && (this == resPassword);
    if (!match && toastError) toast("两次输入密码不一致");
    return match;
  }

  ///邮箱验证
  bool isValidationEmail({bool toastError = true}) {
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regExp = RegExp(pattern);
    bool matches = regExp.hasMatch(this);
    final match = isNotEmpty && matches;
    if (!match && toastError) toast("请输入英文字母、数字、下划线、中划线和唯一特殊字符@和英文句号邮箱格式");
    return match;
  }

  ///电话验证
  bool isTelPhone({bool toastError = true}) {
    String pattern = r'^[0-9]{8,16}$';
    RegExp regExp = RegExp(pattern);
    bool matches = regExp.hasMatch(this);
    final match = isNotEmpty && matches;
    if (!match && toastError) toast("请输入8-16位手机号码");
    return match;
  }

  ///4-8位数字
  bool isVerCode({bool toastError = true}) {
    String pattern = r'^[0-9]{4,8}$';
    RegExp regExp = RegExp(pattern);
    bool matches = regExp.hasMatch(this);
    final match = isNotEmpty && matches;
    if (!match && toastError) toast("请输入4-8位数字验证码");
    return match;
  }

  ///中文姓名
  bool isChineseName() {
    String pattern = r'^[\u{4e00}-\u{9fa5}]{0,}';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(this);
  }

  ///真实姓名验证
  bool isValidationRealName({bool toastError = true}) {
    String pattern = r'^[\u4e00-\u9fa5]{2,16}$';
    RegExp regExp = RegExp(pattern);
    bool matches = regExp.hasMatch(this);
    final match = isNotEmpty && matches;
    if (!match && toastError) toast("请输入2-16位中文真实姓名");
    return match;
  }

  ///4-20位数字和字母推广码验证
  bool isValidationIntrCode({bool toastError = true}) {
    String pattern = r'^[A-Za-z0-9]{4,20}$';
    RegExp regExp = RegExp(pattern);
    bool matches = regExp.hasMatch(this);
    final match = isNotEmpty && matches;
    if (!match && toastError) toast("请输入4-20位数字和字母邀请码");
    return match;
  }

  ///qq
  bool isValidationQQ({bool toastError = true}) {
    String pattern = r'^[1-9][0-9]{6,10}$';
    RegExp regExp = RegExp(pattern);
    bool matches = regExp.hasMatch(this);
    final match = isNotEmpty && matches;
    if (!match && toastError) toast("请输入7-12位数字的QQ号");
    return match;
  }

  ///微信号验证
  bool isValidationWechat({bool toastError = true}) {
    String pattern = r'^[a-zA-Z][a-zA-Z0-9_-]{5,19}$';
    RegExp regExp = RegExp(pattern);
    bool matches = regExp.hasMatch(this);
    final match = isNotEmpty && matches;
    if (!match && toastError) toast("请输入微信号");
    return match;
  }

  int? toIntOrNull() => int.tryParse(this);

  double? toDoubleOrNull() => double.tryParse(this);

  bool? toBoolOrNull() => bool.tryParse(this);

  /// 手机号码加密
  String formatPhoneNumber({String joined = " "}) {
    if (isEmpty) {
      return this;
    }

    StringBuffer formattedPhone = StringBuffer();
    for (int i = 0; i < length; i++) {
      if (i < 3 || i >= length - 3) {
        formattedPhone.write(this[i]);
      } else {
        formattedPhone.write('*');
      }
    }

    return formattedPhone.toString();
  }

  RichText addStyle({
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black,
    double fontSize = -1,
    bool underline = false,
    GestureTapCallback? onTap,
    bool isSuperscript = false,
    bool isStrikeThrough = false,
    int imgRes = 0,
    double? relativeSize,
    Color? imgTint,
  }) {
    List<TextSpan> spans = [];

    // 文字的style Bold Normal
    spans.add(TextSpan(style: TextStyle(fontWeight: fontWeight)));

    // 文字的颜色
    spans.add(TextSpan(style: TextStyle(color: color)));

    // 文字的大小(绝对值)
    if (fontSize >= 0) {
      spans.add(TextSpan(style: TextStyle(fontSize: fontSize)));
    }

    // 下划线
    if (underline) {
      spans.add(TextSpan(
        text: this,
        style: const TextStyle(decoration: TextDecoration.underline),
      ));
    }

    // 文字点击事件
    if (onTap != null) {
      spans.add(TextSpan(
        text: this,
        recognizer: TapGestureRecognizer()..onTap = onTap,
      ));
    }

    // 上角标
    if (isSuperscript) {
      // Dart 没有内置上角标的直接支持，可以通过设置字体大小和偏移量来模拟
      spans.add(TextSpan(
        text: this,
        style: TextStyle(
            fontSize: fontSize * 0.8, textBaseline: TextBaseline.alphabetic),
      ));
    }

    // 删除线（中划线）
    if (isStrikeThrough) {
      spans.add(TextSpan(
        text: this,
        style: const TextStyle(decoration: TextDecoration.lineThrough),
      ));
    }

    // 插入图片
    if (imgRes > 0) {
      // Dart 没有直接在 TextSpan 中插入组件的方法，通常使用 WidgetSpan
      spans.add(WidgetSpan(
        child: Image.asset(
          'assets/$imgRes.png',
          width: 16,
          height: 16,
          color: imgTint,
        ),
      ) as TextSpan);
    }

    // 文字的相对大小
    if (relativeSize != null) {
      spans.add(TextSpan(
        text: this,
        style: TextStyle(fontSize: fontSize * relativeSize),
      ));
    }

    return RichText(
      text: TextSpan(
        children: spans,
      ),
    );
  }

  Uint8List base64ToUnt8List() {
    final String base64Data = split(',').last;
    return base64Decode(base64Data);
  }
}

extension StringOptionExtension on String? {
  String toFixedDecimalString([int decimalPlaces = 2]) {
    if (this == null || this!.isEmpty) {
      return '0.${'0' * decimalPlaces}';
    }
    final double? number = double.tryParse(this!);
    if (number == null) {
      return '0.${'0' * decimalPlaces}';
    }

    final formattedNumber = number.toStringAsFixed(decimalPlaces);
    return formattedNumber;
  }
}
