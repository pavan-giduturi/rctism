import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/login/logincontroller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<LoginController>(
        init: LoginController(),
        builder: (c) {
          return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Form(
              key: c.formKey,
              child: Container(
                height: MediaQuery.of(context).size.height * 1,
                width: MediaQuery.of(context).size.width * 1,
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Image.asset('assets/images/applogo.png'),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: TextFormField(
                        controller: c.empID,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            // focusedBorder: OutlineInputBorder(
                            //     borderSide: BorderSide(color: Colors.black26),
                            //     borderRadius:
                            //         BorderRadius.all(Radius.circular(10))),
                            // enabledBorder: OutlineInputBorder(
                            //     borderSide: BorderSide(color: Colors.black26),
                            //     borderRadius:
                            //         BorderRadius.all(Radius.circular(10))),
                            fillColor: Colors.black26,
                            filled: true,
                            hintText: 'Employee ID'),
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'Employee ID is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: TextFormField(
                        controller: c.empPassword,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            // focusedBorder: OutlineInputBorder(
                            //     borderSide: BorderSide(color: Colors.black26),
                            //     borderRadius:
                            //         BorderRadius.all(Radius.circular(10))),
                            // enabledBorder: OutlineInputBorder(
                            //     borderSide: BorderSide(color: Colors.black26),
                            //     borderRadius:
                            //         BorderRadius.all(Radius.circular(10))),
                            fillColor: Colors.black26,
                            filled: true,
                            hintText: 'Password'),
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'Password is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 30,
                      ),
                      child: const Text('or'),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: c.empMobile,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            // focusedBorder: OutlineInputBorder(
                            //     borderSide: BorderSide(color: Colors.black26),
                            //     borderRadius:
                            //         BorderRadius.all(Radius.circular(10))),
                            // enabledBorder: OutlineInputBorder(
                            //     borderSide: BorderSide(color: Colors.black26),
                            //     borderRadius:
                            //         BorderRadius.all(Radius.circular(10))),
                            fillColor: Colors.black26,
                            filled: true,
                            hintText: 'Mobile Number'),
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'Mobile Number is required';
                          } else if (value.toString().length > 10 ||
                              value.toString().length < 10) {
                            return 'Mobile Number must be 10 characters';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Row(children: [
                        Checkbox(
                          checkColor: Colors.greenAccent,
                          activeColor: Colors.red,
                          value: c.checkValue,
                          onChanged: (value) {
                            c.setCheckBox(value);
                            log(value.toString());
                          },
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: const Text(
                            'I accept Terms & Conditions and Privacy Policy',
                            maxLines: 2,
                          ),
                        )
                      ]),
                    ),
                    GestureDetector(
                        onTap: () {
                          if(c.checkValue == true){
                            if (c.empID.text.toString().isEmpty &&
                                c.empPassword.text.toString().isEmpty) {
                              if (c.empMobile.text.toString().isEmpty) {
                                Get.snackbar('Alert', 'Mobile Number Required',
                                    messageText: const Text(
                                      'Mobile Number Required',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                    ),
                                    titleText: const Text('Alert',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                    backgroundColor: Colors.deepPurple,
                                    barBlur: 3,
                                    colorText: Colors.black,
                                    animationDuration:
                                    const Duration(seconds: 3));
                              } else if (c.empMobile.text.toString().length >
                                  10 ||
                                  c.empMobile.text.toString().length < 10) {
                                Get.snackbar('Alert', 'Enter Valid Mobile Number',
                                    messageText: const Text(
                                      'Enter Valid Mobile Number',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                    ),
                                    titleText: const Text('Alert',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                    backgroundColor: Colors.deepPurple,
                                    barBlur: 3,
                                    colorText: Colors.black,
                                    animationDuration:
                                    const Duration(seconds: 3));
                              }else{
                                c.getOTP(c.empMobile.text.toString());
                              }
                            } else {
                              if (c.empID.text.toString().isNotEmpty &&
                                  c.empPassword.text.toString().isNotEmpty) {
                                // c.getLogin(c.empID.text.toString(),c.empPassword.text.toString());
                                c.getLogin('RCTD0478', '9492265601');
                              }else{
                                Get.snackbar('Alert', 'Credentials Required',
                                    messageText: const Text(
                                      'Credentials Required',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                    ),
                                    titleText: const Text('Alert',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                    backgroundColor: Colors.deepPurple,
                                    barBlur: 3,
                                    colorText: Colors.black,
                                    animationDuration:
                                    const Duration(seconds: 3));
                              }
                            }
                          }else{
                            Get.snackbar('Alert', 'Accept Terms & Conditions',
                                messageText: const Text(
                                  'Accept Terms & Conditions',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                                titleText: const Text('Alert',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                backgroundColor: Colors.deepPurple,
                                barBlur: 3,
                                colorText: Colors.black,
                                animationDuration:
                                const Duration(seconds: 3));
                          }
                        },
                        child: Container(
                            margin: const EdgeInsets.only(top: 20),
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: const BoxDecoration(
                                color: Colors.deepPurple,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            padding: const EdgeInsets.all(8),
                            child: const Text(
                              'CONTINUE',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            )))
                  ]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
