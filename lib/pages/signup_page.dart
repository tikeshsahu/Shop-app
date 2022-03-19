// import 'package:flutter/material.dart';
// import 'package:kharido_app/pages/login_page.dart';
// import 'package:kharido_app/pages/products_overview_page.dart';

// import 'welcome_page.dart';

// class SignUpPage extends StatelessWidget {
//   static const routeName = '/SignUp-page';

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
//             'https://images.unsplash.com/photo-1580892792749-08e569c5c0db?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjZ8fHNpZ24lMjB1cHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
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
//                       'Sign Up',
//                       style:
//                           TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Text(
//                       'Create an Account, Its Free',
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
//                       makeInput(label: 'Confirm Password', obscureText: true)
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
//                           Navigator.of(context).pushReplacementNamed(ProductOverviewPage.routeName);
//                         },
//                         height: 60,
//                         color: Colors.white,
//                         elevation: 0,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(50),
//                         ),
//                         child: Text(
//                           'Sign Up',
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
//                     Text("Already have an Account?"),
//                     SizedBox(
//                       width: 5,
//                     ),
//                     InkWell(
//                       onTap: () {
//                         Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
//                       },
//                       child: Text(
//                         "Log In",
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
