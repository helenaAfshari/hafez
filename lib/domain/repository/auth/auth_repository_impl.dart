
import 'package:hafez/data/remote/auth/auth_api.dart';
import 'package:hafez/domain/repository/auth/auth_repository.dart';
import 'package:hafez/service_locator.dart';
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