import 'package:flutter/material.dart';
import 'package:flutter_tradingview_ta/view/widgets/custom_text.dart';

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
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: DataTable(
            headingRowColor: MaterialStateColor.resolveWith(
                (states) => const Color(0xff232c52).withOpacity(0.8)),
            dataRowColor: MaterialStateColor.resolveWith(
              (states) => const Color(0xff1e2649),
            ),
            columns: const [
              DataColumn(
                label: CustomText(
                  txt: "#",
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              DataColumn(
                label: CustomText(
                  txt: "الاسم",
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              DataColumn(
                label: CustomText(
                  txt: "نوع التعبئة",
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              DataColumn(
                label: CustomText(
                  txt: "الكمية",
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              DataColumn(
                label: CustomText(
                  txt: "الوقود",
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
            rows: List.generate(
              10,
              (index) {
                // bool x = controller.chekEditable(lastSellMadel);
                // print(x);
                return DataRow(
                  // color: MaterialStateColor.resolveWith(
                  //   (states) => controller.chekEditable(lastSellMadel)
                  //       ? Colors.teal
                  //       : Colors.transparent,
                  // ),
                  // onLongPress: ()=> Get.to(()=> EditFillCarScreen(lastSellMadel: lastSellMadel)),
                  cells: [
                    DataCell(
                      CustomText(
                        txt: (index + 1).toString(),
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const DataCell(
                      CustomText(
                        txt: "Name",
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const DataCell(
                      CustomText(
                        txt: "",
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const DataCell(
                      CustomText(
                        txt: "",
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const DataCell(
                      CustomText(
                        txt: "",
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
