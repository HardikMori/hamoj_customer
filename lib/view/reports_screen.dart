import 'package:flutter/material.dart';

import '../components/order_by_component.dart';
import '../constants.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  String _fromDate = 'From';
  String _toDate = 'To';

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
          child: OrderByComponent(text1: 'View', text2: 'Report'),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'From Date',
                                style: TextStyle(
                                  fontSize: width * 14,
                                  color: Colors.black,
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  DateTime? from = await showDatePicker(
                                      context: context,
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime.now());
                                  setState(() {
                                    _fromDate = from!.day.toString() +
                                        ' / ' +
                                        from.month.toString() +
                                        ' / ' +
                                        from.year.toString();
                                  });
                                },
                                child: Container(
                                  height: height * 36,
                                  // width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color(0xff878787),
                                        width: width * 0.5,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(width * 5)),
                                  child: Center(
                                    child: Text(
                                      _fromDate,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: width * 24,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'To Date',
                                style: TextStyle(
                                  fontSize: width * 14,
                                  color: Colors.black,
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  DateTime? to = await showDatePicker(
                                      context: context,
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime.now());
                                  setState(() {
                                    _toDate = to!.day.toString() +
                                        ' / ' +
                                        to.month.toString() +
                                        ' / ' +
                                        to.year.toString();
                                  });
                                },
                                child: Container(
                                  height: height * 36,
                                  // width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color(0xff878787),
                                        width: width * 0.5,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(width * 5)),
                                  child: Center(
                                    child: Text(
                                      _toDate,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Expanded(
                        //   child: TextField(
                        //     decoration: InputDecoration(
                        //       contentPadding: EdgeInsets.only(
                        //         left: width * 8,
                        //       ),
                        //       border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(
                        //           width * 5,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: height * 24,
                    ),
                    Center(
                      child: SizedBox(
                        width: width * 250,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: height * 6,
                                horizontal: width * 20,
                              ),
                              // width: double.infinity,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                border: Border.all(
                                  color: const Color(0xff878787).withOpacity(0.5),
                                ),
                                borderRadius: BorderRadius.circular(
                                  width * 4,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Search',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: width * 12,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * 16,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: height * 6,
                                horizontal: width * 20,
                              ),
                              // width: double.infinity,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                border: Border.all(
                                  color: const Color(0xff878787).withOpacity(0.5),
                                ),
                                borderRadius: BorderRadius.circular(
                                  width * 4,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Refresh',
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
                    ),
                    SizedBox(
                      height: height * 20,
                    ),
                    // table
                    SizedBox(
                      height: height * 300,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xff878787),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(
                              // columnSpacing: width * 36,
                              headingTextStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: width * 14,
                                color: Colors.black,
                              ),
                              dataTextStyle: TextStyle(
                                color: const Color(0xff878787),
                                fontSize: width * 14,
                                fontWeight: FontWeight.w400,
                              ),
                              columns: [
                                const DataColumn(
                                  label: Text(
                                    'DATE',
                                  ),
                                ),
                                const DataColumn(
                                  label: Text(
                                    'GRAND TOTAL',
                                  ),
                                ),
                                const DataColumn(
                                  label: Text(
                                    'CONFIRM BY',
                                  ),
                                ),
                                const DataColumn(
                                  label: Text(
                                    'ACTION',
                                  ),
                                ),
                              ],
                              rows: [
                                for (var i = 0; i < 7; i++)
                                  DataRow(
                                    cells: [
                                      const DataCell(
                                        Center(child: Text('2024-08-01')),
                                      ),
                                      const DataCell(
                                        Center(child: Text('\$100.00')),
                                      ),
                                      const DataCell(
                                        Center(child: Text('Yes')),
                                      ),
                                      DataCell(
                                        Center(
                                          child: Icon(
                                            Icons.remove_red_eye,
                                            color: primaryColor,
                                            size: width * 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Divider(),
            ],
          ),
        ),
      ],
    );
  }
}
