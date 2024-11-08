import 'package:flutter/material.dart';
import '../OTP/verfication.dart';
import '../cart/delivery.dart';
import '../cart/payment.dart';
import '../dashboard admin/addItem.dart';
import '../dashboard admin/admin.dart';
import '../dashboard admin/inspectProducts.dart';
import '../dashboard admin/viewOrders.dart';
import '../forgot_password/forgot_password_view.dart';
import '../home_layout/home_layout.dart';
import '../login/login_view.dart';
import '../onboarding/onboarding_view.dart';
import '../productItem/productItem.dart';
import '../settings/settings_view.dart';
import '../signUp/signup.dart';
import '../splash/splash_view.dart';
import '../start/start_view.dart';
import '../resources/strings_Manager.dart';
class routes{
  static const String splashRoute ="/";
  static const String onBoardingRoute ="/onBoarding";
  static const String startRoute ="/start";
  static const String loginRoute ="/login";
  static const String signupRoute ="/signup";
  static const String otpRoute ="/otp";
  static const String home_view ="/homeView";
  static const String settingsRoute ="/settings";
  static const String deliveryRoute ="/delivery";
  static const String paymentRoute ="/payment";
  static const String forgotPasswordRoute ="/forgotPassword";
  static const String adminRoute ="/admin";
  static const String addItemRoute ="/additem";
  static const String addCategoryRoute ="/addcategories";
  static const String viewOrdersRoute ="/viewOrders";
  static const String inspectRoute ="/inspectProducts";
  static const String productItemRoute ="/productItem";
}
class routeGenerator{
  static Route <dynamic> getRoutes (RouteSettings settings){
    switch (settings.name){
      case routes.splashRoute:
        return MaterialPageRoute(builder: (_)=>const splashView());
      case routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_)=>const OnBoardingView());
      case routes.startRoute:
        return MaterialPageRoute(builder: (_)=>const startView());
      case routes.loginRoute:
        return MaterialPageRoute(builder: (_)=>LoginView());
      case routes.signupRoute:
        return MaterialPageRoute(builder: (_)=>SignUp());
        case routes.otpRoute:
        return MaterialPageRoute(builder: (_)=> OTP());
      case routes.deliveryRoute:
        return MaterialPageRoute(builder: (_)=>const delivery());
        case routes.paymentRoute:
        return MaterialPageRoute(builder: (_)=>const payment());
      case routes.home_view:
        return MaterialPageRoute(builder: (_)=>const home_layout());
      case routes.settingsRoute:
        return MaterialPageRoute(builder: (_)=>const settings_view());
      case routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_)=>const forgotPasswordView());
      case routes.adminRoute:
        return MaterialPageRoute(builder: (_)=>const admin());
      case routes.addItemRoute:
        return MaterialPageRoute(builder: (_)=> AddItem());
        // case routes.addCategoryRoute:
        // return MaterialPageRoute(builder: (_)=> addCategories());
      case routes.viewOrdersRoute:
        return MaterialPageRoute(builder: (_)=>const viewOrders());
      case routes.inspectRoute:
        return MaterialPageRoute(builder: (_)=>const inspectProducts());
      case routes.productItemRoute:
        final int index = settings.arguments as int;
        return MaterialPageRoute(builder: (_)=> productItem(
          index: index,
        ));
      default:
    return unDefinedRoute();
    }
  }

  static Route<dynamic>unDefinedRoute(){
      return MaterialPageRoute(builder: (_)=>Scaffold(appBar: AppBar(title: Text(appStrings.noRouteFound),),
        body: Center(child: Text(appStrings.noRouteFound),),));
    }
}