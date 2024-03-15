import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/pdprofile/pdprofilecontroller.dart';
import '../../controllers/profilesdirectory/profileslistcontroller.dart';
import '../../helpers/utilities.dart';
import '../servicerequestforms/servicerequestform1.dart';
import '../verification/verification.dart';

class ServiceRequestslist extends StatelessWidget {
  const ServiceRequestslist({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<ProfileslistController>(
          init: ProfileslistController(),
          builder: (e) {
            var titlename = "";
            if(e.profileData['role'].toString() == "pof"){
              titlename = "My Project Directors";
            } else if(e.profileData['role'].toString() == "pm"){
              titlename = "My Social Workers";
            } else if(e.profileData['role'].toString() == "sw"){
              titlename = "Service Requests";
            } else if(e.profileData['role'].toString() == "srq"){
              titlename = "Service Requests";
            }

            return Scaffold(
              appBar: AppBar(
                title: Text(titlename.toString(),style: TextStyle(fontWeight: FontWeight.bold)),
                actions: [
                  Visibility(
                    visible: Utilities.isSocialWorker,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: GestureDetector(
                        child: const Icon(
                          Icons.add_circle_outlined,
                          color: Colors.deepPurple,
                        ),
                        onTap: () {
                          Get.to(() => const ServiceRequestForm1(),arguments: "add");

                        },
                      ),
                    ),
                  )
                ],
              ),
              body: ListView.builder(
                  itemCount: e.serviceRequestslistData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      // decoration: BoxDecoration(
                      //   border: Border(
                      //     bottom: BorderSide(width: 2.0, color: Colors.black38),
                      //   ),
                      //   color: Colors.white,
                      // ),
                      child: ListTile(
                        leading: const Icon(Icons.account_circle,size: 60),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        title: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(e.serviceRequestslistData[index]["recp_name"].toString(),style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.blue),),
                              Text(e.serviceRequestslistData[index]["phone_no"].toString(),style: TextStyle(fontSize: 12,)),
                              Text(e.serviceRequestslistData[index]["serreqid"].toString(),style: TextStyle(fontSize: 12,)),
                            ],
                          ),
                        ),
                        onTap: () {
                          Get.to(() =>  VerificationScreen(),arguments: e.serviceRequestslistData[index]["id"].toString());
                        },
                        shape: Border(bottom: BorderSide(color: Colors.black45,width: 1, )),
                      ),
                    );
                  }),
            );
          },
        ));
  }
}
