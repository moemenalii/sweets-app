import 'package:flutter/material.dart';
import 'package:samysalim/views/dashboard%20admin/Cubit/Cubit-Admin.dart';

import '../../models/productModel.dart';
class ItemBuilder extends StatelessWidget {
  const ItemBuilder({this.allProducts ,super.key,});
  final productModel ?allProducts;

  @override
  Widget build(BuildContext context) {
     productModel ?model;
    return  Column(
      children: [
        Card(margin: EdgeInsets.all(1),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),child: Image(image: NetworkImage('${model!.productImage}' ),
                  width: double.infinity,height: 180)),
              CircleAvatar(backgroundColor: Colors.orange,child: IconButton(onPressed: (){}, icon: Icon(Icons.edit,size: 20,color: Colors.white,),)),
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
  }
}
