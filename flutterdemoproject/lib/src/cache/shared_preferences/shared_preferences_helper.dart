import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/logger/logger_utils.dart';

class SharedPreferencesHelper {
  static SharedPreferences? _prefs;

  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  SharedPreferencesHelper._();

  static String? _objectToJson(dynamic object) {
    try {
      return jsonEncode(object.toJson());
    } catch (e) {
      logError("toJson: ${e.toString()}");
      return null;
    }
  }
  static set<T>(String key, T value) async {
    if (value is int) {
      _prefs?.setInt(key, value as int);
    } else if (value is String) {
      _prefs?.setString(key, value as String);
    } else if (value is double) {
      _prefs?.setDouble(key, value as double);
    } else if (value is bool) {
      _prefs?.setBool(key, value as bool);
    }else if (value is List<String>){
      _prefs?.setStringList(key, value as List<String>);
    } else {
      final data = await compute(_objectToJson, value);
      if (data != null) {
        _prefs?.setString(key, data);
      }
    }
  }
  static Future<T?> get<T>(String key,
      {T Function(Map<String, dynamic> json)? fromJsonT}) async {
    final object = _prefs?.get(key);
    if (object != null) {
      if (T == bool ||
          T == int ||
          T == double ||
          T == String ||
          T == List<String>) {
          return object as T;
      } else if (object is String && fromJsonT != null) {
        return await compute(
            fromJsonT, jsonDecode(object) as Map<String, dynamic>);
      }
    }
    return null;
  }
  static List<String> getListString(String key) {
    //重新运行app上面取值List<String>会变成List<Object>,直接用他提供的方法
    List<String> value = _prefs?.getStringList(key)??[];
    return value;
  }

  static remove(String key) {
    _prefs?.remove(key);
  }

  static clear() async {
    await _prefs?.clear();
  }
}
