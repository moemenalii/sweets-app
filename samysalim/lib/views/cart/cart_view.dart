import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import '../home_layout/cubit/cubit.dart';
import '../resources/strings_Manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../home_layout/cubit/state.dart';
import '../resources/color_Manager.dart';
import '../resources/theme_Manager.dart';
import '../resources/routes_Manager.dart';
class cart_view extends StatelessWidget {
  const cart_view({super.key});
  @override

  Widget build(BuildContext context) {
    var cubit =AppCubit.get(context);
    return  BlocConsumer<AppCubit,AppState>(
        builder: (context,state){
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                  children: [
                    appBarWidget(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('your Cart',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 30,) ,),
                          SizedBox(
                            width: 400,
                            child: ListView.separated(
                              separatorBuilder: (context,index)=>Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: Container(height: 0,width: 2,color: Colors.black12,),
                              ),
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: 3,
                                itemBuilder: (context,index)=>productcart(cubit)
                            ),
                          ),
                          SizedBox(height:15,),
                          Row(children: [Text('Total Price : 250 ',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)],),

                          SizedBox(height:15,),
                          Container(
                              width: 180,
                              height: 50,
                              decoration:  const BoxDecoration(
                                color: ColorManager.orange,
                                borderRadius:BorderRadius.all(Radius.circular(50.0)),
                              ),
                              child: TextButton(
                                  onPressed: (){
                                    Navigator.pushReplacementNamed(context, routes.paymentRoute);
                                  },
                                  child: Text(appStrings.confirm,style: TextStyle(color: Colors.white),))),
                          SizedBox(height:15 ,),

                        ],
                      ),
                    ),
                  ]
              ),
            ),
          );
        },
        listener:  (context,state){});
  }
}

 productcart(cubit)=>Card(
   child: Padding(
     padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 4),
     child: Row(
       children: [
         ClipRRect(borderRadius: BorderRadius.circular(12),child: Image(image: AssetImage('assets/images/tort.jpg', ),fit: BoxFit.cover,width: 140,height: 160)),
         const SizedBox(width: 10,),
         const Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 Text('cake mango ',maxLines: 2,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
               ],
             ),
             SizedBox(height: 10,),
             Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Text('cake mango',maxLines: 2,style: TextStyle(fontSize: 15,color: Colors.grey,)),
               ],
             ),
             SizedBox(height: 20,),
             Row(
               children: [
                 Text('150 L.E',maxLines: 2,overflow: TextOverflow.clip,style: TextStyle(fontSize: 30,color: Colors.grey,)),
               ],
             ),
           ],
         ),
         Column(children: [
           IconButton(onPressed: (){
             cubit.countplus();
           }, icon:Icon(Icons.add_circle,color: ColorManager.orange,)),
           Text('${cubit.counter} pieces',style: TextStyle(fontSize: 20,color: Colors.black,),),
           IconButton(onPressed: (){
             cubit.countminusCart();
           }, icon:Icon(EvaIcons.minusCircle,color: ColorManager.orange,)),
         ],)
       ],
     ),
   ),
 );