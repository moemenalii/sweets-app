import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Components/Components(tools).dart';
import '../home_layout/cubit/cubit.dart';
import '../home_layout/cubit/state.dart';
import '../resources/color_Manager.dart';
import '../resources/strings_Manager.dart';
import '../resources/theme_Manager.dart';
class delivery extends StatelessWidget {
  const delivery({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit =AppCubit.get(context);
    return BlocConsumer<AppCubit,AppState>(
        builder: (context,state){
      return  Scaffold(
      body: SingleChildScrollView(
       physics: ClampingScrollPhysics(),
       child: Column(
         children: [
           appBarWidget(),
           Text('your Order',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 30,) ,),
           SizedBox(height:30 ,),
           Row(children: [
             SizedBox(width:12 ,),
             Container(
                 width: 180,
                 height: 50,
                 decoration:  const BoxDecoration(
                   color: ColorManager.orange,
                   borderRadius:BorderRadius.all(Radius.circular(50.0)),
                 ),
                 child: TextButton(
                     onPressed: (){
                       cubit.delivery();
                     },
                     child: Text(appStrings.delivery,style: TextStyle(color: Colors.white),))),
             SizedBox(width:5 ,),
             Container(
                 width: 180,
                 height: 50,
                 decoration:  const BoxDecoration(
                   color: ColorManager.white,
                   borderRadius:BorderRadius.all(Radius.circular(50.0)),
                 ),
                 child: TextButton(
                     onPressed: (){
                       cubit.pickUp();
                     },
                     child: Text(appStrings.pickup,style: TextStyle(color: Colors.orange),))),
           ],
           ),
           SizedBox(height: 10,),
           if(cubit.isdelivery==true)
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
                 child: Column(
                   children: [
                     SizedBox(height: 20,),
                     textformdelivery(onTap: (){},label: 'your Name',icon: Icon(Icons.person),keyboardType:TextInputType.text),
                     SizedBox(height: 20,),
                     textformdelivery(onTap: (){},label: 'your Address',hint: 'حي الزهور شارع عمر بن الخطاب ع 1 ش 10',icon: Icon(Icons.place_outlined),keyboardType:TextInputType.text),
                     SizedBox(height: 20,),
                     textformdelivery(onTap: (){},label: 'your Phone',hint: '0120099999',icon: Icon(Icons.phone),keyboardType:TextInputType.phone),
                     SizedBox(height: 20,),
                     Row(children: [Text('Total Price : 250 ',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)],),
                     SizedBox(height: 20,),
                     defultButton(label: 'Confirm', onTap: (){},),

                   ],),
               ),
             ),
          if (cubit.isdelivery ==false)
          Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
          child: Column(
          children: [
          SizedBox(height: 20,),
          textformdelivery(onTap: (){},label: 'your Name',icon: Icon(Icons.person),keyboardType:TextInputType.text),
          SizedBox(height: 20,),
          textformdelivery(onTap: (){},label: 'your Phone',hint: '0120099999',icon: Icon(Icons.phone),keyboardType:TextInputType.phone),
          SizedBox(height: 20,),
          Row(children: [Text('Total Price : 250 ',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)],),
          SizedBox(height: 20,),
          defultButton(label: 'Confirm', onTap: (){},),

          ],),
          ),
          ),
          ]
       )
      ),
    );},
        listener:  (context,state){});

  }
}
