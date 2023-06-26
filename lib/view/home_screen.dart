import 'package:flutter/material.dart';
import 'package:flutter_tradingview_ta/controller/tickers_controller.dart';
import 'package:flutter_tradingview_ta/view/widgets/custom_text.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Flutter trading view",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: GetBuilder<TickersController>(
          init: TickersController(),
          builder: (controller) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: DataTable(
                  headingRowColor: MaterialStateColor.resolveWith(
                    (states) => const Color(0xff008080).withOpacity(0.8),
                  ),
                  dataRowColor: MaterialStateColor.resolveWith(
                    (states) => const Color(0xffA5CFE3),
                  ),
                  columns: [
                    const DataColumn(
                      label: CustomText(
                        txt: "#",
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    ...(controller.dataWithOneInterval[0]["indicators"] as List)
                        .map(
                          (e) => DataColumn(
                            label: CustomText(
                              txt: e["indicatorsName"],
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        )
                        .toList()
                  ],
                  rows: [
                    ...controller.dataWithOneInterval
                        .map((e) => DataRow(
                              cells: [
                                DataCell(
                                  CustomText(
                                    txt: controller.dataWithOneInterval[0]
                                        ["ticker"],
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                ...List.generate(
                                  (controller.dataWithOneInterval[0]
                                          ["indicators"] as List)
                                      .length,
                                  (index) {
                                    return DataCell(
                                      CustomText(
                                        txt: controller.dataWithOneInterval[0]
                                                ["indicators"][index]["value"]
                                            .toString(),
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    );
                                  },
                                )
                              ],
                            ))
                        .toList(),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
