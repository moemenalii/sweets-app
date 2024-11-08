import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:samysalim/views/resources/routes_Manager.dart';

Future signInWithGoogle(context) async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
   await FirebaseAuth.instance.signInWithCredential(credential);
   Navigator.pushReplacementNamed(context, routes.home_view);
}

// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
//
// Future signInWithFacebook() async {
//   // Trigger the sign-in flow
//   final LoginResult loginResult = await FacebookAuth.instance.login();
//
//   // Create a credential from the access token
//   final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken.token);
//
//   // Once signed in, return the UserCredential
//   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
// }

///////////////////////////////////////////////////////////////////////
//
// Future<void> _signInWithGoogle() async {
//   // Trigger the authentication flow
//   final googleUser = await GoogleSignIn().signIn();
//
//   // Obtain the auth details from the request
//   final googleAuth = await googleUser?.authentication;
//
//   if (googleAuth != null) {
//     // Create a new credential
//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );
//
//     // Once signed in, return the UserCredential
//     await auth.signInWithCredential(credential);
//   }
// }
//
// Future<void> _signInWithFacebook() async {
//   // Trigger the authentication flow
//   // by default we request the email and the public profile
//   final LoginResult result = await FacebookAuth.instance.login();
//
//   if (result.status == LoginStatus.success) {
//     // Get access token
//     final AccessToken accessToken = result.accessToken!;
//
//     // Login with token
//     await auth.signInWithCredential(
//       FacebookAuthProvider.credential(accessToken.tokenString),
//     );
//   } else {
//     print('Facebook login did not succeed');
//     print(result.status);
//     print(result.message);
//   }
// }
// }