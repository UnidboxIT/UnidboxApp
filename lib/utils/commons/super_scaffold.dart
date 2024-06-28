import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:focus_detector_v2/focus_detector_v2.dart';
import 'package:unidbox_app/views/screens/internet_connection/internet_connection_screen.dart';
import '../../views/screens/internet_connection/state/connectivity_state_notifier.dart';

/*
  Customize status bar color and nav bar color for global 
*/

class SuperScaffold extends ConsumerWidget {
  final Widget child;
  final Color topColor;
  final Color botColor;
  final bool xBotSafe;
  const SuperScaffold(
      {super.key,
      this.topColor = Colors.white,
      this.botColor = Colors.white,
      required this.child,
      this.xBotSafe = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FocusDetector(
      onFocusGained: () {
        setBarColor(topColor, botColor);
        if (Platform.isIOS) {
          topColor.computeLuminance() > 0.179
              ? setBarBrightnessDark()
              : setBarBrightnessLight();
        }
      },
      onVisibilityGained: () {
        setBarColor(topColor, botColor);
        if (Platform.isIOS) {
          topColor.computeLuminance() > 0.179
              ? setBarBrightnessDark()
              : setBarBrightnessLight();
        }
      },
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaler: MediaQuery.of(context)
              .textScaler
              .clamp(minScaleFactor: 0.8, maxScaleFactor: 1.0),
        ),
        child: Container(
          color: topColor,
          child: SafeArea(
            top: true,
            left: false,
            right: false,
            bottom: xBotSafe,
            child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: ref.watch(connectivityStatusProviders) ==
                        ConnectivityStatus.isConnected
                    ? child
                    : const InternetConnectionScreen()),
          ),
        ),
      ),
    );
  }
}

void setBarBrightnessLight() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark));
}

void setBarBrightnessDark() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarBrightness: Brightness.light));
}

void setBarColor(Color top, Color bot) {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: top,
      systemNavigationBarColor: bot,
      statusBarIconBrightness:
          top.computeLuminance() > 0.179 ? Brightness.dark : Brightness.light,
    ),
  );
}
