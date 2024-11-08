import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Components/Components(tools).dart';
import '../resources/color_Manager.dart';
import '../resources/theme_Manager.dart';
import '../resources/strings_Manager.dart';
import '../resources/routes_Manager.dart';
import '../signUp/Cubit/Cubit-Register.dart';
import 'Cubit/State-Register.dart';

class SignUp extends StatelessWidget {
  var NameController = TextEditingController();
  var EmailController = TextEditingController();
  var PasswordController = TextEditingController();
  var PhoneController = TextEditingController();
  var Formkeysignup = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => registerCubit(),
        child: BlocConsumer<registerCubit, registerState>(
          builder: (context, state) => Scaffold(
            body: SingleChildScrollView(
              child: Form(
                key: Formkeysignup,
                child: Column(
                  children: [
                    appBarWidget(),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(EvaIcons.closeCircleOutline),
                        iconSize: 50,
                        color: ColorManager.orange),
                    Text(
                      appStrings.signup,
                      style: TextStyle(
                          color: ColorManager.orange,
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    ),
                    defultTextForm(
                      cursorColor: ColorManager.orange,
                      controller: NameController,
                      keyboardType: TextInputType.text,
                      prefixIcon: Icon(CupertinoIcons.person),
                      label: 'Enter Your Name',
                      onTab: () {},
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'please Enter your Name ';
                        }
                      },
                    ),
                    defultTextForm(
                      cursorColor: ColorManager.orange,
                      controller: EmailController,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icon(CupertinoIcons.mail),
                      label: 'Enter E-mail or Phone Number',
                      onTab: () {},
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'please Enter your email ';
                        }
                      },
                    ),
                    defultTextForm(
                      cursorColor: ColorManager.orange,
                      controller: PhoneController,
                      keyboardType: TextInputType.phone,
                      prefixIcon: Icon(CupertinoIcons.phone),
                      label: 'Enter Phone Number',
                      onTab: () {},
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'please Enter your phone ';
                        }
                      },
                    ),
                    defultTextForm(
                      cursorColor: ColorManager.orange,
                      showpassword: true,
                      controller: PasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      prefixIcon: Icon(CupertinoIcons.lock),
                      label: 'Enter Your Password',
                      onTab: () {},
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'please Enter your password ';
                        }
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ConditionalBuilder(
                      condition: state != SuccessRegisteState,
                      builder: (BuildContext context) => Container(
                        height: 50,
                        width: 200,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: WidgetStatePropertyAll(
                                ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.circular(100))),
                            backgroundColor:
                                WidgetStatePropertyAll(ColorManager.orange),
                          ),
                          child: Text(
                            appStrings.signup,
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: ()async{
                            if (Formkeysignup.currentState!.validate()) {
                              const snackBar = SnackBar(
                                content: Text('Success Login State'),
                              );
                             await registerCubit.get(context).registerUser(
                                  email: EmailController.text,
                                  password: PasswordController.text,
                                  phone: PhoneController.text,
                                  name: NameController.text,
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              Navigator.pushReplacementNamed(
                                  context, routes.home_view);
                            }


                          },
                        ),
                      ),
                      fallback: (BuildContext context) {
                        return Center(
                            child: CircularProgressIndicator(
                          color: ColorManager.orange,
                        ));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          listener: (context, state) {},
        ));
  }

  @override
  void dispose() {
    EmailController.dispose();
    PasswordController.dispose();
    NameController.dispose();
    PhoneController.dispose();
  }
}
