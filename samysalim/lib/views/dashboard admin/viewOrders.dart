import 'package:flutter/material.dart';

import '../resources/theme_Manager.dart';


class viewOrders extends StatelessWidget {
  const viewOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
              children: [
                appBarWidget(),
              ]
          ),
        ),
      );
  }
}
