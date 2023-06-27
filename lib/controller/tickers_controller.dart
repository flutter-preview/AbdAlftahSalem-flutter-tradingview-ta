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
      symbols: tickers,
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

var tickers = [
  "BINANCE:BTCUSDT",
  "BINANCE:ETHUSDT",
  "BINANCE:BNBUSDT",
  "BINANCE:NEOUSDT",
  "BINANCE:LTCUSDT",
  "BINANCE:QTUMUSDT",
  "BINANCE:ADAUSDT",
  "BINANCE:XRPUSDT",
  "BINANCE:EOSUSDT",
  "BINANCE:IOTAUSDT",
  "BINANCE:XLMUSDT",
  "BINANCE:ONTUSDT",
  "BINANCE:TRXUSDT",
  "BINANCE:ETCUSDT",
  "BINANCE:ICXUSDT",
  "BINANCE:NULSUSDT",
  "BINANCE:VETUSDT",
  "BINANCE:BCHUSDT",
  "BINANCE:LINKUSDT",
  "BINANCE:WAVESUSDT",
  "BINANCE:ONGUSDT",
  "BINANCE:HOTUSDT",
  "BINANCE:ZILUSDT",
  "BINANCE:ZRXUSDT",
  "BINANCE:FETUSDT",
  "BINANCE:BATUSDT",
  "BINANCE:XMRUSDT"
];
