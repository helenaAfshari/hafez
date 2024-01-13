import 'package:hafez/core/network/api_provider.dart';
import 'package:hafez/core/network/api_provider_impl.dart';
import 'package:hafez/data/remote/auth/auth_api.dart';
import 'package:hafez/service_locator.dart';
import 'package:dio/dio.dart';

class AuthApiImp extends AuthApi {
  @override
  Future<Response> checkedOtp(String mobileNumber, String otpToken) async {
    final checkOtpResponse = await serviceLocator<ApiProviderImp>().post(
        'https://payment.vada.ir/api/auth/check-otp',
        bodyParameter: {
        'mobile': mobileNumber, 
        'token': otpToken});
    return checkOtpResponse;
  }

  @override
  Future<Response> loginOtp(String mobileNumber) async {
    final loginOtpResponse = await serviceLocator<ApiProvider>()
        .post('https://payment.vada.ir/api/auth/login-otp', bodyParameter: {
      'mobile': mobileNumber,
     'package_name': 'com.vada.karvarz',
    });
    return loginOtpResponse;
  }
}