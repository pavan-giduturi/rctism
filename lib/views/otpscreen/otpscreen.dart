import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  dynamic argumentData = Get.arguments;
  TextEditingController otpController = TextEditingController();
  int secondsRemaining = 30;
  bool enableResend = false;
  Timer? timer;
  String mobOTP = "";

  @override
  void initState() {
    super.initState();
    // log(argumentData.toString());
    // log('argumentData');
    // setState(() {
    //   mobOTP = argumentData['data']['OTP'].toString();
    // });
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Verification'),
        titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "A text message with a 6 digit verification code was just sent to ",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                // Text(
                //   " + 91 ${e.argumentData['data']['Mobile_Number'].toString()}",
                //   style: const TextStyle(color: Colors.grey),
                // ),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextField(
                    controller: otpController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      fillColor: Colors.black26,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: Colors.black26,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: Colors.black26,
                          )),
                      hintText: 'Enter OTP',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                GestureDetector(
                  onTap: () {
                    // log(argumentData.toString());
                    // log(otpController.text);
                    // log('mob otp====');
                    // log(mobOTP.toString());
                    if (otpController.text.toString().isEmpty) {
                      Get.snackbar("Alert", 'Enter Valid OTP',
                          overlayBlur: 5,
                          titleText: const Text(
                            'Alert',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.white),
                          ),
                          messageText: const Text(
                            'Enter Valid OTP',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          backgroundColor: Colors.red);
                    } else if (mobOTP.toString() !=
                        otpController.text.toString()) {
                      Get.snackbar("Alert", 'OTP entered is invalid',
                          overlayBlur: 5,
                          titleText: const Text(
                            'Alert',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.white),
                          ),
                          messageText: const Text(
                            'OTP entered is invalid',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          backgroundColor: Colors.red);
                    } else {
                      Get.snackbar(
                        "Alert",
                        'OTP Verified Successfully',
                        overlayBlur: 5,
                        backgroundColor: Colors.red,
                        titleText: const Text(
                          'Alert',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.white),
                        ),
                        messageText: const Text(
                          'OTP Verified Successfully',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      );
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 30),
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: const Text(
                      "Verify",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Request OTP in $secondsRemaining seconds',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 12),
                      ),
                      GestureDetector(
                        onTap: () {
                          log('pressed');
                          log(enableResend.toString());
                          enableResend ? resendCode() : null;
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: 40,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Text(
                            'Resend Code',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              height: 2,
                              color:
                                  enableResend ? Colors.blue : Colors.black38,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void resendCode() {
    //other code here
    setState(() {
      secondsRemaining = 30;
      enableResend = false;
      // sendOtpApiService(argumentData['data']['Mobile_Number'].toString());
    });
  }

  @override
  dispose() {
    timer?.cancel();
    super.dispose();
  }
}
