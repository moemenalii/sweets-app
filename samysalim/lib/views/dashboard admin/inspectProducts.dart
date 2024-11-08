import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samysalim/models/productModel.dart';
import 'package:samysalim/views/resources/color_Manager.dart';
import '../resources/theme_Manager.dart';
import '../widget/itemBuilder.dart';
import 'Cubit/Cubit-Admin.dart';
import 'Cubit/State-Admin.dart';

class inspectProducts extends StatelessWidget {
  const inspectProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Builder(
        builder:(context){
          adminCubit.get(context).getProductData();
          return BlocConsumer<adminCubit,adminState>(
            listener: (context,state){
              // var allproducts=adminCubit.get(context).allProducts;

            },
          builder: (context,state)=>Scaffold(
            body: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
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
              ConditionalBuilder(
                  fallback:(context)=>SizedBox(height: 400,child: Center(child: CircularProgressIndicator(color: ColorManager.orange,))) ,
                  condition: adminCubit.get(context).allProducts!.length >0,
                  builder: (context)=> GridView.count(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: .2,
                            crossAxisCount:2,
                            childAspectRatio: 1/1.24,

                            children:List.generate(adminCubit.get(context).allProducts!.length,(index)=>
                                Itembuilder(  adminCubit.get(context).allProducts![index],context))
                            // List.generate(adminCubit.get(context).allProducts.length,(index) =>GestureDetector(
                            //     onTap: (){
                            //       // Navigator.pushNamed(context, routes.productItemRoute);
                            //     },
                            //     child: ItemBuilder(adminCubit.get(context).allProducts[index],)) ,)
                        ),

                    ),
                  ]
              ),
            ),
          ),
        );}
      );
  }
}
Widget Itembuilder(productModel ?model,context)=> Column(
  children: [
    Card(margin: EdgeInsets.all(1),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [

          ClipRRect(
              borderRadius: BorderRadius.circular(10),child: Image(image: NetworkImage('${model!.productImage}' ),
              width: double.infinity,height: 180)),
          Row(children: [
            CircleAvatar(backgroundColor: Colors.orange,child: IconButton(onPressed: (){
              // adminCubit.get(context).deleteProduct(adminCubit.get(context).model!.productId);
            }, icon: Icon(Icons.delete_outlined,size: 20,color: Colors.white,),)),
            Spacer(),
            CircleAvatar(backgroundColor: Colors.orange,child: IconButton(onPressed: (){}, icon: Icon(Icons.edit,size: 20,color: Colors.white,),)),

          ],),
        ],
      ),
    ),
    Column(
      children: [
        Row(mainAxisAlignment:MainAxisAlignment.center,children: [Text('${model.productName}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,),)],),
        Row(mainAxisAlignment:MainAxisAlignment.center,children: [Text('EGP ${model.productPrice}.00',style:  TextStyle(fontSize: 15,fontWeight: FontWeight.bold,), )],),
      ],
    )
  ],
);