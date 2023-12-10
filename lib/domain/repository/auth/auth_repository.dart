import 'package:dio/dio.dart';

abstract class AuthRepository {
  Future<Response> loginOtp(String mobileNumber);
 Future<Response> checkOtp(String mobileNumber, String otpToken);
}