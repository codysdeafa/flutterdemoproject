import 'package:demo/src/utils/universal_utils.dart';
import 'package:flutter/services.dart';

class MethodKey{
  ///web跳转通道
  static const webActionEvent = "webActionEvent";
}
class ChannelUtils {
  ChannelUtils._();

  static final ChannelUtils instance = ChannelUtils._();

  static late MethodChannel platform;

 static init() {
    platform = const MethodChannel("native")..setMethodCallHandler((call) async {
      switch(call.method){

      }
    });
  }
  ///跳转webViewController
  Future pushNativeWebView({required String baseUrl,required Map requestParameter}) async{
   requestParameter['baseUrl'] = baseUrl;
   if(!isAndroid()){
     //ios通道
     await platform.invokeMethod(MethodKey.webActionEvent,requestParameter);
   }else{

   }
 }
}