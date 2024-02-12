import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/auth.registerUser.request.model.dart';
import '../model/auth.token.request.model.dart';
import '../model/auth.token.response.model.dart';
import '../model/auth.user.response.model.dart';

part 'auth.datasource.g.dart';

@RestApi()
abstract class AuthDatasource {
  factory AuthDatasource(Dio dio, {String baseUrl}) = _AuthDatasource;

  @POST('/auth')
  Future<AuthTokenResponseModel> login(
      @Body() AuthTokenRequestModel requestModel);

  @POST('/user')
  Future<AuthUserResponseModel> register(
      @Body() AuthRegisterUserRequestModel requestModel);
}
