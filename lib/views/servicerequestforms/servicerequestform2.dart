import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/servicerequestforms/servicerequestform2controller.dart';


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
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          body: SizedBox(
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width * 1,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Aadhaar Number',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 10,),
                    TextFormField(
                      readOnly: true,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFf1f1f1),),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          enabledBorder:  OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFf1f1f1),),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          focusedBorder:  OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFf1f1f1),),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          fillColor: Color(0xFFf1f1f1),
                          filled: true,
                          hintText: 'Apollo'
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const Text('Type Of Cultivation',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 10,),
                    TextFormField(
                      readOnly: true,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFf1f1f1),),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          enabledBorder:  OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFf1f1f1),),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          focusedBorder:  OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFf1f1f1),),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          fillColor: Color(0xFFf1f1f1),
                          filled: true,
                          hintText: 'Kent'
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const Text('Door No.',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 10,),
                    TextFormField(
                      readOnly: true,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFf1f1f1),),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          enabledBorder:  OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFf1f1f1),),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          focusedBorder:  OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFf1f1f1),),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          fillColor: Color(0xFFf1f1f1),
                          filled: true,
                          hintText: 'Number'
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const Text('Street',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 10,),
                    TextFormField(
                      readOnly: true,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFf1f1f1),),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          enabledBorder:  OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFf1f1f1),),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          focusedBorder:  OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFf1f1f1),),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          fillColor: Color(0xFFf1f1f1),
                          filled: true,
                          hintText: 'Street'
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const Text('Village',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 10,),
                    TextFormField(
                      readOnly: true,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFf1f1f1),),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          enabledBorder:  OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFf1f1f1),),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          focusedBorder:  OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFf1f1f1),),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          fillColor: Color(0xFFf1f1f1),
                          filled: true,
                          hintText: 'Village'
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const Text('Mandal',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 10,),
                    TextFormField(
                      readOnly: true,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFf1f1f1),),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          enabledBorder:  OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFf1f1f1),),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          focusedBorder:  OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFf1f1f1),),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          fillColor: Color(0xFFf1f1f1),
                          filled: true,
                          hintText: 'Mandal'
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const Text('State',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 10,),
                    TextFormField(
                      readOnly: true,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFf1f1f1),),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          enabledBorder:  OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFf1f1f1),),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          focusedBorder:  OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFf1f1f1),),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          fillColor: Color(0xFFf1f1f1),
                          filled: true,
                          hintText: 'State'
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const Text('District',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 10,),
                    TextFormField(
                      readOnly: true,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFf1f1f1),),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          enabledBorder:  OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFf1f1f1),),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          focusedBorder:  OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFf1f1f1),),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          fillColor: Color(0xFFf1f1f1),
                          filled: true,
                          hintText: 'District'
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const Text('PinCode',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 10,),
                    TextFormField(
                      readOnly: true,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFf1f1f1),),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          enabledBorder:  OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFf1f1f1),),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          focusedBorder:  OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFf1f1f1),),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          fillColor: Color(0xFFf1f1f1),
                          filled: true,
                          hintText: 'PinCode'
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const Text('Voter ID',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 10,),
                    TextFormField(
                      readOnly: true,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFf1f1f1),),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          enabledBorder:  OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFf1f1f1),),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          focusedBorder:  OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFf1f1f1),),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          fillColor: Color(0xFFf1f1f1),
                          filled: true,
                          hintText: 'Voter ID'
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                        },
                        child: Container(
                            margin: const EdgeInsets.only(top: 20),
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: const BoxDecoration(
                                color: Colors.deepPurple,
                                borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                            padding: const EdgeInsets.all(8),
                            child: const Text(
                              'NEXT',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            )))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
