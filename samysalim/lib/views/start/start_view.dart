import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../resources/color_Manager.dart';
import '../resources/theme_Manager.dart';
import '../resources/strings_Manager.dart';
import '../resources/routes_Manager.dart';
import '../widget/authByGoogle.dart';
class startView extends StatelessWidget {
  const startView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                ClipPath(
                  clipper: ContainerClipperstart(),
                  child: Container(
                    decoration:   const BoxDecoration(
                      color: ColorManager.orange,
                      image:DecorationImage(image:AssetImage('assets/images/logo.png'),alignment: Alignment.topCenter,)
                    ),
                    height: 750,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 140),
                        width: 185,
                        height: 50,
                        decoration:  const BoxDecoration(
                          color: ColorManager.orange,
                          borderRadius:BorderRadius.all(Radius.circular(50.0)),
                        ),
                        child: TextButton(
                            onPressed: (){
                              Navigator.pushNamed(context, routes.loginRoute);
                            },
                            child: Text(appStrings.signin,style: TextStyle(color: Colors.white),))),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 70),
                        width: 185,
                        height: 50,
                        decoration:  const BoxDecoration(
                          color: ColorManager.button2 ,
                          borderRadius:BorderRadius.all(Radius.circular(50.0)),
                        ),
                        child: TextButton(
                            onPressed: (){
                              Navigator.pushNamed(context, routes.signupRoute);
                            },
                            child: Text(appStrings.signup,style: TextStyle(color: Colors.white),))),
                  ],
                ),
                Text('OR',style: TextStyle(fontSize: 20,height: 5),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            IconButton(
            icon:FaIcon(
            FontAwesomeIcons.google,
              color: ColorManager.orange,size: 40,
            ),
          onPressed: () {
            signInWithGoogle(context);
          }
      ),
                SizedBox(width: 20,),
      IconButton(
        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
          icon: FaIcon(FontAwesomeIcons.facebook,
            color: ColorManager.orange,
            size: 40,
          ),
          onPressed: () {
            // signInWithFacebook();
          }
      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

