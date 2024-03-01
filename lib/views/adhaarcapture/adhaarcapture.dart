import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/adhaarcapture/aadhaarcapturecontroller.dart';

class AadhaarCapture extends StatelessWidget {
  const AadhaarCapture({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<AadhaarCaptureController>(
      init: AadhaarCaptureController(),
      builder: (e) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Aadhaar Identity'),
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      e.frontImageDialog();
                    },
                    child: e.frontSelectedImage == null
                        ? SizedBox(
                            height: 200,
                            width: 300,
                            child: Card(
                                color: const Color(0xffededed),
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    side: BorderSide(
                                        color: Colors.black, width: 1)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/icons/cameraicon.png',
                                      scale: 2,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'Upload Aadhaar Front Image',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                )),
                          )
                        : Card(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                side:
                                    BorderSide(color: Colors.black, width: 1)),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Image.file(
                                File(e.frontSelectedImage!.path.toString()),
                                height: 200,
                                width: 300,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                  ),
                  const SizedBox(height: 20,),
                  GestureDetector(
                    onTap: () {
                      e.backImageDialog();
                    },
                    child: e.backSelectedImage == null
                        ? SizedBox(
                            height: 200,
                            width: 300,
                            child: Card(
                                color: const Color(0xffededed),
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    side: BorderSide(
                                        color: Colors.black, width: 1)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/icons/cameraicon.png',
                                      scale: 2,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'Upload Aadhaar Back Image',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                )),
                          )
                        : Card(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                side:
                                    BorderSide(color: Colors.black, width: 1)),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Image.file(
                                File(e.backSelectedImage!.path.toString()),
                                height: 200,
                                width: 300,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                        margin: const EdgeInsets.only(top: 30),
                        alignment: Alignment.center,
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: const BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        padding: const EdgeInsets.all(8),
                        child: const Text(
                          'SUBMIT',
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
