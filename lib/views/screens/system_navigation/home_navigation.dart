import 'package:flutter/material.dart';
import 'package:unidbox_app/views/screens/home/presentation/home_screen.dart';

GlobalKey<NavigatorState> homeNavRouteState = GlobalKey();

class HomeNavigationRoute extends StatefulWidget {
  const HomeNavigationRoute({super.key});

  @override
  State<HomeNavigationRoute> createState() => _HomeNavigationRouteState();
}

class _HomeNavigationRouteState extends State<HomeNavigationRoute> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: homeNavRouteState,
      onGenerateRoute: (RouteSettings setting) {
        return MaterialPageRoute(
            settings: setting,
            builder: (BuildContext context) {
              if (setting.name == "/") {}
              return const HomeScreen();
            });
      },
    );
  }
}