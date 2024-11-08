import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resources/color_Manager.dart';
import '../resources/routes_Manager.dart';
import '../resources/theme_Manager.dart';

class admin extends StatelessWidget {
  const admin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
    child: Column(
    children: [
    appBarWidget(),
      GridView.count(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisSpacing: 1,
          mainAxisSpacing: 3,
          crossAxisCount:2,
          childAspectRatio: 1/1.24,

          children:[
            Padding(
            padding: const EdgeInsets.all(10.0),
            child: ClipRRect(
borderRadius: BorderRadius.circular(40),

              child: GestureDetector(
                child: Card(color: ColorManager.orange,
                  child: Column(
                    children: [
                      Container(width: 180,height: 180,child: Icon(Icons.add_business_outlined,size: 50,color: Colors.black),),
                      Text('Add Item',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    ],
                  ),
                ),
                onTap: (){
                  Navigator.pushNamed(context,routes.addItemRoute);
                },
              ),
            ),
          ),
            Padding(
            padding: const EdgeInsets.all(10.0),
            child: ClipRRect(
borderRadius: BorderRadius.circular(40),

              child: GestureDetector(
                child: Card(color: ColorManager.orange,
            child: Column(
                children: [
                  Container(width: 180,height: 180,child: Icon(Icons.loop_outlined,size: 50,color: Colors.black),),
                  Text('Inspect Products',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                ],
            ),
                ),
                onTap: (){
                  Navigator.pushNamed(context,routes.inspectRoute);

                },
              ),
            ),
          ),

            Padding(
            padding: const EdgeInsets.all(10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: GestureDetector(
                child: Card(color: ColorManager.orange,
            child: Column(
                children: [
                  Container(width: 180,height: 180,child: Icon(Icons.cloud_upload_outlined,size: 50,color: Colors.black),),
                  Text('View Orders',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                ],
            ),
                ),
                onTap: (){
                  Navigator.pushNamed(context,routes.viewOrdersRoute);
                },
              ),
            ),
          ),
          ]
      )
    ]),
        ),);
  }}