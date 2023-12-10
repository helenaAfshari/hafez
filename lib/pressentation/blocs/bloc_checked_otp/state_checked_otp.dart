
import 'package:equatable/equatable.dart';

abstract class CheckedOtpState extends Equatable{}

class CheckedOtpInitial extends CheckedOtpState{
  CheckedOtpInitial();
  @override
  List<Object?> get props => [];
}

class CheckedOtpLoading extends CheckedOtpState{
  @override
  List<Object?> get props => [];
}
class CheckedOtpSuccess extends CheckedOtpState{
  @override
  List<Object?> get props => [];
}
class CheckedOtpError extends CheckedOtpState{
 final String errorMessage;
 CheckedOtpError({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}
class CheckedOtpExpired extends CheckedOtpState{

  @override
  List<Object?> get props => [];
}

class CountDownTick extends CheckedOtpState {
  final int countDown;

  CountDownTick(this.countDown);
  
  @override
  // TODO: implement props
  List<Object?> get props => [countDown];
}

// class CheckedOtpExpired extends CheckedOtpState {}
