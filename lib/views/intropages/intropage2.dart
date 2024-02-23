import 'package:flutter/material.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/small_scale.png',
                ),
                fit: BoxFit.cover)),
        padding: EdgeInsets.only(
            top: MediaQuery.sizeOf(context).height * 0.6, left: 20, right: 10),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Small Scale Industries',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Taking your skills to the next level',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ));
  }
}
