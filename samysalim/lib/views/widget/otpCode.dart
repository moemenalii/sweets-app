import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

Widget PINCODE(BuildContext context){
  return Padding(
    padding: const EdgeInsets.all(30.0),
    child: PinCodeTextField(
      autoFocus: true,
      animationCurve: Curves.easeInCubic,
      cursorColor: Colors.white,
      length: 5,
      obscureText: false,
      keyboardType: TextInputType.number,
      animationType: AnimationType.scale,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        borderWidth: 1,
        activeFillColor: Colors.white,
        activeColor: Colors.orange,
        disabledColor: Colors.red,
        inactiveColor: Colors.orange,
        inactiveFillColor: Colors.white,
        selectedColor: Colors.white,
        selectedFillColor: Colors.orange,
      ),
      animationDuration: Duration(milliseconds: 300),
      enableActiveFill: true,
      // errorAnimationController: errorController,
      // controller: textEditingController,
      onCompleted: (code) {
        var otpcode=code ;
        print("Completed");
      },
      onChanged: (value) {
        print(value);
      },
      appContext: context,
    ),
  );

}