abstract class PhoneAuthState {}

class PhoneAuthInitialState extends PhoneAuthState{}

class LoadingOTPState extends PhoneAuthState{}

class PhoneNumberSubmited extends PhoneAuthState{}

class PhoneOTPVerfied extends PhoneAuthState{}

class ErorrOTPState extends PhoneAuthState{
  final String msg;

  ErorrOTPState({required this.msg});
}

