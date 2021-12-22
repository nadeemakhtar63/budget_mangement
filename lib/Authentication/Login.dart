// import 'package:budget_mangement/Authentication/SiginUp.dart';
// import 'package:budget_mangement/DashBoard.dart';
// import 'package:budget_mangement/DataBase/Authentication.dart';
// import 'package:budget_mangement/testingFiles/shapdraw.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class Login extends StatefulWidget {
//   @override
//   _LoginState createState() => _LoginState();
// }
//
// class _LoginState extends State<Login> {
//   final formkey=GlobalKey<FormState>();
//   bool _obscurepassword=true;
// String email,password;
// Future checkuser() async
// {
//   User _user=(await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)).user;
//   if(_user!=null)
//     {
//       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DashBoard()));
//     }
// }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xff7c94b6),
//         leading: IconButton(icon: Icon(Icons.settings), onPressed: (){
//           Navigator.push(context, MaterialPageRoute(builder: (context)=>shappdraw()));
//         }),
//         elevation: 0.0,
//         // leading: FlatButton.icon(onPressed: (){}, icon: Icon(Icons.settings), label: Text("Setting")),
//         title: Text("Login"),
//         actions: <Widget>[
//           IconButton(icon: Icon(Icons.login), onPressed: (){
//            Navigator.push(context, MaterialPageRoute(builder: (context)=>SiginUP()));
//           })
//         ],
//       ),
//       body:
//              Container(
//               height: MediaQuery.of(context).size.height,
//               decoration: BoxDecoration(
//                 color: const Color(0xff7c94b6),
//              //   color: Colors.white,
//                 image: DecorationImage(
//                     colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
//                     image: AssetImage("budget.jpg"),
//                     fit: BoxFit.cover,
//
//                 ),
//               ),
//                 // padding: EdgeInsets.all(20),
//
//                child:   SingleChildScrollView(
//                  child: Column(
//                    children: [
//                      Container(
//                        margin: EdgeInsets.fromLTRB(5, 20, 5, 50),
//                        child: CircleAvatar
//                          (
//
//                          radius: 50.0,
//                          backgroundImage:
//                          AssetImage("budgetplan.jpg"),
//                          backgroundColor: Colors.transparent,
//                        ),
//                      ),
//                             Form(
//
//                         key: formkey,
//
//                               child: Container(
//                                 margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
//                                 child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                                   children: <Widget>[
//
//                                     TextFormField(
//                                       textInputAction: TextInputAction.next,
//                                         autofocus:true,
//                                       decoration: InputDecoration(
//                                         prefixIcon: Icon(Icons.person,color: Colors.blueAccent,),
//                                         labelText: "Enter Email",
//
//                                         disabledBorder: InputBorder.none,
//                                         border: const OutlineInputBorder(
//
//                                           borderRadius: BorderRadius.all(Radius.circular(20.0))
//                                         )
//                                       ),
//                                       validator: (value){
//                                         if(value.isEmpty)
//                                         {
//                                           return "Please Enter Valid Email";
//                                         }
//                                         else
//                                         {
//                                           email=value.trim();
//                                         }
//
//                                       },
//                                     ),
//                                     SizedBox(height: 20,),
//                                     TextFormField(
//                                       textInputAction: TextInputAction.next,
//                                       autofocus:true,
//                                       obscureText: _obscurepassword,
//                                       decoration: InputDecoration(
//                                           prefixIcon: Icon(Icons.vpn_key,color: Colors.blueAccent,),
//                                           labelText: "Enter Password",
//                                           disabledBorder: InputBorder.none,
//                                           suffixIcon: IconButton(
//                                             onPressed:(){
//                                               setState(() {
//                                                 _obscurepassword=!_obscurepassword;
//                                               });
//
//                                             } ,
//                                             icon: Icon(_obscurepassword?Icons.visibility:Icons.visibility_off),color: Theme.of(context).primaryColorDark,),
//
//                                           border: const OutlineInputBorder(
//                                               borderRadius: BorderRadius.all(Radius.circular(20.0))
//                                           )
//                                       ),
//                                       validator: (value)
//                                       {
//                                         if(value.isEmpty)
//                                         {
//                                           return "Enter Password";
//                                         }
//                                         else{
//                                           password=value.trim();
//                                         }
//                                       },
//                                     ),
//                                     // new FlatButton(
//                                     //     onPressed: togle, child: new Text(_obscurepassword?"Show":"Hide")),
//                                     SizedBox(height: 20,),
//                                   FlatButton(
//                                     color: Colors.blue,
//                                   padding: EdgeInsets.all(5.0),
//                                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),side: BorderSide(color: Colors.blue)),
//                                       onPressed: (){
//                                       if(formkey.currentState.validate()) {
//                                         checkuser();
//                                       }
//                                       },
//                                       child: Text("Login",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
//
//                                   ),
//                                     SizedBox(height: 20,),
//                                     new FlatButton(
//
//                                         onPressed: (){
//                                           Authentication object=Authentication();
//                                           object.SignInWithGoogle().then((Result) {
//                                             if(Result!=null)
//                                               {
//                                                 Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>DashBoard()));
//                                               }
//                                           });
//                                         },
//                                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
//                                      // highlightElevation: 0,
//                                       splashColor: Colors.grey,
//                                        // color: Colors.white,
//                                      // borderSide: BorderSide(color: Colors.blue),
//                                       child: Padding(
//                                         padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
//                                         child: Row(
//                                           mainAxisSize: MainAxisSize.min,
//                                           mainAxisAlignment: MainAxisAlignment.center,
//                                           children: <Widget>[
//                                             Image(image: AssetImage("google_logo.jpg"),height: 25.0,),
//                                             Padding(
//                                               padding: const EdgeInsets.only(left: 10),
//                                               child: Text("SigIn With Google",style: TextStyle(fontSize: 20,color: Colors.white),),
//
//                                             )
//                                           ],
//                                         ),
//                                       ),
//
//                                         ),
//                                     FlatButton(
//
//                                         onPressed: (){
//                                           Navigator.push(context, MaterialPageRoute(builder: (context)=>SiginUP()));
//                                         },
//                                         child: Text(
//                                             "Create New Account",
//                                             style: TextStyle(decoration: TextDecoration.underline, fontSize: 14,fontWeight: FontWeight.normal,color: Colors.deepOrange),textAlign: TextAlign.end
//                                         )
//
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                  ),
//                )
//
//             ),
//         //  ),
//   //      ],
//    //   ),
//
//     );
//   }
// }
