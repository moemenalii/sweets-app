import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Components/Components(tools).dart';
import '../home_layout/cubit/cubit.dart';
import '../home_layout/cubit/state.dart';
import '../resources/color_Manager.dart';

class productItem extends StatelessWidget {
  const productItem({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    var notecontroller = TextEditingController();
    var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.orange),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: Container(
                        child: Image(
                      image: NetworkImage(
                          '${AppCubit.get(context).allProducts![index].productImage}'),
                      fit: BoxFit.cover,
                      width: 300,
                      height: 300,
                    )),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    '${AppCubit.get(context).allProducts![index].productName}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '${AppCubit.get(context).allProducts![index].productPrice}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.orange),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            AppCubit.get(context).countplus();
                          },
                          icon: Icon(
                            Icons.add_circle,
                            color: ColorManager.orange,
                          )),
                      Text(
                        '${AppCubit.get(context).counter}',
                        style: TextStyle(fontSize: 25),
                      ),
                      IconButton(
                          onPressed: () {
                            AppCubit.get(context).countminus();
                          },
                          icon: Icon(
                            EvaIcons.minusCircle,
                            color: ColorManager.orange,
                          )),
                    ],
                  ),
                  // BuildItem(context,index),
                  SizedBox(
                    height: 30,
                  ),
                  defultTextForm(
                      label: 'add Notes', controller: notecontroller),
                  SizedBox(
                    height: 40,
                  ),
                  defultButton(
                    label: 'Add to cart',
                    onTap: () {
                      // AppCubit.get(context).addOrder(
                      //     productImage: AppCubit.get(context)
                      //         .allProducts![index]
                      //         .productImage,
                      //     productName: AppCubit.get(context)
                      //         .allProducts![index]
                      //         .productName,
                      //     productPrice: AppCubit.get(context)
                      //         .allProducts![index]
                      //         .productPrice);
                    },
                  ),
                ],
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}
// Widget BuildItem(context,index){
//   return
// }
