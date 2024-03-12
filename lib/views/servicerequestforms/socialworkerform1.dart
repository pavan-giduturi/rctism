import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rctism/helpers/utilities.dart';
import 'package:rctism/views/servicerequestforms/servicerequestform2.dart';

import '../../controllers/servicerequestforms/servicerequestform1controller.dart';

class SocialworkerForm1 extends StatelessWidget {
  const SocialworkerForm1({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ServiceRequestForm1Controller>(
      init: ServiceRequestForm1Controller(),
      builder: (e) {
        return Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: const Text(
                    'Social Worker',
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
                        'Recipient Name',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: e.recipientController,
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
                          filled: true,),
                        validator: (value){
                          if(value.toString().isEmpty){
                            return 'Recipient Name is required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Surname',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: e.surNameController,
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
                          filled: true,),
                        validator: (value){
                          if(value.toString().isEmpty){
                            return 'SurName is required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'S/o. D/o, W/o*',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: e.sonOfController,
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
                          filled: true,),
                        validator: (value){
                          if(value.toString().isEmpty){
                            return 'S/o. D/o, W/o is required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'DOB*',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onTap: () {
                          e.datePicker(context);
                        },
                        readOnly: true,
                        controller: e.dobController,
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
                          hintText: 'DDMMYYYY',
                          suffixIcon: Icon(Icons.calendar_month),
                        ),
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'DOB is required';
                          } else if (value.toString().length < 8) {
                            return 'Enter Valid DOB in DDMMYYYY format';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Service Type*',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DropdownButtonFormField(
                        style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w400),
                        isExpanded: true,
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
                        isDense: true,
                        icon: const Icon(
                          Icons.arrow_drop_down,
                        ),
                        iconSize: 30,
                        items: e.serviceReqTypes.map((item) {
                          return DropdownMenuItem(
                            value: item['id'].toString(),
                            child: Text(
                              item['name'],
                              style: const TextStyle(color: Colors.black),
                            ),
                          );
                        }).toList(),
                        value: e.serviceTypeDropDownValue,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Field is required';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          log('Selected Value is $value');
                          e.serviceTypeDropDownValue = value.toString();
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Gender*',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: e.genderController,
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
                          filled: true,),
                        validator: (value){
                          if(value.toString().isEmpty){
                            return 'Gender is required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Phone Number*',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: e.mobNumController,
                        keyboardType: TextInputType.phone,
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
                          filled: true,),
                        validator: (value){
                          if(value.toString().isEmpty){
                            return 'Mobile Number is required';
                          }else if(value.toString().length<10 || value.toString().length>10){
                            return 'Enter valid Mobile Number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Alternative Phone Number*',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: e.altMobNumController,
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
                          filled: true,),
                        validator: (value){
                          if(value.toString().isEmpty){
                            return 'Mobile Number is required';
                          }else if(value.toString().length<10 || value.toString().length>10){
                            return 'Enter valid Mobile Number';
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
                if(e.formKey.currentState!.validate()){
                  Utilities.form1List = {};
                  Utilities.form1List =jsonEncode( {
                    "recipientName" : e.recipientController.text.toString(),
                    "recipientSurname" : e.surNameController.text.toString(),
                    "recipientSonOf" : e.sonOfController.text.toString(),
                    "recipientDOB" : e.dobController.text.toString(),
                    "recipientGender" : e.genderController.text.toString(),
                    "recipientMobNumber" : e.mobNumController.text.toString(),
                    "recipientAltMobNumber" : e.altMobNumController.text.toString(),
                    "requestType" : e.argumentData,
                  });
                  log(Utilities.form1List.toString());
                  log('next');
                  Get.to(()=>const ServiceRequestForm2());
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
