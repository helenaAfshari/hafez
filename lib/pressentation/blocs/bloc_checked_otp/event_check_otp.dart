import 'package:equatable/equatable.dart';

abstract class EventChecked extends Equatable{}

class CheckedOtpButtomClicked extends EventChecked {
  final String mobileNumber;
  final String token;
  CheckedOtpButtomClicked({required this.token,required this.mobileNumber});
  @override
  List<Object?> get props => [mobileNumber,token];
}

