import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samysalim/models/userModel.dart';
import '../../Components/Components(tools).dart';
import '../../Network/constant.dart';
import '../../models/productModel.dart';
import '../home_layout/cubit/cubit.dart';
import '../home_layout/cubit/state.dart';
import '../onboarding/onboarding_view.dart';
import '../resources/color_Manager.dart';
import '../resources/routes_Manager.dart';
import '../resources/strings_Manager.dart';
import '../resources/theme_Manager.dart';

class homeView extends StatelessWidget {
  const homeView({super.key});
  @override

  Widget build(BuildContext context) {
    late final List<sliderObject>_list=[
      // sliderObject(appStrings.boarding1,'assets/images/logo.png' ),
      sliderObject(appStrings.boarding2, 'assets/images/lots.jpg'),
      sliderObject(appStrings.boarding3, 'assets/images/tort.jpg'),
      sliderObject(appStrings.boarding3, 'assets/images/basbosa.jpg'),
      sliderObject(appStrings.boarding3, 'assets/images/blah.jpg'),
    ];

    productModel ?model;
    var cubit =AppCubit.get(context);
    var SearchController =TextEditingController();
    return  Builder(
      builder:(context){
        AppCubit.get(context).getProductData();
        return BlocConsumer<AppCubit,AppState>(
          builder: (context,state){
            return Scaffold(
                body: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: ClampingScrollPhysics(),
                  child: Column(
                    children: [
                        appBarWidget(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              defultTextForm(
                                controller: SearchController,
                                keyboardType:TextInputType.text,
                                prefixIcon:Icon(CupertinoIcons.search),
                                label:'Search Your Favorite Sweets',
                                onTab: (){},
                              ),
                              SizedBox(height: 10,),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: CarouselSlider(
                                    items:_list.map((e)=>  Image(
                                      image: AssetImage('${e.image}'),
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    )).toList() ,
                                    options: CarouselOptions(
                                      height: 200.0,
                                      initialPage: 0,
                                      viewportFraction: 1.0,
                                      reverse: false,
                                      enableInfiniteScroll: true,
                                      autoPlay: true,
                                      autoPlayInterval: Duration(seconds: 1),
                                      autoPlayAnimationDuration: Duration(seconds: 1),
                                      autoPlayCurve: Curves.fastOutSlowIn,
                                      scrollDirection: Axis.horizontal,
                                    )),
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Category',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 30,) ,),
                                ],
                              ),
                              SizedBox(height: 10,),
                              // if(adminCubit.get(context).categoriesMenue !=[])
                              SizedBox(
                               height: 100,
                               child: ListView.builder(
                                 shrinkWrap: true,
                                 scrollDirection: Axis.horizontal,
                                 itemCount:4,
                                 itemBuilder: (context,index)=>Padding(
                                   padding:  EdgeInsets.symmetric(horizontal: 5.0),
                                   child: ClipRRect(
                                     borderRadius: BorderRadius.circular(15),
                                     child: Stack(
                                       children: [
                                         Container(width: 120,height: 120,color: Colors.white60,child:
                                         Image(image: AssetImage('${_list[index].image}', ),fit: BoxFit.cover,)),
                                         // Image(image: NetworkImage(adminCubit.get(context).CategoryImageUrl, ),fit: BoxFit.cover,)),
                                         // Text(adminCubit.get(context).categories!.categoryname,style: TextStyle(),),
                                       ],
                                     ),
                                   ),
                                 ),
                                 ),
                             ),
                              GridView.count(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                crossAxisSpacing: 1,
                                mainAxisSpacing: 3,
                                crossAxisCount:2,
                                childAspectRatio: 1/1.24,

                                children:List.generate(cubit.allProducts!.length,(index) =>GestureDetector(
                                  onTap: (){
                                    Navigator.pushNamed(context, routes.productItemRoute,arguments: index);
                                  },
                                    child: ItemBuilder(cubit.allProducts![index],context, index)) ,)),
                            ],
                          ),
                        ),
                      ],
                  ),
                ),
            );
          } ,
          listener:  (context,state){});}
    );
  }
}
userModel ?_model;
Widget ItemBuilder(productModel ?model,context,index)=> Column(
  children: [
    Stack(
      alignment: Alignment.bottomRight,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(25),child: Image(image: NetworkImage('${model!.productImage}')
            ,width: double.infinity,height: 200)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 20,),
            Text('${model.productPrice} LE',style:
            TextStyle(fontWeight: FontWeight.bold, backgroundColor: Colors.transparent,fontSize: 20),),
            Spacer(),
            IconButton(onPressed: (){
              print(uId);
              AppCubit.get(context).addOrder(
                  productImage: AppCubit.get(context)
                      .allProducts![index]
                      .productImage,
                  productName: AppCubit.get(context)
                      .allProducts![index]
                      .productName,
                  productPrice: AppCubit.get(context)
                      .allProducts![index]
                      .productPrice);
            },
                icon: Icon(Icons.add_circle),color: ColorManager.orange,iconSize: 25),
            SizedBox(width: 8,),
          ],
        ),
      ],
    ),
  ],
);