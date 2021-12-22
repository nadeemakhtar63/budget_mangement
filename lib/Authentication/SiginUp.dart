// import 'package:budget_mangement/DataBase/Authentication.dart';
// import 'package:email_validator/email_validator.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class SiginUP extends StatefulWidget {
//   @override
//   _SiginUPState createState() => _SiginUPState();
// }
//
// class _SiginUPState extends State<SiginUP> {
//  final _registerform=GlobalKey<FormState>();
//  String name,email,pasword;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//      // backgroundColor: Colors.blue,
//       appBar: AppBar(
//         title: Text("Register Now"),
//       ),
//       body:
//
//       Container(
//         height: MediaQuery.of(context).size.height,
//         decoration: BoxDecoration(
//             color: const Color(0xff7c94b6),
//             image: DecorationImage(
//                 colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
//                 image: AssetImage("budget.jpg"),
//                 fit: BoxFit.cover
//             )
//         ),
//
//          child:  SingleChildScrollView(
//              child:Column(
//                 children:[
//              Container(
//
//                margin: EdgeInsets.fromLTRB(5, 20, 5, 20),
//                child: CircleAvatar
//                  (
//
//                  radius: 50.0,
//                  backgroundImage:
//                  AssetImage("budgetplan.jpg"),
//                  backgroundColor: Colors.transparent,
//                ),
//              ),
//                  Form(
//                   key: _registerform,
//                     child: Container(
//
//                       // height: MediaQuery.of(context).size.height,
//
//                       child: Column(
//
//                           mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: <Widget>[
//                                 Padding(padding: EdgeInsets.only(top: 25)),
//                              TextFormField(
//
//                                  decoration: InputDecoration(
//
//                                 labelText: "Enrter Name",
//                                    disabledBorder: InputBorder.none,
//                                 enabledBorder: const OutlineInputBorder(
//                                   borderRadius:const BorderRadius.all(Radius.circular(20.0)),
//
//                               ),
//                             ),
//                         validator: (value)
//                   {
//                   if(value.isEmpty)
//                   {
//                   return "Please Enter name";
//                   }
//                   else
//                     name=value;
//                   },
//                             ),
//                           SizedBox(height: 25,),
//                           TextFormField(
//
//                               decoration: InputDecoration(
//                                 labelText: "Enrter Email",
//                                 enabledBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))
//                                 ),
//                               ),
//                             autovalidate: true,
//                             validator: (value)
//                             {
//                               if(value.isEmpty)
//                                   {
//
//                                     return "Please Enter Email";
//                                    }
//                                             else   if(EmailValidator.validate(value))
//                                                {
//                                                    email=value;
//                                                }
//                                              else
//                                                 return "Enter valide email";
//                                              }
//
//                               // {
//                               //   if(value.isEmpty)
//                               //   {
//                               //
//                               //     return "Please Enter Email";
//                               //   }
//                               //  else if(EmailValidator.validate(value))
//                               //   {
//                               //     return "Enter valide Email";
//                               //   }
//                               //   else
//                               //     email=value;
//                               // },
//                               ),
//                               SizedBox(height: 25,),
//                               TextFormField(
//
//                               decoration: InputDecoration(
//                               labelText: "Enrter Password",
//                               enabledBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))
//                               ),
//                               ),
//                               validator: (value)
//                               {
//                               if(value.isEmpty)
//                               {
//                               return "Please Enter Password";
//                               }
//
//                               else
//                               {
//                               pasword=value;
//                               }
//                               },
//                               ),
//                               SizedBox(height: 20,),
//                               TextFormField(
//                               decoration: InputDecoration(
//                               labelText: "Re-Inter Password",
//                               enabledBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(
//                             20.0))
//                                 ),
//                               ),
//                             validator: (value)
//                             {
//                               if(value.isEmpty)
//                               {
//                                 return "Re-inter Password";
//                               }
//                             },
//                           ),
//                         SizedBox(height: 25,),
//                         Padding(
//                           padding: const EdgeInsets.fromLTRB(5, 0, 5, 20),
//                           child: FlatButton(
//                             color: Colors.blue,
//                             padding: EdgeInsets.all(5.0),
//                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),side: BorderSide(color: Colors.blue)),
//                               onPressed: (){
//                               if(_registerform.currentState.validate())
//                                 {
//                                   Authentication obj=new Authentication();
//                                   obj.Register(email, pasword,name);
//                                   print(name);
//                                   print(email);
//                                   print(pasword);
//                                // Scaffold.of(context).showSnackBar(SnackBar(content: Text(name+"\n"+email+"\n"+pasword)));
//                                 }
//                               }, child: Text("SignIn",style: TextStyle(fontSize: 18),)),
//                         ),
//
//                         ],
//                       ),
//                     ),
//                 ),
//       ]
//               ),
//
//            ),
//         //  ],
//        // ),
//       ),
//     );
//   }
// }
