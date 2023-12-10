
import 'package:autharization_hanna/domain/repository/auth/auth_repository.dart';
import 'package:autharization_hanna/pressentation/blocs/bloc_login/event_login.dart';
import 'package:autharization_hanna/pressentation/blocs/bloc_login/state_login.dart';
import 'package:autharization_hanna/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginOtpBloc extends Bloc<LoginOtpEvent, LoginOtpState> {

  LoginOtpBloc() : super(LoginOtpInitial()) {
    on<LoginOtpEvent>((event, emit) async {
      if (event is LoginOtpButtonClicked) {
        try {
          if (event.mobileNumber.length != 11) {
            emit(LoginOtpError(errorMessage:"شماره موبایل باید 11 رقم و با 0 شروع شود" ) );
          } else {
            emit(LoginOtpLoading());
            final loginOtpResponse = await serviceLocator<AuthRepository>()
                .loginOtp(event.mobileNumber);
            if (loginOtpResponse.statusCode == 200) {
              print("درست هستتتتت");
              emit(LoginOtpSuccess());
            }else if(loginOtpResponse.statusCode ==422){
              print("معتبر نیست");
              emit(LoginOtpError(errorMessage: "معتبر نیست"));
            }
          }
        } catch (e) {
          print(e);
          emit(LoginOtpError(errorMessage: 'دسترسی به اینترنت قطع شده است ، لطفا مجددا تلاش کنید')
           );
        }
      } 
    });
  }
}