import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/pdprofile/pdprofilecontroller.dart';

class EmpProfile extends StatelessWidget {
  const EmpProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (e) {
        return Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text( "Profile Details",
                    // 'PD/PO/SW Profile',
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            titleTextStyle: const TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          body: SizedBox(
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width * 1,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                child: Column(
                  children: [
                    Table(
                      defaultColumnWidth: const FixedColumnWidth(150.0),
                      children: [
                         TableRow(children: [
                          TableCell(
                              child: Text(
                            'Name : ',
                            style: TextStyle(color: Color(0xFF583988)),
                          )),
                          TableCell(
                            child: Text(e.profileDataById['name'].toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color(0xFF503083),
                                )),
                          )
                        ]),
                        TableRow(children: [
                          const TableCell(
                            child: Text(
                              'Contact Number : ',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          TableCell(
                              child: Text(e.profileDataById['mobile'].toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )))
                        ]),
                        TableRow(children: [
                          const TableCell(
                            child: Text(
                              'Alternate Mobile Number : ',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          TableCell(
                              child: Text(e.profileDataById['alt_mobile'].toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )))
                        ]),
                        TableRow(children: [
                          const TableCell(
                            child: Text(
                              'Email ID : ',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          TableCell(
                              child: Text(e.profileDataById['email'].toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )))
                        ]),
                        TableRow(children: [
                          const TableCell(
                            child: Text(
                              'Qualification : ',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          TableCell(
                              child: Text(e.profileDataById['qualification'].toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )))
                        ]),
                         TableRow(children: [
                          const TableCell(
                            child: Text(
                              'Gender : ',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          TableCell(
                              child: Text(e.profileDataById['gender'].toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )))
                        ]),
                      ],
                    ),
                    Container(
                      width: 180,
                      height: 220,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(
                          top: 60, bottom: 20, left: 50, right: 60),
                      decoration: BoxDecoration(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: const Color(0xFF583988))),
                      child: e.profileDataById['profile_img'].toString().isNotEmpty ?  Image.network(
                        e.profileDataById['profile_img'].toString(),
                      ) : Image.asset('assets/images/applogo.png'),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ));
  }
}
