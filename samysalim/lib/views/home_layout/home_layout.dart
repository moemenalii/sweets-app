import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';
class home_layout extends StatelessWidget {
  const home_layout({super.key});

  @override
  Widget build(BuildContext context){
    var cubit =AppCubit.get(context);
        return  BlocConsumer<AppCubit,AppState>(
        builder: (context,state)=>Scaffold(
          body: cubit.Screens[cubit.CurrentIndex],
          bottomNavigationBar:cubit.BottomNav(),),
        listener:  (context,state){});
  }
}
