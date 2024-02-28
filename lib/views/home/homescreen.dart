import 'package:carousel_slider/carousel_slider.dart';
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
    return GetBuilder<HomeScreenController>(
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
                color: const Color(0xFFf7f7f9),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 1,
                        color: const Color(0xFFf7f7f9),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Image.asset(
                                'assets/images/applogo.png',
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  onTap: () {
                                    // Get.offAll(() => const SearchVoterId());
                                  },
                                  leading: const Icon(
                                    Icons.person,
                                    color: Color(0xFF503083),
                                  ),
                                  title: const Text(
                                    'Profile',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  onTap: () {
                                    // Get.offAll(() => const SearchVoterId());
                                  },
                                  leading: const Icon(
                                    Icons.groups_rounded,
                                    color: Color(0xFF503083),
                                  ),
                                  title: const Text(
                                    'My Project Directors',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  onTap: () {
                                    // Get.offAll(() => const SearchVoterId());
                                  },
                                  leading: Image.asset(
                                    'assets/icons/cardsicon.png',
                                    height: 22,
                                    width: 22,
                                  ),
                                  title: const Text(
                                    'My Service Requests',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  onTap: () {
                                    // Get.offAll(() => const SearchVoterId());
                                  },
                                  leading: const Icon(
                                    Icons.phone,
                                    color: Color(0xFF503083),
                                  ),
                                  title: const Text(
                                    'Contact Us',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
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
              backgroundColor: const Color(0xFFf0f0f3),
              appBar: AppBar(
                title: Row(
                  children: [
                    SizedBox(
                      width: 250,
                      child: Text(
                        'Hello ${e.userName}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
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
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: GestureDetector(
                      child: Image.asset(
                        'assets/icons/alerticon.png',
                        height: 30,
                        width: 30,
                      ),
                    ),
                  )
                ],
              ),
              body: GetBuilder<HomeScreenController>(
                builder: (controller) => SizedBox(
                  height: MediaQuery.of(context).size.height * 1,
                  width: MediaQuery.of(context).size.width * 1,
                  child: SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      child: Column(children: [
                        Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                  image: AssetImage('assets/icons/cardbg.png'),
                                  fit: BoxFit.fill)),
                          padding: const EdgeInsets.all(20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'My Profile',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      e.empID.toString(),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  e.userName.toString(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Total Service Requests (28)',
                                  style: TextStyle(color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      width: 120,
                                      child: Card(
                                        color: const Color(0xffa697be),
                                        shape: const RoundedRectangleBorder(),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            e.mobNum.toString(),
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ]),
                        ),
                        Card(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          color: const Color(0xFFd0cadc),
                          child: ListTile(
                            leading: Image.asset(
                              'assets/icons/lockicon.png',
                              height: 30,
                              width: 30,
                            ),
                            title: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Service Requests (28)',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Text(
                                      'Updated on 13 Feb 2024',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10),
                                    )
                                  ]),
                            ),
                            trailing: Image.asset(
                              'assets/icons/arrowicon.png',
                              height: 25,
                              width: 25,
                            ),
                          ),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                'Service Requests',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Card(
                          color: Colors.white,
                          child: GridView.builder(
                              physics: const ScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                      mainAxisExtent: 100,
                                      maxCrossAxisExtent: 100,
                                      childAspectRatio: 2.5 / 2,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10),
                              itemCount: e.serviceReqGrid.length,
                              itemBuilder: (BuildContext ctx, index) {
                                return GestureDetector(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Card(
                                          color: Colors.white,
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(20),
                                              ),
                                              side: BorderSide(
                                                  color: Colors.yellow)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset(
                                              e.serviceReqGrid[index]['image']
                                                  .toString(),
                                              height: 30,
                                              width: 30,
                                            ),
                                          ),
                                        ),
                                        // const SizedBox(
                                        //   height: 10,
                                        // ),
                                        Text(
                                          e.serviceReqGrid[index]['name']
                                              .toString(),
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 300,
                          width: 600,
                          child: Stack(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                      Color(0xff682bc9),
                                      Color(0xff542d93),
                                    ],
                                        stops: [
                                      0.0,
                                      1.0
                                    ],
                                        begin: FractionalOffset.topCenter,
                                        end: FractionalOffset.bottomCenter,
                                        tileMode: TileMode.repeated)),
                                padding: const EdgeInsets.all(15.0),
                                alignment: Alignment.topRight,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(top: 5, left: 5),
                                      child: Text(
                                        'Company Headlines',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: (){},
                                      child: const Row(
                                        children: [
                                          Text(
                                            'view all',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.white,
                                            size: 10,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ), //Text
                              ),
                            Positioned(
                              top: 10,
                              child:  SizedBox(
                                height: 400,
                                width: 380,
                                child: CarouselSlider.builder(
                                  disableGesture: true,
                                  itemCount: 3,
                                  itemBuilder: (BuildContext context, int itemIndex,
                                      int pageViewIndex) =>
                                  /* featureadList.isEmpty
                                            ? Center(
                                          child: Text(
                                            'No Feature Ads available',
                                            style: TextStyle(
                                                color: Constants.whiteColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                            :*/
                                  GestureDetector(
                                    onTap: () {},
                                    child: Image.network(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvnlP8WxrZ-syCynvqsQuWalArI-Biyxn4nesRNWqWSA&s',
                                    ),
                                  ),
                                  options: CarouselOptions(
                                    height: 400,
                                    aspectRatio: 16 / 9,
                                    viewportFraction: 0.95,
                                    initialPage: 0,
                                    enableInfiniteScroll: true,
                                    reverse: false,
                                    autoPlay: true,
                                    autoPlayInterval: const Duration(seconds: 3),
                                    autoPlayAnimationDuration:
                                    const Duration(milliseconds: 800),
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    enlargeCenterPage: true,
                                    enlargeFactor: 0.3,
                                    scrollDirection: Axis.horizontal,
                                  )),
                              ),)
                            ],
                          ),
                        ),
                        // Container(
                        //   decoration: const BoxDecoration(
                        //     gradient: LinearGradient(
                        //       colors:[
                        //         Color(0xff682bc9),
                        //         Color(0xff542d93),
                        //       ],
                        //       stops: [0.0, 1.0],
                        //       begin: FractionalOffset.topCenter,
                        //       end: FractionalOffset.bottomCenter,
                        //     ),
                        //   ),
                        //   padding: const EdgeInsets.only(top: 100),
                        //   child: Column(
                        //     children: [
                        //       Container(
                        //         padding: const EdgeInsets.all(20),
                        //         child: SizedBox(
                        //           height: MediaQuery.of(context).size.height * 0.2,
                        //           child: CarouselSlider.builder(
                        //               disableGesture: true,
                        //               itemCount: 3,
                        //               itemBuilder: (BuildContext context, int itemIndex,
                        //                       int pageViewIndex) =>
                        //                   /* featureadList.isEmpty
                        //                   ? Center(
                        //                 child: Text(
                        //                   'No Feature Ads available',
                        //                   style: TextStyle(
                        //                       color: Constants.whiteColor,
                        //                       fontWeight: FontWeight.bold),
                        //                 ),
                        //               )
                        //                   :*/
                        //                   GestureDetector(
                        //                     onTap: () {},
                        //                     child: Image.network(
                        //                       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvnlP8WxrZ-syCynvqsQuWalArI-Biyxn4nesRNWqWSA&s',
                        //                     ),
                        //                   ),
                        //               options: CarouselOptions(
                        //                 height: 400,
                        //                 aspectRatio: 16 / 9,
                        //                 viewportFraction: 0.95,
                        //                 initialPage: 0,
                        //                 enableInfiniteScroll: true,
                        //                 reverse: false,
                        //                 autoPlay: true,
                        //                 autoPlayInterval: const Duration(seconds: 3),
                        //                 autoPlayAnimationDuration:
                        //                     const Duration(milliseconds: 800),
                        //                 autoPlayCurve: Curves.fastOutSlowIn,
                        //                 enlargeCenterPage: true,
                        //                 enlargeFactor: 0.3,
                        //                 scrollDirection: Axis.horizontal,
                        //               )),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ]),
                    ),
                  ),
                ),
              ),
            )));
  }
}
