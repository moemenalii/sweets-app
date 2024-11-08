import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Components/Components(tools).dart';
import '../resources/color_Manager.dart';
import '../resources/strings_Manager.dart';
import '../resources/routes_Manager.dart';
import '../resources/theme_Manager.dart';
import 'cubit_login/cubit_login.dart';
import 'cubit_login/state_login.dart';

// ignore: camel_case_types
class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  var EmailController = TextEditingController();
  var PasswordController = TextEditingController();
  var Formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // var cubit = loginCubit.get(context);
    return BlocProvider(
      create: (context) => loginCubit(),
      child: BlocConsumer<loginCubit, loginState>(
        builder: (context, state) => Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: Formkey,
              child: Column(
                children: [
                  appBarWidget(),
                  IconButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, appStrings.start);
                      },
                      icon: Icon(EvaIcons.closeCircleOutline),
                      iconSize: 50,
                      color: ColorManager.orange),
                  Text(
                    appStrings.signin,
                    style: TextStyle(
                        color: ColorManager.orange,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
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
                    condition: state is! SuccessLoginState,
                    builder: (BuildContext context) => Container(
                      height: 50,
                      width: 200,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: WidgetStatePropertyAll(
                                ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.circular(100))),
                            backgroundColor:
                                WidgetStatePropertyAll(ColorManager.orange)
                            ),
                        child: Text(
                          appStrings.signin,
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          if (Formkey.currentState!.validate()) {
                            loginCubit.get(context).userlogin(
                                email: EmailController.text,
                                password: PasswordController.text);
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
        listener: (context, state) {
          if(EmailController.text=='admin@samy.com'&&PasswordController.text=='admin@samy.com'){
            Navigator.pushNamed(context, routes.adminRoute);
          }
          if (state is SuccessLoginState) {
            // CacheHelper.saveData(Key: "uId", value: state.uId).then((value) {
            // });
            // MotionToast.success(
            //   title:  Text("Success Motion Toast"),
            //   description:  Text("Example of success motion toast"),
            // ).show(context);
          }
        },
      ),
    );
  }
}
