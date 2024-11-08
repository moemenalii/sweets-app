import 'package:samysalim/models/productModel.dart';

class orderModel {

  final String ? productName;
  final String ? productPrice;
  final String ? productImage;
  final String ? userId;


  orderModel( {required this.productName,required this.productPrice,required this.productImage,required this.userId});


  factory orderModel.fromJson(Map<String,dynamic>jsondata){
    return orderModel(
      productName:jsondata['productName'],
      productPrice:jsondata['productPrice'],
      userId:jsondata['userId'],
      productImage:jsondata['productImage'],
    );
  }

  Map<String ,dynamic> toMap(){
    return{
      'productName':productName,
      'productPrice':productPrice,
      'userId':userId,
      'productImage':productImage,
    };
  }
}