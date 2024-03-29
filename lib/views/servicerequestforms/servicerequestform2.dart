import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rctism/helpers/utilities.dart';

import '../../controllers/servicerequestforms/servicerequestform2controller.dart';
import '../identitycapture/identitycapturescreen.dart';

class ServiceRequestForm2 extends StatelessWidget {
  const ServiceRequestForm2({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ServiceRequestForm2Controller>(
      init: ServiceRequestForm2Controller(),
      builder: (e) {
        return Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: const Text(
                    'Service Request',
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
          body: Form(
            key: e.formKey,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 1,
              width: MediaQuery.of(context).size.width * 1,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Aadhaar Number',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        maxLength: 12,
                        keyboardType: TextInputType.number,
                        controller: e.aadhaarNumController,
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFf1f1f1),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFf1f1f1),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFf1f1f1),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          fillColor: Color(0xFFf1f1f1),
                          filled: true,
                        ),
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'Aadhaar Number is required';
                          } else if (value.toString().length < 12 ||
                              value.toString().length > 12) {
                            return 'Enter valid Aadhaar Number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Type Of Cultivation',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: e.cultivationTypeController,
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFf1f1f1),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFf1f1f1),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFf1f1f1),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          fillColor: Color(0xFFf1f1f1),
                          filled: true,
                        ),
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'Cultivation Type is required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 160,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Extent of Land (Acress)',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  maxLength: 4,
                                  keyboardType: TextInputType.number,
                                  controller: e.extentActressController,
                                  style: const TextStyle(color: Colors.black),
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFf1f1f1),
                                        ),
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFf1f1f1),
                                        ),
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFf1f1f1),
                                        ),
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                    fillColor: Color(0xFFf1f1f1),
                                    filled: true,
                                  ),
                                  validator: (value) {
                                    if (value.toString().isEmpty) {
                                      return 'Extent of Land is required';
                                    }
                                    return null;
                                  },
                                ),
                                // DropdownButtonFormField(
                                //   decoration: const InputDecoration(
                                //     border: OutlineInputBorder(
                                //         borderSide: BorderSide(
                                //           color: Color(0xFFf1f1f1),
                                //         ),
                                //         borderRadius: BorderRadius.all(
                                //             Radius.circular(10))),
                                //     enabledBorder: OutlineInputBorder(
                                //         borderSide: BorderSide(
                                //           color: Color(0xFFf1f1f1),
                                //         ),
                                //         borderRadius: BorderRadius.all(
                                //             Radius.circular(10))),
                                //     focusedBorder: OutlineInputBorder(
                                //         borderSide: BorderSide(
                                //           color: Color(0xFFf1f1f1),
                                //         ),
                                //         borderRadius: BorderRadius.all(
                                //             Radius.circular(10))),
                                //     fillColor: Color(0xFFf1f1f1),
                                //     filled: true,
                                //   ),
                                //   isDense: true,
                                //   icon: const Icon(
                                //     Icons.arrow_drop_down,
                                //   ),
                                //   iconSize: 30,
                                //   items: e.landExtentList.map((item) {
                                //     return DropdownMenuItem(
                                //       value: item['id'].toString(),
                                //       child: Text(
                                //         item['name'],
                                //         style: const TextStyle(
                                //             color: Colors.black),
                                //       ),
                                //     );
                                //   }).toList(),
                                //   value: e.extentDropDownValue,
                                //   validator: (value) {
                                //     if (value == null || value.isEmpty) {
                                //       return 'Field is required';
                                //     }
                                //     return null;
                                //   },
                                //   onChanged: (value) {
                                //     log('Selected Value is $value');
                                //     e.extentDropDownValue = value.toString();
                                //   },
                                // ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 130,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Cents',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  maxLength: 4,
                                  keyboardType: TextInputType.number,
                                  controller: e.extentCentController,
                                  style: const TextStyle(color: Colors.black),
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFf1f1f1),
                                        ),
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFf1f1f1),
                                        ),
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFf1f1f1),
                                        ),
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                    fillColor: Color(0xFFf1f1f1),
                                    filled: true,
                                  ),
                                  validator: (value) {
                                    if (value.toString().isEmpty) {
                                      return 'Cents is required';
                                    }
                                    return null;
                                  },
                                ),
                                // DropdownButtonFormField(
                                //   decoration: const InputDecoration(
                                //     border: OutlineInputBorder(
                                //         borderSide: BorderSide(
                                //           color: Color(0xFFf1f1f1),
                                //         ),
                                //         borderRadius: BorderRadius.all(
                                //             Radius.circular(10))),
                                //     enabledBorder: OutlineInputBorder(
                                //         borderSide: BorderSide(
                                //           color: Color(0xFFf1f1f1),
                                //         ),
                                //         borderRadius: BorderRadius.all(
                                //             Radius.circular(10))),
                                //     focusedBorder: OutlineInputBorder(
                                //         borderSide: BorderSide(
                                //           color: Color(0xFFf1f1f1),
                                //         ),
                                //         borderRadius: BorderRadius.all(
                                //             Radius.circular(10))),
                                //     fillColor: Color(0xFFf1f1f1),
                                //     filled: true,
                                //   ),
                                //   isDense: true,
                                //   icon: const Icon(
                                //     Icons.arrow_drop_down,
                                //   ),
                                //   iconSize: 30,
                                //   items: e.centsList.map((item) {
                                //     return DropdownMenuItem(
                                //       value: item['id'].toString(),
                                //       child: Text(
                                //         item['name'],
                                //         style: const TextStyle(
                                //             color: Colors.black),
                                //       ),
                                //     );
                                //   }).toList(),
                                //   value: e.centsDropDownValue,
                                //   validator: (value) {
                                //     if (value == null || value.isEmpty) {
                                //       return 'Field is required';
                                //     }
                                //     return null;
                                //   },
                                //   onChanged: (value) {
                                //     log('Selected Value is $value');
                                //     e.centsDropDownValue = value.toString();
                                //   },
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Door No.',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        maxLength: 12,
                        controller: e.doorNumController,
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFf1f1f1),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFf1f1f1),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFf1f1f1),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          fillColor: Color(0xFFf1f1f1),
                          filled: true,
                        ),
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'Door No.  is required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Street',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: e.streetController,
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFf1f1f1),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFf1f1f1),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFf1f1f1),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          fillColor: Color(0xFFf1f1f1),
                          filled: true,
                        ),
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'Street Name is required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Village',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: e.villageController,
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFf1f1f1),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFf1f1f1),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFf1f1f1),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          fillColor: Color(0xFFf1f1f1),
                          filled: true,
                        ),
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'Village Name is required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Mandal',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: e.mandalNameController,
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFf1f1f1),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFf1f1f1),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFf1f1f1),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          fillColor: Color(0xFFf1f1f1),
                          filled: true,
                        ),
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'Mandal Name is required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'State',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DropdownButtonFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFf1f1f1),
                              ),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFf1f1f1),
                              ),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFf1f1f1),
                              ),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10))),
                          fillColor: Color(0xFFf1f1f1),
                          filled: true,
                        ),
                        isDense: true,
                        icon: const Icon(
                          Icons.arrow_drop_down,
                        ),
                        iconSize: 30,
                        items: e.statesList.map((item) {
                          return DropdownMenuItem(
                            value: item['id'].toString(),
                            child: Text(
                              item['name'],
                              style: const TextStyle(
                                  color: Colors.black),
                            ),
                          );
                        }).toList(),
                        value: e.stateDropDownValue,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Field is required';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          log('Selected Value is $value');
                          e.stateDropDownValue = value.toString();
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'District',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: e.districtController,
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFf1f1f1),
                              ),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFf1f1f1),
                              ),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFf1f1f1),
                              ),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                          fillColor: Color(0xFFf1f1f1),
                          filled: true,
                        ),
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'District Name is required';
                          }
                          return null;
                        },
                      ),
                      // DropdownButtonFormField(
                      //   decoration: const InputDecoration(
                      //     border: OutlineInputBorder(
                      //         borderSide: BorderSide(
                      //           color: Color(0xFFf1f1f1),
                      //         ),
                      //         borderRadius: BorderRadius.all(
                      //             Radius.circular(10))),
                      //     enabledBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(
                      //           color: Color(0xFFf1f1f1),
                      //         ),
                      //         borderRadius: BorderRadius.all(
                      //             Radius.circular(10))),
                      //     focusedBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(
                      //           color: Color(0xFFf1f1f1),
                      //         ),
                      //         borderRadius: BorderRadius.all(
                      //             Radius.circular(10))),
                      //     fillColor: Color(0xFFf1f1f1),
                      //     filled: true,
                      //   ),
                      //   isDense: true,
                      //   icon: const Icon(
                      //     Icons.arrow_drop_down,
                      //   ),
                      //   iconSize: 30,
                      //   items: e.districtList.map((item) {
                      //     return DropdownMenuItem(
                      //       value: item['id'].toString(),
                      //       child: Text(
                      //         item['name'],
                      //         style: const TextStyle(
                      //             color: Colors.black),
                      //       ),
                      //     );
                      //   }).toList(),
                      //   value: e.districtDropDownValue,
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'Field is required';
                      //     }
                      //     return null;
                      //   },
                      //   onChanged: (value) {
                      //     log('Selected Value is $value');
                      //     e.districtDropDownValue = value.toString();
                      //   },
                      // ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'PinCode',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        maxLength: 6,
                        keyboardType: TextInputType.number,
                        controller: e.pinCodeController,
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFf1f1f1),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFf1f1f1),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFf1f1f1),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          fillColor: Color(0xFFf1f1f1),
                          filled: true,
                        ),
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'PinCode is required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Voter ID',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        maxLength: 10,
                        controller: e.voterIdController,
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFf1f1f1),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFf1f1f1),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFf1f1f1),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          fillColor: Color(0xFFf1f1f1),
                          filled: true,
                        ),
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'Voter ID is required';
                          } else if (value.toString().length < 10 ||
                              value.toString().length > 10) {
                            return 'Enter valid Voter ID';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          bottomNavigationBar: GestureDetector(
              onTap: () {
                if (e.formKey.currentState!.validate()) {
                  Utilities.form2List = {};
                  Utilities.form2List = jsonEncode({
                    "aadhaarNumber" : e.aadhaarNumController.text.toString(),
                    "cultivationType" : e.cultivationTypeController.text.toString(),
                    "landExtent" : e.extentActressController.text.toString(),
                    "landCents" : e.extentCentController.text.toString(),
                    "doorNum" : e.doorNumController.text.toString(),
                    "streetName" : e.streetController.text.toString(),
                    "villageName" : e.villageController.text.toString(),
                    "mandalName" : e.mandalNameController.text.toString(),
                    "stateID" : e.stateDropDownValue.toString(),
                    "districtID" : e.districtController.text.toString(),
                    "pinCode" : e.pinCodeController.text.toString(),
                    "voterID" : e.voterIdController.text.toString(),
                  });
                  log(Utilities.form2List.toString());
                  Get.to(()=> IdentityCapture(),arguments: "serviceRequest");
                }
              },
              child: Container(
                  margin: const EdgeInsets.only(
                      left: 30, right: 30, top: 10, bottom: 10),
                  height: 40,
                  decoration: const BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  padding: const EdgeInsets.all(8),
                  child: const Text(
                    'NEXT',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ))),
        );
      },
    );
  }
}
