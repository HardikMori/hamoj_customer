import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hamoj/constants.dart';
import 'package:hamoj/utils/image_contants.dart';
import 'package:hamoj/view/login_screen.dart';
import 'package:hamoj/view/payments_screen.dart';
import 'package:hamoj/view/reports_screen.dart';

import '../components/my_navigation_bar_item.dart';
import 'dashboard_screen.dart';
import 'orders_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;
  var prefData = GetStorage();

  List<Widget> screensToShow = [
    const DashboardScreen(),
    OrdersScreen(),
    const ReportsScreen(),
    const PaymentsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 758;
    double width = MediaQuery.of(context).size.width / 360;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: height * 72,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: const AssetImage(ImageConstants.teaImage),
              width: width * 48,
              fit: BoxFit.cover,
            ),
            Image(
              image: const AssetImage(ImageConstants.whiteLogo),
              width: width * 88,
              fit: BoxFit.cover,
            ),
          ],
        ),
        actions: [
          InkWell(
            onTap: () {
              // prefData.erase();
              // Get.offAll(const LoginScreen());
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Welcome!',
                  style: TextStyle(
                    fontSize: width * 16,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Test',
                  style: TextStyle(
                    fontSize: width * 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: width * 8,
          ),
          Image(
            height: height * 52,
            fit: BoxFit.cover,
            image: const AssetImage(ImageConstants.profileImage),
          ),
          SizedBox(
            width: width * 24,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * screenHorizontalPadding,
            vertical: height * screenVerticalPadding,
          ),
          child: screensToShow[index],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        // this is not working
        // onDestinationSelected: (int newIndex) {
        //   setState(() {
        //     index = newIndex;
        //   });
        // },
        backgroundColor: primaryColor,
        destinations: [
          MyNavigationBarItem(
            title: 'Dashboard',
            icon: Icons.dashboard,
            isSelected: index == 0,
            onTap: () {
              setState(() {
                index = 0;
              });
            },
          ),
          MyNavigationBarItem(
            title: 'Orders',
            icon: Icons.bookmark_border,
            isSelected: index == 1,
            onTap: () {
              setState(() {
                index = 1;
              });
            },
          ),
          MyNavigationBarItem(
            title: 'Reports',
            icon: Icons.report_sharp,
            isSelected: index == 2,
            onTap: () {
              setState(() {
                index = 2;
              });
            },
          ),
          MyNavigationBarItem(
            title: 'Payment Details',
            icon: Icons.payment,
            isSelected: index == 3,
            onTap: () {
              setState(() {
                index = 3;
              });
            },
          ),
        ],
      ),
    );
  }
}
