import 'package:flutter/material.dart';
// import 'package:motion_toast/motion_toast.dart';
// import 'package:motion_toast/resources/arrays.dart';
import '../views/resources/color_Manager.dart';

///////////////////////////////defultTextForm//////////////////////////
Widget defultTextForm(
    {
      cursorColor,
      validate ,
      onChanged,
      onTab,
      sufixIcon,
      prefixIcon,
      hintText,
      sufixPressed,
      controller,
      label,
      keyboardType,
      bool showpassword=false,
    }
    )=>Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        cursorColor: cursorColor,
  controller:controller,
  validator: validate,
  onTap:onTab ,
  onChanged: onChanged,
  keyboardType:keyboardType ,
  obscureText:showpassword ,
  decoration:  InputDecoration(
    fillColor: ColorManager.orange,
    hoverColor: ColorManager.orange,
    labelText: label,
      suffixIconColor: ColorManager.orange ,
      prefixIconColor: ColorManager.orange ,
      enabledBorder:  OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.orange,width: 1),
          borderRadius: BorderRadius.all(Radius.circular(30.0))
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.orange,style: BorderStyle.solid,width: 2),
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
    errorBorder:   OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.red,width: 1),
        borderRadius: BorderRadius.all(Radius.circular(30))
    ),
    focusedErrorBorder:   OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.red,width: 1),
        borderRadius: BorderRadius.all(Radius.circular(30))
    ),
      labelStyle:(TextStyle(color:ColorManager.button2 )) ,
      prefixIcon: prefixIcon,
  ),
),
    );
 Widget textformdelivery({keyboardType,onTap,icon,label,cotroller,hint})=>TextFormField(
  keyboardType: keyboardType,
  onTap: onTap,
  controller: cotroller,
  decoration:  InputDecoration(
    hintText: hint,
    hintStyle: TextStyle(color: Colors.grey[350]),
    prefixIconColor: ColorManager.orange ,
    labelText: label,
    prefixIcon: icon,
    labelStyle:(TextStyle(color:ColorManager.button2 )) ,
    enabledBorder:  OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.orange,width: 1.5),
        borderRadius: BorderRadius.all(Radius.circular(30.0))
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ColorManager.orange,style: BorderStyle.solid,width: 3),
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
    ),
  ),
);
//////////////////////////////////defultButton/////////////////////////////////////////////
Widget defultButton({
  required label,
  required onTap,
  defultcolor = ColorManager.orange ,
})=> InkWell(
  onTap: onTap,
  child: Container(
    width: 190,
    height: 50,
    decoration:BoxDecoration(
      color: defultcolor ,
      borderRadius:BorderRadius.all(Radius.circular(40.0)),
      boxShadow: [
        BoxShadow(
          color: Colors.orange,
          blurRadius: 5.0, // soften the shadow
          spreadRadius: -5.0, //extend the shadow
          offset: Offset(
            5.0, // Move to right 10  horizontally
            5.0, // Move to bottom 10 Vertically
          ),
        )
      ],
    ),
    child: Center(
      child: Text(
        label,style: TextStyle(color: Colors.white,) ,),
    ),
    ),
);
Widget defultElvatedButton({
  required label,
  required onPressed,
  defultcolor = ColorManager.orange,
})=> Container(
  width: 185,
  height: 50,
  decoration:BoxDecoration(
    color: defultcolor ,
    borderRadius:BorderRadius.all(Radius.circular(50.0)),
    boxShadow: [
      BoxShadow(
        color: Colors.orange,
        blurRadius: 5.0, // soften the shadow
        spreadRadius: -5.0, //extend the shadow
        offset: Offset(
          5.0, // Move to right 10  horizontally
          5.0, // Move to bottom 10 Vertically
        ),
      )
    ],
  ),
  child: ElevatedButton(
    onPressed: (){},
    child: Text(label,style: TextStyle(color: Colors.white) ,),
  ),);
//////////////////////////////////
// void displaySuccessMotionToast(context) {
//   MotionToast.success(
//     title: const Text(
//       'Success',
//       style: TextStyle(
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//     description: const Text('have anice time'),
//     position: MotionToastPosition.top,
//     barrierColor: Colors.black.withOpacity(0.3),
//     width: 300,
//     height: 80,
//     dismissable: false,
//   ).show(context);
// }void displayErrorMotionToast(context) {
//   MotionToast.error(
//     title: const Text(
//       'Error',
//       style: TextStyle(
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//     description: const Text('Please check your email and password'),
//     position: MotionToastPosition.top,
//     barrierColor: Colors.black.withOpacity(0.3),
//     width: 300,
//     height: 80,
//     dismissable: false,
//   ).show(context);
// }
/////////////////////////////////////SIGNOUT////////////////////////
// void signOut(context)=> CacheHelper.removeData(Key: 'uId').then((value){
//   if(value){
//     Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>loginView()));
//   }
// });
//////////////////////////////////ToastFLutter//////////////////////////////////////
// void toast({
//   required Color color,
//   required String text,
// })=>   Fluttertoast.showToast(
//     msg: text,
//     toastLength: Toast.LENGTH_LONG,
//     gravity: ToastGravity.BOTTOM,
//     timeInSecForIosWeb: 5,
//     backgroundColor: color,
//     textColor: Colors.white,
//     fontSize: 16.0
// );
/////////////////////////////////////SIGNOUT////////////////////////
// void signOut(context)=> CacheHelper.removeData(Key: 'token').then((value){
//   if(value){
//     Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>LoginScreen()));
//   }
// });
/////////
//     bottomNavigationBar: BottomNavigationBar(
//   backgroundColor:Colors.brown,
//     unselectedItemColor:Colors.grey,
//     selectedItemColor:Colors.brown,
//   items: [
//   BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
//   BottomNavigationBarItem(icon: Icon(Icons.apps),label: 'Categories'),
//   BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favorite'),
//   BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),
// ],
//   currentIndex: cubit.Curentindex,
//   onTap: (index){
//     cubit.changeScreen(index);
//   },),