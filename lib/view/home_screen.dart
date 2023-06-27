import 'package:flutter/cupertino.dart';
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
          return controller.loading
              ? const Center(child: CupertinoActivityIndicator())
              : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    child: DataTable(
                      border: TableBorder.all(
                        color: Colors.white,
                        width: 4,
                      ),
                      headingRowColor: MaterialStateColor.resolveWith(
                        (states) => const Color(0xff008080).withOpacity(0.8),
                      ),
                      dataRowColor: MaterialStateColor.resolveWith(
                        (states) => const Color(0xffA5CFE3),
                      ),
                      columns: [
                        const DataColumn(
                          label: CustomText(
                            txt: "Ticker name",
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const DataColumn(
                          label: CustomText(
                            txt: "Frame",
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        ...(controller.dataWithOneInterval[0]["indicators"]
                                as List)
                            .map(
                              (e) => DataColumn(
                                label: Row(
                                  children: [
                                    CustomText(
                                      txt: e["indicatorsName"],
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    const SizedBox(width: 16),
                                    const Icon(
                                      Icons.arrow_upward_rounded,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ],
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
                                        txt: e["ticker"]
                                            .toString()
                                            .split(":")[1],
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    DataCell(
                                      CustomText(
                                        txt: e["interval"],
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    ...List.generate(
                                      (e["indicators"] as List).length,
                                      (index) {
                                        return DataCell(
                                          CustomText(
                                            txt: e["indicators"][index]["value"]
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
        },
      ),
    );
  }
}
