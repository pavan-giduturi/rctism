import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/home/notifications.dart';


class Contactus extends StatelessWidget {
  const Contactus({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<NotificationsController>(
          init: NotificationsController(),
          builder: (e) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Contact Us",style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              body: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      borderRadius:
                      BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                          image: AssetImage('assets/icons/cardbg.png'),
                          fit: BoxFit.fill)),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Icon(Icons.phone,color: Colors.white,),
                            ),
                            Text(
                              "+91 8688121391",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Icon(Icons.location_on_outlined,color: Colors.white,),
                            ),
                            Text(
                              "Door No 35-86. Narayana Nagar.",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 14),
                            ),

                          ],
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(""),
                            ),
                            Text(
                              "Antharaba Road. Po Pathapatnam.",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(""),
                            ),
                            Text(
                              "Srikakulam Dt. PIN-532213. (A.P)",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 14),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Icon(Icons.email_outlined,color: Colors.white,),
                            ),
                            Text(
                              "info@rctism.com",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                      ]),
                ),
              ),
            );

          },
        ));
  }
}
