
import 'package:autharization_hanna/data/remote/auth/auth_api.dart';
import 'package:autharization_hanna/domain/repository/auth/auth_repository.dart';
import 'package:autharization_hanna/service_locator.dart';
import 'package:dio/dio.dart';

class AuthRepositoryImp extends AuthRepository {
 @override
 //serialize model
  Future<Response> checkOtp(String mobileNumber, String otpToken) async {
    final checkOtpResponse = await serviceLocator<AuthApi>().checkedOtp(mobileNumber, otpToken);
    print("ggggggg${otpToken}");
    return checkOtpResponse;
  }

  @override
  Future<Response> loginOtp(String mobileNumber) async {
    final loginOtpResponse =await serviceLocator<AuthApi>().loginOtp(mobileNumber);
    return loginOtpResponse;
  }
}