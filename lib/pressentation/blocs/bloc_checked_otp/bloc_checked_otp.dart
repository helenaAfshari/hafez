
import 'dart:async';
import 'package:hafez/domain/repository/auth/auth_repository.dart';
import 'package:hafez/pressentation/blocs/bloc_checked_otp/event_check_otp.dart';
import 'package:hafez/pressentation/blocs/bloc_checked_otp/state_checked_otp.dart';
import 'package:hafez/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CheckedOtpBloc extends Bloc<EventChecked, CheckedOtpState> {
  Timer? _timer;
  int _countDown = 50;
    final StreamController<int> _timerController = StreamController<int>();
 Stream<int> get timerStream => _timerController.stream;
  CheckedOtpBloc() : super(CheckedOtpInitial()) {
    on<EventChecked>((event, emit) async {
      if (event is CheckedOtpButtomClicked) {
        try {
          emit(CheckedOtpLoading());
          final checkOtpResponse = await serviceLocator<AuthRepository>()
              .checkOtp(event.mobileNumber, event.token);
          if (checkOtpResponse.statusCode == 200) {
            emit(CheckedOtpSuccess());
            startExpirationTimer();
          } else if (checkOtpResponse.statusCode == 400) {
            emit(CheckedOtpError(errorMessage: "کد اشتباه است"));
          }
        } catch (e) {
          emit(CheckedOtpError(
              errorMessage: 'دسترسی به اینترنت قطع شده است، لطفاً مجددا تلاش کنید'));
        }
      }
    });
  }
  int get countDown => _countDown;

  void startExpirationTimer() {
    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 120), () {
      // ignore: invalid_use_of_visible_for_testing_member
      emit(CheckedOtpExpired());
    });
  }
void startCountDown() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (timer) {
      _countDown -= 1;
      if (_countDown <= 0) {
        timer.cancel();
        
      }
      _timerController.add(_countDown); 
    });
  }
  Timer? get timer => _timer;

  @override
  Future<void> close() {
    _timerController.close();
    return super.close();
  }
    Future<void> saveTokenToSecureStorage(String token) async {
    final storage = FlutterSecureStorage();
    await storage.write(key: 'otpToken', value: token);
  }
}

