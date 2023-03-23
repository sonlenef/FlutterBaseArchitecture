import 'dart:async';

import 'package:flutter/material.dart';

import '../../define.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<StatefulWidget> createState() => SplashState();
}

class SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Splash screen"));
  }

  @override
  void initState() {
    super.initState();
    startTimer(context);
  }

  void startTimer(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context)
          .pushAndRemoveUntil(AppRoute.home.page, (route) => false);
    });
  }
}
