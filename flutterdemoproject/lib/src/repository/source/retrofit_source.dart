import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../api/login_api.dart';
import '../interceptor/header_interceptor.dart';

class RetrofitSource {
  RetrofitSource._();
  static final Dio _dio = Dio(BaseOptions(baseUrl: ""));
  static bool _add = false;

  static _addInterceptors() {
    _addClientAdapter();
    _dio.interceptors.addAll([
      HeaderInterceptor(),
      LogInterceptor(responseBody: true, requestBody: true)
    ]);
  }

  static final _cache = <Type, dynamic>{};

  static T getApi<T>() {
    if (!_add) {
      _add = true;
      _addInterceptors();
    }
    if (_cache.containsKey(T)) {
      return _cache[T] as T;
    } else {
      final api = switch (T) {
        const (LoginApi) => LoginApi(_dio),
        _ => LoginApi(_dio)
      };
      _cache[T] = api;
      return _cache[T] as T;
    }
  }
  //HttpClientAdapter
  static _addClientAdapter(){
    // if(!isRelease && Api.allowCapture){
    //   (_dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
    //     // 创建 HttpClient 实例
    //     var client = HttpClient();
    //     // 设置代理服务器
    //     client.findProxy = (Uri uri) {
    //       return 'PROXY localhost:8888';
    //     };
    //     // 忽略不受信任的证书
    //     client.badCertificateCallback =
    //         (X509Certificate cert, String host, int port) => true;
    //
    //     return client;
    //   };
    // }
  }
}
