import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:samysalim/models/categoryModel.dart';
import '../../../models/productModel.dart';
import 'State-Admin.dart';

class adminCubit extends Cubit<adminState> {
  adminCubit() : super(InitialState()) {}
  String? categoryValue;

  productModel? model;
  static adminCubit get(context) => BlocProvider.of(context);

  void upLoadProudct({
    required name,
    required price,
    required image,
    required description,
  }) {
    emit(UploadProductLoading());
    productModel modelProduct = productModel(
        productName: name,
        productPrice: price,
        productDescription: description,
        productImage: image);
    FirebaseFirestore.instance
        .collection('category')
        .doc('konafa')
        .collection('products')
        .add(modelProduct.toMap())
        .then((onValue) {
     String productId=onValue.id;
      emit(UploadProductSuccess());
    }).catchError((onError) {
      print(onError.toString());
      emit(UploadProductError());
    });
  }

  List<productModel> ?allProducts=[] ;
  void getProductData() {
    emit(GetProductsLoading());
    FirebaseFirestore.instance
        .collection('category')
        .doc('konafa')
        .collection('products')
        // .orderBy('lastOrder')
        .snapshots()
        .listen((onData) {
      allProducts = [];
      onData.docs.forEach((action) {
        allProducts!.add(productModel.fromJson(action.data()));
        print('${action.data()}');
      });
      emit(GetProductsSuccess());
      // allProducts = List.generate(value.docs.length,
      //     (index) => productModel.fromJson(value.docs[index].data()));
    });
  }

  void deleteProduct(productId) {
    emit(DeleteProductLoading());
    FirebaseFirestore.instance
        .collection('category')
        .doc('konafa')
        .collection('products')
        .doc(productId)
        .delete()
        .then((onValue) {
      emit(DeleteProductSuccess());

    })
        .catchError((onError) {
      emit(DeleteProductError());

    });
  }

  File? productImage;
  var picker = ImagePicker();

  Future<void> getProductImage() async {
    final XFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (XFile != null) {
      productImage = File(XFile.path);
      print(XFile.path);
      emit(pickedProductImageSuccess());
    } else {
      print('No image selected');
      emit(pickedProductImageError());
    }
  }

  String ProductImageUrl = '';
  void upLoadProductImage(
  {
    required name,
    required price,
    required image,
    required description,
}
      ) {
    emit(UploadProductImageLoading());
    FirebaseStorage.instance
        .ref()
        .child('products/${Timestamp.now().microsecondsSinceEpoch.toString()}')
        .putFile(productImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        ProductImageUrl = value;
        upLoadProudct(name: name,description:description,image: value,price: price,);
        emit(UploadProductImageSuccess());
      }).catchError((error) {
        log(error.toString());
      });
      emit(UploadProductImageError());
    });
  }

  File? categoryImage;

  Future<void> getCategoryImage() async {
    final XFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (XFile != null) {
      categoryImage = File(XFile.path);
      print(XFile.path);
      emit(pickedCategoryImageSuccess());
    } else {
      print('No image selected');
      emit(pickedCategoryImageError());
    }
  }

  String CategoryImageUrl = '';
  void upLoadCategoryImage() {
    FirebaseStorage.instance
        .ref()
        .child('category/${Uri.file(categoryImage!.path).pathSegments.last}')
        .putFile(categoryImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        CategoryImageUrl = value;
        emit(UploadCategoryImageSuccess());
      }).catchError((error) {});
      emit(UploadCategoryImageError());
    }).catchError((error) {
      emit(UploadCategoryImageError());
    });
  }

  static List<String> categoriesList = [
    'Konafa',
    'Sharky',
    'Torat',
    'Gatou',
    'kahk',
    'Moled',
    "Rmadan",
  ];

  static List<DropdownMenuItem<String>>? get categoriesDropDownList {
    List<DropdownMenuItem<String>>? menuItems =
        List<DropdownMenuItem<String>>.generate(
      categoriesList.length,
      (index) => DropdownMenuItem(
        value: categoriesList[index],
        child: Text(
          categoriesList[index],
        ),
      ),
    );
    return menuItems;
  }

  changeCategory(String? value) {
    categoryValue = value;
    emit(changeCategoryValue());
  }
}
