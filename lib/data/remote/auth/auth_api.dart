import 'package:dio/dio.dart';

abstract class AuthApi {
  Future<Response> loginOtp(String mobileNumber);
  Future<Response>checkedOtp(String mobileNumber, String token);
}