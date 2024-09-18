import 'package:flutter/material.dart';
import 'package:hamoj/components/order_by_component.dart';
import 'package:hamoj/constants.dart';
import 'package:hamoj/utils/image_contants.dart';

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 758;
    double width = MediaQuery.of(context).size.width / 360;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            bottom: height * 20,
          ),
          padding: EdgeInsets.symmetric(
            vertical: height * 12,
            horizontal: width * 12,
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: width * 3,
                spreadRadius: width * 1,
              ),
            ],
            borderRadius: BorderRadius.circular(
              width * 8,
            ),
          ),
          child: OrderByComponent(text1: 'View', text2: 'Payment'),
        ),
        Container(
          margin: EdgeInsets.only(
            bottom: height * 20,
          ),
          padding: EdgeInsets.symmetric(
            vertical: height * 12,
            // horizontal: width * 12,
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: width * 3,
                spreadRadius: width * 1,
              ),
            ],
            borderRadius: BorderRadius.circular(
              width * 8,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 9,
                ),
                child: Text(
                  'Scan QR for Payment',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
              Divider(),
              Center(
                child: Image(
                  height: height * 350,
                  fit: BoxFit.cover,
                  image: AssetImage(
                    ImageConstants.qrCodeImage,
                  ),
                ),
              ),
              SizedBox(
                height: height * 56,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
