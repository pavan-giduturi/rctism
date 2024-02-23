import 'package:flutter/material.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/jaikissan.png',
                ),
                fit: BoxFit.cover)),
        padding: EdgeInsets.only(
            top: MediaQuery.sizeOf(context).height * 0.6, left: 20, right: 10),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jai Kishan',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Preserving natures legacy Effortlessly elegant, naturally exceptional',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ));
  }
}
