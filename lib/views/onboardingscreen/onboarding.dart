import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rctism/views/login/login.dart';

import '../../controllers/onboarding/onboardingcontroller.dart';
import '../intropages/intopage1.dart';
import '../intropages/intropage2.dart';
import '../intropages/intropage3.dart';
import '../pdprofile/pdprofile.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<OnBoardingController>(
      init: OnBoardingController(),
      builder: (controller) {
        return Stack(
          children: [
            PageView(
              // physics: const NeverScrollableScrollPhysics(),
              controller: controller.pageController,
              onPageChanged: (index) {
                setState(() {
                  controller.onLastPage = (index == 2);
                });
                log(index.toString());
                log(controller.onLastPage.toString());
              },
              children: const [
                IntroPage1(),
                IntroPage2(),
                IntroPage3(),
              ],
            ),
            controller.onLastPage
                ? Container(
                    alignment: const Alignment(0, 0.9),
                    child: GestureDetector(
                        onTap: () => Get.offAll(() => const LoginScreen()),
                        child: Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            padding: const EdgeInsets.all(8),
                            child: const Text(
                              'LOGIN',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ))),
                  )
                : Container(
                    alignment: const Alignment(0.8, 0.9),
                    child: GestureDetector(
                        onTap: () {
                          log('indexed tap');
                          controller.pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.blue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          padding: const EdgeInsets.all(8),
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 20,
                          ),
                        )),
                  )
          ],
        );
      },
    ));
  }
}
