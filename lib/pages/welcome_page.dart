// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:kharido_app/pages/login_page.dart';
// import 'package:kharido_app/pages/signup_page.dart';

// class WelcomePage extends StatelessWidget {
  // static const routeName = '/Welcome-page';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFF9F9F9),
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Image.network(
//               'https://images.unsplash.com/photo-1527769929977-c341ee9f2033?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8d2hpdGUlMjBiYWNrZ3JvdW5kJTIwbG9naW58ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
//               fit: BoxFit.cover,
//               height: MediaQuery.of(context).size.height,
//             ),
//             Container(
//               width: double.infinity,
//               height: MediaQuery.of(context).size.height,
//               padding: EdgeInsets.symmetric(horizontal: 25, vertical: 50),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(bottom: 50),
//                         child: Text(
//                           'Get Started',
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 50,
//                               fontFamily: GoogleFonts.roboto().fontFamily),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 30,
//                       ),
//                       Text(
//                         'Best Quality Shopping    At Reasonable Prices',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 30,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Text(
//                         '50 Lakh + Styles | 650 + categories',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                   // Container(
//                   //   height: 300,
//                   //   //MediaQuery.of(context).size.height,
//                   //   decoration: BoxDecoration(
//                   //       image: DecorationImage(
//                   //     image: NetworkImage(
//                   //       'https://images.unsplash.com/photo-1500189001820-d65835a662d4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTg2fHx3aGl0ZSUyMGJhY2tncm91bmR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
//                   //     ),
//                   //     opacity: 30,
//                   //     fit: BoxFit.fill,
//                   //   )),
//                   // ),
//                   Column(
//                     children: [
//                       MaterialButton(
//                         minWidth: double.infinity,
//                         onPressed: () {
//                           Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
//                         },
//                         height: 60,
//                         color: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           side: BorderSide(color: Colors.black),
//                           borderRadius: BorderRadius.circular(50),
//                         ),
//                         child: Text(
//                           'Login',
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 18),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Container(
//                         padding: EdgeInsets.only(top: 0),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(50),
//                             border: Border(
//                               bottom: BorderSide(color: Colors.black),
//                               top: BorderSide(color: Colors.black),
//                               left: BorderSide(color: Colors.black),
//                               right: BorderSide(color: Colors.black),
//                             )),
//                         child: MaterialButton(
//                           minWidth: double.infinity,
//                           onPressed: () {
//                             Navigator.of(context)
//                                 .pushReplacementNamed(SignUpPage.routeName);
//                           },
//                           height: 60,
//                           color: Colors.white,
//                           elevation: 0,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(50),
//                           ),
//                           child: Text(
//                             'Sign up',
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 18),
//                           ),
//                         ),
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

/////////////////////////////////////////////////////////////////////////////////////////////

