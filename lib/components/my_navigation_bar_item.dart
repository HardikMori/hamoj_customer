import 'package:flutter/material.dart';

class MyNavigationBarItem extends StatefulWidget {
  MyNavigationBarItem({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });
  String title;
  bool isSelected;
  IconData icon;
  VoidCallback onTap;
  @override
  State<MyNavigationBarItem> createState() => _MyNavigationBarItemState();
}

class _MyNavigationBarItemState extends State<MyNavigationBarItem> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 758;
    double width = MediaQuery.of(context).size.width / 360;
    return InkWell(
      onTap: widget.onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: widget.isSelected
                  ? [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.65),
                        blurRadius: width * 30,
                        spreadRadius: width * 0.1,
                      ),
                    ]
                  : [],
            ),
            child: Icon(
              widget.icon,
              color: Colors.white,
              size: width * 30,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: widget.isSelected
                  ? [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.65),
                        blurRadius: width * 30,
                        spreadRadius: width * 0.1,
                      ),
                    ]
                  : [],
            ),
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: width * 10,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
