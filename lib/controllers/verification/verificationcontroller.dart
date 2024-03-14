import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationController extends GetxController {
  IconData verificationIcon = Icons.phone_android;
  List verificationList = [
    {
      "id": "1",
      "status":"1",
      "name": "Mobile Verification",
      "description": "Mobile Verification Description"
    },
    {
      "id": "2",
      "status":"1",
      "name": "Aadhaar Verification",
      "description": "Aadhaar Verification Description"
    },
    {
      "id": "3",
      "status":"0",
      "name": "Voter ID Verification",
      "description": "Voter ID Verification Description"
    },
    {
      "id": "4",
      "status":"0",
      "name": "Former Verification",
      "description": "Former Verification Description"
    },
    {
      "id": "5",
      "status":"0",
      "name": "Office Visit Verification",
      "description": "Office Visit Verification Description"
    },
  ];

  setIcon(id){
    if(id == "1"){
      verificationIcon =  Icons.phone_android;
    }else if(id == "2"){
      verificationIcon =  Icons.contact_mail ;
    }else if(id == "3"){
      verificationIcon =  Icons.contact_mail ;
    }else if(id == "4"){
      verificationIcon =  Icons.contact_mail ;
    }else if(id == "5"){
      verificationIcon =  Icons.contact_mail ;
    }else{
      verificationIcon =  Icons.phone_android ;
    }
  }
}
