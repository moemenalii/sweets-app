import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samysalim/Network/constant.dart';
import '../../Components/Components(tools).dart';
import '../../models/productModel.dart';
import '../resources/color_Manager.dart';
import '../resources/theme_Manager.dart';
import 'Cubit/Cubit-Admin.dart';
import 'Cubit/State-Admin.dart';

class AddItem extends StatelessWidget {
   AddItem({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit= adminCubit.get(context);
    var upLoadProduct =GlobalKey<FormState>();
    var productNameController = TextEditingController();
    var productPriceController = TextEditingController();
    var productDescriptionController = TextEditingController();
    productModel ?product ;

    return BlocConsumer<adminCubit, adminState>(
      builder: (context, state) {
        var cubit = adminCubit.get(context);
        var productImage = cubit.productImage;
        return Scaffold(
          body: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Form(
              key: upLoadProduct,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    appBarWidget(),
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Container(
                            height: 180,
                            width: 150,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: productImage == null
                                  ? const AssetImage('assets/images/basbosa.jpg')
                                  : FileImage(productImage) as ImageProvider,
                            )),

                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.orange,
                          child: IconButton(
                              icon: Icon(Icons.add_circle),
                              onPressed: () {
                                cubit.getProductImage();
                              }),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    DropdownButton<String>(
                      dropdownColor: ColorManager.orange,
                      style: TextStyle(color: ColorManager.c4,fontSize: 25,fontWeight: FontWeight.w500),
                      menuWidth: 180,
                      borderRadius: BorderRadius.circular(10),
                      hint: Text(cubit.categoryValue ?? "Select Category"),
                      value: cubit.categoryValue,
                      items: adminCubit.categoriesDropDownList,
                      onChanged: (String? value) {
                        cubit.changeCategory (value);
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    defultTextForm(
                      label: 'Name Product',
                      controller: productNameController,
                      keyboardType: TextInputType.text,
                      validate: (String? value) {
                        if(value!.isEmpty)
                        print('Entre Name Product');
                      },
                    ),    defultTextForm(
                      label: 'Description Product',
                      controller: productDescriptionController,
                      keyboardType: TextInputType.text,
                      validate: (String? value) {
                        if(value!.isEmpty)
                        print('Entre Description\'s Product');
                      },
                    ),
                    defultTextForm(
                      label: 'Price Product',
                      controller: productPriceController,
                      keyboardType: TextInputType.number,
                      validate: (String? value) {
                        if(value!.isEmpty)
                          print('Entre Price Product');
                      },

                    ),
                defultButton(
                        label: 'Upload Product',
                        onTap: () {

                        if(upLoadProduct.currentState!.validate()){
                          adminCubit.get(context).upLoadProductImage(
                            // productId: cubit.model!.productId,
                            description: productDescriptionController.text,
                              name:productNameController.text,
                              price:productPriceController.text ,
                              image:cubit.ProductImageUrl.toString(),
                          );
                        }
                        }),

                  ]),
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
