import 'package:equatable/equatable.dart';

abstract class LoginOtpEvent extends Equatable {}

class LoginOtpButtonClicked extends LoginOtpEvent {
  final String mobileNumber;
  LoginOtpButtonClicked({required this.mobileNumber});
  @override
  List<Object?> get props => [];
}