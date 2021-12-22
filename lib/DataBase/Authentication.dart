//
// import 'package:budget_mangement/DashBoard.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
// class Authentication
// {
//   User user;
//   Future Register(String mail,String pass,String name) async
//   {
//   user=(await  FirebaseAuth.instance.createUserWithEmailAndPassword
//       (
//         email: mail,
//         password: pass
//     )).user;
//   if(user!=null)
//     {
//      Firestore.instance.collection("Users").document(user.uid).setData({'User id':user.uid,'Name':name,'Email':mail});
//     }
//   }
//   Future login(String email,String password) async
//
//   {
//     try{
//
//  User retriveuser=( await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)).user;
//  print("Authentication class check"+retriveuser.uid);
//  String id=retriveuser.uid;
// // return id;
//  if(id!=null)
//    {
//      DashBoard();
//    }
//   }
//   catch (e) {
//       print(e);
//   }
//   }
// final FirebaseAuth _auth=FirebaseAuth.instance;
//   final GoogleSignIn googleSignIn=GoogleSignIn();
//   Future <String> SignInWithGoogle() async
//   {
//     await Firebase.initializeApp();
//     final GoogleSignInAccount googleSignInAccount=await googleSignIn.signIn();
//     final GoogleSignInAuthentication googleSignInAuthentication=await googleSignInAccount.authentication;
//     final AuthCredential credential=GoogleAuthProvider.credential(
//       accessToken: googleSignInAuthentication.accessToken,
//       idToken: googleSignInAuthentication.idToken,
//
//     );
//     final UserCredential authResult=await _auth.signInWithCredential(credential);
//     final User user=authResult.user;
//     if(user!=null)
//       {
//
//         assert(!user.isAnonymous);
//         assert(await user.getIdToken()!=null);
//         final User currentuser=_auth.currentUser;
//         assert(user.uid==currentuser.uid);
//         print("signin with google success : $user");
//         print("User Name: ${user.displayName}");
//         print("User Email ${user.email}");
//          Firestore.instance.collection("Users").document(user.uid).setData({'User id':user.uid,'Name':user.displayName,'Email':user.email}).catchError((e)=>print("Check error yhan"+e));
//         return '$user';
//       }
//     return null;
//   }
//   void SignOutWithGoogle()async{
//     await googleSignIn.signOut();
//     print("User sigined out");
//   }
// }
