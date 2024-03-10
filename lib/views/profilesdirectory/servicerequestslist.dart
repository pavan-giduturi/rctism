import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/pdprofile/pdprofilecontroller.dart';
import '../../controllers/profilesdirectory/profileslistcontroller.dart';

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
            }

            return Scaffold(
              appBar: AppBar(
                title: Text(titlename.toString(),style: TextStyle(fontWeight: FontWeight.bold)),
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
                        leading: const Icon(Icons.circle,size: 60),
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
