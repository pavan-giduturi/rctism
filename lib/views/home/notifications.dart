import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/home/notifications.dart';
import '../../controllers/profilesdirectory/profileslistcontroller.dart';
import '../servicerequestforms/socialworkerform1.dart';


class Notificationslist extends StatelessWidget {
  const Notificationslist({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<NotificationsController>(
          init: NotificationsController(),
          builder: (e) {
            if(e.notificationslistData.isNotEmpty){
              return Scaffold(
                appBar: AppBar(
                  title: Text("Notifications",style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                body: ListView.builder(
                    itemCount: e.notificationslistData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        // decoration: BoxDecoration(
                        //   border: Border(
                        //     bottom: BorderSide(width: 2.0, color: Colors.black38),
                        //   ),
                        //   color: Colors.white,
                        // ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(e.notificationslistData[index]["profile_img_path"].toString()), // No matter how big it is, it won't overflow
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          title: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Title",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.blue),),
                                Text("Subject",style: TextStyle(fontSize: 12,)),
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
            }else{
              return Scaffold(
                appBar: AppBar(
                  title: Text("Notifications",style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                body: Center(
                  heightFactor: 22,
                  child: Text(
                    "No Notifications Found",
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              );
            }

          },
        ));
  }
}
