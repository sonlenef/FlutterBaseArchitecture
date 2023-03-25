import 'dart:async';

import 'package:flutter/material.dart';

import '../define.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Splash screen")));
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
