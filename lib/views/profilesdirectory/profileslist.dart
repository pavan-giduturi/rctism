import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rctism/helpers/utilities.dart';
import '../../controllers/profilesdirectory/profileslistcontroller.dart';
import '../servicerequestforms/socialworkerform1.dart';
import 'empprofile.dart';

class Profileslist extends StatelessWidget {
  const Profileslist({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<ProfileslistController>(
      init: ProfileslistController(),
      builder: (e) {
        var titlename = "";
        if (e.profileData['role'].toString() == "pof") {
          titlename = "My Project Directors";
        } else if (e.profileData['role'].toString() == "pm") {
          titlename = "My Social Workers";
        } else if (e.profileData['role'].toString() == "sw") {
          titlename = "Social Requests";
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(titlename.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold)),
            actions: [
              Visibility(
                visible: Utilities.isPojectDirector,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    child: const Icon(
                      Icons.add_circle_outlined,
                      color: Colors.deepPurple,
                    ),
                    onTap: () {
                      Get.to(() => const SocialworkerForm1(), arguments: "add");

                    },
                  ),
                ),
              )
            ],
          ),
          body: ListView.builder(
              itemCount: e.profileslistData.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(e.profileslistData[index]
                            ["profile_img_path"]
                        .toString()), // No matter how big it is, it won't overflow
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        e.profileslistData[index]["name"].toString(),
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                      Text(e.profileslistData[index]["mobile"].toString(),
                          style: const TextStyle(
                            fontSize: 12,
                          )),
                      Text(e.profileslistData[index]["emp_id"].toString(),
                          style: const TextStyle(
                            fontSize: 12,
                          )),
                    ],
                  ),
                  onTap: () {
                    Get.to(() => const EmpProfile(),
                        arguments: e.profileslistData[index]);
                  },
                  shape: const Border(
                      bottom: BorderSide(
                    color: Colors.black45,
                    width: 1,
                  )),
                );
              }),
        );
      },
    ));
  }
}
