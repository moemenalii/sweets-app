import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:samysalim/views/OTP/cubit_OTP/cubit_OTP.dart';
import 'package:samysalim/views/OTP/cubit_OTP/state_OTP.dart';
import 'package:samysalim/views/resources/color_Manager.dart';
import '../resources/routes_Manager.dart';
import '../resources/theme_Manager.dart';
import '../widget/otpCode.dart';

class OTP extends StatelessWidget {
  OTP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => PhoneAuthCubit(),
      child: BlocConsumer<PhoneAuthCubit,PhoneAuthState>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                appBarWidget(),
                Container(
                  child: Lottie.asset('assets/images/otp.json',
                      fit: BoxFit.fill, height: 220, width: 300),
                ),
                SizedBox(
                  height: 20,
                ),
                PINCODE(context),
                SizedBox(
                  height: 30,
                ),
                TextButtonOTP(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget TextButtonOTP(context){
  return Container(
    width: 185,
    height: 50,
    decoration:BoxDecoration(
      color: ColorManager.orange,
      borderRadius:BorderRadius.all(Radius.circular(50.0)),
      boxShadow: [
        BoxShadow(
          color: Colors.orange,
          blurRadius: 5.0, // soften the shadow
          spreadRadius: -5.0, //extend the shadow
          offset: Offset(
            5.0, // Move to right 10  horizontally
            5.0, // Move to bottom 10 Vertically
          ),
        ),
      ],
    ),
    child: TextButton(onPressed: (){
      Navigator.pushReplacementNamed(context, routes.home_view);
    }, child: Text('Confirm',style: TextStyle(color: ColorManager.white),)),
  );

}