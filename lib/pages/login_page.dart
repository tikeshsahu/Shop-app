// import 'package:flutter/material.dart';
// import 'package:kharido_app/pages/welcome_page.dart';

// import 'products_overview_page.dart';
// import 'signup_page.dart';

// class LoginPage extends StatelessWidget {
//   static const routeName = '/Login-page';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         elevation: 0,
//         brightness: Brightness.light,
//         backgroundColor: Color(0xFFE9F6FE),
//         leading: IconButton(
//             onPressed: () {
//               Navigator.of(context).pushReplacementNamed(WelcomePage.routeName);
//             },
//             icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 20)),
//       ),
//       body: Stack(
//         children: [
//           Image.network(
//             'https://images.pexels.com/photos/845405/pexels-photo-845405.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
//             fit: BoxFit.cover,
//             height: MediaQuery.of(context).size.height,
//           ),
//           Container(
//             height: MediaQuery.of(context).size.height,
//             width: double.infinity,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Text(
//                       'Login',
//                       style:
//                           TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Text(
//                       'Login to your Account',
//                       style: TextStyle(
//                           fontSize: 15,
//                           color: Colors.grey[600],
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 40),
//                   child: Column(
//                     children: [
//                       makeInput(label: 'Username'),
//                       makeInput(label: 'Password', obscureText: true),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 40),
//                   child: Container(
//                     child: Container(
//                       padding: EdgeInsets.only(top: 0),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(50),
//                           border: Border(
//                             bottom: BorderSide(color: Colors.black),
//                             top: BorderSide(color: Colors.black),
//                             left: BorderSide(color: Colors.black),
//                             right: BorderSide(color: Colors.black),
//                           )),
//                       child: MaterialButton(
//                         minWidth: double.infinity,
//                         onPressed: () {
//                            Navigator.of(context).pushReplacementNamed(ProductOverviewPage.routeName);
//                         },
//                         height: 60,
//                         color: Colors.white70,
//                         elevation: 0,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(50),
//                         ),
//                         child: Text(
//                           'Login',
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 20),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text("Dont't have an Account?"),
//                     SizedBox(
//                       width: 5,
//                     ),
//                     InkWell(
//                       onTap: () {
//                         Navigator.of(context)
//                                 .pushReplacementNamed(SignUpPage.routeName);
//                       },
//                       child: Text(
//                         "Sign up",
//                         style: TextStyle(
//                             fontWeight: FontWeight.w600,
//                             fontSize: 18,
//                             color: Colors.red),
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Widget makeInput({label, obscureText = false}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: TextStyle(
//               fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black),
//         ),
//         SizedBox(
//           height: 5,
//         ),
//         TextField(
//           obscureText: obscureText,
//           decoration: InputDecoration(
//               contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
//               enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.grey[500])),
//               border: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.grey[500]))),
//         ),
//         SizedBox(
//           height: 30,
//         )
//       ],
//     );
//   }
// }
