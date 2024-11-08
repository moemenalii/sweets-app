import 'dart:ffi';
import 'dart:math';
import 'package:uuid/uuid.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samysalim/Network/constant.dart';
import 'package:samysalim/models/orderModel.dart';
import 'package:samysalim/models/userModel.dart';
import '../../../models/productModel.dart';
import '../../cart/cart_view.dart';
import '../../home/home.dart';
import '../../resources/color_Manager.dart';
import '../../settings/settings_view.dart';
import 'state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);
  userModel? model;
  // var uuid = Uuid();
  List<Widget> Screens = [
    const cart_view(),
    const homeView(),
    const settings_view(),
  ];
  int CurrentIndex = 1;
  void ChangeBottomNav(index) {
    CurrentIndex = index;
    emit(AppChangeBottomNav());
  }

  dynamic BottomNav() => CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Colors.orange,
        animationCurve: Curves.bounceInOut,
        animationDuration: Duration(milliseconds: 200),
        items: const [
          CurvedNavigationBarItem(
            child: Badge(
                child: Icon(
                  CupertinoIcons.shopping_cart,
                ),
                backgroundColor: ColorManager.red,
                label: Text(
                  '6',
                  style: TextStyle(fontSize: 8),
                )),
            label: 'Cart',
          ),
          CurvedNavigationBarItem(
            child: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          CurvedNavigationBarItem(
            child: Icon(CupertinoIcons.settings),
            label: 'Settings',
          ),
        ],
        index: CurrentIndex,
        onTap: (index) {
          ChangeBottomNav(index);
        },
      );
  int counter = 0;
  countplus() {
    counter++;
    emit(AppChangeCounterplus());
  }

  countminus() {
    if (counter > 0) {
      counter--;
    }
    emit(AppChangeCounterminus());
  }

  countminusCart() {
    if (counter > 1) {
      counter--;
    }
    emit(AppChangeCounterminus());
  }

  bool isdelivery = true;
  void delivery() {
    isdelivery = true;
    emit(AppChangeToDelivery());
  }

  void pickUp() {
    isdelivery = false;
    emit(AppChangeToPickUp());
  }

  List<productModel>? allProducts = [];
  void getProductData() {
    FirebaseFirestore.instance
        .collection('category')
        .doc('konafa')
        .collection('products')
        // .orderBy('dateTime')
        .snapshots()
        .listen((onData) {
      allProducts = [];
      print('${allProducts!.length}');
      // print('${model!.uId}');
      onData.docs.forEach((action) {
        allProducts!.add(productModel.fromJson(action.data()));
      });
      emit(GetProductsSuccess());
      // allProducts = List.generate(value.docs.length,
      //     (index) => productModel.fromJson(value.docs[index].data()));
    });
  }
  Future<void> addOrder(
      {
        required String? productImage,
        required String? productName,
        required String? productPrice,
      }) async {
    // print(model!.uId);
    orderModel modelorder = orderModel(
      productImage:productImage,
        productName: productName,
        productPrice: productPrice,
        userId:uId);
    print(uId);
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('orders')
        .add(modelorder.toMap())
        .then((onValue) {
      // productId=onValue.id;
      emit(AddOrderSuccess());
    }).catchError((onError) {
      print('errrorrrrrr${onError.toString()}');
      log(onError);
      emit(AddOrderError());
    });
  }
}
