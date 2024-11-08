import 'dart:async';
import 'package:flutter/material.dart';
import 'package:samysalim/Network/constant.dart';
import 'package:samysalim/views/dashboard%20admin/Cubit/Cubit-Admin.dart';
import 'package:samysalim/views/login/cubit_login/cubit_login.dart';
import '../resources/color_Manager.dart';
import '../resources/routes_Manager.dart';


class splashView extends StatefulWidget {
  const splashView({Key? key}) : super(key: key);

  @override
  State<splashView> createState() => _splashViewState();
}

class _splashViewState extends State<splashView> {
  Timer ? _timer;
  _startDely(){
    _timer= Timer(const Duration(milliseconds:2500),_goNext);
  }
  _goNext(){
      Navigator.pushReplacementNamed(context, routes.onBoardingRoute);

  }
  @override
  void initState() {
    _startDely();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor:ColorManager.orange,
      body:Center(child:
    Material(
      color: Colors.transparent,
      child: Image(image: AssetImage('assets/images/logo.png'),width: 190,height: 190,),
    ),
    ));
  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

}

