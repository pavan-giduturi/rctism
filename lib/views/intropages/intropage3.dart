import 'package:flutter/material.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/support.png',
                ),
                fit: BoxFit.cover)),
        padding: EdgeInsets.only(
            top: MediaQuery.sizeOf(context).height * 0.6, left: 20, right: 20),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Basic Needs For People',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Building a strong foundation starts with basic needs',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ));
  }
}
