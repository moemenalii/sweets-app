import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pretty_animated_buttons/widgets/pretty_neumorphic_button.dart';
import 'package:samysalim/views/resources/Constant.dart';


import '../../Network/Local/Cache_helper.dart';
import '../home_layout/cubit/cubit.dart';
import '../home_layout/cubit/state.dart';
import '../resources/color_Manager.dart';
import '../resources/routes_Manager.dart';
import '../resources/theme_Manager.dart';
class settings_view extends StatelessWidget {
  const settings_view({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppState>(
        builder: (context, state) {

          return Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    appBarWidget(),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(onPressed: () {
                                Navigator.pushNamed(context, routes.adminRoute);
                              },
                                  iconSize: 40,
                                  color: ColorManager.orange,
                                  icon: Icon(CupertinoIcons.person_circle)),
                              SizedBox(width: 20,),
                              PrettyNeumorphicButton(duration: Duration(
                                  milliseconds: 20),
                                label: 'person',
                                onPressed: () {
                                Navigator.pushNamed(context, routes.adminRoute);
                                },
                              ),
                            ],),
                          SizedBox(height: 40,),
                          Row(
                            children: [
                              IconButton(onPressed: () {},
                                  iconSize: 40,
                                  color: ColorManager.orange,
                                  icon: Icon(EvaIcons.messageCircleOutline)),
                              SizedBox(width: 20,),
                              PrettyNeumorphicButton(duration: Duration(
                                  milliseconds: 20),
                                label: 'language',
                                onPressed: () {},
                              ),
                            ],),
                          SizedBox(height: 40,),
                          Row(
                            children: [
                              IconButton(onPressed: () {},
                                  iconSize: 40,
                                  color: ColorManager.orange,
                                  icon: Icon(CupertinoIcons.phone_circle)),
                              SizedBox(width: 20,),
                              PrettyNeumorphicButton(duration: Duration(
                                  milliseconds: 20),
                                label: 'call center',
                                onPressed: () {
                                BottomSheet(onClosing: ()=>{}, builder: (context)=>Column(children: [
                                  Row(
                                    children: [Text('01205193855')],
                                  )
                                  
                                ],),);
                                },
                              ),
                            ],),
                          SizedBox(height: 40,),
                          Row(
                            children: [
                              IconButton(onPressed: () {},
                                  iconSize: 40,
                                  color: ColorManager.orange,
                                  icon: Icon(EvaIcons.logOutOutline)),
                              SizedBox(width: 20,),
                              PrettyNeumorphicButton(duration: Duration(
                                  milliseconds: 20),
                                label: 'logOut',
                                onPressed: () {
                                 CacheHelper.removeData(Key: 'uId',);
                                // FirebaseAuth.instance.currentUser!.delete();
                                FirebaseAuth.instance.signOut();
                                Navigator.pushReplacementNamed(context, routes.startRoute);
                                },
                              ),
                            ],),
                        ],
                      ),
                    ),
                  ],
                ),
              )
          );
        },
        listener: (context, state) {});
  }

}