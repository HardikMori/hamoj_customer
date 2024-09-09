import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../components/order_by_component.dart';
import '../../constants.dart';

class OrdersScreen extends StatefulWidget {
  OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List<int> _productQuantity = [
    1,
    1,
    2,
    1,
    2,
  ];

  List<int> _productPrice = [12, 23, 32, 13, 23];
  List<String> _productName = [
    'Product 1',
    'Product 2',
    'Product 3',
    'Product 4',
    'Product 5',
  ];
  List<TextEditingController> _quantityControllers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _quantityControllers = List.generate(_productQuantity.length, (index) {
      return TextEditingController(
        text: _productQuantity[index].toString(),
      );
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    for (var item in _quantityControllers) {
      item.dispose();
    }
  }

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
          child: OrderByComponent(text1: 'Order', text2: 'Add'),
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
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                      left: width * 8,
                    ),
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      color: Color(0xff878787),
                      fontSize: width * 14,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        width * 5,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 5,
              ),
              Divider(),
              SizedBox(
                height: height * 350,
                child: SingleChildScrollView(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      horizontalMargin: width * 12,

                      // columnSpacing: width * 36,
                      headingRowHeight: height * 36,
                      dataTextStyle: TextStyle(
                        color: Color(0xff000000),
                        fontSize: width * 14,
                        fontWeight: FontWeight.w400,
                      ),
                      headingTextStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: width * 15,
                        color: Colors.black,
                      ),
                      columns: [
                        DataColumn(
                          label: Text(
                            'Items',
                          ),
                        ),
                        DataColumn(
                          label: Text('Product Name'),
                        ),
                        DataColumn(
                          label: Text(
                            'Price',
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Qty.',
                          ),
                        ),
                      ],
                      rows: [
                        for (var i = 0; i < _productQuantity.length; i++)
                          DataRow(
                            cells: [
                              DataCell(Center(
                                child: Image(
                                    height: height * 28,
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      teaImageForTable,
                                    )),
                              )),
                              DataCell(
                                Center(
                                  child: Text(
                                    _productName[i],
                                  ),
                                ),
                              ),
                              DataCell(
                                Center(
                                  child: Text(
                                    _productPrice[i].toString(),
                                  ),
                                ),
                              ),
                              DataCell(Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        if (int.parse(
                                                _quantityControllers[i].text) <=
                                            0) {
                                        } else {
                                          setState(() {
                                            _quantityControllers[i]
                                                .text = ((int.tryParse(
                                                            _quantityControllers[
                                                                    i]
                                                                .text) ??
                                                        0) -
                                                    1)
                                                .toString();
                                          });
                                        }
                                      },
                                      child: Container(
                                        height: width * 24,
                                        width: width * 24,
                                        decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius: BorderRadius.circular(
                                            width * 5,
                                          ),
                                        ),
                                        child: Center(
                                          child: Icon(
                                            CupertinoIcons.minus,
                                            color: Colors.white,
                                            size: width * 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: width * 4),
                                    SizedBox(
                                      width: width * 52,
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        controller: _quantityControllers[i],
                                        decoration: InputDecoration(),
                                        textAlign: TextAlign.center,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        onChanged: (value) {
                                          setState(() {
                                            if (int.parse(value) < 0) {
                                            } else {
                                              _quantityControllers[i].text =
                                                  (int.tryParse(value) ??
                                                          _productQuantity[i])
                                                      .toString();
                                            }
                                          });
                                        },
                                      ),
                                    ),
                                    SizedBox(width: width * 4),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          _quantityControllers[i]
                                              .text = ((int.tryParse(
                                                          _quantityControllers[
                                                                  i]
                                                              .text) ??
                                                      0) +
                                                  1)
                                              .toString();
                                        });
                                      },
                                      child: Container(
                                        height: width * 24,
                                        width: width * 24,
                                        decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius: BorderRadius.circular(
                                            width * 5,
                                          ),
                                        ),
                                        child: Center(
                                          child: Icon(
                                            CupertinoIcons.add,
                                            color: Colors.white,
                                            size: width * 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 12,
              ),
              Container(
                width: width * 72,
                padding: EdgeInsets.symmetric(
                  vertical: height * 4,
                ),

                margin: EdgeInsets.only(left: width * 16),
                // width: double.infinity,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(
                    width * 4,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Order Now',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: width * 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
