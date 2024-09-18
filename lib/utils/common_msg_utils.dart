import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamoj/api_service/service.dart';
import 'package:hamoj/constants.dart';


class Utils {


  static snakBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      // showCloseIcon: true,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      backgroundColor: Colors.black,
      duration: Duration(seconds: 3),
    ));
  }

  static void focusnode(FocusNode current, FocusNode nextFocus, BuildContext context) {
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static void getCommonErrorSnackBar(String message,
      {BuildContext? context, String? title, double? topPadding}) {
    final overlay = Navigator.of(context ?? Get.context!).overlay!;

    OverlayEntry? entry;
    AnimationController? controller;
    Animation<Offset> offsetAnimation;

    void removeOverlay() {
      entry?.remove();
      entry = null;
    }

    controller = AnimationController(
      vsync: overlay,
      duration: const Duration(milliseconds: 650),
    );

    offsetAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeOut,
    ));

    void hideSnackBar() {
      if (controller!.status == AnimationStatus.forward) {
        controller.reverse();
        Future.delayed(const Duration(milliseconds: 50)).whenComplete(() => removeOverlay());
      }
    }

    entry = OverlayEntry(
        builder: (_) => SafeArea(
            top: true,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                alignment: Alignment.topCenter,
                child: SlideTransition(
                  position: offsetAnimation,
                  child: Dismissible(
                    key: const Key('error_snackbar'),
                    direction: DismissDirection.up,
                    onDismissed: (_) => removeOverlay(),
                    child: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: hideSnackBar,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColor.redcolor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(left: 2),
                            decoration: BoxDecoration(
                                color: AppColor.buttonColor,
                                borderRadius: BorderRadius.circular(4)),
                            padding: const EdgeInsets.only(
                              left: 15,
                              top: 15,
                              right: 15,
                              bottom: 15,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(children: [
                                  Padding(
                                      padding: const EdgeInsets.only(top: 2, right: 15),
                                      child: Icon(
                                        Icons.error,
                                        color: AppColor.redcolor,
                                      )),
                                  Expanded(
                                    child: Text(
                                      message,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ]),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )));

    overlay.insert(entry!);

    controller.forward();

    // You can adjust the delay and animation duration as needed
    Future.delayed(const Duration(milliseconds: 2500), () {
      controller!.reverse(); // Reverse the animation before removing the overlay
      Future.delayed(
          const Duration(milliseconds: 650), removeOverlay); // Give animation time to reverse
    });

    Future.delayed(const Duration(milliseconds: 2500), removeOverlay);
  }

  static void getCommonSuccessSnackBar(String message,
      {BuildContext? context, double? topPadding, Color? backgrouncolor}) {
    final overlay = Navigator.of(context ?? Get.context!).overlay!;
    OverlayEntry? entry;

    AnimationController? controller;
    Animation<Offset> offsetAnimation;

    void removeOverlay() {
      entry?.remove();
      entry = null;
    }

    controller = AnimationController(
      vsync: overlay,
      duration: const Duration(milliseconds: 650),
    );

    offsetAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeOut,
    ));

    void hideSnackBar() {
      if (controller!.status == AnimationStatus.forward) {
        controller.reverse();
        Future.delayed(const Duration(milliseconds: 50), removeOverlay);
      }
    }

    entry = OverlayEntry(
      builder: (_) => SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Align(
              alignment: Alignment.topCenter,
              child: SlideTransition(
                position: offsetAnimation,
                child: Dismissible(
                  key: const Key('success_snackbar'),
                  direction: DismissDirection.up,
                  onDismissed: (_) => removeOverlay(),
                  child: Material(
                    elevation: 0,
                    borderRadius: BorderRadius.circular(4),
                    child: InkWell(
                      onTap: hideSnackBar,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        width: Get.width,
                        child: Container(
                          margin: const EdgeInsets.only(left: 2),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: const EdgeInsets.only(
                            left: 15,
                            top: 15,
                            right: 15,
                            bottom: 15,
                          ),
                          child: Row(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(top: 2, right: 14),
                                  child: Icon(
                                    Icons.check_circle,
                                    size: 25,
                                    color: AppColor.whiteColor,
                                  )),
                              Expanded(
                                child: Text(
                                  message,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Normal1"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )),
    );

    overlay.insert(entry!);

    controller.forward();

    // You can adjust the delay and animation duration as needed
    Future.delayed(const Duration(milliseconds: 2500), () {
      controller!.reverse();
      Future.delayed(const Duration(milliseconds: 650), removeOverlay);
    });

    Future.delayed(const Duration(milliseconds: 2500), removeOverlay);
  }


}