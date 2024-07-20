
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../models/base_data.dart';
import '../models/login_info.dart';

part 'login_api.g.dart';


///登陆注册对应的API
@RestApi()
abstract class LoginApi {

  factory LoginApi(Dio dio) = _LoginApi;
  
   ///账号登陆
   @POST("/api/auth/sign_in")
   @FormUrlEncoded()
   Future<BaseData<LoginDetails>> loginWithAccount<T>(@Body()Map<String, dynamic> map);

}