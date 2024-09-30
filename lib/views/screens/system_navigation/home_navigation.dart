// import 'package:flutter/material.dart';
// import 'package:unidbox_app/views/screens/home/presentation/home_screen.dart';

// class HomeNavigationRoute extends StatefulWidget {
//   const HomeNavigationRoute({super.key});

//   @override
//   State<HomeNavigationRoute> createState() => _HomeNavigationRouteState();
// }

// // GlobalKey<NavigatorState> homeNavRouteState = GlobalKey<NavigatorState>();

// class _HomeNavigationRouteState extends State<HomeNavigationRoute> {
//   @override
//   Widget build(BuildContext context) {
//     return Navigator(
//       key: homeNavRouteState,
//       onGenerateRoute: (RouteSettings setting) {
//         return MaterialPageRoute(
//             settings: setting,
//             builder: (BuildContext context) {
//               switch (setting.name) {
//                 default:
//                   return const HomeScreen();
//               }

//               // if (setting.name == "/issue") {
//               //   return const PackedListScreen(otherRequestList: []);
//               // }
//               // if (setting.name == "/") {}
//               // return const HomeScreen();
//             });
//       },
//     );
//   }
// }
