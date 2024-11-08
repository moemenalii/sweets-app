import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samysalim/views/home_layout/cubit/cubit.dart';
import 'package:samysalim/views/dashboard admin/Cubit/Cubit-Admin.dart';
import 'package:samysalim/views/resources/color_Manager.dart';
import 'package:samysalim/views/resources/routes_Manager.dart';
import 'Network/Local/Cache_helper.dart';
import '../../Network/constant.dart';

// import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
//   //معناه يشغل كل الفانكشن ال async بعدين يشغل الابليكشن
  await Firebase.initializeApp(
    // options: DefairebaseOptions.currentPlatform,
  );
  await CacheHelper.init();
 var  uId =CacheHelper.GetData(Key: 'uId');
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider (
      providers: [
        BlocProvider(create: (context)=>AppCubit()..getProductData(),),
        BlocProvider(create: (context)=>adminCubit(),),
      ],
      child:ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_ , child) {
            return MaterialApp(
              title: 'samy salem',
              theme:ThemeData(primaryColor:ColorManager.orange,hoverColor:ColorManager.orange,textSelectionTheme:TextSelectionThemeData(
                cursorColor:  ColorManager.orange,
                selectionColor:  ColorManager.orange,
                selectionHandleColor:  ColorManager.orange,
              )  ),
              debugShowCheckedModeBanner: false,
              onGenerateRoute: routeGenerator.getRoutes,
              initialRoute: routes.splashRoute,
            );}
      ),);
  }
}
// ./gradlew signingReport
// for SH1