import 'package:equatable/equatable.dart';

abstract class LoginOtpState extends Equatable{}

class LoginOtpInitial extends LoginOtpState {
  LoginOtpInitial();
  
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginOtpError extends LoginOtpState {
  final String errorMessage;
  LoginOtpError({required this.errorMessage});
  
  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
}

class LoginOtpSuccess extends LoginOtpState {
  LoginOtpSuccess();
  
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginOtpLoading extends LoginOtpState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}