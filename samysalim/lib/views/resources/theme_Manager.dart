import 'package:flutter/material.dart';
import 'color_Manager.dart';
import 'values_Manager.dart';
import 'styles_Manager.dart';
import 'fonts_Manager.dart';

ThemeData getAppTheme(){
  return ThemeData(
    //main Color
    primaryColor: ColorManager.c3,
    primaryColorLight: ColorManager.c4,
    primaryColorDark: ColorManager.c3,
    disabledColor: ColorManager.c4,
    splashColor: ColorManager.c4,
    //card Theme
    cardTheme: CardTheme(
      color: ColorManager.c3,
      shadowColor: ColorManager.c4,
      elevation: appSize.s4,
    ),
    //app bar Theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.c2,
      elevation: appSize.s4,
      shadowColor: ColorManager.c1,
      titleTextStyle: getRegularStyle(FontSize: FontSize.s16,Color: ColorManager.c1,)
    ),
    //button Theme
    buttonTheme: const ButtonThemeData(
      shape: StadiumBorder(),
      disabledColor: ColorManager.c1,
      buttonColor: ColorManager.c4,
      splashColor:  ColorManager.c3,
    ),
   
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(Color: ColorManager.c4,FontSize: FontSize.s14),
        // primaryc: ColorManager.c1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(appSize.s12),
        )
      )
    ),
    //text theme
    textTheme: TextTheme(
      displayLarge: getLightStyle(Color: Colors.white,FontSize: FontSize.s22),
      headlineMedium: getSemiBoldStyle(Color: Colors.blueGrey,FontSize: FontSize.s16),
      headlineSmall: getMediumStyle(Color: Colors.grey,FontSize: FontSize.s14),
      titleMedium: getRegularStyle(Color: Colors.black12),
      titleLarge: getRegularStyle(Color: Colors.black12),
    ),
      //textFormField
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(appPadding.p8),
      hintStyle: getRegularStyle(Color: Colors.grey,FontSize: FontSize.s14),
      labelStyle: getMediumStyle(Color: Colors.grey,FontSize: FontSize.s14),
      errorStyle: getRegularStyle(Color: Colors.red),

      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.c1,width: appSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(appSize.s8))
      ),
      focusedBorder:  const OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.c2,width: appSize.s1_5),
          borderRadius: BorderRadius.all(Radius.circular(appSize.s8))
      ),
      errorBorder:  const OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.c3,width: appSize.s1_5),
          borderRadius: BorderRadius.all(Radius.circular(appSize.s8))
      ),
      focusedErrorBorder:  const OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.c2,width: appSize.s1_5),
          borderRadius: BorderRadius.all(Radius.circular(appSize.s8))
      ),
    ),
  );
}

class ContainerClipper extends CustomClipper< Path>{

  @override

  Path getClip(Size size) {
    Path path =Path();
    path.lineTo(0, size.height-100);
    path.quadraticBezierTo(size.width*.4,size.height+140,size.width*.6,size.height-200);
    path.quadraticBezierTo(size.width*.9,size.height-600,size.width,size.height-450);
    path.lineTo( size.height,0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {

    return true ;
  }
}
class ContainerClipperstart extends CustomClipper< Path>{
  @override
  Path getClip(Size size) {
    Path path =Path();
    path.lineTo(0, size.height);
    path.lineTo(-15, size.height-20);
    path.quadraticBezierTo(100*.9,size.height-250,size.width*.4,size.height-250);
    path.quadraticBezierTo(size.width*.6,size.height-240,size.width*.7,size.height-400);
    path.quadraticBezierTo(size.width*.9,size.height-750,size.width,size.height-650);
    path.lineTo( size.height,0);
    return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {

    return true ;
  }
}
class ContainerClipperApp extends CustomClipper< Path>{
  @override
  Path getClip(Size size) {
    Path path =Path();
    path.lineTo(0, size.height-120);
    // path.quadraticBezierTo(size.width*.5,size.height+50,size.width,size.height-100);
    path.quadraticBezierTo(size.width*.5,size.height-20,size.width,size.height-120);
    // path.quadraticBezierTo(size.width,size.height+120,size.width,size.height-80);
    // path.quadraticBezierTo(size.width*.9,size.height-400,size.width,size.height-150);
    path.lineTo(size.width,0);
    return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {

    return true ;
  }
}

class appBarWidget extends StatelessWidget {
  const appBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        ClipPath(
          clipper: ContainerClipperApp(),
          child: Container(
            decoration:   const BoxDecoration(
              color: ColorManager.orange,
            ),
            height: 200,
          ),
        ),
        Image(image: AssetImage('assets/images/logo.png'),width: 150,height: 130,),
      ],
    );
  }
}
