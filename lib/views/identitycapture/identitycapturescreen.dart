import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/identitycapture/identitycapturecontroller.dart';

class IdentityCapture extends StatelessWidget {
  const IdentityCapture({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<IdentityCaptureController>(
      init: IdentityCaptureController(),
      builder: (e) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Capture Identity'),
            titleTextStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
          ),
          body: SizedBox(
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width * 1,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'We capture a portrait & signature',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(
                    height: 120,
                  ),
                  GestureDetector(
                    onTap: () {
                      e.imageDialog();
                    },
                    child: e.selectedImage == null
                        ? SizedBox(
                            height: 300,
                            width: 300,
                            child: Card(
                                color: const Color(0xffededed),
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(150)),
                                    side: BorderSide(
                                        color: Color(0xff503083), width: 3)),
                                child: Image.asset(
                                  'assets/icons/cameraicon.png',
                                  scale: 2,
                                )),
                          )
                        : Card(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(150)),
                                side: BorderSide(
                                    color: Color(0xff503083), width: 5)),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: CircleAvatar(
                                radius: 150,
                                backgroundImage: Image.file(
                                  File(e.selectedImage!.path.toString()),
                                  fit: BoxFit.cover,
                                ).image,
                              ),
                            ),
                          ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  e.selectedImage == null
                      ? GestureDetector(
                          onTap: () {
                            e.imageDialog();
                          },
                          child: const Column(
                            children: [
                              SizedBox(
                                height: 80,
                                width: 80,
                                child: Card(
                                  color: Color(0xff503083),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(150)),
                                      side: BorderSide(
                                          color: Color(0xffededed), width: 5)),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Tap Here to Capture',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )
                      : GestureDetector(
                          onTap: () {},
                          child: Container(
                              margin: const EdgeInsets.only(top: 20),
                              alignment: Alignment.center,
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.8,
                              decoration: const BoxDecoration(
                                  color: Colors.deepPurple,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              padding: const EdgeInsets.all(8),
                              child: const Text(
                                'NEXT',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )),
                        )
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}
