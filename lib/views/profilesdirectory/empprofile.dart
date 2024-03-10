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
                  child: Text(e.profileData['role'].toString() == "null" ? "Profile" : e.profileData['role'].toString()+" Profile",
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
                        const TableRow(children: [
                          TableCell(
                              child: Text(
                            'Project Director : ',
                            style: TextStyle(color: Color(0xFF583988)),
                          )),
                          TableCell(
                            child: Text('Project Director Name',
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
                              child: Text(e.profileData['mobile'].toString(),
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
                              child: Text(e.profileData['alt_mobile'].toString(),
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
                              child: Text(e.profileData['email'].toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )))
                        ]),
                        TableRow(children: [
                          const TableCell(
                            child: Text(
                              'Date of Birth : ',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          TableCell(
                              child: Text(e.profileData['dob'].toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )))
                        ]),
                        TableRow(children: [
                          const TableCell(
                            child: Text(
                              'Name of the Father/Husband : ',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          TableCell(
                              child: Text(e.profileData['f_h_name'].toString(),
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
                              child: Text(e.profileData['qualification'].toString(),
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
                              child: Text(e.profileData['gender'].toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )))
                        ]),
                         TableRow(children: [
                          const TableCell(
                            child: Text(
                              'Religion : ',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          TableCell(
                              child: Text(e.profileData['religion'].toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )))
                        ]),
                        TableRow(children: [
                          const TableCell(
                            child: Text(
                              'Marital Status : ',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          TableCell(
                              child: Text(e.profileData['marital_status'].toString(),
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
                      child: Image.asset('assets/images/applogo.png'),
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
