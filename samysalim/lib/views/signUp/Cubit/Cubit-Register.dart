import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samysalim/Network/Local/Cache_helper.dart';
import '../../../models/userModel.dart';
import 'State-Register.dart';

class registerCubit extends Cubit<registerState>{
  registerCubit():super(InitialState()) {}

  static registerCubit get(context)=>BlocProvider.of(context);

 Future<void> registerUser({required email,required password,phone,name,})async {
   emit(LoadingRegisteState());
  await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)
       .then((value) {
         print(value.user!.uid);
      var uId=  CacheHelper.saveData(Key: 'uId', value: value.user!.uid);
         CreateUser( uId: value.user!.uid,email:email,name: name,
           phone: phone, );
         emit(SuccessRegisteState());
       })
       .catchError((error){
     print('error==${error.toString()}');
         emit(ErorrRegisterState(error.toString()));
   });
 }

   Future<void> CreateUser({required email,required name,required phone,required uId,
})async {
   userModel ?model=userModel(
       name:name,
       numPhone:phone,
       email:email,
       uId:uId,
   );
  await FirebaseFirestore.instance.collection('users').doc(uId).set(model.toMap()).then((value) {
   emit(SuccessCreatUserState(uId));
   // MotionToast.success(
   //   title: Text("Success Motion Toast"),
   //   description: Text("Example of success motion toast"),
   // ).show(context);
 }).catchError((error){
   print('error==${error.toString()}');
   // MotionToast.error(
   //   title: Text("error Motion Toast"),
   //   description: Text("Example of error motion toast"),
   // ).show(context);
   emit(ErorrCreatUserState(error.toString()));
 });
 }
}
