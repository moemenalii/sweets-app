import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samysalim/views/OTP/cubit_OTP/state_OTP.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  late String verificationId;

  PhoneAuthCubit() : super(PhoneAuthInitialState());

  static PhoneAuthCubit get(context) => BlocProvider.of(context);

  FirebaseAuth auth = FirebaseAuth.instance;
  // String verfied = '';

  Future<void> SubmitPhoneNumber(String phoneNumber) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+2 $phoneNumber ',
      timeout: const Duration(seconds: 20),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  void verificationCompleted(PhoneAuthCredential credential) {

    signIn(credential);
  }

  void verificationFailed(FirebaseAuthException error) {
    print('verificationFailed : ${error.toString()}');
    emit(ErorrOTPState(msg: error.toString()));
  }

  void codeSent(String verificationId, int? resendToken) {
    print('codeSent');
    this.verificationId = verificationId;
    emit(PhoneNumberSubmited());
  }

  void codeAutoRetrievalTimeout(String verificationId) {}


  Future<void>submitOTP(String otpCode)async {
    PhoneAuthCredential credential =PhoneAuthProvider.credential
      (verificationId: this.verificationId, smsCode: otpCode);
    await signIn(credential);
  }


  Future<void>signIn(PhoneAuthCredential credential)async {
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(PhoneOTPVerfied());
    } catch (error) {
      emit(ErorrOTPState(msg:error.toString()));
    }
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  User getLoggedUser(){
    User firebaseUser = FirebaseAuth.instance.currentUser!;
    return firebaseUser;
  //   return  FirebaseAuth.instance.currentUser!;
  }
}
