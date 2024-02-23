import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rctism/views/onboardingscreen/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  double opacityLevel = 1.0;

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      _changeOpacity();
    });

    _navigateToLogin();

    // getLoginstatus().then((status) {
    //   if (status) {
    //     _navigateToHome();
    //   } else {
    //     _navigateToLogin();
    //   }
    // });
  }

  // getLoginstatus() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await Future.delayed(Duration(milliseconds: 1500));
  //   if (prefs.getBool('isLogin') == null) {
  //     return false;
  //   } else {
  //     return true;
  //   }
  // }

  // void _navigateToHome() {
  //   Timer(
  //       Duration(seconds: 3),
  //       () => Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(
  //               builder: (context) => AuditHome(
  //                     fromType: 'login',
  //                   ))));
  // }

  void _navigateToLogin() {
    Timer(const Duration(seconds: 3),
        () => Get.offAll(() => const OnBoardingPage()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: AnimatedOpacity(
                opacity: opacityLevel,
                duration: const Duration(seconds: 3),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                      Image.asset(
                        "assets/images/applogo.png",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Image.asset(
                        "assets/images/worldbg.png",
                      ),
                      const Text(
                        'Powered By SARADHI CONSULTANCY PVT. LTD.',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )),
          )
        ],
      ),
    ));
  }
}
