import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import '../routes.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenPage> {
  static const int timeSplashSecond = 1;

  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return  Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/plash.png',
              width: 200,
              height: 200,
            ),
          ),
        ],

      ),
    );
  }

  Timer? _timer;

  _navigateToHome() async {
    _timer = Timer(
        const Duration(seconds: timeSplashSecond), () => {context.vxNav.clearAndPush(Uri.parse(RoutesPath.loginRoute))});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer!.cancel();
    super.dispose();
  }
}
