import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rctism/helpers/utilities.dart';
import 'package:rctism/views/servicerequestforms/servicerequestform2.dart';

import '../../controllers/servicerequestforms/servicerequestform1controller.dart';
import '../../controllers/servicerequestforms/socialworkerform1controller.dart';

class SocialworkerForm1 extends StatelessWidget {
  const SocialworkerForm1({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SocialworkerForm1Controller>(
      init: SocialworkerForm1Controller(),
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
                        'Name',
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
                            return 'Name is required';
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
                        'DOJ*',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
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
                            hintText: 'DDMMYYYY'),
                        validator: (value){
                          if(value.toString().isEmpty){
                            return 'DOB is required';
                          }else if(value.toString().length<8){
                            return 'Enter Valid DOB in DDMMYYYY format';
                          }
                          return null;
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
                        'Email-Id*',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: e.emailController,
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

                      const SizedBox(
                        height: 10,
                      ),

                      const Text(
                        'Qualification',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: e.qualificationController,
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
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      const Text(
                        'Aadhar Number',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
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
                            return 'Voter ID is required';
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
                          }
                          return null;
                        },
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
                        keyboardType: TextInputType.phone,
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
                        items: e.districtList.map((item) {
                          return DropdownMenuItem(
                            value: item['id'].toString(),
                            child: Text(
                              item['name'],
                              style: const TextStyle(
                                  color: Colors.black),
                            ),
                          );
                        }).toList(),
                        value: e.districtDropDownValue,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Field is required';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          log('Selected Value is $value');
                          e.districtDropDownValue = value.toString();
                        },
                      ),
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

                    ],
                  ),
                ),
              ),
            ),
          ),
          bottomNavigationBar: GestureDetector(
              onTap: () {
                if(e.formKey.currentState!.validate()){
                  Utilities.socialWorkerFormList = {};
                  Utilities.socialWorkerFormList =jsonEncode( {
                    "name" : e.recipientController.text.toString(),
                    "surname" : e.surNameController.text.toString(),
                    "date_of_join" : e.dobController.text.toString(),
                    "email" : e.emailController.text.toString(),
                    "mobile" : e.mobNumController.text.toString(),
                    "alt_mobile" : e.altMobNumController.text.toString(),
                    "gender" : e.genderController.text.toString(),
                    "qualification" : e.qualificationController.text.toString(),
                    "aadhaar_no" : e.aadhaarNumController.text.toString(),
                    "voter_id_no" : e.voterIdController.text.toString(),
                    "door_no" : e.doorNumController.text.toString(),
                    "street" : e.streetController.text.toString(),
                    "village" : e.villageController.text.toString(),
                    "mandal" : e.mandalNameController.text.toString(),
                    "state_id" : e.stateDropDownValue.toString(),
                    "district" : e.districtDropDownValue.toString(),
                    "pincode" :  e.pinCodeController.text.toString(),
                  });
                  log(Utilities.socialWorkerFormList.toString());
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
