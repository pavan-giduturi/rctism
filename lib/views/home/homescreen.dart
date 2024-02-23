import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';

import '../../controllers/home/homecontroller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeScreenController>(
          init: HomeScreenController(),
          builder: (e) => AdvancedDrawer(
              backdrop: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  // color: Constants.lightBlue
                ),
              ),
              controller: e.advancedDrawerController,
              animationCurve: Curves.easeInOut,
              animationDuration: const Duration(milliseconds: 300),
              animateChildDecoration: true,
              rtlOpening: false,
              // openScale: 1.0,
              disabledGestures: false,
              childDecoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              drawer: SafeArea(
                bottom: true,
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 1,
                  color: Colors.blue,
                  // color: Colors.white,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 1,
                          color: const Color(0xFFdadada),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 100.0,
                                height: 100.0,
                                margin: const EdgeInsets.only(
                                  top: 24.0,
                                  bottom: 24.0,
                                ),
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  color: Colors.black26,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(
                                width: 100.0,
                                child: Text(
                                  'User Name',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: const Text(
                                  'username123@gmail.com',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                        SafeArea(
                          bottom: true,
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 1,
                                decoration: const BoxDecoration(
                                    color: Color(0xFFf1f1f1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                margin: const EdgeInsets.only(
                                    top: 20, left: 15, right: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListTile(
                                      onTap: () {
                                        // Get.offAll(() => const SearchVoterId());
                                      },
                                      leading: const Icon(
                                        Icons.home_outlined,
                                        color: Colors.blue,
                                        size: 20,
                                      ),
                                      title: const Text(
                                        'Home',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                    ListTile(
                                      onTap: () {
                                        // Get.offAll(() => const SearchVoterId());
                                      },
                                      leading: const Icon(
                                        Icons.category_outlined,
                                        color: Colors.blue,
                                        size: 20,
                                      ),
                                      title: const Text(
                                        'Shop by Category',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      trailing: const Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Colors.blue,
                                        // size: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  title: Row(
                    children: [
                      Text('Hello ${e.userName}'),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.waving_hand_outlined,
                      )
                    ],
                  ),
                  titleTextStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                  leading: IconButton(
                    onPressed: () {
                      e.advancedDrawerController.showDrawer();
                    },
                    icon: ValueListenableBuilder<AdvancedDrawerValue>(
                      valueListenable: e.advancedDrawerController,
                      builder: (_, value, __) {
                        return AnimatedSwitcher(
                          duration: const Duration(milliseconds: 250),
                          child: value.visible
                              ? Icon(
                                  Icons.clear,
                                  color:
                                      value.visible ? Colors.blue : Colors.blue,
                                  key: ValueKey<bool>(value.visible),
                                )
                              : Image.asset(
                                  'assets/icons/menuicon.png',
                                  height: 20,
                                  width: 20,
                                  color: Colors.blue,
                                ),
                        );
                      },
                    ),
                  ),
                ),
                body: GetBuilder<HomeScreenController>(
                  builder: (controller) => SizedBox(
                    height: MediaQuery.of(context).size.height * 1,
                    width: MediaQuery.of(context).size.width * 1,
                  ),
                ),
              ))),
    );
  }
}
