import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../resources/color_Manager.dart';

class payment extends StatelessWidget {
  const payment({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var groupValue;
    var moneyValue;
    return Scaffold(
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                   'recive method',
                    style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.black),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RadioListTile(
                    value: "Delivery",
                    groupValue: groupValue,
                    onChanged: (value) {
                    //   setState(() {
                    //     if (context.read<AppCubit>().isVisaSuccess == true) {
                    //       MotionToast.info(
                    //           description: Text(LocaleKeys.already.tr()))
                    //           .show(context);
                    //     } else {
                    //       groupValue = value.toString();
                    //     }
                    //   });
                    },
                    title: Text('Delivery',
                      style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.black),

                    ),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    secondary: const Icon(
                      Icons.delivery_dining,
                      color: ColorManager.orange
                    ),
                  ),
                  RadioListTile(
                    value: "Pickup",
                    groupValue: groupValue,
                    onChanged: (value) {
                      // setState(() {
                      //   groupValue = value.toString();
                      // });
                    },
                    title: Text(
                      'pickUp',
                      style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.black),),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    secondary: const  Icon(Icons.store_outlined,
                      color: ColorManager.orange,
                    ),
                  ),
                ],
              ),

            if (groupValue == "Delivery")
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('address'
                      // LocaleKeys.address.tr(),
                      // style: TextsStyle.heavyStyle(23, Colors.black, context),
                    ),
                    const SizedBox(
                      height: 20,
                    ),TextFormField(
                      decoration: InputDecoration(hintText: 'name'),
                    ),
                    // TheTextFiled(
                    //   controller: namesController,
                    //   hintText: LocaleKeys.name.tr(),
                    //   prefix: FontAwesomeIcons.user,
                    //   keyboardType: TextInputType.name,
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return "${LocaleKeys.name.tr()} ${LocaleKeys.isEmpty.tr()} ";
                    //     }
                    //     return null;
                    //   },
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    // DropdownButtonFormField(
                    //   items: [
                    //     DropdownMenuItem(
                    //       value: "حي العرب",
                    //       child: Text(LocaleKeys.arab.tr(),
                    //           style: TextsStyle.semiBoldStyle(
                    //               20, Colors.black, context)),
                    //     ),
                    //     DropdownMenuItem(
                    //       value: "حي الصواحي",
                    //       child: Text(LocaleKeys.eldwahy.tr(),
                    //           style: TextsStyle.semiBoldStyle(
                    //               20, Colors.black, context)),
                    //     ),
                    //     DropdownMenuItem(
                    //       value: "حي المناخ",
                    //       child: Text(LocaleKeys.elmanah.tr(),
                    //           style: TextsStyle.semiBoldStyle(
                    //               20, Colors.black, context)),
                    //     ),
                    //     DropdownMenuItem(
                    //       value: "حي الشرق",
                    //       child: Text(LocaleKeys.EastDistrict.tr(),
                    //           style: TextsStyle.semiBoldStyle(
                    //               20, Colors.black, context)),
                    //     ),
                    //     DropdownMenuItem(
                    //       value: "حي الزهور",
                    //       child: Text(LocaleKeys.ZuhurDistrict.tr(),
                    //           style: TextsStyle.semiBoldStyle(
                    //               20, Colors.black, context)),
                    //     ),
                    //     DropdownMenuItem(
                    //       value: "بؤرفؤاد",
                    //       child: Text(LocaleKeys.PortFouad.tr(),
                    //           style: TextsStyle.semiBoldStyle(
                    //               20, Colors.black, context)),
                    //     ),
                    //     DropdownMenuItem(
                    //       value: "خارج بورسعيد",
                    //       child: Text(LocaleKeys.outsaid.tr(),
                    //           style: TextsStyle.semiBoldStyle(
                    //               20, Colors.black, context)),
                    //     ),
                    //   ],
                    //   onChanged: (value) {
                    //     if (context.read<AppCubit>().isVisaSuccess == true) {
                    //       MotionToast.info(
                    //           description: Text(LocaleKeys.already.tr()))
                    //           .show(context);
                    //     } else {
                    //       setState(() {
                    //         districtValue = value.toString();
                    //       });
                    //     }
                    //   },
                    //   decoration: InputDecoration(
                    //     border: OutlineInputBorder(
                    //       borderSide:
                    //       const BorderSide(color: ColorsManger.scaffold),
                    //       borderRadius: BorderRadius.circular(20),
                    //     ),
                    //     iconColor: Colors.black,
                    //     enabledBorder: OutlineInputBorder(
                    //       borderSide:
                    //       const BorderSide(color: ColorsManger.scaffold),
                    //       borderRadius: BorderRadius.circular(20),
                    //     ),
                    //     focusColor: Colors.black,
                    //     focusedBorder: OutlineInputBorder(
                    //       borderSide: const BorderSide(color: Colors.black),
                    //       borderRadius: BorderRadius.circular(20),
                    //     ),
                    //     prefixIcon: const Icon(
                    //       Icons.location_on,
                    //       color: ColorsManger.primaryColorLight,
                    //     ),
                    //   ),
                    //   value: districtValue,
                    //   validator: (value) {
                    //     if (value == null) {
                    //       return LocaleKeys.Pleaseselectdistrict.tr();
                    //     }
                    //     return null;
                    //   },
                    // ),
                    const SizedBox(
                      height: 20,
                    ),TextFormField(
                    decoration: InputDecoration(hintText: 'street'),),
                    // TheTextFiled(
                    //   controller: streetController,
                    //   hintText: LocaleKeys.streetHint.tr(),
                    //   prefix: FontAwesomeIcons.streetView,
                    //   keyboardType: TextInputType.streetAddress,
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return "${LocaleKeys.street.tr()} ${LocaleKeys.isEmpty.tr()} ";
                    //     }
                    //     return null;
                    //   },
                    // ),
                    const SizedBox(
                      height: 20,
                    ),TextFormField(
    decoration: InputDecoration(hintText: 'building'),),
                    // TheTextFiled(
                    //   controller: buildingController,
                    //   hintText: LocaleKeys.buildingHint.tr(),
                    //   prefix: FontAwesomeIcons.solidBuilding,
                    //   keyboardType: TextInputType.streetAddress,
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return "${LocaleKeys.buildingnum.tr()} ${LocaleKeys.isEmpty.tr()} ";
                    //     }
                    //     return null;
                    //   },
                    // ),
                    const SizedBox(
                      height: 20,
                    ),TextFormField(
    decoration: InputDecoration(hintText: 'flat'),),
                    // TheTextFiled(
                    //   controller: flatController,
                    //   hintText: "${LocaleKeys.flat.tr()} .10",
                    //   prefix: FontAwesomeIcons.doorClosed,
                    //   keyboardType: TextInputType.streetAddress,
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return "${LocaleKeys.flat.tr()} ${LocaleKeys.isEmpty.tr()} ";
                    //     }
                    //     return null;
                    //   },
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'phone'),),
                    // TheTextFiled(
                    //   controller: phoneController,
                    //   hintText: "01000000000",
                    //   prefix: FontAwesomeIcons.phone,
                    //   keyboardType: TextInputType.phone,
                    //   maxLength: 11,
                    //   validator: (value) {
                    //     if (value!.isPhoneNumber) {
                    //       return "${LocaleKeys.phone.tr()} ${LocaleKeys.isEmpty.tr()} ";
                    //     }
                    //     return null;
                    //   },
                    // ),
                  ],
                ),
              ),
            if (groupValue == "Pickup")
              Container(

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('pickup info'
                      // LocaleKeys.pickupInfo.tr(),
                      // style: TextsStyle.heavyStyle(23, Colors.black, context),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
    decoration: InputDecoration(hintText: 'name'),
    )
                    // TheTextFiled(
                    //   controller: namesController,
                    //   hintText: LocaleKeys.name.tr(),
                    //   prefix: FontAwesomeIcons.user,
                    //   keyboardType: TextInputType.name,
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return "${LocaleKeys.name.tr()} ${LocaleKeys.isEmpty.tr()} ";
                    //     }
                    //     return null;
                    //   },
                    // ),
                  ],
                ),
              ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('payment summary'
                    // LocaleKeys.PaymentSummary.tr(),
                    // style: TextsStyle.heavyStyle(23, Colors.black, context),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('subtotal'
                    // '${LocaleKeys.subtotal.tr()}  :  ${widget.total} ${LocaleKeys.le.tr()} ',
                    // style: TextsStyle.semiBoldStyle(20, Colors.black, context),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (groupValue == "Delivery")
                    Text('delivery'
                      // '${LocaleKeys.delivery.tr()}  :  ${context.read<AppCubit>().deliveryPrice(districtValue, context.read<AppCubit>().branchValue)} ${LocaleKeys.le.tr()} ',
                      // style:
                      // TextsStyle.semiBoldStyle(20, Colors.black, context),
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('total price'
                    // '${LocaleKeys.totalPrice.tr()}  :  ${groupValue == "Delivery" ? widget.total + context.read<AppCubit>().deliveryPrice(districtValue, context.read<AppCubit>().branchValue) : widget.total} ${LocaleKeys.le.tr()} ',
                    // style: TextsStyle.semiBoldStyle(20, Colors.black, context),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('payment method'
                    // LocaleKeys.paymentMethod.tr(),
                    // style: TextsStyle.heavyStyle(23, Colors.black, context),
                    // textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RadioListTile(
                    value: "cash",
                    groupValue: moneyValue,
                    onChanged: (value) {
                      // if (context.read<AppCubit>().isVisaSuccess == true) {
                      //   MotionToast.info(
                      //       description: Text(LocaleKeys.already.tr()))
                      //       .show(context);
                      // } else {
                      //   setState(() {
                      //     context.read<AppCubit>().moneyValue =
                      //         value.toString();
                      //   });
                      // }
                    },
                    title: Text('cash'
                      // LocaleKeys.cash.tr(),
                     // style: TextsStyle.boldStyle(20, Colors.black, context),
                    ),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    secondary: const FaIcon(
                      FontAwesomeIcons.moneyBill1,
                      color: Colors.green,
                    ),
                  ),
                  RadioListTile(
                    value: "visa",
                    groupValue: moneyValue,
                    onChanged: (value) {
                      // if (formKey.currentState!.validate()) {
                      //   context.read<AppCubit>().showLoaderDialog(context);
                      //   context
                      //       .read<AppCubit>()
                      //       .getFirstToken(
                      //       groupValue == "Delivery"
                      //           ? widget.total +
                      //           context.read<AppCubit>().deliveryPrice(
                      //               districtValue,
                      //               context
                      //                   .read<AppCubit>()
                      //                   .branchValue)
                      //           : widget.total,
                      //       context)
                      //       .whenComplete(() {
                      //     Navigator.pop(context);
                      //   });
                      // }
                    },
                    title: Text('visa'
                      // LocaleKeys.visa.tr(),
                      // style: TextsStyle.boldStyle(20, Colors.black, context),
                    ),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    secondary: const FaIcon(
                      FontAwesomeIcons.ccVisa,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  // if (formKey.currentState!.validate()) {
                  //   context.read<AppCubit>().confirmOrder(
                  //     context,
                  //     userName: namesController.text,
                  //     deliveryMethod: groupValue,
                  //     totalPrice: groupValue == "Delivery" ? widget.total + context.read<AppCubit>().deliveryPrice(districtValue, context.read<AppCubit>().branchValue) : widget.total,
                  //     address: AddressModel(
                  //         buildingNumber: buildingController.text,
                  //         district: districtValue,
                  //         street: streetController.text,
                  //         flat: flatController.text,
                  //         phone: phoneController.text,
                  //         latLng: ""),
                  //     paymentMethod: context.read<AppCubit>().moneyValue,
                  //   );
                  //   context.read<AppCubit>().sendNotification(context);
                  // }
                },
                child: Text('confirm'),
  )],
        ),
      ),
    );
  }
}
