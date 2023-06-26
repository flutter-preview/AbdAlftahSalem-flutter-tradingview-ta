import 'package:get/get.dart';
import 'package:tradingview_ta/exports.dart';

class TickersController extends GetxController {
  List<Map<String, dynamic>> dataWithOneInterval = [];
  List<Map<String, dynamic>> dataWithMultiInterval = [];
  bool loading = false;

  // create obj to get data
  TradingViewTA tradingViewTA = TradingViewTA(
    tradingView: TradingViewModel(
      screener: "crypto",
      symbols: ["BINANCE:BTCUSDT", "BINANCE:ETHUSDT"],
      interval: Intervals.INTERVAL_1_HOUR,
    ),
  );

  // get data with one interval [ Intervals.INTERVAL_1_HOUR ]
  void getTickerWithOneInterval() async {
    loading = true;
    update();
    dataWithOneInterval = await tradingViewTA.getAnalysis();
    loading = false;
    update();
  }

  // get data with one interval [ Intervals.INTERVAL_1_HOUR , Intervals.INTERVAL_15_MINUTES ]
  void getTickerWithMultiInterval() async {
    dataWithMultiInterval = await tradingViewTA.getAnalysisWithMultiFrame(
      intervals: [
        Intervals.INTERVAL_1_HOUR,
        Intervals.INTERVAL_15_MINUTES,
      ],
    );
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getTickerWithOneInterval();
  }
}
