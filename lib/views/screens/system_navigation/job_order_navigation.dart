// import 'package:flutter/material.dart';
// import 'package:unidbox_app/views/screens/job_order/presentation/job_order_screen.dart';

// class JobOrderNavigationRoute extends StatefulWidget {
//   const JobOrderNavigationRoute({super.key});

//   @override
//   State<JobOrderNavigationRoute> createState() =>
//       _JobOrderNavigationRouteState();
// }

// GlobalKey<NavigatorState> jobOrderNavRouteState = GlobalKey<NavigatorState>();

// class _JobOrderNavigationRouteState extends State<JobOrderNavigationRoute> {
//   @override
//   Widget build(BuildContext context) {
//     return Navigator(
//       key: jobOrderNavRouteState,
//       onGenerateRoute: (RouteSettings setting) {
//         return MaterialPageRoute(
//             settings: setting,
//             builder: (BuildContext context) {
//               switch (setting.name) {
//                 default:
//                   return const JobOrderScreen();
//               }
//             });
//       },
//     );
//   }
// }
