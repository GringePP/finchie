import 'package:finchie/page/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '雀仔finchie',
      theme: ThemeData(primaryColor: Color(0xFF47c479)),
      home: HomePage(),
    );
  }
}

// class _MyAppState extends State<MyApp> {
//   bool isLogin = false;

//   @override
//   void initState() {
//     super.initState();
//     loginUtil.checkLogin().then((loginInfo) {
//       if (loginInfo != null) {
//         updateToken(loginInfo["token"]);
//         updateUserId(loginInfo["user_id"]);
//         setState(() {
//           isLogin = true;
//         });
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: isLogin
//           ? HomePage()
//           : NoLoginWidget(
//               onLogin: (res) {
//                 if (res == LOGIN) {
//                   setState(() {
//                     isLogin = true;
//                   });
//                 }
//               },
//             ),
//     );
//   }
// }
