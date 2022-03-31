import 'dart:async';
import 'package:application_design_demo/screens/home_screen.dart';
import 'package:application_design_demo/utils/size_utils.dart';
import 'package:flutter/material.dart';

class SplashSCreen extends StatefulWidget {
  const SplashSCreen({Key? key}) : super(key: key);

  @override
  State<SplashSCreen> createState() => _SplashSCreenState();
}

class _SplashSCreenState extends State<SplashSCreen> {
  late Timer timer;

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  void startTime() {
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      timer.cancel();
     /* Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return MovieScreen();
      }));*/

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
            (Route<dynamic> route) => false,
      );

    });
  }

  @override
  Widget build(BuildContext context) {
    SizeUtils().sizeUnit(context);
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
