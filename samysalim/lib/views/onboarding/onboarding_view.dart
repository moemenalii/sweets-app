import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../resources/color_Manager.dart';
import '../resources/theme_Manager.dart';
import '../resources/strings_Manager.dart';
import '../resources/routes_Manager.dart';
class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);
  @override
  State<OnBoardingView> createState() => _OnBoardingView();
}
int _currentIndex =0;
final PageController _pageController =PageController();
late final List<sliderObject>_list=[
  sliderObject(appStrings.boarding1,'assets/images/moto.json' ),
  sliderObject(appStrings.boarding2, 'assets/images/pickup.json'),
  sliderObject(appStrings.boarding3, 'assets/images/cakes.json'),
];
class _OnBoardingView extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(itemBuilder: (context,index)=>onboardingPage(_list[index], ) ,
      itemCount: _list.length,
      controller: _pageController,
    onPageChanged: (index){
        setState(() {
          _currentIndex =index ;
        });
    },
    ));
  }
}

class sliderObject{
   String title;
   String image ;

  sliderObject(this.title, this.image);

}

class onboardingPage extends StatelessWidget {
  const onboardingPage(this.Slider,{Key?key}) :super (key: key);
  final sliderObject Slider;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              ClipPath(
                clipper: ContainerClipper(),
                child: Container(
                  color: ColorManager.orange,
                  height: 550,
                ),
              ),
              const Hero(tag: 'hero splash',
                  child: Material(
                    color: Colors.transparent,
                    child: Image(image: AssetImage('assets/images/logo.png'),width: 120,height: 150,),
                  )),
              // const Image(image: AssetImage('assets/images/logo.png'),width: 120,height: 150,),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 250,width: 200,),
                      Container(
                        width: 240,
                        height: 180,
                        child: LottieBuilder.asset(Slider.image,height:200 ,width:150 ),
                      ),
                      SizedBox(height: 25,),
                      Text(Slider.title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     SmoothPageIndicator(
                       controller: _pageController,
                       count: _list.length,
                       effect: ExpandingDotsEffect(dotHeight: 8,dotWidth: 8,spacing: 8,activeDotColor: Colors.orange,dotColor: ColorManager.background),),
                   ],
                ),
          SizedBox(height: 50,),
          if(_currentIndex!=2)
          Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 185,
                        height: 50,
                        decoration:  const BoxDecoration(
                          color: ColorManager.orange,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.orange,
                              blurRadius: 5.0, // soften the shadow
                              spreadRadius: -5.0,
                              offset: Offset(
                                0.0, // Move to right 10  horizontally
                                0.0, // Move to bottom 10 Vertically
                              ),
                            )
                          ],
                          borderRadius:BorderRadius.all(Radius.circular(50.0)),

                        ),
                        child: TextButton(
                            onPressed: (){
                              _pageController.nextPage(duration: Duration(milliseconds: 500), curve:Curves.bounceInOut);
                            },
                            child: Text(appStrings.Next,style: TextStyle(color: Colors.white),))),
                  ],
                ),
                SizedBox(height: 25,),
          if(_currentIndex!=2)
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 185,
                  height: 50,
                  decoration:  const BoxDecoration(
                   color: ColorManager.button2 ,
                    borderRadius:BorderRadius.all(Radius.circular(50.0)),
                  ),
                  child: TextButton(
                      onPressed: (){
                        Navigator.pushReplacementNamed(context, routes.startRoute);
                      },
                      child: Text(appStrings.Skip,style: TextStyle(color: Colors.white),))),
            ],
          ),
          SizedBox(height: 25,),
          if(_currentIndex==2)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 185,
                    height: 50,
                    decoration:  const BoxDecoration(
                      color: ColorManager.orange,
                      borderRadius:BorderRadius.all(Radius.circular(50.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.orange,
                          blurRadius: 5.0, // soften the shadow
                          spreadRadius: -5.0,
                          offset: Offset(
                            5.0, // Move to right 10  horizontally
                            5.0, // Move to bottom 10 Vertically
                          ),
                        )
                      ],
                    ),
                    child: TextButton(
                        onPressed: (){
                          Navigator.pushReplacementNamed(context, routes.startRoute);
                        },
                        child: const Text(appStrings.start,style: TextStyle(color: Colors.white),))),
              ],
            ),
        ],
      ),
    );
  }
}
