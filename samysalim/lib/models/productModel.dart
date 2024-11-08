
import 'dart:io';

class productModel {
  final String ? productName;
  // final String ? productId;
  final String ? productPrice;
  final String ? productDescription;
  final String ? productImage;


  productModel( {required this.productName,required this.productPrice,required this.productDescription,required this.productImage});


  factory productModel.fromJson(Map<String,dynamic>jsondata){
    return productModel(
      productName:jsondata['productName'],
      // productId:jsondata['productId'],
      productPrice:jsondata['productPrice'],
      productDescription:jsondata['productDescription'],
      productImage:jsondata['productImage'],
    );
  }

  Map<String ,dynamic> toMap(){
    return{
      'productName':productName,
      // 'productId':productId,
      'productPrice':productPrice,
      'productDescription':productDescription,
      'productImage':productImage,
    };
  }
  // static List<productModel>products=[
  //   productModel(productId:'5',productDescription: '10',productName: 'konafa lotas',productPrice: '150',productImage:'assets/images/lots.jpg'),
  //   productModel(productId:'5',productDescription: '11',productName: 'torta manga',productPrice: '150',productImage:'assets/images/tort.jpg'),
  //   productModel(productId:'5',productDescription: '11',productName: 'torta manga',productPrice: '150',productImage:'assets/images/basbosa.jpg'),
  //   productModel(productId:'5',productDescription: '11',productName: 'torta manga',productPrice: '150',productImage:'assets/images/gato.jpg'),
  //   productModel(productId:'5',productDescription: '11',productName: 'torta manga',productPrice: '150',productImage:'assets/images/kahk.jpg'),
  //   productModel(productId:'5',productDescription: '11',productName: 'torta manga',productPrice: '150',productImage:'assets/images/blah.jpg'),
  // ];
}