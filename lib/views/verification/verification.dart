import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/verification/verificationcontroller.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VerificationController>(
      builder: (e) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Verification'),
            titleTextStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: SingleChildScrollView(
                child: ListView.builder(
                  itemCount: e.verificationList.length,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (context, index) {
                    e.setIcon(e.verificationList[index]['status_position']);
                    return SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                e.verificationList[index]['status_flag'].toString() != "checked"
                                    ? Container(
                                        height: 50,
                                        width: 50,
                                        decoration: const BoxDecoration(
                                            color: Color(0xFF503083),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50))),
                                        child: Icon(
                                                e.verificationIcon,
                                                color: Colors.white,
                                              ))

                                        // CircleAvatar(
                                        //   backgroundImage: NetworkImage(e.verificationList[index]['image'].toString()), // No matter how big it is, it won't overflow
                                        // ))

                                    : Container(
                                        height: 50,
                                        width: 50,
                                        decoration: const BoxDecoration(
                                            color: Color(0xFF06a900),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50))),
                                        child: const Icon(
                                          Icons.done,
                                          color: Colors.white,
                                        )),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      e.verificationList[index]['title'].toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(e.verificationList[index]['status_position'].toString()),
                                  ],
                                )
                              ],
                            ),
                            index < (e.verificationList.length - 1)
                                ? Container(
                                    margin:
                                        const EdgeInsets.only(top: 10, left: 15),
                                    height: 30,
                                    child: const VerticalDivider(
                                      color: Color(0xFFa9b9cf),
                                      thickness: 2,
                                    ))
                                : Container(),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
      init: VerificationController(),
    );
  }
}
