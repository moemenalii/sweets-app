import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samysalim/views/login/cubit_login/state_login.dart';
import '../../../Network/Local/Cache_helper.dart';
import '../../../Network/constant.dart';
class loginCubit extends Cubit<loginState>{
  loginCubit():super(InitialState());
  static loginCubit get(context)=>BlocProvider.of(context);
  // void changeIcon(){
  //   // ispassword != ispassword;
  //   emit(cahngeIconState());
  // }
  void userlogin({required email,required password,context}){
    emit(LoadingLoginState());
    // if(uId != '')
    //   uId='';
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value){
      CacheHelper.saveData(Key: 'uId', value: value.user!.uid);
      emit(SuccessLoginState(uId));
      print(uId);
    }).catchError((onError){
      print('error==${onError}');

      emit(ErorrLoginState());});
  //   void userLogin({
  //     required String email,
  //     required String password,
  //   }){
  //     emit( LoadingLoginState());
  //     DioHelper.postData(url:LOGIN,
  //         data: {
  //           'email':'$email',
  //           'password':'$password',
  //         }).then((value){
  //       userModel=userModel.fromJson(value.data);
  //       // print(userModel?.data?.token);
  //       // print(loginModel?.status);
  //       // print(userModel.message);
  //       emit(SuccessLoginState(userModel));
  //     }).catchError((Error){
  //       emit(ErorrLoginState(Error.toString()));
  //       print(Error.toString());
  //     });
  //   }
  }
}