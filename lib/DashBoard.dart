// import 'package:budget_mangement/Authentication/Login.dart';
// import 'package:budget_mangement/DataBase/Authentication.dart';
// import 'package:budget_mangement/Expense/Expence_card.dart';
// import 'package:budget_mangement/Expense/Expences.dart';
// import 'package:budget_mangement/Lost/Lost.dart';
// import 'package:budget_mangement/Profit/Profit.dart';
// import 'package:budget_mangement/Sellery/ExpenseMonth.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
//
// import 'Expense/Expense_show.dart';
// import 'Sellery/Incom.dart';
// class DashBoard  extends StatefulWidget {
//   final String  exp;
//   DashBoard({Key key,this.exp}):super(key: key);
//   @override
//   _DashBoardState createState() => _DashBoardState();
// }
//
// class _DashBoardState extends State<DashBoard> {
//  //final exp;
// // _DashBoardState({this.exp});
//   Authentication _obj=Authentication();
//
// int _currentInde=0;
// GlobalKey _buttomNavigationKey=GlobalKey();
//
// List pages=[
//   MyRoute(
//     iconData:Icons.money_off,
//     page:Expence_card(),
//   ),
//   MyRoute(
//     iconData:Icons.score,
//     page:income(),
//   ),
//   MyRoute(
//       iconData: Icons.category,
//     page:  ExpenseShow()
//   ),
//   MyRoute(
//     iconData:Icons.bar_chart,
//     page:Profit(),
//   ),
//   MyRoute(
//     iconData: Icons.opacity,
//     page: ExpenseMonths()
//   ),
//
// ];
//   Future <void> SignoutWithGoogle() async
//   {
//     await _obj.googleSignIn.signOut();
//     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
//   }
//   Widget _createHeader() {
//     return DrawerHeader(
//         margin: EdgeInsets.zero,
//         padding: EdgeInsets.zero,
//         decoration: BoxDecoration(
//             image: DecorationImage(
//                 fit: BoxFit.fill,
//                 image:  AssetImage('headerview.jpg'))),
//         child: Stack(children: <Widget>[
//           Positioned(
//               bottom: 12.0,
//               left: 16.0,
//               child: Text("Budget Managment App",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 20.0,
//                       fontWeight: FontWeight.w500))),
//         ]));
//   }
//   Widget _createDrawerItem(
//       {IconData icon, String text, GestureTapCallback onTap}) {
//     return ListTile(
//       title: Row(
//         children: <Widget>[
//           Icon(icon),
//           Padding(
//             padding: EdgeInsets.only(left: 8.0),
//             child: Text(text),
//           )
//         ],
//       ),
//       onTap: onTap,
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//
//     return
//       Scaffold(
//       backgroundColor: Color(0xff7c94b6),
//       drawer: Drawer(
//
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             _createHeader(),
//             _createDrawerItem(icon:Icons.home,text: "Home",onTap: (){
//               Navigator.pop(context, MaterialPageRoute(builder: (context)=>DashBoard()));}),
//             _createDrawerItem(icon:Icons.settings,text: "Setting"),
//             Divider(),
//             _createDrawerItem(icon:Icons.lock_open,text: "LogOut"),
//           ],
//         ),
//       ),
//       bottomNavigationBar: CurvedNavigationBar(
//           key: _buttomNavigationKey,
//           index: 2,
//           height: 40,
//           backgroundColor: Color(0xff7c94b6),
//           //  animationCurve: Curves.easeInOut,
//           //  animationDuration: Duration(microseconds: 60),
//          items: pages.map((p)=>Icon(p.iconData,size: 30,)).toList(),
//
//       onTap: (index)
//       {
//       setState(() {
//         _currentInde=index;
//       });
//       },
//       ),
//
//
//       appBar: AppBar(
//
//         backgroundColor: Color(0xff7c94b6),
//         actions: <Widget>[
//
//          IconButton(icon: Icon(Icons.logout), onPressed: (){
//           SignoutWithGoogle();
//          })
//         ],
//         title: Text("Budget Mangement"),
//         elevation: 0.0,
//
//       ),
//       body: pages[_currentInde].page,
//     );
//
//   }
// }
// class MyRoute{
//   final IconData iconData;
//   final Widget page;
//
//   MyRoute({this.iconData, this.page});
// }
// class Page1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text("Page1"),
//     );
//   }
// }
// class Page2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text("Page2"),
//     );
//   }
// }
// class Page3 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text("Page3"),
//     );
//   }
// }
//
//
